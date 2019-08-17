# zookeeper setup

# Extract Files ================================================
cd /opt/softwares/
tar -zxf zookeeper-3.4.14.tar.gz -C /opt/modules/
mv /opt/modules/zookeeper-3.4.14 /opt/modules/zookeeper
chown -R hadoop:hadoop /opt/modules/zookeeper
cd /opt/modules/zookeeper/

# Environment Variables ================================================
nano ~/.bashrc
# --------------- ADD
# Set ZOOKEEPER_HOME
export ZOOKEEPER_HOME=/opt/modules/zookeeper
export PATH=$PATH:$ZOOKEEPER_HOME/bin   
# --------------- 
source ~/.bashrc

# 刪除不必要的命令 ================================================
su - hadoop
cd /opt/modules/zookeeper/
rm -rf bin/*.cmd

# 更名配置文件 ================================================
cd conf/
cp zoo_sample.cfg zoo.cfg

# zoo.cfg ================================================
mkdir -p ~/data/zookeeperdata/data # Each Zookeeper Client
nano zoo.cfg
# --------------- CHANGE I
# The number of milliseconds of each tick
tickTime=2000
# the directory where the snapshot is stored.
# do not use /tmp for storage, /tmp here is just
# example sakes.
dataDir=/home/hadoop/data/zookeeperdata/data
# the port at which the clients will connect
clientPort=2181
# --------------- 

# --------------- CHANGE II
# The number of ticks that the initial
# sychroniztion phase can take
initLimit=10 # 初始化過程中的心跳個數; 初始化 follower 與 leader 連接時允許的心跳次數 
# The number of ticks that can pass between
# sending a request and getting an acknowledgement
syncLimit=5 # 請求和響應之間的心跳次數; follower 與 leader 數據同步時允許的心跳次數 
# --------------- 

# zookeeper 的集群有幾台就要寫幾台，一行代表一個節點
# server: 固定寫法; num: 每台結點id號碼(隨意指定，但不可重複)
# (這個id要存在快照目錄中，文件名要叫做myid)
# 2888: 集群內通信端口
# 3888:　選舉的端口
# --------------- ADD
server.1=master1.example.org:2888:3888
server.2=master2.example.org:2888:3888
server.3=master3.example.org:2888:3888
# ---------------

# zooEnv.sh ================================================
cd /opt/modules/zookeeper/bin
nano zkEnv.sh
# --------------- CHANGE
ZOOBINDIR="${ZOOBINDIR:-/usr/bin}"
ZOOKEEPER_PREFIX="${ZOOBINDIR}/.."
ZOO_LOG_DIR="/opt/modules/zookeeper/logs"
ZOO_LOG4J_PROP="INFO,ROLLINGFILE" 
# ---------------

# 建立myid ================================================
# Each Zookeeper 需進行
touch ~/data/zookeeperdata/data/myid
nano ~/data/zookeeperdata/data/myid
# --------------- NEW
1 # 2, 3, 4 ....不能有空格或空行
# --------------- 

# 分發到其他節點 ================================================
cd /opt/modules/
scp -r zookeeper/ stu@test02:$PWD
scp -r zookeeper/ stu@test03:$PWD
nano ~/data/zookeeperdata/data/myid
# --------------- CHANGE
1 # 2, 3, 4 ....不能有空格或空行
# --------------- 

# Testing ================================================
# 啟動
cd /opt/modules/zookeeper-3.4.14/
bin/zkServer.sh start
jps
bin/zkServer.sh status
# 連結服務
bin/zkCli.sh # 連本機的 zookeeper 服務
bin/zkCli.sh -server test02 # 連 test02 的 zookeeper 服務
# zookeeper 集群所有機器都可提供讀取服務
# 只有主節點才能處理寫入操作
# 連接後指令
help # 有 watch 代表可以監聽
ls / # 列出根結點內容
ls / watch # 監聽根目錄
create /zk_test my_data # 創建 znode 為 zk_test; 並在 zk_test 中，添加 my_data 這個內容
get /zk_test # 獲取 /zk_test 內容
# my_data:　內容
# cZxid: 記錄集群創建事件的提交順序(16進制; 前面四位:代表集群、leader 改變隨之改變; 後面四位: 代表提交順序)
# ctime: 創建時間
# mZxid: 紀錄集群修改事件的提交順序(cZxid = mZxid: 創建的那次操作會相同)
# pZxid: 子節點修改或創建的編號、只與子節點有關(與孫節點無關)
# cversion, dataVersion, aclVersion(版本)
# ephemeralOwner: 臨時節點的擁有者(永久節點: 0x0; 臨時節點: zookeeper 客戶端的 sessionID)
# dataLength: 儲存的數據長度
# numChildren: 子節點的個數
create -e /zk_test/test data # 創建臨時的 znode(內容為 data)
get /zk_test/test # 獲取 /zk_test/test 內容
stat /zk_test # 獲取 /zk_test 狀態
set /zk_test junk # 改變 zk_test 的內容
get /zk_test # 獲取 zk_test 內容
delete /zk_test # 只能刪除無子節點的 znode
rmr /zk_test # 遞歸刪除
ls /
quit








