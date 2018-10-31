node {
  name: "keep_prob"
  op: "Placeholder"
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "shape"
    value {
      shape {
      }
    }
  }
}
node {
  name: "image_batch"
  op: "Placeholder"
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "shape"
    value {
      shape {
        dim {
          size: -1
        }
        dim {
          size: 64
        }
        dim {
          size: 64
        }
        dim {
          size: 1
        }
      }
    }
  }
}
node {
  name: "label_batch"
  op: "Placeholder"
  attr {
    key: "dtype"
    value {
      type: DT_INT64
    }
  }
  attr {
    key: "shape"
    value {
      shape {
        dim {
          size: -1
        }
      }
    }
  }
}
node {
  name: "conv1/kernel/Initializer/random_uniform/shape"
  op: "Const"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@conv1/kernel"
      }
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_INT32
        tensor_shape {
          dim {
            size: 4
          }
        }
        tensor_content: "\003\000\000\000\003\000\000\000\001\000\000\000@\000\000\000"
      }
    }
  }
}
node {
  name: "conv1/kernel/Initializer/random_uniform/min"
  op: "Const"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@conv1/kernel"
      }
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
        }
        float_val: -0.10127393901348114
      }
    }
  }
}
node {
  name: "conv1/kernel/Initializer/random_uniform/max"
  op: "Const"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@conv1/kernel"
      }
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
        }
        float_val: 0.10127393901348114
      }
    }
  }
}
node {
  name: "conv1/kernel/Initializer/random_uniform/RandomUniform"
  op: "RandomUniform"
  input: "conv1/kernel/Initializer/random_uniform/shape"
  attr {
    key: "T"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@conv1/kernel"
      }
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "seed"
    value {
      i: 0
    }
  }
  attr {
    key: "seed2"
    value {
      i: 0
    }
  }
}
node {
  name: "conv1/kernel/Initializer/random_uniform/sub"
  op: "Sub"
  input: "conv1/kernel/Initializer/random_uniform/max"
  input: "conv1/kernel/Initializer/random_uniform/min"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@conv1/kernel"
      }
    }
  }
}
node {
  name: "conv1/kernel/Initializer/random_uniform/mul"
  op: "Mul"
  input: "conv1/kernel/Initializer/random_uniform/RandomUniform"
  input: "conv1/kernel/Initializer/random_uniform/sub"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@conv1/kernel"
      }
    }
  }
}
node {
  name: "conv1/kernel/Initializer/random_uniform"
  op: "Add"
  input: "conv1/kernel/Initializer/random_uniform/mul"
  input: "conv1/kernel/Initializer/random_uniform/min"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@conv1/kernel"
      }
    }
  }
}
node {
  name: "conv1/kernel"
  op: "VariableV2"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@conv1/kernel"
      }
    }
  }
  attr {
    key: "container"
    value {
      s: ""
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "shape"
    value {
      shape {
        dim {
          size: 3
        }
        dim {
          size: 3
        }
        dim {
          size: 1
        }
        dim {
          size: 64
        }
      }
    }
  }
  attr {
    key: "shared_name"
    value {
      s: ""
    }
  }
}
node {
  name: "conv1/kernel/Assign"
  op: "Assign"
  input: "conv1/kernel"
  input: "conv1/kernel/Initializer/random_uniform"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@conv1/kernel"
      }
    }
  }
  attr {
    key: "use_locking"
    value {
      b: true
    }
  }
  attr {
    key: "validate_shape"
    value {
      b: true
    }
  }
}
node {
  name: "conv1/kernel/read"
  op: "Identity"
  input: "conv1/kernel"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@conv1/kernel"
      }
    }
  }
}
node {
  name: "conv1/bias/Initializer/zeros"
  op: "Const"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@conv1/bias"
      }
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
          dim {
            size: 64
          }
        }
        float_val: 0.0
      }
    }
  }
}
node {
  name: "conv1/bias"
  op: "VariableV2"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@conv1/bias"
      }
    }
  }
  attr {
    key: "container"
    value {
      s: ""
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "shape"
    value {
      shape {
        dim {
          size: 64
        }
      }
    }
  }
  attr {
    key: "shared_name"
    value {
      s: ""
    }
  }
}
node {
  name: "conv1/bias/Assign"
  op: "Assign"
  input: "conv1/bias"
  input: "conv1/bias/Initializer/zeros"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@conv1/bias"
      }
    }
  }
  attr {
    key: "use_locking"
    value {
      b: true
    }
  }
  attr {
    key: "validate_shape"
    value {
      b: true
    }
  }
}
node {
  name: "conv1/bias/read"
  op: "Identity"
  input: "conv1/bias"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@conv1/bias"
      }
    }
  }
}
node {
  name: "conv1/dilation_rate"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_INT32
        tensor_shape {
          dim {
            size: 2
          }
        }
        tensor_content: "\001\000\000\000\001\000\000\000"
      }
    }
  }
}
node {
  name: "conv1/Conv2D"
  op: "Conv2D"
  input: "image_batch"
  input: "conv1/kernel/read"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "data_format"
    value {
      s: "NHWC"
    }
  }
  attr {
    key: "dilations"
    value {
      list {
        i: 1
        i: 1
        i: 1
        i: 1
      }
    }
  }
  attr {
    key: "padding"
    value {
      s: "SAME"
    }
  }
  attr {
    key: "strides"
    value {
      list {
        i: 1
        i: 1
        i: 1
        i: 1
      }
    }
  }
  attr {
    key: "use_cudnn_on_gpu"
    value {
      b: true
    }
  }
}
node {
  name: "conv1/BiasAdd"
  op: "BiasAdd"
  input: "conv1/Conv2D"
  input: "conv1/bias/read"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "data_format"
    value {
      s: "NHWC"
    }
  }
}
node {
  name: "max_pool1/MaxPool"
  op: "MaxPool"
  input: "conv1/BiasAdd"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "data_format"
    value {
      s: "NHWC"
    }
  }
  attr {
    key: "ksize"
    value {
      list {
        i: 1
        i: 2
        i: 2
        i: 1
      }
    }
  }
  attr {
    key: "padding"
    value {
      s: "SAME"
    }
  }
  attr {
    key: "strides"
    value {
      list {
        i: 1
        i: 2
        i: 2
        i: 1
      }
    }
  }
}
node {
  name: "conv2/kernel/Initializer/random_uniform/shape"
  op: "Const"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@conv2/kernel"
      }
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_INT32
        tensor_shape {
          dim {
            size: 4
          }
        }
        tensor_content: "\003\000\000\000\003\000\000\000@\000\000\000\200\000\000\000"
      }
    }
  }
}
node {
  name: "conv2/kernel/Initializer/random_uniform/min"
  op: "Const"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@conv2/kernel"
      }
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
        }
        float_val: -0.0589255653321743
      }
    }
  }
}
node {
  name: "conv2/kernel/Initializer/random_uniform/max"
  op: "Const"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@conv2/kernel"
      }
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
        }
        float_val: 0.0589255653321743
      }
    }
  }
}
node {
  name: "conv2/kernel/Initializer/random_uniform/RandomUniform"
  op: "RandomUniform"
  input: "conv2/kernel/Initializer/random_uniform/shape"
  attr {
    key: "T"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@conv2/kernel"
      }
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "seed"
    value {
      i: 0
    }
  }
  attr {
    key: "seed2"
    value {
      i: 0
    }
  }
}
node {
  name: "conv2/kernel/Initializer/random_uniform/sub"
  op: "Sub"
  input: "conv2/kernel/Initializer/random_uniform/max"
  input: "conv2/kernel/Initializer/random_uniform/min"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@conv2/kernel"
      }
    }
  }
}
node {
  name: "conv2/kernel/Initializer/random_uniform/mul"
  op: "Mul"
  input: "conv2/kernel/Initializer/random_uniform/RandomUniform"
  input: "conv2/kernel/Initializer/random_uniform/sub"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@conv2/kernel"
      }
    }
  }
}
node {
  name: "conv2/kernel/Initializer/random_uniform"
  op: "Add"
  input: "conv2/kernel/Initializer/random_uniform/mul"
  input: "conv2/kernel/Initializer/random_uniform/min"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@conv2/kernel"
      }
    }
  }
}
node {
  name: "conv2/kernel"
  op: "VariableV2"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@conv2/kernel"
      }
    }
  }
  attr {
    key: "container"
    value {
      s: ""
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "shape"
    value {
      shape {
        dim {
          size: 3
        }
        dim {
          size: 3
        }
        dim {
          size: 64
        }
        dim {
          size: 128
        }
      }
    }
  }
  attr {
    key: "shared_name"
    value {
      s: ""
    }
  }
}
node {
  name: "conv2/kernel/Assign"
  op: "Assign"
  input: "conv2/kernel"
  input: "conv2/kernel/Initializer/random_uniform"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@conv2/kernel"
      }
    }
  }
  attr {
    key: "use_locking"
    value {
      b: true
    }
  }
  attr {
    key: "validate_shape"
    value {
      b: true
    }
  }
}
node {
  name: "conv2/kernel/read"
  op: "Identity"
  input: "conv2/kernel"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@conv2/kernel"
      }
    }
  }
}
node {
  name: "conv2/bias/Initializer/zeros"
  op: "Const"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@conv2/bias"
      }
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
          dim {
            size: 128
          }
        }
        float_val: 0.0
      }
    }
  }
}
node {
  name: "conv2/bias"
  op: "VariableV2"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@conv2/bias"
      }
    }
  }
  attr {
    key: "container"
    value {
      s: ""
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "shape"
    value {
      shape {
        dim {
          size: 128
        }
      }
    }
  }
  attr {
    key: "shared_name"
    value {
      s: ""
    }
  }
}
node {
  name: "conv2/bias/Assign"
  op: "Assign"
  input: "conv2/bias"
  input: "conv2/bias/Initializer/zeros"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@conv2/bias"
      }
    }
  }
  attr {
    key: "use_locking"
    value {
      b: true
    }
  }
  attr {
    key: "validate_shape"
    value {
      b: true
    }
  }
}
node {
  name: "conv2/bias/read"
  op: "Identity"
  input: "conv2/bias"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@conv2/bias"
      }
    }
  }
}
node {
  name: "conv2/dilation_rate"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_INT32
        tensor_shape {
          dim {
            size: 2
          }
        }
        tensor_content: "\001\000\000\000\001\000\000\000"
      }
    }
  }
}
node {
  name: "conv2/Conv2D"
  op: "Conv2D"
  input: "max_pool1/MaxPool"
  input: "conv2/kernel/read"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "data_format"
    value {
      s: "NHWC"
    }
  }
  attr {
    key: "dilations"
    value {
      list {
        i: 1
        i: 1
        i: 1
        i: 1
      }
    }
  }
  attr {
    key: "padding"
    value {
      s: "SAME"
    }
  }
  attr {
    key: "strides"
    value {
      list {
        i: 1
        i: 1
        i: 1
        i: 1
      }
    }
  }
  attr {
    key: "use_cudnn_on_gpu"
    value {
      b: true
    }
  }
}
node {
  name: "conv2/BiasAdd"
  op: "BiasAdd"
  input: "conv2/Conv2D"
  input: "conv2/bias/read"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "data_format"
    value {
      s: "NHWC"
    }
  }
}
node {
  name: "max_pool2/MaxPool"
  op: "MaxPool"
  input: "conv2/BiasAdd"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "data_format"
    value {
      s: "NHWC"
    }
  }
  attr {
    key: "ksize"
    value {
      list {
        i: 1
        i: 2
        i: 2
        i: 1
      }
    }
  }
  attr {
    key: "padding"
    value {
      s: "SAME"
    }
  }
  attr {
    key: "strides"
    value {
      list {
        i: 1
        i: 2
        i: 2
        i: 1
      }
    }
  }
}
node {
  name: "conv3/kernel/Initializer/random_uniform/shape"
  op: "Const"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@conv3/kernel"
      }
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_INT32
        tensor_shape {
          dim {
            size: 4
          }
        }
        tensor_content: "\003\000\000\000\003\000\000\000\200\000\000\000\000\001\000\000"
      }
    }
  }
}
node {
  name: "conv3/kernel/Initializer/random_uniform/min"
  op: "Const"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@conv3/kernel"
      }
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
        }
        float_val: -0.0416666679084301
      }
    }
  }
}
node {
  name: "conv3/kernel/Initializer/random_uniform/max"
  op: "Const"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@conv3/kernel"
      }
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
        }
        float_val: 0.0416666679084301
      }
    }
  }
}
node {
  name: "conv3/kernel/Initializer/random_uniform/RandomUniform"
  op: "RandomUniform"
  input: "conv3/kernel/Initializer/random_uniform/shape"
  attr {
    key: "T"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@conv3/kernel"
      }
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "seed"
    value {
      i: 0
    }
  }
  attr {
    key: "seed2"
    value {
      i: 0
    }
  }
}
node {
  name: "conv3/kernel/Initializer/random_uniform/sub"
  op: "Sub"
  input: "conv3/kernel/Initializer/random_uniform/max"
  input: "conv3/kernel/Initializer/random_uniform/min"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@conv3/kernel"
      }
    }
  }
}
node {
  name: "conv3/kernel/Initializer/random_uniform/mul"
  op: "Mul"
  input: "conv3/kernel/Initializer/random_uniform/RandomUniform"
  input: "conv3/kernel/Initializer/random_uniform/sub"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@conv3/kernel"
      }
    }
  }
}
node {
  name: "conv3/kernel/Initializer/random_uniform"
  op: "Add"
  input: "conv3/kernel/Initializer/random_uniform/mul"
  input: "conv3/kernel/Initializer/random_uniform/min"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@conv3/kernel"
      }
    }
  }
}
node {
  name: "conv3/kernel"
  op: "VariableV2"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@conv3/kernel"
      }
    }
  }
  attr {
    key: "container"
    value {
      s: ""
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "shape"
    value {
      shape {
        dim {
          size: 3
        }
        dim {
          size: 3
        }
        dim {
          size: 128
        }
        dim {
          size: 256
        }
      }
    }
  }
  attr {
    key: "shared_name"
    value {
      s: ""
    }
  }
}
node {
  name: "conv3/kernel/Assign"
  op: "Assign"
  input: "conv3/kernel"
  input: "conv3/kernel/Initializer/random_uniform"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@conv3/kernel"
      }
    }
  }
  attr {
    key: "use_locking"
    value {
      b: true
    }
  }
  attr {
    key: "validate_shape"
    value {
      b: true
    }
  }
}
node {
  name: "conv3/kernel/read"
  op: "Identity"
  input: "conv3/kernel"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@conv3/kernel"
      }
    }
  }
}
node {
  name: "conv3/bias/Initializer/zeros"
  op: "Const"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@conv3/bias"
      }
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
          dim {
            size: 256
          }
        }
        float_val: 0.0
      }
    }
  }
}
node {
  name: "conv3/bias"
  op: "VariableV2"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@conv3/bias"
      }
    }
  }
  attr {
    key: "container"
    value {
      s: ""
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "shape"
    value {
      shape {
        dim {
          size: 256
        }
      }
    }
  }
  attr {
    key: "shared_name"
    value {
      s: ""
    }
  }
}
node {
  name: "conv3/bias/Assign"
  op: "Assign"
  input: "conv3/bias"
  input: "conv3/bias/Initializer/zeros"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@conv3/bias"
      }
    }
  }
  attr {
    key: "use_locking"
    value {
      b: true
    }
  }
  attr {
    key: "validate_shape"
    value {
      b: true
    }
  }
}
node {
  name: "conv3/bias/read"
  op: "Identity"
  input: "conv3/bias"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@conv3/bias"
      }
    }
  }
}
node {
  name: "conv3/dilation_rate"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_INT32
        tensor_shape {
          dim {
            size: 2
          }
        }
        tensor_content: "\001\000\000\000\001\000\000\000"
      }
    }
  }
}
node {
  name: "conv3/Conv2D"
  op: "Conv2D"
  input: "max_pool2/MaxPool"
  input: "conv3/kernel/read"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "data_format"
    value {
      s: "NHWC"
    }
  }
  attr {
    key: "dilations"
    value {
      list {
        i: 1
        i: 1
        i: 1
        i: 1
      }
    }
  }
  attr {
    key: "padding"
    value {
      s: "SAME"
    }
  }
  attr {
    key: "strides"
    value {
      list {
        i: 1
        i: 1
        i: 1
        i: 1
      }
    }
  }
  attr {
    key: "use_cudnn_on_gpu"
    value {
      b: true
    }
  }
}
node {
  name: "conv3/BiasAdd"
  op: "BiasAdd"
  input: "conv3/Conv2D"
  input: "conv3/bias/read"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "data_format"
    value {
      s: "NHWC"
    }
  }
}
node {
  name: "max_pool3/MaxPool"
  op: "MaxPool"
  input: "conv3/BiasAdd"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "data_format"
    value {
      s: "NHWC"
    }
  }
  attr {
    key: "ksize"
    value {
      list {
        i: 1
        i: 2
        i: 2
        i: 1
      }
    }
  }
  attr {
    key: "padding"
    value {
      s: "SAME"
    }
  }
  attr {
    key: "strides"
    value {
      list {
        i: 1
        i: 2
        i: 2
        i: 1
      }
    }
  }
}
node {
  name: "flatten/Shape"
  op: "Shape"
  input: "max_pool3/MaxPool"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "out_type"
    value {
      type: DT_INT32
    }
  }
}
node {
  name: "flatten/strided_slice/stack"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_INT32
        tensor_shape {
          dim {
            size: 1
          }
        }
        int_val: 0
      }
    }
  }
}
node {
  name: "flatten/strided_slice/stack_1"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_INT32
        tensor_shape {
          dim {
            size: 1
          }
        }
        int_val: 1
      }
    }
  }
}
node {
  name: "flatten/strided_slice/stack_2"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_INT32
        tensor_shape {
          dim {
            size: 1
          }
        }
        int_val: 1
      }
    }
  }
}
node {
  name: "flatten/strided_slice"
  op: "StridedSlice"
  input: "flatten/Shape"
  input: "flatten/strided_slice/stack"
  input: "flatten/strided_slice/stack_1"
  input: "flatten/strided_slice/stack_2"
  attr {
    key: "Index"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "T"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "begin_mask"
    value {
      i: 0
    }
  }
  attr {
    key: "ellipsis_mask"
    value {
      i: 0
    }
  }
  attr {
    key: "end_mask"
    value {
      i: 0
    }
  }
  attr {
    key: "new_axis_mask"
    value {
      i: 0
    }
  }
  attr {
    key: "shrink_axis_mask"
    value {
      i: 1
    }
  }
}
node {
  name: "flatten/Reshape/shape/1"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_INT32
        tensor_shape {
        }
        int_val: -1
      }
    }
  }
}
node {
  name: "flatten/Reshape/shape"
  op: "Pack"
  input: "flatten/strided_slice"
  input: "flatten/Reshape/shape/1"
  attr {
    key: "N"
    value {
      i: 2
    }
  }
  attr {
    key: "T"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "axis"
    value {
      i: 0
    }
  }
}
node {
  name: "flatten/Reshape"
  op: "Reshape"
  input: "max_pool3/MaxPool"
  input: "flatten/Reshape/shape"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "Tshape"
    value {
      type: DT_INT32
    }
  }
}
node {
  name: "dropout/Identity"
  op: "Identity"
  input: "flatten/Reshape"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "fc1/weights/Initializer/random_uniform/shape"
  op: "Const"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@fc1/weights"
      }
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_INT32
        tensor_shape {
          dim {
            size: 2
          }
        }
        tensor_content: "\000@\000\000\000\004\000\000"
      }
    }
  }
}
node {
  name: "fc1/weights/Initializer/random_uniform/min"
  op: "Const"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@fc1/weights"
      }
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
        }
        float_val: -0.018565267324447632
      }
    }
  }
}
node {
  name: "fc1/weights/Initializer/random_uniform/max"
  op: "Const"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@fc1/weights"
      }
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
        }
        float_val: 0.018565267324447632
      }
    }
  }
}
node {
  name: "fc1/weights/Initializer/random_uniform/RandomUniform"
  op: "RandomUniform"
  input: "fc1/weights/Initializer/random_uniform/shape"
  attr {
    key: "T"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@fc1/weights"
      }
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "seed"
    value {
      i: 0
    }
  }
  attr {
    key: "seed2"
    value {
      i: 0
    }
  }
}
node {
  name: "fc1/weights/Initializer/random_uniform/sub"
  op: "Sub"
  input: "fc1/weights/Initializer/random_uniform/max"
  input: "fc1/weights/Initializer/random_uniform/min"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@fc1/weights"
      }
    }
  }
}
node {
  name: "fc1/weights/Initializer/random_uniform/mul"
  op: "Mul"
  input: "fc1/weights/Initializer/random_uniform/RandomUniform"
  input: "fc1/weights/Initializer/random_uniform/sub"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@fc1/weights"
      }
    }
  }
}
node {
  name: "fc1/weights/Initializer/random_uniform"
  op: "Add"
  input: "fc1/weights/Initializer/random_uniform/mul"
  input: "fc1/weights/Initializer/random_uniform/min"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@fc1/weights"
      }
    }
  }
}
node {
  name: "fc1/weights"
  op: "VariableV2"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@fc1/weights"
      }
    }
  }
  attr {
    key: "container"
    value {
      s: ""
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "shape"
    value {
      shape {
        dim {
          size: 16384
        }
        dim {
          size: 1024
        }
      }
    }
  }
  attr {
    key: "shared_name"
    value {
      s: ""
    }
  }
}
node {
  name: "fc1/weights/Assign"
  op: "Assign"
  input: "fc1/weights"
  input: "fc1/weights/Initializer/random_uniform"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@fc1/weights"
      }
    }
  }
  attr {
    key: "use_locking"
    value {
      b: true
    }
  }
  attr {
    key: "validate_shape"
    value {
      b: true
    }
  }
}
node {
  name: "fc1/weights/read"
  op: "Identity"
  input: "fc1/weights"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@fc1/weights"
      }
    }
  }
}
node {
  name: "fc1/biases/Initializer/zeros/shape_as_tensor"
  op: "Const"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@fc1/biases"
      }
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_INT32
        tensor_shape {
          dim {
            size: 1
          }
        }
        int_val: 1024
      }
    }
  }
}
node {
  name: "fc1/biases/Initializer/zeros/Const"
  op: "Const"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@fc1/biases"
      }
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
        }
        float_val: 0.0
      }
    }
  }
}
node {
  name: "fc1/biases/Initializer/zeros"
  op: "Fill"
  input: "fc1/biases/Initializer/zeros/shape_as_tensor"
  input: "fc1/biases/Initializer/zeros/Const"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@fc1/biases"
      }
    }
  }
  attr {
    key: "index_type"
    value {
      type: DT_INT32
    }
  }
}
node {
  name: "fc1/biases"
  op: "VariableV2"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@fc1/biases"
      }
    }
  }
  attr {
    key: "container"
    value {
      s: ""
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "shape"
    value {
      shape {
        dim {
          size: 1024
        }
      }
    }
  }
  attr {
    key: "shared_name"
    value {
      s: ""
    }
  }
}
node {
  name: "fc1/biases/Assign"
  op: "Assign"
  input: "fc1/biases"
  input: "fc1/biases/Initializer/zeros"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@fc1/biases"
      }
    }
  }
  attr {
    key: "use_locking"
    value {
      b: true
    }
  }
  attr {
    key: "validate_shape"
    value {
      b: true
    }
  }
}
node {
  name: "fc1/biases/read"
  op: "Identity"
  input: "fc1/biases"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@fc1/biases"
      }
    }
  }
}
node {
  name: "fc1/MatMul"
  op: "MatMul"
  input: "dropout/Identity"
  input: "fc1/weights/read"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "transpose_a"
    value {
      b: false
    }
  }
  attr {
    key: "transpose_b"
    value {
      b: false
    }
  }
}
node {
  name: "fc1/BiasAdd"
  op: "BiasAdd"
  input: "fc1/MatMul"
  input: "fc1/biases/read"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "data_format"
    value {
      s: "NHWC"
    }
  }
}
node {
  name: "fc1/Tanh"
  op: "Tanh"
  input: "fc1/BiasAdd"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "dropout_1/Identity"
  op: "Identity"
  input: "fc1/Tanh"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "fc2/weights/Initializer/random_uniform/shape"
  op: "Const"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@fc2/weights"
      }
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_INT32
        tensor_shape {
          dim {
            size: 2
          }
        }
        tensor_content: "\000\004\000\000\005\000\000\000"
      }
    }
  }
}
node {
  name: "fc2/weights/Initializer/random_uniform/min"
  op: "Const"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@fc2/weights"
      }
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
        }
        float_val: -0.07636035233736038
      }
    }
  }
}
node {
  name: "fc2/weights/Initializer/random_uniform/max"
  op: "Const"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@fc2/weights"
      }
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
        }
        float_val: 0.07636035233736038
      }
    }
  }
}
node {
  name: "fc2/weights/Initializer/random_uniform/RandomUniform"
  op: "RandomUniform"
  input: "fc2/weights/Initializer/random_uniform/shape"
  attr {
    key: "T"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@fc2/weights"
      }
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "seed"
    value {
      i: 0
    }
  }
  attr {
    key: "seed2"
    value {
      i: 0
    }
  }
}
node {
  name: "fc2/weights/Initializer/random_uniform/sub"
  op: "Sub"
  input: "fc2/weights/Initializer/random_uniform/max"
  input: "fc2/weights/Initializer/random_uniform/min"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@fc2/weights"
      }
    }
  }
}
node {
  name: "fc2/weights/Initializer/random_uniform/mul"
  op: "Mul"
  input: "fc2/weights/Initializer/random_uniform/RandomUniform"
  input: "fc2/weights/Initializer/random_uniform/sub"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@fc2/weights"
      }
    }
  }
}
node {
  name: "fc2/weights/Initializer/random_uniform"
  op: "Add"
  input: "fc2/weights/Initializer/random_uniform/mul"
  input: "fc2/weights/Initializer/random_uniform/min"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@fc2/weights"
      }
    }
  }
}
node {
  name: "fc2/weights"
  op: "VariableV2"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@fc2/weights"
      }
    }
  }
  attr {
    key: "container"
    value {
      s: ""
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "shape"
    value {
      shape {
        dim {
          size: 1024
        }
        dim {
          size: 5
        }
      }
    }
  }
  attr {
    key: "shared_name"
    value {
      s: ""
    }
  }
}
node {
  name: "fc2/weights/Assign"
  op: "Assign"
  input: "fc2/weights"
  input: "fc2/weights/Initializer/random_uniform"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@fc2/weights"
      }
    }
  }
  attr {
    key: "use_locking"
    value {
      b: true
    }
  }
  attr {
    key: "validate_shape"
    value {
      b: true
    }
  }
}
node {
  name: "fc2/weights/read"
  op: "Identity"
  input: "fc2/weights"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@fc2/weights"
      }
    }
  }
}
node {
  name: "fc2/biases/Initializer/zeros"
  op: "Const"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@fc2/biases"
      }
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
          dim {
            size: 5
          }
        }
        float_val: 0.0
      }
    }
  }
}
node {
  name: "fc2/biases"
  op: "VariableV2"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@fc2/biases"
      }
    }
  }
  attr {
    key: "container"
    value {
      s: ""
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "shape"
    value {
      shape {
        dim {
          size: 5
        }
      }
    }
  }
  attr {
    key: "shared_name"
    value {
      s: ""
    }
  }
}
node {
  name: "fc2/biases/Assign"
  op: "Assign"
  input: "fc2/biases"
  input: "fc2/biases/Initializer/zeros"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@fc2/biases"
      }
    }
  }
  attr {
    key: "use_locking"
    value {
      b: true
    }
  }
  attr {
    key: "validate_shape"
    value {
      b: true
    }
  }
}
node {
  name: "fc2/biases/read"
  op: "Identity"
  input: "fc2/biases"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@fc2/biases"
      }
    }
  }
}
node {
  name: "fc2/MatMul"
  op: "MatMul"
  input: "dropout_1/Identity"
  input: "fc2/weights/read"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "transpose_a"
    value {
      b: false
    }
  }
  attr {
    key: "transpose_b"
    value {
      b: false
    }
  }
}
node {
  name: "fc2/BiasAdd"
  op: "BiasAdd"
  input: "fc2/MatMul"
  input: "fc2/biases/read"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "data_format"
    value {
      s: "NHWC"
    }
  }
}
node {
  name: "SparseSoftmaxCrossEntropyWithLogits/Shape"
  op: "Shape"
  input: "label_batch"
  attr {
    key: "T"
    value {
      type: DT_INT64
    }
  }
  attr {
    key: "out_type"
    value {
      type: DT_INT32
    }
  }
}
node {
  name: "SparseSoftmaxCrossEntropyWithLogits/SparseSoftmaxCrossEntropyWithLogits"
  op: "SparseSoftmaxCrossEntropyWithLogits"
  input: "fc2/BiasAdd"
  input: "label_batch"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "Tlabels"
    value {
      type: DT_INT64
    }
  }
}
node {
  name: "Const"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_INT32
        tensor_shape {
          dim {
            size: 1
          }
        }
        int_val: 0
      }
    }
  }
}
node {
  name: "Mean"
  op: "Mean"
  input: "SparseSoftmaxCrossEntropyWithLogits/SparseSoftmaxCrossEntropyWithLogits"
  input: "Const"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "Tidx"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "keep_dims"
    value {
      b: false
    }
  }
}
node {
  name: "ArgMax/dimension"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_INT32
        tensor_shape {
        }
        int_val: 1
      }
    }
  }
}
node {
  name: "ArgMax"
  op: "ArgMax"
  input: "fc2/BiasAdd"
  input: "ArgMax/dimension"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "Tidx"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "output_type"
    value {
      type: DT_INT64
    }
  }
}
node {
  name: "Equal"
  op: "Equal"
  input: "ArgMax"
  input: "label_batch"
  attr {
    key: "T"
    value {
      type: DT_INT64
    }
  }
}
node {
  name: "Cast"
  op: "Cast"
  input: "Equal"
  attr {
    key: "DstT"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "SrcT"
    value {
      type: DT_BOOL
    }
  }
}
node {
  name: "Const_1"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_INT32
        tensor_shape {
          dim {
            size: 1
          }
        }
        int_val: 0
      }
    }
  }
}
node {
  name: "Mean_1"
  op: "Mean"
  input: "Cast"
  input: "Const_1"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "Tidx"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "keep_dims"
    value {
      b: false
    }
  }
}
node {
  name: "step/Initializer/Const"
  op: "Const"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@step"
      }
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
        }
        float_val: 0.0
      }
    }
  }
}
node {
  name: "step"
  op: "VariableV2"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@step"
      }
    }
  }
  attr {
    key: "container"
    value {
      s: ""
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "shape"
    value {
      shape {
      }
    }
  }
  attr {
    key: "shared_name"
    value {
      s: ""
    }
  }
}
node {
  name: "step/Assign"
  op: "Assign"
  input: "step"
  input: "step/Initializer/Const"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@step"
      }
    }
  }
  attr {
    key: "use_locking"
    value {
      b: true
    }
  }
  attr {
    key: "validate_shape"
    value {
      b: true
    }
  }
}
node {
  name: "step/read"
  op: "Identity"
  input: "step"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@step"
      }
    }
  }
}
node {
  name: "ExponentialDecay/learning_rate"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
        }
        float_val: 0.00019999999494757503
      }
    }
  }
}
node {
  name: "ExponentialDecay/Cast/x"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_INT32
        tensor_shape {
        }
        int_val: 2000
      }
    }
  }
}
node {
  name: "ExponentialDecay/Cast"
  op: "Cast"
  input: "ExponentialDecay/Cast/x"
  attr {
    key: "DstT"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "SrcT"
    value {
      type: DT_INT32
    }
  }
}
node {
  name: "ExponentialDecay/Cast_1/x"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
        }
        float_val: 0.9700000286102295
      }
    }
  }
}
node {
  name: "ExponentialDecay/truediv"
  op: "RealDiv"
  input: "step/read"
  input: "ExponentialDecay/Cast"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "ExponentialDecay/Floor"
  op: "Floor"
  input: "ExponentialDecay/truediv"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "ExponentialDecay/Pow"
  op: "Pow"
  input: "ExponentialDecay/Cast_1/x"
  input: "ExponentialDecay/Floor"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "ExponentialDecay"
  op: "Mul"
  input: "ExponentialDecay/learning_rate"
  input: "ExponentialDecay/Pow"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "gradients/Shape"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_INT32
        tensor_shape {
          dim {
          }
        }
      }
    }
  }
}
node {
  name: "gradients/grad_ys_0"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
        }
        float_val: 1.0
      }
    }
  }
}
node {
  name: "gradients/Fill"
  op: "Fill"
  input: "gradients/Shape"
  input: "gradients/grad_ys_0"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "index_type"
    value {
      type: DT_INT32
    }
  }
}
node {
  name: "gradients/Mean_grad/Reshape/shape"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_INT32
        tensor_shape {
          dim {
            size: 1
          }
        }
        int_val: 1
      }
    }
  }
}
node {
  name: "gradients/Mean_grad/Reshape"
  op: "Reshape"
  input: "gradients/Fill"
  input: "gradients/Mean_grad/Reshape/shape"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "Tshape"
    value {
      type: DT_INT32
    }
  }
}
node {
  name: "gradients/Mean_grad/Shape"
  op: "Shape"
  input: "SparseSoftmaxCrossEntropyWithLogits/SparseSoftmaxCrossEntropyWithLogits"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "out_type"
    value {
      type: DT_INT32
    }
  }
}
node {
  name: "gradients/Mean_grad/Tile"
  op: "Tile"
  input: "gradients/Mean_grad/Reshape"
  input: "gradients/Mean_grad/Shape"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "Tmultiples"
    value {
      type: DT_INT32
    }
  }
}
node {
  name: "gradients/Mean_grad/Shape_1"
  op: "Shape"
  input: "SparseSoftmaxCrossEntropyWithLogits/SparseSoftmaxCrossEntropyWithLogits"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "out_type"
    value {
      type: DT_INT32
    }
  }
}
node {
  name: "gradients/Mean_grad/Shape_2"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_INT32
        tensor_shape {
          dim {
          }
        }
      }
    }
  }
}
node {
  name: "gradients/Mean_grad/Const"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_INT32
        tensor_shape {
          dim {
            size: 1
          }
        }
        int_val: 0
      }
    }
  }
}
node {
  name: "gradients/Mean_grad/Prod"
  op: "Prod"
  input: "gradients/Mean_grad/Shape_1"
  input: "gradients/Mean_grad/Const"
  attr {
    key: "T"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "Tidx"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "keep_dims"
    value {
      b: false
    }
  }
}
node {
  name: "gradients/Mean_grad/Const_1"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_INT32
        tensor_shape {
          dim {
            size: 1
          }
        }
        int_val: 0
      }
    }
  }
}
node {
  name: "gradients/Mean_grad/Prod_1"
  op: "Prod"
  input: "gradients/Mean_grad/Shape_2"
  input: "gradients/Mean_grad/Const_1"
  attr {
    key: "T"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "Tidx"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "keep_dims"
    value {
      b: false
    }
  }
}
node {
  name: "gradients/Mean_grad/Maximum/y"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_INT32
        tensor_shape {
        }
        int_val: 1
      }
    }
  }
}
node {
  name: "gradients/Mean_grad/Maximum"
  op: "Maximum"
  input: "gradients/Mean_grad/Prod_1"
  input: "gradients/Mean_grad/Maximum/y"
  attr {
    key: "T"
    value {
      type: DT_INT32
    }
  }
}
node {
  name: "gradients/Mean_grad/floordiv"
  op: "FloorDiv"
  input: "gradients/Mean_grad/Prod"
  input: "gradients/Mean_grad/Maximum"
  attr {
    key: "T"
    value {
      type: DT_INT32
    }
  }
}
node {
  name: "gradients/Mean_grad/Cast"
  op: "Cast"
  input: "gradients/Mean_grad/floordiv"
  attr {
    key: "DstT"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "SrcT"
    value {
      type: DT_INT32
    }
  }
}
node {
  name: "gradients/Mean_grad/truediv"
  op: "RealDiv"
  input: "gradients/Mean_grad/Tile"
  input: "gradients/Mean_grad/Cast"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "gradients/zeros_like"
  op: "ZerosLike"
  input: "SparseSoftmaxCrossEntropyWithLogits/SparseSoftmaxCrossEntropyWithLogits:1"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "gradients/SparseSoftmaxCrossEntropyWithLogits/SparseSoftmaxCrossEntropyWithLogits_grad/PreventGradient"
  op: "PreventGradient"
  input: "SparseSoftmaxCrossEntropyWithLogits/SparseSoftmaxCrossEntropyWithLogits:1"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "message"
    value {
      s: "Currently there is no way to take the second derivative of sparse_softmax_cross_entropy_with_logits due to the fused implementation\'s interaction with tf.gradients()"
    }
  }
}
node {
  name: "gradients/SparseSoftmaxCrossEntropyWithLogits/SparseSoftmaxCrossEntropyWithLogits_grad/ExpandDims/dim"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_INT32
        tensor_shape {
        }
        int_val: -1
      }
    }
  }
}
node {
  name: "gradients/SparseSoftmaxCrossEntropyWithLogits/SparseSoftmaxCrossEntropyWithLogits_grad/ExpandDims"
  op: "ExpandDims"
  input: "gradients/Mean_grad/truediv"
  input: "gradients/SparseSoftmaxCrossEntropyWithLogits/SparseSoftmaxCrossEntropyWithLogits_grad/ExpandDims/dim"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "Tdim"
    value {
      type: DT_INT32
    }
  }
}
node {
  name: "gradients/SparseSoftmaxCrossEntropyWithLogits/SparseSoftmaxCrossEntropyWithLogits_grad/mul"
  op: "Mul"
  input: "gradients/SparseSoftmaxCrossEntropyWithLogits/SparseSoftmaxCrossEntropyWithLogits_grad/ExpandDims"
  input: "gradients/SparseSoftmaxCrossEntropyWithLogits/SparseSoftmaxCrossEntropyWithLogits_grad/PreventGradient"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "gradients/fc2/BiasAdd_grad/BiasAddGrad"
  op: "BiasAddGrad"
  input: "gradients/SparseSoftmaxCrossEntropyWithLogits/SparseSoftmaxCrossEntropyWithLogits_grad/mul"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "data_format"
    value {
      s: "NHWC"
    }
  }
}
node {
  name: "gradients/fc2/BiasAdd_grad/tuple/group_deps"
  op: "NoOp"
  input: "^gradients/SparseSoftmaxCrossEntropyWithLogits/SparseSoftmaxCrossEntropyWithLogits_grad/mul"
  input: "^gradients/fc2/BiasAdd_grad/BiasAddGrad"
}
node {
  name: "gradients/fc2/BiasAdd_grad/tuple/control_dependency"
  op: "Identity"
  input: "gradients/SparseSoftmaxCrossEntropyWithLogits/SparseSoftmaxCrossEntropyWithLogits_grad/mul"
  input: "^gradients/fc2/BiasAdd_grad/tuple/group_deps"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@gradients/SparseSoftmaxCrossEntropyWithLogits/SparseSoftmaxCrossEntropyWithLogits_grad/mul"
      }
    }
  }
}
node {
  name: "gradients/fc2/BiasAdd_grad/tuple/control_dependency_1"
  op: "Identity"
  input: "gradients/fc2/BiasAdd_grad/BiasAddGrad"
  input: "^gradients/fc2/BiasAdd_grad/tuple/group_deps"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@gradients/fc2/BiasAdd_grad/BiasAddGrad"
      }
    }
  }
}
node {
  name: "gradients/fc2/MatMul_grad/MatMul"
  op: "MatMul"
  input: "gradients/fc2/BiasAdd_grad/tuple/control_dependency"
  input: "fc2/weights/read"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "transpose_a"
    value {
      b: false
    }
  }
  attr {
    key: "transpose_b"
    value {
      b: true
    }
  }
}
node {
  name: "gradients/fc2/MatMul_grad/MatMul_1"
  op: "MatMul"
  input: "dropout_1/Identity"
  input: "gradients/fc2/BiasAdd_grad/tuple/control_dependency"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "transpose_a"
    value {
      b: true
    }
  }
  attr {
    key: "transpose_b"
    value {
      b: false
    }
  }
}
node {
  name: "gradients/fc2/MatMul_grad/tuple/group_deps"
  op: "NoOp"
  input: "^gradients/fc2/MatMul_grad/MatMul"
  input: "^gradients/fc2/MatMul_grad/MatMul_1"
}
node {
  name: "gradients/fc2/MatMul_grad/tuple/control_dependency"
  op: "Identity"
  input: "gradients/fc2/MatMul_grad/MatMul"
  input: "^gradients/fc2/MatMul_grad/tuple/group_deps"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@gradients/fc2/MatMul_grad/MatMul"
      }
    }
  }
}
node {
  name: "gradients/fc2/MatMul_grad/tuple/control_dependency_1"
  op: "Identity"
  input: "gradients/fc2/MatMul_grad/MatMul_1"
  input: "^gradients/fc2/MatMul_grad/tuple/group_deps"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@gradients/fc2/MatMul_grad/MatMul_1"
      }
    }
  }
}
node {
  name: "gradients/fc1/Tanh_grad/TanhGrad"
  op: "TanhGrad"
  input: "fc1/Tanh"
  input: "gradients/fc2/MatMul_grad/tuple/control_dependency"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "gradients/fc1/BiasAdd_grad/BiasAddGrad"
  op: "BiasAddGrad"
  input: "gradients/fc1/Tanh_grad/TanhGrad"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "data_format"
    value {
      s: "NHWC"
    }
  }
}
node {
  name: "gradients/fc1/BiasAdd_grad/tuple/group_deps"
  op: "NoOp"
  input: "^gradients/fc1/BiasAdd_grad/BiasAddGrad"
  input: "^gradients/fc1/Tanh_grad/TanhGrad"
}
node {
  name: "gradients/fc1/BiasAdd_grad/tuple/control_dependency"
  op: "Identity"
  input: "gradients/fc1/Tanh_grad/TanhGrad"
  input: "^gradients/fc1/BiasAdd_grad/tuple/group_deps"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@gradients/fc1/Tanh_grad/TanhGrad"
      }
    }
  }
}
node {
  name: "gradients/fc1/BiasAdd_grad/tuple/control_dependency_1"
  op: "Identity"
  input: "gradients/fc1/BiasAdd_grad/BiasAddGrad"
  input: "^gradients/fc1/BiasAdd_grad/tuple/group_deps"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@gradients/fc1/BiasAdd_grad/BiasAddGrad"
      }
    }
  }
}
node {
  name: "gradients/fc1/MatMul_grad/MatMul"
  op: "MatMul"
  input: "gradients/fc1/BiasAdd_grad/tuple/control_dependency"
  input: "fc1/weights/read"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "transpose_a"
    value {
      b: false
    }
  }
  attr {
    key: "transpose_b"
    value {
      b: true
    }
  }
}
node {
  name: "gradients/fc1/MatMul_grad/MatMul_1"
  op: "MatMul"
  input: "dropout/Identity"
  input: "gradients/fc1/BiasAdd_grad/tuple/control_dependency"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "transpose_a"
    value {
      b: true
    }
  }
  attr {
    key: "transpose_b"
    value {
      b: false
    }
  }
}
node {
  name: "gradients/fc1/MatMul_grad/tuple/group_deps"
  op: "NoOp"
  input: "^gradients/fc1/MatMul_grad/MatMul"
  input: "^gradients/fc1/MatMul_grad/MatMul_1"
}
node {
  name: "gradients/fc1/MatMul_grad/tuple/control_dependency"
  op: "Identity"
  input: "gradients/fc1/MatMul_grad/MatMul"
  input: "^gradients/fc1/MatMul_grad/tuple/group_deps"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@gradients/fc1/MatMul_grad/MatMul"
      }
    }
  }
}
node {
  name: "gradients/fc1/MatMul_grad/tuple/control_dependency_1"
  op: "Identity"
  input: "gradients/fc1/MatMul_grad/MatMul_1"
  input: "^gradients/fc1/MatMul_grad/tuple/group_deps"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@gradients/fc1/MatMul_grad/MatMul_1"
      }
    }
  }
}
node {
  name: "gradients/flatten/Reshape_grad/Shape"
  op: "Shape"
  input: "max_pool3/MaxPool"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "out_type"
    value {
      type: DT_INT32
    }
  }
}
node {
  name: "gradients/flatten/Reshape_grad/Reshape"
  op: "Reshape"
  input: "gradients/fc1/MatMul_grad/tuple/control_dependency"
  input: "gradients/flatten/Reshape_grad/Shape"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "Tshape"
    value {
      type: DT_INT32
    }
  }
}
node {
  name: "gradients/max_pool3/MaxPool_grad/MaxPoolGrad"
  op: "MaxPoolGrad"
  input: "conv3/BiasAdd"
  input: "max_pool3/MaxPool"
  input: "gradients/flatten/Reshape_grad/Reshape"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "data_format"
    value {
      s: "NHWC"
    }
  }
  attr {
    key: "ksize"
    value {
      list {
        i: 1
        i: 2
        i: 2
        i: 1
      }
    }
  }
  attr {
    key: "padding"
    value {
      s: "SAME"
    }
  }
  attr {
    key: "strides"
    value {
      list {
        i: 1
        i: 2
        i: 2
        i: 1
      }
    }
  }
}
node {
  name: "gradients/conv3/BiasAdd_grad/BiasAddGrad"
  op: "BiasAddGrad"
  input: "gradients/max_pool3/MaxPool_grad/MaxPoolGrad"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "data_format"
    value {
      s: "NHWC"
    }
  }
}
node {
  name: "gradients/conv3/BiasAdd_grad/tuple/group_deps"
  op: "NoOp"
  input: "^gradients/conv3/BiasAdd_grad/BiasAddGrad"
  input: "^gradients/max_pool3/MaxPool_grad/MaxPoolGrad"
}
node {
  name: "gradients/conv3/BiasAdd_grad/tuple/control_dependency"
  op: "Identity"
  input: "gradients/max_pool3/MaxPool_grad/MaxPoolGrad"
  input: "^gradients/conv3/BiasAdd_grad/tuple/group_deps"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@gradients/max_pool3/MaxPool_grad/MaxPoolGrad"
      }
    }
  }
}
node {
  name: "gradients/conv3/BiasAdd_grad/tuple/control_dependency_1"
  op: "Identity"
  input: "gradients/conv3/BiasAdd_grad/BiasAddGrad"
  input: "^gradients/conv3/BiasAdd_grad/tuple/group_deps"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@gradients/conv3/BiasAdd_grad/BiasAddGrad"
      }
    }
  }
}
node {
  name: "gradients/conv3/Conv2D_grad/ShapeN"
  op: "ShapeN"
  input: "max_pool2/MaxPool"
  input: "conv3/kernel/read"
  attr {
    key: "N"
    value {
      i: 2
    }
  }
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "out_type"
    value {
      type: DT_INT32
    }
  }
}
node {
  name: "gradients/conv3/Conv2D_grad/Conv2DBackpropInput"
  op: "Conv2DBackpropInput"
  input: "gradients/conv3/Conv2D_grad/ShapeN"
  input: "conv3/kernel/read"
  input: "gradients/conv3/BiasAdd_grad/tuple/control_dependency"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "data_format"
    value {
      s: "NHWC"
    }
  }
  attr {
    key: "dilations"
    value {
      list {
        i: 1
        i: 1
        i: 1
        i: 1
      }
    }
  }
  attr {
    key: "padding"
    value {
      s: "SAME"
    }
  }
  attr {
    key: "strides"
    value {
      list {
        i: 1
        i: 1
        i: 1
        i: 1
      }
    }
  }
  attr {
    key: "use_cudnn_on_gpu"
    value {
      b: true
    }
  }
}
node {
  name: "gradients/conv3/Conv2D_grad/Conv2DBackpropFilter"
  op: "Conv2DBackpropFilter"
  input: "max_pool2/MaxPool"
  input: "gradients/conv3/Conv2D_grad/ShapeN:1"
  input: "gradients/conv3/BiasAdd_grad/tuple/control_dependency"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "data_format"
    value {
      s: "NHWC"
    }
  }
  attr {
    key: "dilations"
    value {
      list {
        i: 1
        i: 1
        i: 1
        i: 1
      }
    }
  }
  attr {
    key: "padding"
    value {
      s: "SAME"
    }
  }
  attr {
    key: "strides"
    value {
      list {
        i: 1
        i: 1
        i: 1
        i: 1
      }
    }
  }
  attr {
    key: "use_cudnn_on_gpu"
    value {
      b: true
    }
  }
}
node {
  name: "gradients/conv3/Conv2D_grad/tuple/group_deps"
  op: "NoOp"
  input: "^gradients/conv3/Conv2D_grad/Conv2DBackpropFilter"
  input: "^gradients/conv3/Conv2D_grad/Conv2DBackpropInput"
}
node {
  name: "gradients/conv3/Conv2D_grad/tuple/control_dependency"
  op: "Identity"
  input: "gradients/conv3/Conv2D_grad/Conv2DBackpropInput"
  input: "^gradients/conv3/Conv2D_grad/tuple/group_deps"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@gradients/conv3/Conv2D_grad/Conv2DBackpropInput"
      }
    }
  }
}
node {
  name: "gradients/conv3/Conv2D_grad/tuple/control_dependency_1"
  op: "Identity"
  input: "gradients/conv3/Conv2D_grad/Conv2DBackpropFilter"
  input: "^gradients/conv3/Conv2D_grad/tuple/group_deps"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@gradients/conv3/Conv2D_grad/Conv2DBackpropFilter"
      }
    }
  }
}
node {
  name: "gradients/max_pool2/MaxPool_grad/MaxPoolGrad"
  op: "MaxPoolGrad"
  input: "conv2/BiasAdd"
  input: "max_pool2/MaxPool"
  input: "gradients/conv3/Conv2D_grad/tuple/control_dependency"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "data_format"
    value {
      s: "NHWC"
    }
  }
  attr {
    key: "ksize"
    value {
      list {
        i: 1
        i: 2
        i: 2
        i: 1
      }
    }
  }
  attr {
    key: "padding"
    value {
      s: "SAME"
    }
  }
  attr {
    key: "strides"
    value {
      list {
        i: 1
        i: 2
        i: 2
        i: 1
      }
    }
  }
}
node {
  name: "gradients/conv2/BiasAdd_grad/BiasAddGrad"
  op: "BiasAddGrad"
  input: "gradients/max_pool2/MaxPool_grad/MaxPoolGrad"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "data_format"
    value {
      s: "NHWC"
    }
  }
}
node {
  name: "gradients/conv2/BiasAdd_grad/tuple/group_deps"
  op: "NoOp"
  input: "^gradients/conv2/BiasAdd_grad/BiasAddGrad"
  input: "^gradients/max_pool2/MaxPool_grad/MaxPoolGrad"
}
node {
  name: "gradients/conv2/BiasAdd_grad/tuple/control_dependency"
  op: "Identity"
  input: "gradients/max_pool2/MaxPool_grad/MaxPoolGrad"
  input: "^gradients/conv2/BiasAdd_grad/tuple/group_deps"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@gradients/max_pool2/MaxPool_grad/MaxPoolGrad"
      }
    }
  }
}
node {
  name: "gradients/conv2/BiasAdd_grad/tuple/control_dependency_1"
  op: "Identity"
  input: "gradients/conv2/BiasAdd_grad/BiasAddGrad"
  input: "^gradients/conv2/BiasAdd_grad/tuple/group_deps"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@gradients/conv2/BiasAdd_grad/BiasAddGrad"
      }
    }
  }
}
node {
  name: "gradients/conv2/Conv2D_grad/ShapeN"
  op: "ShapeN"
  input: "max_pool1/MaxPool"
  input: "conv2/kernel/read"
  attr {
    key: "N"
    value {
      i: 2
    }
  }
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "out_type"
    value {
      type: DT_INT32
    }
  }
}
node {
  name: "gradients/conv2/Conv2D_grad/Conv2DBackpropInput"
  op: "Conv2DBackpropInput"
  input: "gradients/conv2/Conv2D_grad/ShapeN"
  input: "conv2/kernel/read"
  input: "gradients/conv2/BiasAdd_grad/tuple/control_dependency"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "data_format"
    value {
      s: "NHWC"
    }
  }
  attr {
    key: "dilations"
    value {
      list {
        i: 1
        i: 1
        i: 1
        i: 1
      }
    }
  }
  attr {
    key: "padding"
    value {
      s: "SAME"
    }
  }
  attr {
    key: "strides"
    value {
      list {
        i: 1
        i: 1
        i: 1
        i: 1
      }
    }
  }
  attr {
    key: "use_cudnn_on_gpu"
    value {
      b: true
    }
  }
}
node {
  name: "gradients/conv2/Conv2D_grad/Conv2DBackpropFilter"
  op: "Conv2DBackpropFilter"
  input: "max_pool1/MaxPool"
  input: "gradients/conv2/Conv2D_grad/ShapeN:1"
  input: "gradients/conv2/BiasAdd_grad/tuple/control_dependency"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "data_format"
    value {
      s: "NHWC"
    }
  }
  attr {
    key: "dilations"
    value {
      list {
        i: 1
        i: 1
        i: 1
        i: 1
      }
    }
  }
  attr {
    key: "padding"
    value {
      s: "SAME"
    }
  }
  attr {
    key: "strides"
    value {
      list {
        i: 1
        i: 1
        i: 1
        i: 1
      }
    }
  }
  attr {
    key: "use_cudnn_on_gpu"
    value {
      b: true
    }
  }
}
node {
  name: "gradients/conv2/Conv2D_grad/tuple/group_deps"
  op: "NoOp"
  input: "^gradients/conv2/Conv2D_grad/Conv2DBackpropFilter"
  input: "^gradients/conv2/Conv2D_grad/Conv2DBackpropInput"
}
node {
  name: "gradients/conv2/Conv2D_grad/tuple/control_dependency"
  op: "Identity"
  input: "gradients/conv2/Conv2D_grad/Conv2DBackpropInput"
  input: "^gradients/conv2/Conv2D_grad/tuple/group_deps"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@gradients/conv2/Conv2D_grad/Conv2DBackpropInput"
      }
    }
  }
}
node {
  name: "gradients/conv2/Conv2D_grad/tuple/control_dependency_1"
  op: "Identity"
  input: "gradients/conv2/Conv2D_grad/Conv2DBackpropFilter"
  input: "^gradients/conv2/Conv2D_grad/tuple/group_deps"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@gradients/conv2/Conv2D_grad/Conv2DBackpropFilter"
      }
    }
  }
}
node {
  name: "gradients/max_pool1/MaxPool_grad/MaxPoolGrad"
  op: "MaxPoolGrad"
  input: "conv1/BiasAdd"
  input: "max_pool1/MaxPool"
  input: "gradients/conv2/Conv2D_grad/tuple/control_dependency"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "data_format"
    value {
      s: "NHWC"
    }
  }
  attr {
    key: "ksize"
    value {
      list {
        i: 1
        i: 2
        i: 2
        i: 1
      }
    }
  }
  attr {
    key: "padding"
    value {
      s: "SAME"
    }
  }
  attr {
    key: "strides"
    value {
      list {
        i: 1
        i: 2
        i: 2
        i: 1
      }
    }
  }
}
node {
  name: "gradients/conv1/BiasAdd_grad/BiasAddGrad"
  op: "BiasAddGrad"
  input: "gradients/max_pool1/MaxPool_grad/MaxPoolGrad"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "data_format"
    value {
      s: "NHWC"
    }
  }
}
node {
  name: "gradients/conv1/BiasAdd_grad/tuple/group_deps"
  op: "NoOp"
  input: "^gradients/conv1/BiasAdd_grad/BiasAddGrad"
  input: "^gradients/max_pool1/MaxPool_grad/MaxPoolGrad"
}
node {
  name: "gradients/conv1/BiasAdd_grad/tuple/control_dependency"
  op: "Identity"
  input: "gradients/max_pool1/MaxPool_grad/MaxPoolGrad"
  input: "^gradients/conv1/BiasAdd_grad/tuple/group_deps"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@gradients/max_pool1/MaxPool_grad/MaxPoolGrad"
      }
    }
  }
}
node {
  name: "gradients/conv1/BiasAdd_grad/tuple/control_dependency_1"
  op: "Identity"
  input: "gradients/conv1/BiasAdd_grad/BiasAddGrad"
  input: "^gradients/conv1/BiasAdd_grad/tuple/group_deps"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@gradients/conv1/BiasAdd_grad/BiasAddGrad"
      }
    }
  }
}
node {
  name: "gradients/conv1/Conv2D_grad/ShapeN"
  op: "ShapeN"
  input: "image_batch"
  input: "conv1/kernel/read"
  attr {
    key: "N"
    value {
      i: 2
    }
  }
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "out_type"
    value {
      type: DT_INT32
    }
  }
}
node {
  name: "gradients/conv1/Conv2D_grad/Conv2DBackpropInput"
  op: "Conv2DBackpropInput"
  input: "gradients/conv1/Conv2D_grad/ShapeN"
  input: "conv1/kernel/read"
  input: "gradients/conv1/BiasAdd_grad/tuple/control_dependency"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "data_format"
    value {
      s: "NHWC"
    }
  }
  attr {
    key: "dilations"
    value {
      list {
        i: 1
        i: 1
        i: 1
        i: 1
      }
    }
  }
  attr {
    key: "padding"
    value {
      s: "SAME"
    }
  }
  attr {
    key: "strides"
    value {
      list {
        i: 1
        i: 1
        i: 1
        i: 1
      }
    }
  }
  attr {
    key: "use_cudnn_on_gpu"
    value {
      b: true
    }
  }
}
node {
  name: "gradients/conv1/Conv2D_grad/Conv2DBackpropFilter"
  op: "Conv2DBackpropFilter"
  input: "image_batch"
  input: "gradients/conv1/Conv2D_grad/ShapeN:1"
  input: "gradients/conv1/BiasAdd_grad/tuple/control_dependency"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "data_format"
    value {
      s: "NHWC"
    }
  }
  attr {
    key: "dilations"
    value {
      list {
        i: 1
        i: 1
        i: 1
        i: 1
      }
    }
  }
  attr {
    key: "padding"
    value {
      s: "SAME"
    }
  }
  attr {
    key: "strides"
    value {
      list {
        i: 1
        i: 1
        i: 1
        i: 1
      }
    }
  }
  attr {
    key: "use_cudnn_on_gpu"
    value {
      b: true
    }
  }
}
node {
  name: "gradients/conv1/Conv2D_grad/tuple/group_deps"
  op: "NoOp"
  input: "^gradients/conv1/Conv2D_grad/Conv2DBackpropFilter"
  input: "^gradients/conv1/Conv2D_grad/Conv2DBackpropInput"
}
node {
  name: "gradients/conv1/Conv2D_grad/tuple/control_dependency"
  op: "Identity"
  input: "gradients/conv1/Conv2D_grad/Conv2DBackpropInput"
  input: "^gradients/conv1/Conv2D_grad/tuple/group_deps"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@gradients/conv1/Conv2D_grad/Conv2DBackpropInput"
      }
    }
  }
}
node {
  name: "gradients/conv1/Conv2D_grad/tuple/control_dependency_1"
  op: "Identity"
  input: "gradients/conv1/Conv2D_grad/Conv2DBackpropFilter"
  input: "^gradients/conv1/Conv2D_grad/tuple/group_deps"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@gradients/conv1/Conv2D_grad/Conv2DBackpropFilter"
      }
    }
  }
}
node {
  name: "beta1_power/initial_value"
  op: "Const"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@conv1/bias"
      }
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
        }
        float_val: 0.8999999761581421
      }
    }
  }
}
node {
  name: "beta1_power"
  op: "VariableV2"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@conv1/bias"
      }
    }
  }
  attr {
    key: "container"
    value {
      s: ""
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "shape"
    value {
      shape {
      }
    }
  }
  attr {
    key: "shared_name"
    value {
      s: ""
    }
  }
}
node {
  name: "beta1_power/Assign"
  op: "Assign"
  input: "beta1_power"
  input: "beta1_power/initial_value"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@conv1/bias"
      }
    }
  }
  attr {
    key: "use_locking"
    value {
      b: true
    }
  }
  attr {
    key: "validate_shape"
    value {
      b: true
    }
  }
}
node {
  name: "beta1_power/read"
  op: "Identity"
  input: "beta1_power"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@conv1/bias"
      }
    }
  }
}
node {
  name: "beta2_power/initial_value"
  op: "Const"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@conv1/bias"
      }
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
        }
        float_val: 0.9990000128746033
      }
    }
  }
}
node {
  name: "beta2_power"
  op: "VariableV2"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@conv1/bias"
      }
    }
  }
  attr {
    key: "container"
    value {
      s: ""
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "shape"
    value {
      shape {
      }
    }
  }
  attr {
    key: "shared_name"
    value {
      s: ""
    }
  }
}
node {
  name: "beta2_power/Assign"
  op: "Assign"
  input: "beta2_power"
  input: "beta2_power/initial_value"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@conv1/bias"
      }
    }
  }
  attr {
    key: "use_locking"
    value {
      b: true
    }
  }
  attr {
    key: "validate_shape"
    value {
      b: true
    }
  }
}
node {
  name: "beta2_power/read"
  op: "Identity"
  input: "beta2_power"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@conv1/bias"
      }
    }
  }
}
node {
  name: "conv1/kernel/Adam/Initializer/zeros"
  op: "Const"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@conv1/kernel"
      }
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
          dim {
            size: 3
          }
          dim {
            size: 3
          }
          dim {
            size: 1
          }
          dim {
            size: 64
          }
        }
        float_val: 0.0
      }
    }
  }
}
node {
  name: "conv1/kernel/Adam"
  op: "VariableV2"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@conv1/kernel"
      }
    }
  }
  attr {
    key: "container"
    value {
      s: ""
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "shape"
    value {
      shape {
        dim {
          size: 3
        }
        dim {
          size: 3
        }
        dim {
          size: 1
        }
        dim {
          size: 64
        }
      }
    }
  }
  attr {
    key: "shared_name"
    value {
      s: ""
    }
  }
}
node {
  name: "conv1/kernel/Adam/Assign"
  op: "Assign"
  input: "conv1/kernel/Adam"
  input: "conv1/kernel/Adam/Initializer/zeros"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@conv1/kernel"
      }
    }
  }
  attr {
    key: "use_locking"
    value {
      b: true
    }
  }
  attr {
    key: "validate_shape"
    value {
      b: true
    }
  }
}
node {
  name: "conv1/kernel/Adam/read"
  op: "Identity"
  input: "conv1/kernel/Adam"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@conv1/kernel"
      }
    }
  }
}
node {
  name: "conv1/kernel/Adam_1/Initializer/zeros"
  op: "Const"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@conv1/kernel"
      }
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
          dim {
            size: 3
          }
          dim {
            size: 3
          }
          dim {
            size: 1
          }
          dim {
            size: 64
          }
        }
        float_val: 0.0
      }
    }
  }
}
node {
  name: "conv1/kernel/Adam_1"
  op: "VariableV2"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@conv1/kernel"
      }
    }
  }
  attr {
    key: "container"
    value {
      s: ""
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "shape"
    value {
      shape {
        dim {
          size: 3
        }
        dim {
          size: 3
        }
        dim {
          size: 1
        }
        dim {
          size: 64
        }
      }
    }
  }
  attr {
    key: "shared_name"
    value {
      s: ""
    }
  }
}
node {
  name: "conv1/kernel/Adam_1/Assign"
  op: "Assign"
  input: "conv1/kernel/Adam_1"
  input: "conv1/kernel/Adam_1/Initializer/zeros"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@conv1/kernel"
      }
    }
  }
  attr {
    key: "use_locking"
    value {
      b: true
    }
  }
  attr {
    key: "validate_shape"
    value {
      b: true
    }
  }
}
node {
  name: "conv1/kernel/Adam_1/read"
  op: "Identity"
  input: "conv1/kernel/Adam_1"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@conv1/kernel"
      }
    }
  }
}
node {
  name: "conv1/bias/Adam/Initializer/zeros"
  op: "Const"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@conv1/bias"
      }
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
          dim {
            size: 64
          }
        }
        float_val: 0.0
      }
    }
  }
}
node {
  name: "conv1/bias/Adam"
  op: "VariableV2"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@conv1/bias"
      }
    }
  }
  attr {
    key: "container"
    value {
      s: ""
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "shape"
    value {
      shape {
        dim {
          size: 64
        }
      }
    }
  }
  attr {
    key: "shared_name"
    value {
      s: ""
    }
  }
}
node {
  name: "conv1/bias/Adam/Assign"
  op: "Assign"
  input: "conv1/bias/Adam"
  input: "conv1/bias/Adam/Initializer/zeros"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@conv1/bias"
      }
    }
  }
  attr {
    key: "use_locking"
    value {
      b: true
    }
  }
  attr {
    key: "validate_shape"
    value {
      b: true
    }
  }
}
node {
  name: "conv1/bias/Adam/read"
  op: "Identity"
  input: "conv1/bias/Adam"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@conv1/bias"
      }
    }
  }
}
node {
  name: "conv1/bias/Adam_1/Initializer/zeros"
  op: "Const"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@conv1/bias"
      }
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
          dim {
            size: 64
          }
        }
        float_val: 0.0
      }
    }
  }
}
node {
  name: "conv1/bias/Adam_1"
  op: "VariableV2"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@conv1/bias"
      }
    }
  }
  attr {
    key: "container"
    value {
      s: ""
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "shape"
    value {
      shape {
        dim {
          size: 64
        }
      }
    }
  }
  attr {
    key: "shared_name"
    value {
      s: ""
    }
  }
}
node {
  name: "conv1/bias/Adam_1/Assign"
  op: "Assign"
  input: "conv1/bias/Adam_1"
  input: "conv1/bias/Adam_1/Initializer/zeros"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@conv1/bias"
      }
    }
  }
  attr {
    key: "use_locking"
    value {
      b: true
    }
  }
  attr {
    key: "validate_shape"
    value {
      b: true
    }
  }
}
node {
  name: "conv1/bias/Adam_1/read"
  op: "Identity"
  input: "conv1/bias/Adam_1"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@conv1/bias"
      }
    }
  }
}
node {
  name: "conv2/kernel/Adam/Initializer/zeros/shape_as_tensor"
  op: "Const"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@conv2/kernel"
      }
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_INT32
        tensor_shape {
          dim {
            size: 4
          }
        }
        tensor_content: "\003\000\000\000\003\000\000\000@\000\000\000\200\000\000\000"
      }
    }
  }
}
node {
  name: "conv2/kernel/Adam/Initializer/zeros/Const"
  op: "Const"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@conv2/kernel"
      }
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
        }
        float_val: 0.0
      }
    }
  }
}
node {
  name: "conv2/kernel/Adam/Initializer/zeros"
  op: "Fill"
  input: "conv2/kernel/Adam/Initializer/zeros/shape_as_tensor"
  input: "conv2/kernel/Adam/Initializer/zeros/Const"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@conv2/kernel"
      }
    }
  }
  attr {
    key: "index_type"
    value {
      type: DT_INT32
    }
  }
}
node {
  name: "conv2/kernel/Adam"
  op: "VariableV2"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@conv2/kernel"
      }
    }
  }
  attr {
    key: "container"
    value {
      s: ""
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "shape"
    value {
      shape {
        dim {
          size: 3
        }
        dim {
          size: 3
        }
        dim {
          size: 64
        }
        dim {
          size: 128
        }
      }
    }
  }
  attr {
    key: "shared_name"
    value {
      s: ""
    }
  }
}
node {
  name: "conv2/kernel/Adam/Assign"
  op: "Assign"
  input: "conv2/kernel/Adam"
  input: "conv2/kernel/Adam/Initializer/zeros"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@conv2/kernel"
      }
    }
  }
  attr {
    key: "use_locking"
    value {
      b: true
    }
  }
  attr {
    key: "validate_shape"
    value {
      b: true
    }
  }
}
node {
  name: "conv2/kernel/Adam/read"
  op: "Identity"
  input: "conv2/kernel/Adam"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@conv2/kernel"
      }
    }
  }
}
node {
  name: "conv2/kernel/Adam_1/Initializer/zeros/shape_as_tensor"
  op: "Const"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@conv2/kernel"
      }
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_INT32
        tensor_shape {
          dim {
            size: 4
          }
        }
        tensor_content: "\003\000\000\000\003\000\000\000@\000\000\000\200\000\000\000"
      }
    }
  }
}
node {
  name: "conv2/kernel/Adam_1/Initializer/zeros/Const"
  op: "Const"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@conv2/kernel"
      }
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
        }
        float_val: 0.0
      }
    }
  }
}
node {
  name: "conv2/kernel/Adam_1/Initializer/zeros"
  op: "Fill"
  input: "conv2/kernel/Adam_1/Initializer/zeros/shape_as_tensor"
  input: "conv2/kernel/Adam_1/Initializer/zeros/Const"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@conv2/kernel"
      }
    }
  }
  attr {
    key: "index_type"
    value {
      type: DT_INT32
    }
  }
}
node {
  name: "conv2/kernel/Adam_1"
  op: "VariableV2"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@conv2/kernel"
      }
    }
  }
  attr {
    key: "container"
    value {
      s: ""
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "shape"
    value {
      shape {
        dim {
          size: 3
        }
        dim {
          size: 3
        }
        dim {
          size: 64
        }
        dim {
          size: 128
        }
      }
    }
  }
  attr {
    key: "shared_name"
    value {
      s: ""
    }
  }
}
node {
  name: "conv2/kernel/Adam_1/Assign"
  op: "Assign"
  input: "conv2/kernel/Adam_1"
  input: "conv2/kernel/Adam_1/Initializer/zeros"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@conv2/kernel"
      }
    }
  }
  attr {
    key: "use_locking"
    value {
      b: true
    }
  }
  attr {
    key: "validate_shape"
    value {
      b: true
    }
  }
}
node {
  name: "conv2/kernel/Adam_1/read"
  op: "Identity"
  input: "conv2/kernel/Adam_1"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@conv2/kernel"
      }
    }
  }
}
node {
  name: "conv2/bias/Adam/Initializer/zeros"
  op: "Const"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@conv2/bias"
      }
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
          dim {
            size: 128
          }
        }
        float_val: 0.0
      }
    }
  }
}
node {
  name: "conv2/bias/Adam"
  op: "VariableV2"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@conv2/bias"
      }
    }
  }
  attr {
    key: "container"
    value {
      s: ""
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "shape"
    value {
      shape {
        dim {
          size: 128
        }
      }
    }
  }
  attr {
    key: "shared_name"
    value {
      s: ""
    }
  }
}
node {
  name: "conv2/bias/Adam/Assign"
  op: "Assign"
  input: "conv2/bias/Adam"
  input: "conv2/bias/Adam/Initializer/zeros"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@conv2/bias"
      }
    }
  }
  attr {
    key: "use_locking"
    value {
      b: true
    }
  }
  attr {
    key: "validate_shape"
    value {
      b: true
    }
  }
}
node {
  name: "conv2/bias/Adam/read"
  op: "Identity"
  input: "conv2/bias/Adam"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@conv2/bias"
      }
    }
  }
}
node {
  name: "conv2/bias/Adam_1/Initializer/zeros"
  op: "Const"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@conv2/bias"
      }
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
          dim {
            size: 128
          }
        }
        float_val: 0.0
      }
    }
  }
}
node {
  name: "conv2/bias/Adam_1"
  op: "VariableV2"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@conv2/bias"
      }
    }
  }
  attr {
    key: "container"
    value {
      s: ""
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "shape"
    value {
      shape {
        dim {
          size: 128
        }
      }
    }
  }
  attr {
    key: "shared_name"
    value {
      s: ""
    }
  }
}
node {
  name: "conv2/bias/Adam_1/Assign"
  op: "Assign"
  input: "conv2/bias/Adam_1"
  input: "conv2/bias/Adam_1/Initializer/zeros"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@conv2/bias"
      }
    }
  }
  attr {
    key: "use_locking"
    value {
      b: true
    }
  }
  attr {
    key: "validate_shape"
    value {
      b: true
    }
  }
}
node {
  name: "conv2/bias/Adam_1/read"
  op: "Identity"
  input: "conv2/bias/Adam_1"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@conv2/bias"
      }
    }
  }
}
node {
  name: "conv3/kernel/Adam/Initializer/zeros/shape_as_tensor"
  op: "Const"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@conv3/kernel"
      }
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_INT32
        tensor_shape {
          dim {
            size: 4
          }
        }
        tensor_content: "\003\000\000\000\003\000\000\000\200\000\000\000\000\001\000\000"
      }
    }
  }
}
node {
  name: "conv3/kernel/Adam/Initializer/zeros/Const"
  op: "Const"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@conv3/kernel"
      }
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
        }
        float_val: 0.0
      }
    }
  }
}
node {
  name: "conv3/kernel/Adam/Initializer/zeros"
  op: "Fill"
  input: "conv3/kernel/Adam/Initializer/zeros/shape_as_tensor"
  input: "conv3/kernel/Adam/Initializer/zeros/Const"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@conv3/kernel"
      }
    }
  }
  attr {
    key: "index_type"
    value {
      type: DT_INT32
    }
  }
}
node {
  name: "conv3/kernel/Adam"
  op: "VariableV2"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@conv3/kernel"
      }
    }
  }
  attr {
    key: "container"
    value {
      s: ""
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "shape"
    value {
      shape {
        dim {
          size: 3
        }
        dim {
          size: 3
        }
        dim {
          size: 128
        }
        dim {
          size: 256
        }
      }
    }
  }
  attr {
    key: "shared_name"
    value {
      s: ""
    }
  }
}
node {
  name: "conv3/kernel/Adam/Assign"
  op: "Assign"
  input: "conv3/kernel/Adam"
  input: "conv3/kernel/Adam/Initializer/zeros"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@conv3/kernel"
      }
    }
  }
  attr {
    key: "use_locking"
    value {
      b: true
    }
  }
  attr {
    key: "validate_shape"
    value {
      b: true
    }
  }
}
node {
  name: "conv3/kernel/Adam/read"
  op: "Identity"
  input: "conv3/kernel/Adam"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@conv3/kernel"
      }
    }
  }
}
node {
  name: "conv3/kernel/Adam_1/Initializer/zeros/shape_as_tensor"
  op: "Const"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@conv3/kernel"
      }
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_INT32
        tensor_shape {
          dim {
            size: 4
          }
        }
        tensor_content: "\003\000\000\000\003\000\000\000\200\000\000\000\000\001\000\000"
      }
    }
  }
}
node {
  name: "conv3/kernel/Adam_1/Initializer/zeros/Const"
  op: "Const"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@conv3/kernel"
      }
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
        }
        float_val: 0.0
      }
    }
  }
}
node {
  name: "conv3/kernel/Adam_1/Initializer/zeros"
  op: "Fill"
  input: "conv3/kernel/Adam_1/Initializer/zeros/shape_as_tensor"
  input: "conv3/kernel/Adam_1/Initializer/zeros/Const"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@conv3/kernel"
      }
    }
  }
  attr {
    key: "index_type"
    value {
      type: DT_INT32
    }
  }
}
node {
  name: "conv3/kernel/Adam_1"
  op: "VariableV2"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@conv3/kernel"
      }
    }
  }
  attr {
    key: "container"
    value {
      s: ""
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "shape"
    value {
      shape {
        dim {
          size: 3
        }
        dim {
          size: 3
        }
        dim {
          size: 128
        }
        dim {
          size: 256
        }
      }
    }
  }
  attr {
    key: "shared_name"
    value {
      s: ""
    }
  }
}
node {
  name: "conv3/kernel/Adam_1/Assign"
  op: "Assign"
  input: "conv3/kernel/Adam_1"
  input: "conv3/kernel/Adam_1/Initializer/zeros"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@conv3/kernel"
      }
    }
  }
  attr {
    key: "use_locking"
    value {
      b: true
    }
  }
  attr {
    key: "validate_shape"
    value {
      b: true
    }
  }
}
node {
  name: "conv3/kernel/Adam_1/read"
  op: "Identity"
  input: "conv3/kernel/Adam_1"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@conv3/kernel"
      }
    }
  }
}
node {
  name: "conv3/bias/Adam/Initializer/zeros"
  op: "Const"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@conv3/bias"
      }
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
          dim {
            size: 256
          }
        }
        float_val: 0.0
      }
    }
  }
}
node {
  name: "conv3/bias/Adam"
  op: "VariableV2"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@conv3/bias"
      }
    }
  }
  attr {
    key: "container"
    value {
      s: ""
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "shape"
    value {
      shape {
        dim {
          size: 256
        }
      }
    }
  }
  attr {
    key: "shared_name"
    value {
      s: ""
    }
  }
}
node {
  name: "conv3/bias/Adam/Assign"
  op: "Assign"
  input: "conv3/bias/Adam"
  input: "conv3/bias/Adam/Initializer/zeros"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@conv3/bias"
      }
    }
  }
  attr {
    key: "use_locking"
    value {
      b: true
    }
  }
  attr {
    key: "validate_shape"
    value {
      b: true
    }
  }
}
node {
  name: "conv3/bias/Adam/read"
  op: "Identity"
  input: "conv3/bias/Adam"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@conv3/bias"
      }
    }
  }
}
node {
  name: "conv3/bias/Adam_1/Initializer/zeros"
  op: "Const"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@conv3/bias"
      }
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
          dim {
            size: 256
          }
        }
        float_val: 0.0
      }
    }
  }
}
node {
  name: "conv3/bias/Adam_1"
  op: "VariableV2"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@conv3/bias"
      }
    }
  }
  attr {
    key: "container"
    value {
      s: ""
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "shape"
    value {
      shape {
        dim {
          size: 256
        }
      }
    }
  }
  attr {
    key: "shared_name"
    value {
      s: ""
    }
  }
}
node {
  name: "conv3/bias/Adam_1/Assign"
  op: "Assign"
  input: "conv3/bias/Adam_1"
  input: "conv3/bias/Adam_1/Initializer/zeros"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@conv3/bias"
      }
    }
  }
  attr {
    key: "use_locking"
    value {
      b: true
    }
  }
  attr {
    key: "validate_shape"
    value {
      b: true
    }
  }
}
node {
  name: "conv3/bias/Adam_1/read"
  op: "Identity"
  input: "conv3/bias/Adam_1"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@conv3/bias"
      }
    }
  }
}
node {
  name: "fc1/weights/Adam/Initializer/zeros/shape_as_tensor"
  op: "Const"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@fc1/weights"
      }
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_INT32
        tensor_shape {
          dim {
            size: 2
          }
        }
        tensor_content: "\000@\000\000\000\004\000\000"
      }
    }
  }
}
node {
  name: "fc1/weights/Adam/Initializer/zeros/Const"
  op: "Const"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@fc1/weights"
      }
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
        }
        float_val: 0.0
      }
    }
  }
}
node {
  name: "fc1/weights/Adam/Initializer/zeros"
  op: "Fill"
  input: "fc1/weights/Adam/Initializer/zeros/shape_as_tensor"
  input: "fc1/weights/Adam/Initializer/zeros/Const"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@fc1/weights"
      }
    }
  }
  attr {
    key: "index_type"
    value {
      type: DT_INT32
    }
  }
}
node {
  name: "fc1/weights/Adam"
  op: "VariableV2"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@fc1/weights"
      }
    }
  }
  attr {
    key: "container"
    value {
      s: ""
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "shape"
    value {
      shape {
        dim {
          size: 16384
        }
        dim {
          size: 1024
        }
      }
    }
  }
  attr {
    key: "shared_name"
    value {
      s: ""
    }
  }
}
node {
  name: "fc1/weights/Adam/Assign"
  op: "Assign"
  input: "fc1/weights/Adam"
  input: "fc1/weights/Adam/Initializer/zeros"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@fc1/weights"
      }
    }
  }
  attr {
    key: "use_locking"
    value {
      b: true
    }
  }
  attr {
    key: "validate_shape"
    value {
      b: true
    }
  }
}
node {
  name: "fc1/weights/Adam/read"
  op: "Identity"
  input: "fc1/weights/Adam"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@fc1/weights"
      }
    }
  }
}
node {
  name: "fc1/weights/Adam_1/Initializer/zeros/shape_as_tensor"
  op: "Const"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@fc1/weights"
      }
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_INT32
        tensor_shape {
          dim {
            size: 2
          }
        }
        tensor_content: "\000@\000\000\000\004\000\000"
      }
    }
  }
}
node {
  name: "fc1/weights/Adam_1/Initializer/zeros/Const"
  op: "Const"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@fc1/weights"
      }
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
        }
        float_val: 0.0
      }
    }
  }
}
node {
  name: "fc1/weights/Adam_1/Initializer/zeros"
  op: "Fill"
  input: "fc1/weights/Adam_1/Initializer/zeros/shape_as_tensor"
  input: "fc1/weights/Adam_1/Initializer/zeros/Const"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@fc1/weights"
      }
    }
  }
  attr {
    key: "index_type"
    value {
      type: DT_INT32
    }
  }
}
node {
  name: "fc1/weights/Adam_1"
  op: "VariableV2"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@fc1/weights"
      }
    }
  }
  attr {
    key: "container"
    value {
      s: ""
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "shape"
    value {
      shape {
        dim {
          size: 16384
        }
        dim {
          size: 1024
        }
      }
    }
  }
  attr {
    key: "shared_name"
    value {
      s: ""
    }
  }
}
node {
  name: "fc1/weights/Adam_1/Assign"
  op: "Assign"
  input: "fc1/weights/Adam_1"
  input: "fc1/weights/Adam_1/Initializer/zeros"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@fc1/weights"
      }
    }
  }
  attr {
    key: "use_locking"
    value {
      b: true
    }
  }
  attr {
    key: "validate_shape"
    value {
      b: true
    }
  }
}
node {
  name: "fc1/weights/Adam_1/read"
  op: "Identity"
  input: "fc1/weights/Adam_1"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@fc1/weights"
      }
    }
  }
}
node {
  name: "fc1/biases/Adam/Initializer/zeros/shape_as_tensor"
  op: "Const"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@fc1/biases"
      }
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_INT32
        tensor_shape {
          dim {
            size: 1
          }
        }
        int_val: 1024
      }
    }
  }
}
node {
  name: "fc1/biases/Adam/Initializer/zeros/Const"
  op: "Const"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@fc1/biases"
      }
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
        }
        float_val: 0.0
      }
    }
  }
}
node {
  name: "fc1/biases/Adam/Initializer/zeros"
  op: "Fill"
  input: "fc1/biases/Adam/Initializer/zeros/shape_as_tensor"
  input: "fc1/biases/Adam/Initializer/zeros/Const"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@fc1/biases"
      }
    }
  }
  attr {
    key: "index_type"
    value {
      type: DT_INT32
    }
  }
}
node {
  name: "fc1/biases/Adam"
  op: "VariableV2"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@fc1/biases"
      }
    }
  }
  attr {
    key: "container"
    value {
      s: ""
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "shape"
    value {
      shape {
        dim {
          size: 1024
        }
      }
    }
  }
  attr {
    key: "shared_name"
    value {
      s: ""
    }
  }
}
node {
  name: "fc1/biases/Adam/Assign"
  op: "Assign"
  input: "fc1/biases/Adam"
  input: "fc1/biases/Adam/Initializer/zeros"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@fc1/biases"
      }
    }
  }
  attr {
    key: "use_locking"
    value {
      b: true
    }
  }
  attr {
    key: "validate_shape"
    value {
      b: true
    }
  }
}
node {
  name: "fc1/biases/Adam/read"
  op: "Identity"
  input: "fc1/biases/Adam"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@fc1/biases"
      }
    }
  }
}
node {
  name: "fc1/biases/Adam_1/Initializer/zeros/shape_as_tensor"
  op: "Const"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@fc1/biases"
      }
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_INT32
        tensor_shape {
          dim {
            size: 1
          }
        }
        int_val: 1024
      }
    }
  }
}
node {
  name: "fc1/biases/Adam_1/Initializer/zeros/Const"
  op: "Const"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@fc1/biases"
      }
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
        }
        float_val: 0.0
      }
    }
  }
}
node {
  name: "fc1/biases/Adam_1/Initializer/zeros"
  op: "Fill"
  input: "fc1/biases/Adam_1/Initializer/zeros/shape_as_tensor"
  input: "fc1/biases/Adam_1/Initializer/zeros/Const"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@fc1/biases"
      }
    }
  }
  attr {
    key: "index_type"
    value {
      type: DT_INT32
    }
  }
}
node {
  name: "fc1/biases/Adam_1"
  op: "VariableV2"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@fc1/biases"
      }
    }
  }
  attr {
    key: "container"
    value {
      s: ""
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "shape"
    value {
      shape {
        dim {
          size: 1024
        }
      }
    }
  }
  attr {
    key: "shared_name"
    value {
      s: ""
    }
  }
}
node {
  name: "fc1/biases/Adam_1/Assign"
  op: "Assign"
  input: "fc1/biases/Adam_1"
  input: "fc1/biases/Adam_1/Initializer/zeros"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@fc1/biases"
      }
    }
  }
  attr {
    key: "use_locking"
    value {
      b: true
    }
  }
  attr {
    key: "validate_shape"
    value {
      b: true
    }
  }
}
node {
  name: "fc1/biases/Adam_1/read"
  op: "Identity"
  input: "fc1/biases/Adam_1"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@fc1/biases"
      }
    }
  }
}
node {
  name: "fc2/weights/Adam/Initializer/zeros/shape_as_tensor"
  op: "Const"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@fc2/weights"
      }
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_INT32
        tensor_shape {
          dim {
            size: 2
          }
        }
        tensor_content: "\000\004\000\000\005\000\000\000"
      }
    }
  }
}
node {
  name: "fc2/weights/Adam/Initializer/zeros/Const"
  op: "Const"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@fc2/weights"
      }
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
        }
        float_val: 0.0
      }
    }
  }
}
node {
  name: "fc2/weights/Adam/Initializer/zeros"
  op: "Fill"
  input: "fc2/weights/Adam/Initializer/zeros/shape_as_tensor"
  input: "fc2/weights/Adam/Initializer/zeros/Const"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@fc2/weights"
      }
    }
  }
  attr {
    key: "index_type"
    value {
      type: DT_INT32
    }
  }
}
node {
  name: "fc2/weights/Adam"
  op: "VariableV2"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@fc2/weights"
      }
    }
  }
  attr {
    key: "container"
    value {
      s: ""
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "shape"
    value {
      shape {
        dim {
          size: 1024
        }
        dim {
          size: 5
        }
      }
    }
  }
  attr {
    key: "shared_name"
    value {
      s: ""
    }
  }
}
node {
  name: "fc2/weights/Adam/Assign"
  op: "Assign"
  input: "fc2/weights/Adam"
  input: "fc2/weights/Adam/Initializer/zeros"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@fc2/weights"
      }
    }
  }
  attr {
    key: "use_locking"
    value {
      b: true
    }
  }
  attr {
    key: "validate_shape"
    value {
      b: true
    }
  }
}
node {
  name: "fc2/weights/Adam/read"
  op: "Identity"
  input: "fc2/weights/Adam"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@fc2/weights"
      }
    }
  }
}
node {
  name: "fc2/weights/Adam_1/Initializer/zeros/shape_as_tensor"
  op: "Const"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@fc2/weights"
      }
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_INT32
        tensor_shape {
          dim {
            size: 2
          }
        }
        tensor_content: "\000\004\000\000\005\000\000\000"
      }
    }
  }
}
node {
  name: "fc2/weights/Adam_1/Initializer/zeros/Const"
  op: "Const"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@fc2/weights"
      }
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
        }
        float_val: 0.0
      }
    }
  }
}
node {
  name: "fc2/weights/Adam_1/Initializer/zeros"
  op: "Fill"
  input: "fc2/weights/Adam_1/Initializer/zeros/shape_as_tensor"
  input: "fc2/weights/Adam_1/Initializer/zeros/Const"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@fc2/weights"
      }
    }
  }
  attr {
    key: "index_type"
    value {
      type: DT_INT32
    }
  }
}
node {
  name: "fc2/weights/Adam_1"
  op: "VariableV2"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@fc2/weights"
      }
    }
  }
  attr {
    key: "container"
    value {
      s: ""
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "shape"
    value {
      shape {
        dim {
          size: 1024
        }
        dim {
          size: 5
        }
      }
    }
  }
  attr {
    key: "shared_name"
    value {
      s: ""
    }
  }
}
node {
  name: "fc2/weights/Adam_1/Assign"
  op: "Assign"
  input: "fc2/weights/Adam_1"
  input: "fc2/weights/Adam_1/Initializer/zeros"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@fc2/weights"
      }
    }
  }
  attr {
    key: "use_locking"
    value {
      b: true
    }
  }
  attr {
    key: "validate_shape"
    value {
      b: true
    }
  }
}
node {
  name: "fc2/weights/Adam_1/read"
  op: "Identity"
  input: "fc2/weights/Adam_1"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@fc2/weights"
      }
    }
  }
}
node {
  name: "fc2/biases/Adam/Initializer/zeros"
  op: "Const"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@fc2/biases"
      }
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
          dim {
            size: 5
          }
        }
        float_val: 0.0
      }
    }
  }
}
node {
  name: "fc2/biases/Adam"
  op: "VariableV2"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@fc2/biases"
      }
    }
  }
  attr {
    key: "container"
    value {
      s: ""
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "shape"
    value {
      shape {
        dim {
          size: 5
        }
      }
    }
  }
  attr {
    key: "shared_name"
    value {
      s: ""
    }
  }
}
node {
  name: "fc2/biases/Adam/Assign"
  op: "Assign"
  input: "fc2/biases/Adam"
  input: "fc2/biases/Adam/Initializer/zeros"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@fc2/biases"
      }
    }
  }
  attr {
    key: "use_locking"
    value {
      b: true
    }
  }
  attr {
    key: "validate_shape"
    value {
      b: true
    }
  }
}
node {
  name: "fc2/biases/Adam/read"
  op: "Identity"
  input: "fc2/biases/Adam"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@fc2/biases"
      }
    }
  }
}
node {
  name: "fc2/biases/Adam_1/Initializer/zeros"
  op: "Const"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@fc2/biases"
      }
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
          dim {
            size: 5
          }
        }
        float_val: 0.0
      }
    }
  }
}
node {
  name: "fc2/biases/Adam_1"
  op: "VariableV2"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@fc2/biases"
      }
    }
  }
  attr {
    key: "container"
    value {
      s: ""
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "shape"
    value {
      shape {
        dim {
          size: 5
        }
      }
    }
  }
  attr {
    key: "shared_name"
    value {
      s: ""
    }
  }
}
node {
  name: "fc2/biases/Adam_1/Assign"
  op: "Assign"
  input: "fc2/biases/Adam_1"
  input: "fc2/biases/Adam_1/Initializer/zeros"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@fc2/biases"
      }
    }
  }
  attr {
    key: "use_locking"
    value {
      b: true
    }
  }
  attr {
    key: "validate_shape"
    value {
      b: true
    }
  }
}
node {
  name: "fc2/biases/Adam_1/read"
  op: "Identity"
  input: "fc2/biases/Adam_1"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@fc2/biases"
      }
    }
  }
}
node {
  name: "Adam/beta1"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
        }
        float_val: 0.8999999761581421
      }
    }
  }
}
node {
  name: "Adam/beta2"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
        }
        float_val: 0.9990000128746033
      }
    }
  }
}
node {
  name: "Adam/epsilon"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
        }
        float_val: 9.99999993922529e-09
      }
    }
  }
}
node {
  name: "Adam/update_conv1/kernel/ApplyAdam"
  op: "ApplyAdam"
  input: "conv1/kernel"
  input: "conv1/kernel/Adam"
  input: "conv1/kernel/Adam_1"
  input: "beta1_power/read"
  input: "beta2_power/read"
  input: "ExponentialDecay"
  input: "Adam/beta1"
  input: "Adam/beta2"
  input: "Adam/epsilon"
  input: "gradients/conv1/Conv2D_grad/tuple/control_dependency_1"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@conv1/kernel"
      }
    }
  }
  attr {
    key: "use_locking"
    value {
      b: false
    }
  }
  attr {
    key: "use_nesterov"
    value {
      b: false
    }
  }
}
node {
  name: "Adam/update_conv1/bias/ApplyAdam"
  op: "ApplyAdam"
  input: "conv1/bias"
  input: "conv1/bias/Adam"
  input: "conv1/bias/Adam_1"
  input: "beta1_power/read"
  input: "beta2_power/read"
  input: "ExponentialDecay"
  input: "Adam/beta1"
  input: "Adam/beta2"
  input: "Adam/epsilon"
  input: "gradients/conv1/BiasAdd_grad/tuple/control_dependency_1"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@conv1/bias"
      }
    }
  }
  attr {
    key: "use_locking"
    value {
      b: false
    }
  }
  attr {
    key: "use_nesterov"
    value {
      b: false
    }
  }
}
node {
  name: "Adam/update_conv2/kernel/ApplyAdam"
  op: "ApplyAdam"
  input: "conv2/kernel"
  input: "conv2/kernel/Adam"
  input: "conv2/kernel/Adam_1"
  input: "beta1_power/read"
  input: "beta2_power/read"
  input: "ExponentialDecay"
  input: "Adam/beta1"
  input: "Adam/beta2"
  input: "Adam/epsilon"
  input: "gradients/conv2/Conv2D_grad/tuple/control_dependency_1"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@conv2/kernel"
      }
    }
  }
  attr {
    key: "use_locking"
    value {
      b: false
    }
  }
  attr {
    key: "use_nesterov"
    value {
      b: false
    }
  }
}
node {
  name: "Adam/update_conv2/bias/ApplyAdam"
  op: "ApplyAdam"
  input: "conv2/bias"
  input: "conv2/bias/Adam"
  input: "conv2/bias/Adam_1"
  input: "beta1_power/read"
  input: "beta2_power/read"
  input: "ExponentialDecay"
  input: "Adam/beta1"
  input: "Adam/beta2"
  input: "Adam/epsilon"
  input: "gradients/conv2/BiasAdd_grad/tuple/control_dependency_1"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@conv2/bias"
      }
    }
  }
  attr {
    key: "use_locking"
    value {
      b: false
    }
  }
  attr {
    key: "use_nesterov"
    value {
      b: false
    }
  }
}
node {
  name: "Adam/update_conv3/kernel/ApplyAdam"
  op: "ApplyAdam"
  input: "conv3/kernel"
  input: "conv3/kernel/Adam"
  input: "conv3/kernel/Adam_1"
  input: "beta1_power/read"
  input: "beta2_power/read"
  input: "ExponentialDecay"
  input: "Adam/beta1"
  input: "Adam/beta2"
  input: "Adam/epsilon"
  input: "gradients/conv3/Conv2D_grad/tuple/control_dependency_1"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@conv3/kernel"
      }
    }
  }
  attr {
    key: "use_locking"
    value {
      b: false
    }
  }
  attr {
    key: "use_nesterov"
    value {
      b: false
    }
  }
}
node {
  name: "Adam/update_conv3/bias/ApplyAdam"
  op: "ApplyAdam"
  input: "conv3/bias"
  input: "conv3/bias/Adam"
  input: "conv3/bias/Adam_1"
  input: "beta1_power/read"
  input: "beta2_power/read"
  input: "ExponentialDecay"
  input: "Adam/beta1"
  input: "Adam/beta2"
  input: "Adam/epsilon"
  input: "gradients/conv3/BiasAdd_grad/tuple/control_dependency_1"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@conv3/bias"
      }
    }
  }
  attr {
    key: "use_locking"
    value {
      b: false
    }
  }
  attr {
    key: "use_nesterov"
    value {
      b: false
    }
  }
}
node {
  name: "Adam/update_fc1/weights/ApplyAdam"
  op: "ApplyAdam"
  input: "fc1/weights"
  input: "fc1/weights/Adam"
  input: "fc1/weights/Adam_1"
  input: "beta1_power/read"
  input: "beta2_power/read"
  input: "ExponentialDecay"
  input: "Adam/beta1"
  input: "Adam/beta2"
  input: "Adam/epsilon"
  input: "gradients/fc1/MatMul_grad/tuple/control_dependency_1"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@fc1/weights"
      }
    }
  }
  attr {
    key: "use_locking"
    value {
      b: false
    }
  }
  attr {
    key: "use_nesterov"
    value {
      b: false
    }
  }
}
node {
  name: "Adam/update_fc1/biases/ApplyAdam"
  op: "ApplyAdam"
  input: "fc1/biases"
  input: "fc1/biases/Adam"
  input: "fc1/biases/Adam_1"
  input: "beta1_power/read"
  input: "beta2_power/read"
  input: "ExponentialDecay"
  input: "Adam/beta1"
  input: "Adam/beta2"
  input: "Adam/epsilon"
  input: "gradients/fc1/BiasAdd_grad/tuple/control_dependency_1"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@fc1/biases"
      }
    }
  }
  attr {
    key: "use_locking"
    value {
      b: false
    }
  }
  attr {
    key: "use_nesterov"
    value {
      b: false
    }
  }
}
node {
  name: "Adam/update_fc2/weights/ApplyAdam"
  op: "ApplyAdam"
  input: "fc2/weights"
  input: "fc2/weights/Adam"
  input: "fc2/weights/Adam_1"
  input: "beta1_power/read"
  input: "beta2_power/read"
  input: "ExponentialDecay"
  input: "Adam/beta1"
  input: "Adam/beta2"
  input: "Adam/epsilon"
  input: "gradients/fc2/MatMul_grad/tuple/control_dependency_1"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@fc2/weights"
      }
    }
  }
  attr {
    key: "use_locking"
    value {
      b: false
    }
  }
  attr {
    key: "use_nesterov"
    value {
      b: false
    }
  }
}
node {
  name: "Adam/update_fc2/biases/ApplyAdam"
  op: "ApplyAdam"
  input: "fc2/biases"
  input: "fc2/biases/Adam"
  input: "fc2/biases/Adam_1"
  input: "beta1_power/read"
  input: "beta2_power/read"
  input: "ExponentialDecay"
  input: "Adam/beta1"
  input: "Adam/beta2"
  input: "Adam/epsilon"
  input: "gradients/fc2/BiasAdd_grad/tuple/control_dependency_1"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@fc2/biases"
      }
    }
  }
  attr {
    key: "use_locking"
    value {
      b: false
    }
  }
  attr {
    key: "use_nesterov"
    value {
      b: false
    }
  }
}
node {
  name: "Adam/mul"
  op: "Mul"
  input: "beta1_power/read"
  input: "Adam/beta1"
  input: "^Adam/update_conv1/bias/ApplyAdam"
  input: "^Adam/update_conv1/kernel/ApplyAdam"
  input: "^Adam/update_conv2/bias/ApplyAdam"
  input: "^Adam/update_conv2/kernel/ApplyAdam"
  input: "^Adam/update_conv3/bias/ApplyAdam"
  input: "^Adam/update_conv3/kernel/ApplyAdam"
  input: "^Adam/update_fc1/biases/ApplyAdam"
  input: "^Adam/update_fc1/weights/ApplyAdam"
  input: "^Adam/update_fc2/biases/ApplyAdam"
  input: "^Adam/update_fc2/weights/ApplyAdam"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@conv1/bias"
      }
    }
  }
}
node {
  name: "Adam/Assign"
  op: "Assign"
  input: "beta1_power"
  input: "Adam/mul"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@conv1/bias"
      }
    }
  }
  attr {
    key: "use_locking"
    value {
      b: false
    }
  }
  attr {
    key: "validate_shape"
    value {
      b: true
    }
  }
}
node {
  name: "Adam/mul_1"
  op: "Mul"
  input: "beta2_power/read"
  input: "Adam/beta2"
  input: "^Adam/update_conv1/bias/ApplyAdam"
  input: "^Adam/update_conv1/kernel/ApplyAdam"
  input: "^Adam/update_conv2/bias/ApplyAdam"
  input: "^Adam/update_conv2/kernel/ApplyAdam"
  input: "^Adam/update_conv3/bias/ApplyAdam"
  input: "^Adam/update_conv3/kernel/ApplyAdam"
  input: "^Adam/update_fc1/biases/ApplyAdam"
  input: "^Adam/update_fc1/weights/ApplyAdam"
  input: "^Adam/update_fc2/biases/ApplyAdam"
  input: "^Adam/update_fc2/weights/ApplyAdam"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@conv1/bias"
      }
    }
  }
}
node {
  name: "Adam/Assign_1"
  op: "Assign"
  input: "beta2_power"
  input: "Adam/mul_1"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@conv1/bias"
      }
    }
  }
  attr {
    key: "use_locking"
    value {
      b: false
    }
  }
  attr {
    key: "validate_shape"
    value {
      b: true
    }
  }
}
node {
  name: "Adam/update"
  op: "NoOp"
  input: "^Adam/Assign"
  input: "^Adam/Assign_1"
  input: "^Adam/update_conv1/bias/ApplyAdam"
  input: "^Adam/update_conv1/kernel/ApplyAdam"
  input: "^Adam/update_conv2/bias/ApplyAdam"
  input: "^Adam/update_conv2/kernel/ApplyAdam"
  input: "^Adam/update_conv3/bias/ApplyAdam"
  input: "^Adam/update_conv3/kernel/ApplyAdam"
  input: "^Adam/update_fc1/biases/ApplyAdam"
  input: "^Adam/update_fc1/weights/ApplyAdam"
  input: "^Adam/update_fc2/biases/ApplyAdam"
  input: "^Adam/update_fc2/weights/ApplyAdam"
}
node {
  name: "Adam/value"
  op: "Const"
  input: "^Adam/update"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@step"
      }
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
        }
        float_val: 1.0
      }
    }
  }
}
node {
  name: "Adam"
  op: "AssignAdd"
  input: "step"
  input: "Adam/value"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@step"
      }
    }
  }
  attr {
    key: "use_locking"
    value {
      b: false
    }
  }
}
node {
  name: "Softmax"
  op: "Softmax"
  input: "fc2/BiasAdd"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "loss/tags"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_STRING
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_STRING
        tensor_shape {
        }
        string_val: "loss"
      }
    }
  }
}
node {
  name: "loss"
  op: "ScalarSummary"
  input: "loss/tags"
  input: "Mean"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "accuracy/tags"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_STRING
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_STRING
        tensor_shape {
        }
        string_val: "accuracy"
      }
    }
  }
}
node {
  name: "accuracy"
  op: "ScalarSummary"
  input: "accuracy/tags"
  input: "Mean_1"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "Merge/MergeSummary"
  op: "MergeSummary"
  input: "loss"
  input: "accuracy"
  attr {
    key: "N"
    value {
      i: 2
    }
  }
}
node {
  name: "TopKV2/k"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_INT32
        tensor_shape {
        }
        int_val: 5
      }
    }
  }
}
node {
  name: "TopKV2"
  op: "TopKV2"
  input: "Softmax"
  input: "TopKV2/k"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "sorted"
    value {
      b: true
    }
  }
}
node {
  name: "in_top_k/InTopKV2/k"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_INT64
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_INT64
        tensor_shape {
        }
        int64_val: 5
      }
    }
  }
}
node {
  name: "in_top_k/InTopKV2"
  op: "InTopKV2"
  input: "Softmax"
  input: "label_batch"
  input: "in_top_k/InTopKV2/k"
  attr {
    key: "T"
    value {
      type: DT_INT64
    }
  }
}
node {
  name: "Cast_1"
  op: "Cast"
  input: "in_top_k/InTopKV2"
  attr {
    key: "DstT"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "SrcT"
    value {
      type: DT_BOOL
    }
  }
}
node {
  name: "Const_2"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_INT32
        tensor_shape {
          dim {
            size: 1
          }
        }
        int_val: 0
      }
    }
  }
}
node {
  name: "Mean_2"
  op: "Mean"
  input: "Cast_1"
  input: "Const_2"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "Tidx"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "keep_dims"
    value {
      b: false
    }
  }
}
versions {
  producer: 26
}
