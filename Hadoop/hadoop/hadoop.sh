# hadoop Setup

# 解壓縮安裝 ================================================
tar -zxf hadoop-3.1.2.tar.gz -C /opt/modules/
cd /opt/modules/hadoop-3.1.2/

# 刪除不必要的指令 ================================================
cd /opt/modules/hadoop-3.1.2/
rm -rf bin/*.cmd sbin/*.cmd etc/hadoop/*.cmd

# Set environment variables  ================================================
nano ~/.bashrc
# --------------- ADD
# Set HADOOP_HOME
export HADOOP_HOME=/opt/modules/hadoop
# Set HADOOP_MAPRED_HOME
export HADOOP_MAPRED_HOME=${HADOOP_HOME}
# Set JAVA_HOME 
export JAVA_HOME=/opt/modules/jdk1.8.0_211
# Add Hadoop bin and sbin directory to PATH
export PATH=$PATH:$HADOOP_HOME/bin:$HADOOP_HOME/sbin
# --------------- 
source ~/.bashrc
env

# hadoop-env.sh ================================================
# --------------- CHANGE
export JAVA_HOME=/opt/modules/jdk1.8.0_211
export HADOOP_HOME=/opt/modules/hadoop
export HADOOP_CONF_DIR=/opt/modules/hadoop/etc/hadoop
# --------------- 



# SingleNode Set up  ================================================
# ===================================================================

# core-site.xml ================================================
# 設定 NameNode 所在的主機與端口號(P.51-32)
# --------------- ADD
    <property>
       <name>fs.defaultFS</name>
       <value>hdfs://master1.example.org</value>
       <description>Use HDFS as file storage engine</description>
    </property>

	<property>
       <name>hadoop.tmp.dir</name>
       <value>/home/hadoop/data</value>
       <description>Temporary Directory.</description>
    </property>
# ---------------

# hdfs-site.xml ================================================
# 設定 HDFS 的副本數(P.51-33)
# --------------- ADD
    <property>
        <name>dfs.replication</name>
        <value>2</value>
    </property>
	
	<property>
       <name>dfs.permissions.superusergroup</name>
       <value>hadoop</value>
       <description>The name of the group of super-users. The value should be a single group name.</description>
    </property>
# ---------------

# mapred-site.xml ================================================
# --------------- ADD
# 設定 mapreduce 要運行在哪個資源調度框架上
    <property>
        <name>mapreduce.framework.name</name>
        <value>yarn</value>
    </property>
# 用 mapreduce 的時候去哪找依賴包
   <property> 
      <name>mapreduce.application.classpath</name>
      <value>/opt/modules/hadoop/share/hadoop/mapreduce/*,/opt/modules/hadoop/share/hadoop/mapreduce/lib/*,/opt/modules/hadoop/share/hadoop/common/*,/opt/modules/hadoop/share/hadoop/common/lib/*,/opt/modules/hadoop/share/hadoop/yarn/*,/opt/modules/hadoop/share/hadoop/yarn/lib/*,/opt/modules/hadoop/share/hadoop/hdfs/*,/opt/modules/hadoop/share/hadoop/hdfs/lib/*</value>
   </property>
# 資源配置(請用yarn-utils3.py試算資源配置)
    <property>
       <name>mapreduce.map.memory.mb</name>
       <value>1024</value>
    </property>
	<property>
       <name>mapreduce.map.java.opts</name>
       <value>-Xmx819m</value>
    </property>
	<property>
       <name>mapreduce.reduce.memory.mb</name>
       <value>2048</value>
    </property>
	<property>
       <name>mapreduce.reduce.java.opts</name>
       <value>-Xmx1638m</value>
    </property>
	<property>
       <name>yarn.app.mapreduce.am.resource.mb</name>
       <value>2048</value>
    </property>
	<property>
       <name>yarn.app.mapreduce.am.command-opts</name>
       <value>-Xmx1638m</value>
    </property>
	<property>
       <name>mapreduce.task.io.sort.mb</name>
       <value>409</value>
    </property>
	<property>
       <name>mapreduce.framework.name</name>
       <value>yarn</value>
    </property>
    <property>
	   <name>mapreduce.jobhistory.address</name>
	   <value>bdse88.example.org:10020</value>
    </property>
    <property>
	   <name>mapreduce.jobhistory.webapp.address</name>
	   <value>bdse88.example.org:19888</value>
    </property>
# ---------------

# yarn-site.xml ================================================
# YARN 集群對 MapReduce 程序所提供的 Shuffle 服務(P.52-4)
# --------------- ADD
    <property>
        <name>yarn.nodemanager.aux-services</name>
        <value>mapreduce_shuffle</value>
    </property>
	
	<property>
    <name>yarn.nodemanager.env-whitelist</name>
    <value>JAVA_HOME,HADOOP_COMMON_HOME,HADOOP_HDFS_HOME,HADOOP_CONF_DIR,CLASSPATH_PREPEND_DISTCACHE,HADOOP_YARN_HOME,HADOOP_MAPRED_HOME</value>
    </property>
	
	# 設定配置資源
	<property>
       <name>yarn.scheduler.minimum-allocation-mb</name>
       <value>1024</value>
    </property>
	
	<property>
       <name>yarn.scheduler.maximum-allocation-mb</name>
       <value>3072</value>
    </property>
	
	<property>
       <name>yarn.nodemanager.resource.memory-mb</name>
       <value>3072</value>
    </property>
	
	<property>
       <name>yarn.nodemanager.resource.detect-hardware-capabilities</name>
       <value>true</value>
	</property>
	
    <property>
       <name>yarn.nodemanager.resource.cpu-vcores</name>
       <value>2</value>
    </property>
	
	<property>
		   <name>yarn.nodemanager.vmem-pmem-ratio</name>
		   <value>4.2</value>
	</property>
# ---------------








# Cluster Set up  ================================================
# ================================================================

# hdfs-site.xml ================================================
(P.51-33)
# 在每台機器上創建資料夾
mkdir -p ~/data/hadoopdata/nn
mkdir -p ~/data/hadoopdata/dn
# --------------- ADD
# 指定 NameNode 的資料存放位置
	<property>
		<name>dfs.namenode.name.dir</name>
		<value>/home/hadoop/data/hadoopdata/nn</value>
	</property>
# 指定 DataNode 的資料存放位置
	<property>
		<name>dfs.datanode.data.dir</name>
		<value>/home/hadoop/data/hadoopdata/dn</value>
	</property>
# ---------------

# yarn-site.xml ================================================
# --------------- ADD
# 設置 ResourceManager 位置
	<property>
	   <name>yarn.resourcemanager.hostname</name>
	   <value>master2.example.org</value>
    </property>	
# ---------------

# workers  ================================================
# --------------- NEW
# 設置要當成 datanode 與 nodemanager 的節點
rtest01.example.org
rtest02.example.org
rtest03.example.org
# ---------------

# 分發檔案
cd /opt/modules/
scp -r hadoop-3.1.2/ stu@test02:$PWD
scp -r hadoop-3.1.2/ stu@test03:$PWD
















