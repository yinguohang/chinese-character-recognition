from django.shortcuts import render, HttpResponse
from django.template.loader import get_template
from django.views.decorators.csrf import csrf_exempt
import tensorflow as tf
import numpy as np
import tensorflow.contrib.slim as slim
from PIL import Image
import json
from main.models import User
import os
from django.core.exceptions import ValidationError
import sys
sys.path.append("../")
from model import Config, build_cnn

import base64

__test_image_file  = 'test.png'
__global_times = 0
__checkpoint_dir = "../ckpt/"
__code_to_chinese_file = "../characters.txt"

def load_characters(filename):
    rtn = []
    for line in open(filename).readlines():
        rtn.append(line.strip())
    return rtn

characters = load_characters(__code_to_chinese_file)

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

def collect(request):
    if "user" not in request.session:
        return render(request, 'login_or_register.html')
    user = User.objects.filter(username = request.session["user"]).first()
    return render(request, 'collect.html', 
        context={"characters": characters, "status": user.status})

def logout(request):
    del request.session["user"]
    return render(request, 'login_or_register.html')    

@csrf_exempt
def submit(request):
    if "user" not in request.session:
        return HttpResponse(json.dumps({"status": "error", "message": "login first"}))
    user = User.objects.filter(username = request.session["user"]).first()
    if "status" not in request.POST or "current" not in request.POST or "data" not in request.POST:
        return HttpResponse(json.dumps({"status": "error", "message": "missing parameters"}))
    status = request.POST.get("status")
    current = request.POST.get("current")
    data = request.POST.get("data")
    image = base64.b64decode(data[22:])
    file = open(os.path.join("images", user.username, current + ".png"), 'wb')
    file.write(image)
    file.close()
    user.status = status
    user.save()
    return HttpResponse(json.dumps({"status": "success"}))

def loginOrRegisterPage(request):
    return render(request, 'login_or_register.html')

@csrf_exempt
def login(request):
    if "username" not in request.POST or len(request.POST.get("username")) == 0:
        return HttpResponse(json.dumps({"status": "error", "message": "missing username parameters"}))
    if len(User.objects.filter(username = request.POST.get("username"))) == 0:
        return HttpResponse(json.dumps({"status": "error", "message": "Invalid username"}))    
    user = User.objects.filter(username = request.POST.get("username")).first()
    request.session["user"] = user.username
    return HttpResponse(json.dumps({"status": "success"}))

@csrf_exempt
def register(request):
    if "username" not in request.POST or len(request.POST.get("username")) == 0:
        return HttpResponse(json.dumps({"status": "error", "message": "missing username parameters"}))
    if len(User.objects.filter(username = request.POST.get("username"))) != 0:
        return HttpResponse(json.dumps({"status": "error", "message": "duplicate username"}))    
    user = User.create(request.POST.get("username"))
    user.save()    
    os.makedirs(os.path.join("images", request.POST.get("username")))
    request.session["user"] = user.username
    return HttpResponse(json.dumps({"status": "success"}))

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