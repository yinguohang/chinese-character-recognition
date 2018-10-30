from django.urls import path

from . import views

urlpatterns = [
    path('', views.index, name='index'),
    path('recognition', views.recognition, name='recognition'),
    path('collect', views.collect, name='collect'),
    path('submit', views.submit, name='submit'),
    path('loginOrRegisterPage', views.loginOrRegisterPage, name='loginOrRegisterPage'),
    path('register', views.register, name='register'),
    path('login', views.login, name='login'),
    path('logout', views.logout, name='logout')
]