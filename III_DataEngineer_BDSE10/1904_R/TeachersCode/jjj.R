library(DBI)

db_host <- "HOSTADDRESS"
db_port <- 3306
db_name <- "DBNAME"
user_name <- "USERNAME"
user_pwd <- "PASSWORD"

engine <- dbConnect(RMySQL::MySQL(), # change according to DBMS type
                    host = db_host,
                    port = db_port,
                    dbname = db_name,
                    user = user_name,
                    password = user_pwd
)
dbListTables(engine)
sql_query <- "SELECT * FROM country LIMIT 20;"
db_query <- dbGetQuery(engine, statement = sql_query)
dbDisconnect(engine)

# File
## CSV / TXT / JSON / EXCEL
?read.csv
file_path <- "C:/Shared/R_lecture_material/diamonds.csv"
diamonds_csv <- read.csv(file_path, stringsAsFactors = FALSE)
?read.table
chicago_bulls <- read.table("https://storage.googleapis.com/ds_data_import/chicago_bulls_1995_1996.txt",
                            sep = ";", header = TRUE)
# install.packages(c("curl", "jsonlite"))
library(jsonlite)
?fromJSON
all_time_fantasy <- fromJSON("C:/Shared/R_lecture_material/all_time_fantasy.json")
captain_marvel <- fromJSON("C:/Shared/R_lecture_material/captain_marvel.json")

install.packages("readxl")
library(readxl)
?read_excel
# 讀取觀測值
df_rows <- read_excel("C:/Shared/R_lecture_material/直轄市長/縣表3-1-100(臺北市).xls",
                      skip = 5, col_names = FALSE)
# 調整候選人黨籍
candidates <- colnames(read_excel("C:/Shared/R_lecture_material/直轄市長/縣表3-1-100(臺北市).xls",
                                  skip = 2, n_max = 2))
candidates_split <- strsplit(candidates, split = "\n")
numbers <- c()
candidate_names <- c()
parties <- c()
for (e in candidates_split) {
  if (length(e) == 2) {
    party <- "無黨籍"
  } else {
    party <- e[3]
  }
  parties <- c(parties, party)
  numbers <- c(numbers, e[1])
  candidate_names <- c(candidate_names, e[2])
}
candidates <- paste(numbers, candidate_names, parties)
# 自訂 header
header <- c("district", "village", "office", candidates, LETTERS[1:8])
df <- df_rows
colnames(df) <- header
# 去掉 district 全形空格
df$district <- gsub(pattern = "　", df$district, replacement = "")
# 補行政區
for (i in 1:length(df$district)) {
  if (nchar(df$district[i]) == 0) {
    df$district[i] <- df$district[i - 1]
  }
}
