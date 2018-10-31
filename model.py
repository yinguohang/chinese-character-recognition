import tensorflow as tf
import numpy as np
import tensorflow.contrib.slim as slim

class Config:
    def __init__(self, character_count, top_k):
        self.character_count = character_count
        self.top_k = top_k

# 3 conv (3x3) + 3 max pooling (2x2) +  2 FC
def build_cnn(config):
    # with tf.device('/cpu:0'):
    keep_prob = tf.placeholder(dtype=tf.float32, shape=[], name='keep_prob')
    images = tf.placeholder(dtype=tf.float32, shape=[None, 64, 64, 1], name='image_batch') # image_size 64x64
    labels = tf.placeholder(dtype=tf.int64, shape=[None], name='label_batch')

    # [Different definition of "SAME"]
    conv_1 = tf.layers.conv2d(images, 64, [3, 3], 1, padding='SAME', name='conv1')  # image_size 62x62
    max_pool_1 = tf.layers.max_pooling2d(conv_1, [2, 2], [2, 2], padding='SAME', name='max_pool1')      # image_size 31x31
    conv_2 = tf.layers.conv2d(max_pool_1, 128, [3, 3], padding='SAME', name='conv2')   # image_size 29x29
    max_pool_2 = tf.layers.max_pooling2d(conv_2, [2, 2], [2, 2], padding='SAME', name='max_pool2')      # image_size 15x15
    conv_3 = tf.layers.conv2d(max_pool_2, 256, [3, 3], padding='SAME', name='conv3')      # image_size 13x13
    max_pool_3 = tf.layers.max_pooling2d(conv_3, [2, 2], [2, 2], padding='SAME', name='max_pool3')      # image_size 7x7

    flatten = tf.layers.flatten(max_pool_3)
    fc1 = slim.fully_connected(slim.dropout(flatten, keep_prob), 1024, activation_fn=tf.nn.tanh, scope='fc1')  # tanh
    logits = slim.fully_connected(slim.dropout(fc1, keep_prob), config.character_count, activation_fn=None, scope='fc2') # No activation function
    loss = tf.reduce_mean(tf.nn.sparse_softmax_cross_entropy_with_logits(logits=logits, labels=labels)) # softmax
    accuracy = tf.reduce_mean(tf.cast(tf.equal(tf.argmax(logits, 1), labels), tf.float32)) # acc

    global_step = tf.get_variable("step", [], initializer=tf.constant_initializer(0.0), trainable=False)
    rate = tf.train.exponential_decay(2e-4, global_step, decay_steps=2000, decay_rate=0.97, staircase=True)
    train_op = tf.train.AdamOptimizer(learning_rate=rate).minimize(loss, global_step=global_step)
    probabilities = tf.nn.softmax(logits)

    tf.summary.scalar('loss', loss)
    tf.summary.scalar('accuracy', accuracy)
    merged_summary_op = tf.summary.merge_all()
    predicted_val_top_k, predicted_index_top_k = tf.nn.top_k(probabilities, k=config.top_k)
    accuracy_in_top_k = tf.reduce_mean(tf.cast(tf.nn.in_top_k(probabilities, labels, config.top_k), tf.float32))

    return {
        'images': images,
        'labels': labels,
        'keep_prob': keep_prob,
        'top_k': config.top_k,
        'global_step': global_step,
        'train_op': train_op,
        'loss': loss,
        'accuracy': accuracy,
        'accuracy_top_k': accuracy_in_top_k,
        'merged_summary_op': merged_summary_op,
        'predicted_distribution': probabilities,
        'predicted_index_top_k': predicted_index_top_k,
        'predicted_val_top_k': predicted_val_top_k
    }

def train():
    cache = np.load("input_data.npz")
    X, y = cache["X"], cache["y"]
    model = build_cnn(Config(5, 5))
    saver = tf.train.Saver()
    with tf.Session() as sess:
        init = tf.global_variables_initializer()
        sess.run(init)
        for iter in range(10):
            _, loss, acc = sess.run([model["train_op"], model["loss"], model["accuracy"]], feed_dict={
                model["images"]: X,
                model["labels"]: y,
                model["keep_prob"]: 1.0
            })
            print("Iter %d: loss: %.5f acc: %.5f" % (iter + 1, loss, acc))
            saver.save(sess, "ckpt/model.ckpt")
    sess.close()

if __name__ == "__main__":
    train()