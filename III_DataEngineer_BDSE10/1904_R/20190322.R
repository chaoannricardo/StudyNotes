# 2019-03-22
# Database
#install.packages("RMySQL")
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
# 刪除小計的列數
is_complete <- complete.cases(df)
df_wide <- df[is_complete, ]

# 打包成 Function
get_tidy_df <- function(xls_file_path) {
  df_rows <- read_excel(xls_file_path, skip = 5, col_names = FALSE)
  # 調整候選人黨籍
  candidates <- colnames(read_excel(xls_file_path, skip = 2, n_max = 2))
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
  # 刪除小計的列數
  is_complete <- complete.cases(df)
  df_wide <- df[is_complete, ]
  df_wide$office <- as.integer(df_wide$office)
  n_candidates <- ncol(df_wide) - 11
  # transpose
  df_wide_select <- df_wide[, 1:(3+n_candidates)]
  df_long <- gather(df_wide_select, key = "candidate_info", value = "votes", candidates)
  split_candidate_info <- strsplit(df_long$candidate_info, split = " ")
  numbers <- c()
  candidate_names <- c()
  parties <- c()
  for (e in split_candidate_info) {
    numbers <- c(numbers, as.integer(e[1]))
    candidate_names <- c(candidate_names, e[2])
    parties <- c(parties, e[3])
  }
  df_long$number <- numbers
  df_long$candidate <- candidate_names
  df_long$party <- parties
  df_long$candidate_info <- NULL
  df_long <- df_long[, c("district", "village", "office", "number", "candidate", "party", "votes")]
  outputs <- list(
    wide = df_wide,
    long = df_long
  )
  return(outputs)
}

parent_folder <- "C:/Shared/R_lecture_material/直轄市長/"
xls_file_names <- list.files(parent_folder)
cities <- substr(xls_file_names, start = 11, stop = 13)
xls_file_paths <- paste0(parent_folder, xls_file_names)
city_vote_details <- list()
city_votes <- data.frame()
for (i in 1:length(xls_file_paths)) {
  tidy_df <- get_tidy_df(xls_file_paths[i])
  city_vote_details[[i]] <- tidy_df$wide
  city_votes <- rbind(city_votes, tidy_df$long)
  msg <- sprintf("Processing: %s", xls_file_names[i])
  message(msg)
}
names(city_vote_details) <- cities
View(city_votes)

for (e in city_vote_details) {
  print(dim(e))
}

tp <- city_vote_details$臺北市

# cbind - column bind - horizontal
left_df <- tp[, 1:3]
right_df <- tp[, 4:ncol(tp)]
cbind(left_df, right_df)

# rbind - row bind - vertical
upper_df <- tp[tp$office < 750, ]
lower_df <- tp[tp$office >= 750, ]
rbind(upper_df, lower_df)

ntp <- city_vote_details[["新北市"]]
rbind(tp, ntp)

# 轉置寬格式為長格式
install.packages("tidyr")
library(tidyr)
?gather
n_candidates <- ncol(df_wide) - 11
df_wide_select <- df_wide[, 1:(3+n_candidates)]
df_long <- gather(df_wide_select, key = "candidate_info", value = "votes", candidates)
split_candidate_info <- strsplit(df_long$candidate_info, split = " ")
numbers <- c()
candidate_names <- c()
parties <- c()
for (e in split_candidate_info) {
  numbers <- c(numbers, as.integer(e[1]))
  candidate_names <- c(candidate_names, e[2])
  parties <- c(parties, e[3])
}
df_long$number <- numbers
df_long$candidate <- candidate_names
df_long$party <- parties
df_long$candidate_info <- NULL
View(df_long)

# Complete codes for votes data
install.packages(c("readxl", "tidyr"))
library(readxl)
library(tidyr)

source("C:/Shared/R_lecture_material/my-functions.R")

parent_folder <- "C:/Shared/R_lecture_material/直轄市長/"
xls_file_names <- list.files(parent_folder)
cities <- substr(xls_file_names, start = 11, stop = 13)
xls_file_paths <- paste0(parent_folder, xls_file_names)
city_vote_details <- list()
city_votes <- data.frame()
for (i in 1:length(xls_file_paths)) {
  tidy_df <- get_tidy_df(xls_file_paths[i])
  city_vote_details[[i]] <- tidy_df$wide
  tidy_df_long <- tidy_df$long
  tidy_df_long$area <- cities[i]
  tidy_df_long <- tidy_df_long[, c("area", "district", "village", "office", "number", "candidate", "party", "votes")]
  city_votes <- rbind(city_votes, tidy_df_long)
  msg <- sprintf("Processing: %s", xls_file_names[i])
  message(msg)
}
names(city_vote_details) <- cities
View(city_votes)