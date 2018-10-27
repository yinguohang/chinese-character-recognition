from django.shortcuts import render, HttpResponse
from django.template.loader import get_template
from django.views.decorators.csrf import csrf_exempt
import tensorflow as tf
import numpy as np
import tensorflow.contrib.slim as slim
from PIL import Image
import json

import base64

class Config:
    def __init__(self, character_count, top_k):
        self.character_count = character_count
        self.top_k = top_k

__test_image_file  = 'test.png'
__global_times = 0
__checkpoint_dir = "../ckpt/"
__code_to_chinese_file = "../characters.txt"

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
    fc1 = slim.fully_connected(tf.layers.dropout(flatten, keep_prob), 1024, activation_fn=tf.nn.tanh, scope='fc1')  # 激活函数tanh
    logits = slim.fully_connected(tf.layers.dropout(fc1, keep_prob), config.character_count, activation_fn=None, scope='fc2') # 无激活函数
    loss = tf.reduce_mean(tf.nn.sparse_softmax_cross_entropy_with_logits(logits=logits, labels=labels)) # softmax
    accuracy = tf.reduce_mean(tf.cast(tf.equal(tf.argmax(logits, 1), labels), tf.float32)) # 计算准确率

    global_step = tf.get_variable("step", [], initializer=tf.constant_initializer(0.0), trainable=False)
    rate = tf.train.exponential_decay(2e-4, global_step, decay_steps=2000, decay_rate=0.97, staircase=True) #
    train_op = tf.train.AdamOptimizer(learning_rate=rate).minimize(loss, global_step=global_step) # 自动调节学习率的随机梯度下降算法训练模型
    probabilities = tf.nn.softmax(logits) #

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


def predictPrepare():
    sess = tf.Session()
    graph = build_cnn(Config(5, 5))
    saver = tf.train.Saver()
    ckpt = tf.train.latest_checkpoint(__checkpoint_dir)
    if ckpt:
        saver.restore(sess, ckpt)
    return graph, sess

def imagePrepare(image_path):
    temp_image = Image.open(image_path).convert('L')
    temp_image = temp_image.resize((64, 64), Image.ANTIALIAS)
    temp_image = np.asarray(temp_image) / 255.0
    temp_image = temp_image.reshape([-1, 64, 64, 1])
    f = open("image_array.txt", "w")
    for i in range(64):
        for j in range(64):
            f.write("%.2f, " % temp_image[0][i][j][0])
        f.write("\n")
    return temp_image

def load_dict():
    rtn = []
    for i in open(__code_to_chinese_file).readlines():
        rtn.append(i.strip())
    return rtn

def index(request):
    return render(request, 'index.html')

@csrf_exempt
def recognition(request):
    data = request.POST.get("data")
    image = base64.b64decode(data[22:])
    file = open(__test_image_file, 'wb')
    file.write(image)
    file.close()

    global __global_times
    if (__global_times == 0):
        global __graph1, __sess1
        __graph1, __sess1 = predictPrepare() #加载模型，准备好预测
        __global_times = 1        
    temp_image = imagePrepare(__test_image_file)
    predict_val, predict_index = __sess1.run([__graph1['predicted_val_top_k'], __graph1['predicted_index_top_k']],
                                          feed_dict={__graph1['images']: temp_image, __graph1['keep_prob']: 1.0}) # 预测top3的汉字编码以及相应的准确率
    word_dict = load_dict()
    return HttpResponse(json.dumps([
            [word_dict[predict_index[0][0]], str(predict_val[0][0])],
            [word_dict[predict_index[0][1]], str(predict_val[0][1])],
            [word_dict[predict_index[0][2]], str(predict_val[0][2])],
        ]))