library(stringr)

data <- read.csv("C:/Users/leeys/Desktop/test.csv")

for(i in 1:nrow(data)) {
  if(!is.na(data[[2]][i])) {
    a <- data[[2]][i]
    a <- str_replace_all(a, "[{'} ]", "")
    a <- strsplit(a, ",")[[1]]
    ln <- length(a)
  }
}

result <- data.frame()

for(i in 1:nrow(data)) {
  if(is.na(data[[2]][i])) {
    c <- rep(F,ln)
  }
  else {
    a <- data[[2]][i]
    a <- str_replace_all(a, "[{'} ]", "")
    a <- strsplit(a, ",")[[1]]

    c <- vector(mode="logical", length=length(a))
    n <- vector(mode="character", length=length(a))
    
    for(i in 1:length(a)){
      b <- strsplit(a[i], ":")
      if(b[[1]][2]=="True") c[i] = TRUE
      else c[i] = FALSE
      n[i] <- b[[1]][1]
    }
  }
  
  result <- data.frame(rbind(result,t(c)))
}

names(result) <- n

result