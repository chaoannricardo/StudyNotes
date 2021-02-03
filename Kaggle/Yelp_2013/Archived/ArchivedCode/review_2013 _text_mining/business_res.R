library(jsonlite)
library(dplyr)


business <- stream_in(file("F:\\project\\yelp_2013\\yelp_training_set_business.json"))
cattemp <- business$categories
business_id <- business$business_id
business_name <- business$name

for(i in 1:length(cattemp)){
  cattemp[[i]] <- paste("\"" , cattemp[[i]], "\":\"TRUE\"")
}
cattemp[[1]][1] # "\" Golf \":\"TRUE\""


catcolNew <- c()
for(i in 1:length(cattemp)){
  temp3 <- paste("{" , paste(cattemp[[i]], collapse =","), "}")
  catcolNew <- c(catcolNew, temp3)
}
catcolNew


cat_jsonArray <- paste("[", paste(catcolNew, collapse = ","), "]")

cat_dataframe <- fromJSON(cat_jsonArray)

allcolnames <- names(cat_dataframe)
names(cat_dataframe) <- trimws(allcolnames,"both")
names(cat_dataframe)

cat1 <- cat_dataframe[,1:7]
cat2 <- cat_dataframe[,9:509 ]
cat_dataframe <- cbind(business_id, cat1, cat2)
cat_dataframe[is.na(cat_dataframe)] <- 0
cat_dataframe[cat_dataframe == 'TRUE'] <- 1
cat_dataframe <- as.data.frame(lapply(cat_dataframe,as.numeric))
class(cat_dataframe[1,2])

restaurant <- read.csv("F:\\project\\yelp_2013\\business_2013_categories.csv", header = TRUE)
a <- as.character(restaurant$categories[restaurant$truefalse == 1])

#dataframeÂà¸m
restaurant.df <- as.data.frame(t(restaurant), stringsAsFactors=FALSE)
b <- restaurant.df[1,]
restaurant <- cbind(business_id[1:2],restaurant.df)
colnames(restaurant) <- c("business_id",b)
restaurant <- restaurant[2,]
restaurant <- as.data.frame((lapply(restaurant, as.numeric)))
cat_dataframe <- rbind(restaurant, cat_dataframe)

cat_business_id <- cat_dataframe[, (cat_dataframe[1,] == 1)]
cat_business_id <- cat_business_id[-1,]
cat_business_id <- cbind(business_id, cat_business_id)
cat_business_id <- cat_business_id[,-2]
cat_business_id <- cbind(business_name, cat_business_id)

final <- cat_business_id[which(rowSums(cat_business_id[,3:99]) > 0), ]

write.csv(final, "cat_business.csv", row.names = FALSE)


