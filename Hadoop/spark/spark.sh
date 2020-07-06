# spark

# install Maven ========================================
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

# install Git ===========================================
sudo apt update
sudo apt-get install git

# install Spark ===============================================
cd /opt/softwares
wget https://apache.org/dist/spark/spark-2.3.3/
chmod u+x spark-2.3.3.tgz
tar -zxf spark-2.3.3.tgz -C /opt/modules/
cd /opt/modules/spark-2.3.3/
nano dev/make-distribution.sh
# 檢測系統當前 Scala、Hadoop、Hive 的版本，會耗費很多時間，全部刪除，我們自行指定
# --------------- REVISE
VERSION=2.3.3
SCALA_VERSION=2.11.8
SPARK_HADOOP_VERSION=2.7.7
SPARK_HIVE=1
# --------------

# Building a Runnable Distribution
cd /opt/modules/spark-2.3.3/
./dev/make-distribution.sh --name custom-spark --tgz -Dhadoop.version=2.7.7 -Phadoop-2.7 -Phive -Phive-thriftserver -Pyarn
ll | grep 'spark' # 會 spark 目錄下生成，spark-2.3.3-bin-custom-spark.tgz，custom-spark 是我們所指定的
mv spark-2.3.3-bin-custom-spark.tgz /opt/softwares/
cd ../
rm -rf spark-2.3.3











