german <- read.csv("C:/Users/Student/Desktop/german.csv")
head(german,3)

#Table1
tb_1 <- function(x) {
  a <- class(x)
  b <- length(unique(x))
  c <- sum(is.na(x))
  d <- paste((c*100/length(x)),"%", sep = "")
  e <- length(x) - c
  f <- paste((e*100/length(x)),"%", sep = "")
  return(c(a,b,c,d,e,f))
}

table_1 <- as.data.frame(lapply(german,tb_1))
rownames(table_1) <- c("數據型態","不同值個數","NA","NA%","NonNA","NonNA%")
View(table_1)

#Table2
tb_2 <- function(x) {
    a <- min(x, na.rm = TRUE)
    b <- max(x, na.rm = TRUE)
    c <- mean(x, na.rm = TRUE)
    d <- sd(x, na.rm = TRUE)
    e <- c-3*d
    f <- c+3*d
    return(c(a,b,c,d,e,f))
}

table_2 <- as.data.frame(lapply(german[,sapply(german, class)!="factor"][,-1], tb_2))
rownames(table_2) <- c("Min","Max","Mean","StDev","M-3","M+3")
View(table_2)

#Table3
tb_3 <- function(x) {
  a <- summary(x)
  b <- paste((a*100/sum(a)),"%", sep = "")
  names(b) <- names(a)
  return(c(a,b))
}

table_3 <- lapply(german[,sapply(german, class)=="factor"], tb_3)

View(table_3)
