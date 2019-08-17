# hadoop HA Setup =================================================================

# hdfs-site.xml ================================================
# ---------------  ADD
# 對外提供服務的名稱
	<property>
		<name>dfs.nameservices</name>
		<value>mycluster</value>
	</property>
	
# 要有幾台 NameNode 並給它們一個代號
	<property>
		<name>dfs.ha.namenodes.mycluster</name>
		<value>nn1,nn2</value>
	</property>

# 指定 NameNode 是哪一台主機，哪個端口
	<property>
		<name>dfs.namenode.rpc-address.mycluster.nn1</name>
		<value>test01:8020</value>
	</property>
	
	<property>
		<name>dfs.namenode.rpc-address.mycluster.nn2</name>
		<value>test02:8020</value>
	</property>
	
# 指定 Web 訪問的端口號
	<property>
		<name>dfs.namenode.http-address.mycluster.nn1</name>
		<value>test01:9870</value>
	</property>
	
	<property>
		<name>dfs.namenode.http-address.mycluster.nn2</name>
		<value>test02:9870</value>
	</property>
	
# 設置 JournalNodes 運行的節點與端口號
	<property>
		<name>dfs.namenode.shared.edits.dir</name>
		<value>qjournal://test01:8485;test02:8485;test03:8485/mycluster</value>
	</property>

# HDFS 客戶端利用這個 java class 來聯繫 active NameNode
	<property>
		<name>dfs.client.failover.proxy.provider.mycluster</name>
		<value>org.apache.hadoop.hdfs.server.namenode.ha.ConfiguredFailoverProxyProvider</value>
	</property>

# 當故障發生時，用什麼方法來避免兩個 NameNode 同時處於活躍狀態
	<property>
		<name>dfs.ha.fencing.methods</name>
		<value>sshfence</value>
	</property>

	<property>
		<name>dfs.ha.fencing.ssh.private-key-files</name>
		<value>/home/stu/.ssh/id_rsa</value>
	</property>

# 配置 Journalnode 的儲存目錄
	<property>
		<name>dfs.journalnode.edits.dir</name>
		<value>/home/stu/data/hadoopdata/jn</value>
	</property>
# ---------------


# 三台JournalNode需建置的資料夾
mkdir ~/data/hadoopdata/jn
cd ~/data/hadoopdata/jn/
pwd

# core-site.xml ================================================
# 現在的 NameNode 是集群服務
# --------------- REPLACE
	<property>
		<name>fs.defaultFS</name>
		<value>hdfs://mycluster</value>
	</property>
# ---------------


# SCP configurations to cluster ================================================
cd /opt/modules/hadoop-3.1.2/
scp -r etc/ stu@test02:$PWD
scp -r etc/ stu@test03:$PWD

# Start journal nodes ================================================
bin/hdfs --daemon start journalnode # On Three JournalNodes
jps
bin/hdfs namenode -initializeSharedEdits # 將 NameNode 的 Metadata 匯入 JournalNode
bin/hdfs --daemon start namenode # 啟動 test01 namenode
bin/hdfs namenode -bootstrapStandby # 所以在 nn2 上輸入此命令將 nn1 的數據拷貝至 nn2，nn1 與 nn2 共享一份元數據
bin/hdfs --daemon start namenode # 啟動 2 號機 namenode，檢查網頁(8020)
bin/hdfs haadmin -transitionToActive nn1 # 將1號機設定為active
bin/hdfs --daemon start datanode # 全部datanode皆啟動
bin/hdfs dfs -mkdir -p /user/stu/datas # 測試可用性：創建資料夾
bin/hdfs dfs -put /opt/datas/wc.txt /user/stu/datas/ # 上傳文件
bin/hdfs dfs -cat /user/stu/datas/wc.txt # 訪問文件
bin/hdfs --daemon stop namenode # 關閉active的namenode
bin/hdfs haadmin -transitionToActive nn2 --forceactive # 設置 standby NameNode 為 active
bin/hdfs dfs -cat /user/stu/datas/wc.txt
sbin/stop-dfs.sh






