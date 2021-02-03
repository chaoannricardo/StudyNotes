install.packages("jsonlite")
library(jsonlite)

json_file_tip <- stream_in(file("C:\\Users\\Student\\Desktop\\project\\yelp-dataset\\yelp_academic_dataset_tip.json"))
head(json_file_tip, 6)
nrow(json_file_tip)
ncol(json_file_tip)

summary(json_file_tip$user_id)
sum(complete.cases(json_file_tip))
length(unique(json_file_tip$user_id))

tb_1 <- function(x) {
  a <- class(x)
  b <- length(unique(x))
  c <- sum(is.na(x))
  d <- paste((c*100/length(x)),"%", sep = "")
  e <- length(x) - c
  f <- paste((e*100/length(x)),"%", sep = "")
  return(c(a,b,c,d,e,f))
}

table_1 <- as.data.frame(lapply(json_file_tip,tb_1))
rownames(table_1) <- c("數據型態","不同值個數","NA","NA%","NonNA","NonNA%")

data.c <- as.data.frame(json_file_tip[,c(5, ncol(data))])
data.k <- json_file_tip[,-c(5, ncol(data))]

tb_2 <- function(x) {
  a <- min(x)
  b <- max(x)
  c <- mean(x)
  d <- sd(x)
  e <- c - 3 * d
  f <- c + 3 * d
  return(c(a,b,c,d,e,f))
}

table_2 <- as.data.frame(lapply(data.c, tb_2))
rownames(table_2) <- c("min","max","mean","sd","m-3","m+3")

normalize <- function(x) { 
  return((x - min(x)) / (max(x) - min(x)))
}

data.n <- as.data.frame(lapply(data.c, normalize))

data_clean1 <- cbind(data.k, data.n)

write.csv(data_clean1, "tip_clean.csv", row.names = FALSE)