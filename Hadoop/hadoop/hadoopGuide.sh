# hadoop Guide

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

# 端口 ================================================
# Hadoop: 9870
# ResourceManager: 8088

# bin: 操作服務的命令 ================================================
# hadoop: MapReduce Related.(p53-6)
# hdfs:　HDFS Related.(p51-24)
# yarn: YARN Related.

# sbin: 啟動或關閉服務的命令 ================================================
# hadoop-daemon.sh: depreciated.
# start/stop-all.sh: (Not Recommended) start/stop all services.
# start/stop-dfs.sh: start/stop HDFS services.
# start/stop-yarn.sh start/stop YARN services.

# etc/hadoop: 配置所有文件的目錄 ================================================
# core-site.xml: 整個 hadoop 的核心設置(NameNode 在哪，群組管理)(p51-32, p56-4, p56-9)
# hadoop-env.sh: 有關 JAVA 的設置(JAVA_HOME, Heap_Size, 程式日誌目錄位置)(p51-34)
# hdfs-site.xml: 設定 HDFS 的參數(副本數、資料存在哪、資料存在哪)(P.51-33)
# yarn-site.xml: 設定 YARN 的參數(NodeManager 運算資源、Container 可用運算資源、SCheduler policies)(P.53.10, P.53.12, P.53.14, P.53.22)
# mapred-site.xml: 設定 MapReduce 的參數

# lib: 所有依賴包 ================================================

# Reference  ================================================
# formathdfs P.51-2
# starthdfs P.51-2
# hls P.51-3
# stophdfs P.51-29
# startyarn P.53-4
# stopyarn P.53-11
# startjps P.53-15
# stopjps P.53-16

















