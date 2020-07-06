# commands

# 順序 ================================================
# Zookeeper
# HDFS
# YARN
# JobHistoryServer

# Commands ================================================
# 快速啟動
sbin/start-dfs.sh  # 任意結點
sbin/start-yarn.sh # resourceManagerOnly
# 快速關閉
sbin/stop-yarn.sh
sbin/stop-dfs.sh
# 開啟/關閉JobHistoryServer
mapred --daemon start/stop historyserver
# 關閉 HDFS
bin/hdfs --daemon stop datanode
bin/hdfs --daemon stop namenode
# 關閉 YARN
bin/yarn --daemon stop nodemanager