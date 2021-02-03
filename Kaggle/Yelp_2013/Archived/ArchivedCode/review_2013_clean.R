install.packages("jsonlite")
library(jsonlite)

review_2013 <- stream_in(file("D:\\project\\yelp-recruiting\\yelp_training_set\\yelp_training_set_review.json"))
head(review_2013, 6)
nrow(review_2013)
ncol(review_2013)

summary(review_2013$review_id)
sum(complete.cases(review_2013))
length(unique(review_2013$review_id))

tb_1 <- function(x) {
  a <- class(x)
  b <- length(unique(x))
  c <- sum(is.na(x))
  d <- paste((c*100/length(x)),"%", sep = "")
  e <- length(x) - c
  f <- paste((e*100/length(x)),"%", sep = "")
  return(c(a,b,c,d,e,f))
}

table_1 <- as.data.frame(lapply(review_2013,tb_1))
rownames(table_1) <- c("數據型態","不同值個數","NA","NA%","NonNA","NonNA%")


data.c <- review_2013[,c("votes")]
funny <- data.c[,1]
useful <- data.c[,2]
cool <- data.c[,3]
data.n <- c(funny + useful + cool)
funny <- (data.c[,1] / data.n)
useful <- (data.c[,2] / data.n)
cool <- (data.c[,3] / data.n)
data.c <- as.data.frame(cbind(funny, useful, cool))
data.c[is.na(data.c)] <- 0

data.k <-review_2013[,-c(1,ncol(data))] 

data_clean1 <- cbind(data.c, data.k)

write.csv(data_clean1, "review_2013_clean.csv", row.names = FALSE)
