# 階層式===================================================
#Sample 40 Records
set.seed(100)
index <- sample(1:nrow(iris2),40) 
irissample <- iris2[index,]

#dist函數 distance matrix compute
hclust.result <- hclust(dist(irissample), method= "ward.D2") 

plot(hclust.result, labels=iris$Species[index])
rect.hclust(hclust.result, k=3, border="red")
groups <- cutree(hclust.result, k=3)
table(iris$Species[index], groups)

# 決定群集數的方法I
library(fpc)

pamk.result <- pamk(iris2)
pamk.result$nc

# 決定群集數的方法II
library(NbClust)

NbClust.result <- NbClust(data=iris2, distance="euclidean", 
                          min.nc=2, max.nc=10, 
                          method="ward.D2", index="all") 