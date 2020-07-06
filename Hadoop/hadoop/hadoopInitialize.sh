# hadoop Initialize

# 格式化 HDFS (Only Once)
# 在 NameNode 的機器上(在我們指定的資料夾生成集群信息)(P.51-18)
cd /opt/modules/hadoop-3.1.2/
bin/hdfs namenode -format

# 啟動 HDFS (所有機器)(P.51-19)
cd /opt/modules/hadoop-3.1.2/
# namenode
bin/hdfs --daemon start namenode
bin/hdfs --daemon start datanode
# datanode
bin/hdfs --daemon start datanode
# 創建使用者家目錄(P.56-3)
bin/hdfs dfs -mkdir -p /user/hadoop
bin/hdfs dfs -mkdir  /user/hadoop/datas

# 啟動 YARN (所有機器)(P.51-19)
# resourceManager
bin/yarn --daemon start resourcemanager
bin/yarn --daemon start nodemanager
# datanode
bin/yarn --daemon start nodemanager
# 暫存目錄(P.53-4)
bin/hdfs dfs -mkdir /tmp
bin/hdfs dfs -chmod 777 /tmp

# Start History Server
mapred --daemon start historyserver
jps

# MapReduce 測試(YARN 集群運行 MapReduce 程序測試)
# 創建文件
touch wc.txt
nano wc.txt
# --------------- NEW
hadoop hbase     
hive java
spark hive
spark java
# --------------- 
# 上傳文件
bin/hdfs dfs -put wc.txt /user/hadoop/datas/
# 建立輸出根目錄
bin/hdfs dfs -mkdir -p /user/hadoop/output/count
# 執行 WordCount
bin/hadoop jar /opt/modules/hadoop/share/hadoop/mapreduce/hadoop-mapreduce-examples-3.1.2.jar wordcount /user/hadoop/datas/wc.txt /user/hadoop/output/count/1
# 查看結果
bin/hdfs dfs -cat /user/hadoop/output/count/1/part-r-00000
# Test 2
hadoop jar /opt/modules/hadoop/share/hadoop/mapreduce/hadoop-mapreduce-examples-3.1.2.jar pi 30 100





# Setup Edge node(Gateway node)
# On master1 (or all HA namenodes):
# 1) Create user account, add to hadoop group
sudo -i
adduser user01
gpasswd -a user01 hadoop
groups user01
# 2) Create user directory on hdfs
su - hadoop
hdfs dfs -mkdir /user/user01
hdfs dfs -chown user01 /user/user01
hdfs dfs -ls /user
# (optional, needed for hive setup)
hdfs dfs -chmod g=rwx /tmp
# Refresh the user and group mappings 
# to let the NameNode know about the new user
hdfs dfsadmin -refreshUserToGroupsMappings
# On client :
# 1) Create user account(same user account on master1)   
sudo -i
adduser user01
gpasswd -a user01 hadoop
groups user01
# 2) Switch to user account
su - user01
# 3) Set environment variables 
nano ~/.bashrc
# Set HADOOP_HOME
export HADOOP_HOME=/opt/modules/hadoop
# Set HADOOP_MAPRED_HOME
export HADOOP_MAPRED_HOME=${HADOOP_HOME}
# Set JAVA_HOME 
export JAVA_HOME=/opt/modules/jdk1.8.0_211
# Add Hadoop bin and sbin directory to PATH
export PATH=$PATH:$HADOOP_HOME/bin:$HADOOP_HOME/sbin
source ~/.bashrc
env   
# 4) Run a MapReduce example
hadoop jar /opt/modules/hadoop/share/hadoop/mapreduce/hadoop-mapreduce-examples-3.1.2.jar pi 30 100
http://master1.example.org:8088/cluster/apps (check running appliction)  










