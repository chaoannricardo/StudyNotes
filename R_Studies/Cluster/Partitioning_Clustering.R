# K-Means Clustering
age_income <- read.csv("C:/Users/richi/Desktop/Temp/R_Lesson/Age_Income.csv",header=T,sep=",")
age_income_s <- age_income[,-c(1,4)]

kmd <- kmeans(age_income_s, centers=3)
kmd
kmd$cluster
kmd$centers

# Draw Graph
plot(age_income_s, col=kmd$cluster)
points(kmd$centers, col=1:3, pch=8, cex=2)

# Draw Graph
plot(age_income_s, col=kmd$cluster)
points(kmd$centers, col=1:3, pch=8, cex=2)

# Clustering Evaluation
# R2
kmd$totss
kmd$withinss
kmd$tot.withinss
#R2 <- (kmd$totss - kmd$tot.withinss) / kmd$totss
R2 <- kmd$betweenss / kmd$totss
R2

# Test R2 for Different Different K 
result <- list()

for (i in 2:5){
  kmd <- kmeans(age_income_s, centers=i)
  R2 <- kmd$betweenss / kmd$totss
  result[[paste('k=',i,sep='')]] = R2
}

result

# Test Silhouette Coefficient for Different Different K
library(cluster)

kmd <- kmeans(age_income_s, centers=3)

sil <- silhouette(kmd$cluster, dist(age_income_s))
sil
mean(sil[,'sil_width'])

result <- list()

for (i in 2:5){
  kmd <- kmeans(age_income_s, centers=i)
  sil <- silhouette(kmd$cluster, dist(age_income_s))
  result[[paste('k=',i,sep='')]] <- mean(sil[,'sil_width'])
}

result

# Autumatically Finding K Using PAM
library(fpc)

pamk.result <- pamk(age_income_s)

pamk.result$pamobject$clustering
pamk.result$nc

# Graph for PAM
layout(matrix(c(1,2),1,2))
plot(pamk.result$pamobject)
layout(matrix(1))

library(NbClust)

NbClust.result <- NbClust(data=iris2, distance="euclidean", 
                          min.nc=2, max.nc=10, 
                          method="ward.D2", index="all")



#Normalization for Clustering
age_income <- read.csv("C:/Users/richi/Desktop/Temp/R_Lesson/Age_Income4.csv",header=T,sep=",")

plot(age_income)

set.seed(105)
kmd <- kmeans(age_income, centers=2)
kmd$centers
plot(age_income, col=kmd$cluster)
points(kmd$centers, col=1:3, pch=8, cex=2)

# Normalization
normalize <- function(x) { 
  return((x - min(x)) / (max(x) - min(x)))
}

age_income_sn <- as.data.frame(lapply(age_income, normalize))

plot(age_income_sn)

set.seed(105)
kmd <- kmeans(age_income_sn, centers=2)
kmd$centers
plot(age_income_sn, col=kmd$cluster)
points(kmd$centers, col=1:3, pch=8, cex=2)
