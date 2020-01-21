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
# start a new project with django (myweb is the name of the project)
django-admin startproject myweb
# freeze package list of the enviroment
conda list > requirements.md
```

<br>

# Chapter 2

## 2.1.2 產生第一個網路框架

```shell
# run the django server
python manage.py runserver 192.168.92.130:8000
```
```shell
# if facing "DisallowedHost" error
sudo vim setting.py
ALLOWED_HOSTS = ['*']
```







