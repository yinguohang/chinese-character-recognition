from model import build_cnn, Config
import tensorflow as tf

def exportPbFile():
    sess = tf.Session()
    graph = build_cnn(Config(5, 5))
    tf.train.write_graph(sess.graph_def, './', 'graph.pb')
    saver = tf.train.Saver()
    print(saver.saver_def.restore_op_name)
    print(saver.saver_def.filename_tensor_name)
    print(graph["predicted_val_top_k"].name)
    print(graph["predicted_index_top_k"].name)
    print(graph["images"])
    print(graph["keep_prob"])

def exportBytesFile():
    from tensorflow.python.tools import freeze_graph
    freeze_graph.freeze_graph(input_graph = 'graph.pb',
                  input_binary = False,
                  input_checkpoint = "ckpt/model.ckpt",
                  output_node_names = "TopKV2",
                  output_graph = 'graph.bytes' ,
                  clear_devices = True, initializer_nodes = "",input_saver = "",
                  restore_op_name = "save/restore_all", filename_tensor_name = "save/Const:0")
exportPbFile()
exportBytesFile()