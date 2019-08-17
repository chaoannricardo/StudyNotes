# zookeeper Guide

# Commands ================================================
# 啟動
bin/zkServer.sh start
# 檢查狀態
bin/zkServer.sh status
# 連接服務
bin/zkCli.sh # 連本機的 zookeeper 服務
bin/zkCli.sh -server test02 # 連 test02 的 zookeeper 服務
# 連接後指令
help # 有 watch 代表可以監聽
ls / # 列出根結點內容
ls / watch # 監聽根目錄

# Infos ================================================
# 選舉制：得票要過半才會選出領袖
# 機器數：2n+1
# 允許可損壞數：n

# bin: 存放操作服務的命令 ================================================
# zkServer: 啟動 zookeeper 服務端
# zkCli: 啟動 zookeeper 客戶端

# conf: 配置文件所在目錄 ================================================
# zoo_sample.cfg 配置這個就好