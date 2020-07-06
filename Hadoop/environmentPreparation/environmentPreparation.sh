# environment Preparation

# sudo 無密碼切換 ================================================
sudo visudo
# --------------- 
%sudo ALL=(ALL:ALL) ALL 
%sudo ALL=(ALL:ALL) NOPASSWD:ALL
# --------------- 

# 設置主機名與 IP 地址映射 ================================================
sudo nano /etc/hosts
# --------------- ADD
#(IP FQDN alias) 
192.168.35.86 rtest01.example.org rtest01
192.168.35.87 rtest02.example.org rtest02
192.168.35.88 rtest03.example.org rtest03
# --------------- 
sudo reboot  # 配置生效

# 關閉防火牆 ================================================
sudo ufw disable
sudo ufw status

# 資料歸併 ================================================
sudo mkdir /opt/softwares /opt/modules /opt/datas
# softwares: 用來存放下載的檔案
# modules: 用來存放安裝好的框架
# datas: 用來存放測試的資料
chmod u+x /opt/softwares/*

# 安裝JDK ================================================
tar -zxf jdk-8u211-linux-x64.tar.gz -C /opt/modules/

sudo nano /etc/profile
# --------------- ADD
# JAVA_HOME
export JAVA_HOME=/opt/modules/jdk1.8.0_211
export PATH=$PATH:$JAVA_HOME/bin
# --------------- 
source /etc/profile
java -version

# 安裝Scala ================================================
tar -zxf scala-2.11.8.tgz -C /opt/modules/
sudo nano /etc/profile
# --------------- ADD
# SCALA_HOME
export SCALA_HOME=/opt/modules/scala-2.11.8
export PATH=$PATH:$SCALA_HOME/bin
# --------------- 
source /etc/profile
scala -version

# 複製所需的虛擬機數量 ======================================
# ===========================================================
# ===========================================================
# ===========================================================
# ===========================================================

# 更改主機名 ================================================
sudo -i
hostnamectl set-hostname test02
hostnamectl status
nano /etc/cloud/cloud.cfg
# --------------- CHANGE
preserve_hostname: true
# --------------- 

# 更改ip位置 ================================================
sudo nano /etc/netplan/50-cloud-init.yaml
# --------------- CHANGE
addressess: 192.168.35.86
# --------------- 
ip addr show

# ssh 無密碼登入 ================================================
# 所有虛擬機皆需要完成
ssh-keygen -t rsa
ssh-copy-id rtest01
ssh-copy-id rtest02
ssh-copy-id rtest03





