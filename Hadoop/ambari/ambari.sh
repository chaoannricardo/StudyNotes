# ambari Set-up

# Reference ===================================
# https://supportmatrix.hortonworks.com/
# https://lihi1.cc/gH6v0
# http://www.voidcn.com/article/p-nxtxngvc-bpy.html
# https://blog.csdn.net/q1370992706/article/details/80091614

# Enable NTP on the Cluster and on the Browser Host ===================================
sudo apt-get install ntp
sudo update-rc.d ntp defaults
service ntp start

# Set Up Password-less SSH (Fulfilled, check "enviromentPreparation")

# install MAVEN ===========================================================================
wget https://apache.org/dist/maven/maven-3/3.6.1/binaries/apache-maven-3.6.1-bin.tar.gz
sudo tar -xvzf apache-maven-3.6.1-bin.tar.gz -C /opt/modules/
mv /opt/modules/apache-maven-3.6.1 /opt/modules/maven
chown -R student:student /opt/modules/maven/
sudo nano /etc/profile
# --------------- ADD
# MAVEN_HOME
export MAVEN_HOME=/opt/modules/maven
export MAVEN=$MAVEN_HOME/bin
export PATH=$MAVEN:$PATH
# --------------
source /etc/profile
mvn --version

# install ambari ===========================================================================
# (https://docs.hortonworks.com/HDPDocuments/Ambari-2.7.3.0/bk_ambari-installation/content/hdp_31_repositories.html)
wget http://ftp.tc.edu.tw/pub/Apache/ambari/ambari-2.7.3/apache-ambari-2.7.3-src.tar.gz
sudo chmod -R 755 apache-ambari-2.7.3-src.tar.gz
sudo tar -xvzf apache-ambari-2.7.3-src.tar.gz -C /opt/modules/
chown -R student:student /opt/modules/apache-ambari-2.7.3-src/
mv /opt/modules/apache-ambari-2.7.3-src /opt/modules/ambari

# install HDP ===============================================================================
# (https://docs.hortonworks.com/HDPDocuments/Ambari-2.7.3.0/bk_ambari-installation/content/ambari_repositories.html)
wget http://public-repo-1.hortonworks.com/HDP/ubuntu16/3.x/updates/3.1.0.0/HDP-3.1.0.0-ubuntu16-deb.tar.gz
sudo chmod -R 755 HDP-3.1.0.0-ubuntu16-deb.tar.gz
sudo tar -xvzf HDP-3.1.0.0-ubuntu16-deb.tar.gz -C /opt/modules/
chown -R student:student /opt/modules/HDP

#install HDP-UTILS  ===============================================================================
wget http://public-repo-1.hortonworks.com/HDP-UTILS-1.1.0.22/repos/ubuntu16/HDP-UTILS-1.1.0.22-ubuntu16.tar.gz
sudo chmod -R 755 HDP-UTILS-1.1.0.22-ubuntu16.tar.gz
sudo tar -xvzf HDP-UTILS-1.1.0.22-ubuntu16.tar.gz -C /opt/modules/
chown -R student:student /opt/modules/HDP-UTILS

# install Apache2, enable http service ===========================================================
apt-get update
apt-get install apache2 # 浏览器到http://localhost,你应该看到apache2的测试页:
mkdir -p /var/www/html 

# copy modules into /var/www/html
cd /var/www/html
sudo cp -r /opt/modules/HDP .
sudo cp -r /opt/modules/HDP-UTILS .
sudo cp -r /opt/modules/ambari .
chown -R student:student /var/www/html

# Set & Compile Version
cd /var/www/html/ambari
mvn versions:set -DnewVersion=2.7.3.0.0

# Add Ambari repository
# (https://docs.hortonworks.com/HDPDocuments/Ambari-2.7.3.0/bk_ambari-installation/content/ambari_repositories.html)
cd /etc/apt/sources.list.d
wget http://public-repo-1.hortonworks.com/ambari/ubuntu16/2.x/updates/2.7.3.0/ambari.list
apt-key adv --recv-keys --keyserver keyserver.ubuntu.com B9733A7A07513CAD

# install ambari-server, ambari-agent
apt-get update
apt-get install ambari-server -y --allow-unauthenticated
apt-get install ambari-agent -y --allow-unauthenticated
apt-get install ambari-metrics-assembly -y --allow-unauthenticated

# ambari-server setup ============================================
# http://www.voidcn.com/article/p-elndjqfd-bpy.html
# Only on server
sudo ambari-server setup

# Using python  /usr/bin/python2.7
# Setup ambari-server
# Checking SELinux...
WARNING: Could not run /usr/sbin/sestatus: OK
Customize user account for ambari-server daemon [y/n] (n)? y
Enter user account for ambari-server daemon (root):
# Adjusting ambari-server permissions and ownership...
# Checking firewall status...
# Checking JDK...
# [1] Oracle JDK 1.8 + Java Cryptography Extension (JCE) Policy Files 8
# [2] Oracle JDK 1.7 + Java Cryptography Extension (JCE) Policy Files 7
# [3] Custom JDK
# ==============================================================================
Enter choice (1): 3

# WARNING: JDK must be installed on all hosts and JAVA_HOME must be valid on all hosts.
# WARNING: JCE Policy files are required for configuring Kerberos security. If you plan to use Kerberos,please make sure JCE Unlimited Strength Jurisdiction Policy Files are valid on all hosts.
Path to JAVA_HOME: /opt/modules/jdk1.8.0_211
# Validating JDK on Ambari Server...done.
# Completing setup...
# Configuring database...
Enter advanced database configuration [y/n] (n)? y
# Configuring database...
# ==============================================================================
# Choose one of the following options:
# [1] - PostgreSQL (Embedded)
# [2] - Oracle
# [3] - MySQL
# [4] - PostgreSQL
# [5] - Microsoft SQL Server (Tech Preview)
# [6] - SQL Anywhere
# ==============================================================================
Enter choice (1): 1


# Database name (ambari): 
# Postgres schema (ambari): 
# Username (ambari): 
# Enter Database Password (bigdata): 
# Default properties detected. Using built-in database.
# Configuring ambari database...
# Checking PostgreSQL...
# About to start PostgreSQL
# Configuring local database...
# Connecting to local database...done.
# Configuring PostgreSQL...
# Extracting system views...
# ...ambari-admin-2.1.2.377.jar
# ...
# Adjusting ambari-server permissions and ownership...
# Ambari Server 'setup' completed successfully.


# install Hadoop Cluster with online Guide ===========================================================
# https://blog.csdn.net/wangpei1949/article/details/79509545









































