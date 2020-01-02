# K means could only tackle numeric values
# Extract All Numerical Attributes
# iris2 <- iris[,sapply(iris,is.numeric)]
iris2 <- iris[,-5]

set.seed(1234)
kmeans.result <- kmeans(iris2, 3)  # 3 群
kmeans.result

table(iris$Species, kmeans.result$cluster)
plot(iris2, col=kmeans.result$cluster)

#Find 10 Largest Distances between Objects and Cluster Centers
kmeans.result$centers
centers <- kmeans.result$centers[kmeans.result$cluster,]
head(centers)

distances <- sqrt(rowSums((iris2 - centers)^2))
outliers <- order(distances, decreasing=T)[1:10]
outliers

iris2[outliers,]
plot(iris2[c("Sepal.Length", "Petal.Width")], col=kmeans.result$cluster)
points(kmeans.result$centers[,c("Sepal.Length", "Petal.Width")], col=1:3, pch=8, cex=2)
points(iris2[outliers,c("Sepal.Length", "Petal.Width")], col=4, pch='+', cex=2)

iris2 <- iris[,-5]


# 決定群集數的方法I
library(fpc)

pamk.result <- pamk(iris2)
pamk.result$nc

# 決定群集數的方法II
library(NbClust)

NbClust.result <- NbClust(data=iris2, distance="euclidean", 
                          min.nc=2, max.nc=10, 
                          method="ward.D2", index="all") 