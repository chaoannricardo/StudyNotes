install.packages("jsonlite")
library(jsonlite)

json_file_review <- stream_in(file("C:\\Users\\Student\\Desktop\\project\\yelp-dataset\\yelp_academic_dataset_review.json"))
head(json_file_review, 6)

nrow(json_file_review)
ncol(json_file_review)
length(json_file_review)
summary(json_file_review$review_id)


sum(complete.cases(json_file_review))
length(unique(json_file_review$review_id))

tb_1 <- function(x) {
  a <- class(x)
  b <- length(unique(x))
  c <- sum(is.na(x))
  d <- paste((c*100/length(x)),"%", sep = "")
  e <- length(x) - c
  f <- paste((e*100/length(x)),"%", sep = "")
  return(c(a,b,c,d,e,f))
}

table_1 <- as.data.frame(lapply(json_file_review,tb_1))
rownames(table_1) <- c("數據型態","不同值個數","NA","NA%","NonNA","NonNA%")

json_file_review <- json_file_review[-which.min(json_file_review$useful),]
data.n <- json_file_review[,-c(1,2,3,4,8,9,ncol(data))]
useful <- data.n[,1]
funny <- data.n[,2]
cool <- data.n[,3]
data.m <- c(useful + funny + cool)
useful <- (data.n[,1] / data.m)
funny <- (data.n[,2] / data.m)
cool <- (data.n[,3] / data.m)
data.n <- as.data.frame(cbind(funny, useful, cool))
data.n[is.na(data.n)] <- 0

data.i <- json_file_review[,c(1,2,3,4,ncol(data))]
data.k <- json_file_review[,c(8,9,ncol(data))]

data_clean1 <- cbind(data.i, data.n, data.k)

write.csv(data_clean1, "review_clean.csv", row.names = FALSE)
