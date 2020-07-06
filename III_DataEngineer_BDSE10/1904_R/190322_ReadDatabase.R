#File: CSV/ TXT/ JSON/ EXCEL

#read.csv
?read.csv
file_path <- "C:/Users/richi/Desktop/diamonds.csv"
diamond_csv <- read.csv("C:/Users/richi/Desktop/diamonds.csv")
diamond_csv_0 <- read.csv("C:/Users/richi/Desktop/diamonds.csv", nrows = 3)
diamond_csv_1 <- read.csv("C:/Users/richi/Desktop/diamonds.csv", sep = ",", header = TRUE)
View(diamond_csv)
View(diamond_csv_0)
View(diamond_csv_1)

#read.json
library(jsonlite)
JSONTest <- fromJSON("C:/Users/richi/Desktop/Test.json")
JSONTest
JSONTest0 <- fromJSON("C:/Users/richi/Desktop/JSON0.json")
JSONTest0

#MS SQL Server import
install.packages("DBI")
install.packages("odbc")
install.packages("rstudioapi")

DriverName <- "SQL Server (MSSQLSERVER)"
ServerName <- "127.0.0.1"
DBName <- "DB01"
DataBasePassword <- "password"
DataBaseUser <- "sa"
con <- DBI::dbConnect(odbc::odbc(),
                      Driver   = DriverName,
                      Server   = ServerName,
                      Database = DBName,
                      UID      = rstudioapi::askForPassword(DataBaseUser),
                      PWD      = rstudioapi::askForPassword(DataBasePassword),
                      Port     = 1433)

#Read.Excel
install.packages("readxl")
library(readxl)
tp <- read_excel("C:/Users/richi/Desktop/Test/tp.xls")
View(tp)
#Excel Data Cleanup
#skip first 2 rows of table
tp_rows <- read_excel("C:/Users/richi/Desktop/Test/tp.xls", skip = 2, col_names = FALSE)
View(tp_rows)
#show the colnames of row, blanks are skipped, and max row number is 2
candidates <- colnames(read_excel("C:/Users/richi/Desktop/Test/tp.xls", skip = 2, n_max = 2))
View(candidates)
#Split the value by "\n" (" ")
candidates_split <- strsplit(candidates, split = "\n")
View(candidates_split)
#Set numbers, candidate_name, parties for each candidate
numbers <- c()
candidate_name <- c()
parties <- c()
for(e in candidates_split){
  if(length(e) == 2){
    party <- "無黨籍"
  }else{
    party <- e[3]
  }
  parties <- c(parties, party)
  numbers <- c(numbers, e[1])
  candidate_name <- c(candidate_name, e[2])
}
candidates <- paste(numbers, candidate_name, parties)
View(candidates)

#Customized Header
header <- c("district", "village", "office", candidates, LETTERS[1:8])
df <- tp_rows
View(df)
colnames(df) <- header
View(df)
#delete Fullwidth space of district
df$district <- gsub(pattern = "　", df$district, replacement = "")
#補行政區





