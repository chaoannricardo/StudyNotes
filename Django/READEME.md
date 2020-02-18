# Django Studies

# Contents
[Chapter 1](#Chapter-1): 

[Chapter 2](Chapter-2): Django 網站快速入門



<br>

# Chapter 1
## 1.2.4 在Linux虛擬機建立Python Django開發環境

```shell
sudo apt-get update
sudo apt-get -y upgrade
sudo apt-get -y install python3-pip
# 檢視ip
ip a
```

## 1.2.5 設定SSH、PuTTY以及FTP伺服器

```shell
# 安裝OpenSSH伺服器
sudo apt-get install openssh-server
# 安裝FTP伺服器
sudo apt-get -y install vsftpd
```

## 1.2.6 安裝 Notepad++ 程式編譯器

* Plugins > Plugins Admin.. > NppFTP > Install
* Plugins > NppFTP > Show NppFTP Window

## 1.3.3 在虛擬機中連接Bitbucket

```shell
# create conda environment
conda create python==3.7 --name Django
# pip install django
pip install django
```

<br>

# Chapter 2

## 2.1.2 產生第一個網路框架

```shell
# start a new project with django (myweb is the name of the project)
django-admin startproject myweb
# start a new app (blog is the name of the app)
python manage.py startapp blog
```


```shell
# run the django server
python manage.py runserver 0.0.0.0:8000
# 0.0.0.0 means that you're running the website on all internet interfaces.
```
```shell
# configure settings.py inside configurations' directory
.
.
ALLOWED_HOSTS = ['*']
.
.
# Static files (CSS, JavaScript, Images)
# https://docs.djangoproject.com/en/3.0/howto/static-files/

PROJECT_ROOT = os.path.dirname(os.path.abspath(__file__))

STATIC_URL = '/static/'

STATIC_ROOT = os.path.join(PROJECT_ROOT, 'static')
```

<br>

## 2.3.1 建立網頁版輸出模版template

###### BASE_DIR 為與 manage.py 所在的目錄

1. 在 setting.py 中設定模版資料夾的位置

   1. 設定一個和 manage.py 同級的 templates 資料夾
   2. 將 templates 資料夾路徑加入 setting.py 中的 TEMPLATES（修改 DIRS 路徑）
      1. E.G. os.path.join(BASE_DIR, 'templates')
   3. 撰寫 views.py 程式碼

   ```python
   from django.template.loader import get_template
   from django.http import HttpResponse
   from django.shortcuts import render
   from datetime import datetime
   from .models import Post
   
   
   # Create your views here.
   def homepage(request):
       template = get_template('About.html')
       posts = Post.object.all()
       now = datetime.now()
       html = template.render(locals())
       return HttpResponse(html)
   ```

2. 在 urls.py 建立網址和 views.py 中的函數對應的關係

3. 建立 .html 檔案（例如 index.html），做好排版並安排資料要放置的位置

4. 執行程式，以 objects.all() 在 views.py 取得資料，並放入變數中，例如 posts

5. 以 render 函數，把資料（例如posts）送到指定的模版檔案





