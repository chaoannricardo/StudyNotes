 

test_attributes <- business_attributes[1:20,c(1,4,5)]
write.csv(test_attributes,file='C:/Users/Student/Desktop/test.csv',row.names = FALSE)
test_attributes$BusinessParking[is.na(test_attributes$BusinessParking)] <- "{'garage': False, 'street': False, 'validated': False, 'lot': False, 'valet': False}"
library(nnet)
test <- cbind(ID=test_attributes$ID,class.ind(test_attributes$BusinessParking))



test_attributes$GoodForMeal[is.na(test_attributes$GoodForMeal)] <- "{'dessert': False, 'latenight': False, 'lunch': False, 'dinner': False, 'brunch': False, 'breakfast': False}"
View(test_attributes$GoodForMeal)
test_df <- test_attributes$GoodForMeal
for (i in 1:length(test_df)){
  test_df[i] <- gsub('False',"\"FASLE\"",test_df[i])
  test_df[i] <- gsub('True',"\"TRUE\"",test_df[i])
  test_df[i] <- gsub('\'',"\"",test_df[i])
}
df <- as.data.frame(cbind(ID=test_attributes$ID,GoodForMeal=test_df))
testttt <- paste("[", paste(df$GoodForMeal, collapse = ","), "]") %>% fromJSON(flatten = T)
View(testttt)




library(jsonlite)
library(tidyverse)
business <- stream_in(file("C:/Users/Student/Desktop/business.json"))
business_attributes <- business$attributes
######################################################################
unique(business_attributes$BusinessParking)
business_attributes$BusinessParking[is.na(business_attributes$BusinessParking)] <- "{'garage': False, 'street': False, 'validated': False, 'lot': False, 'valet': False}" 
BusinessParking <- business_attributes$BusinessParking
for (i in 1:length(BusinessParking)){
  BusinessParking[i] <- gsub('False',"\"FASLE\"",BusinessParking[i])
  BusinessParking[i] <- gsub('True',"\"TRUE\"",BusinessParking[i])
  BusinessParking[i] <- gsub('\'',"\"",BusinessParking[i])
  BusinessParking[i] <- gsub('None',"{}",BusinessParking[i])
}

BusinessParking <- as.data.frame(cbind(ID=business_attributes$ID,BusinessParking=BusinessParking))
BusinessParking <- paste("[", paste(BusinessParking$BusinessParking, collapse = ","), "]") %>% fromJSON(flatten = T)
View(head(BusinessParking,20))
trim_space <- function(X){
  trimws(X,"left")
}
BusinessParking <- lapply(BusinessParking, trim_space)  
BusinessParking <- BusinessParking %>% as.data.frame()
unique(BusinessParking)
write.csv(BusinessParking,file = 'C:/Users/Student/Desktop/attributes/BusinessParking.csv',col.names = F,row.names = T)
############################################################################

unique(business_attributes$GoodForMeal)
business_attributes$GoodForMeal[is.na(business_attributes$GoodForMeal)] <- "{'dessert': False, 'latenight': False, 'lunch': False, 'dinner': False, 'brunch': False, 'breakfast': Fales}"
GoodForMeal <- business_attributes$GoodForMeal
View(head(GoodForMeal))
unique(GoodForMeal)
for (i in 1:length(GoodForMeal)){
  GoodForMeal[i] <- gsub('False',"\"FASLE\"",GoodForMeal[i])
  GoodForMeal[i] <- gsub('Fales',"\"FASLE\"",GoodForMeal[i])
  GoodForMeal[i] <- gsub('True',"\"TRUE\"",GoodForMeal[i])
  GoodForMeal[i] <- gsub('\'',"\"",GoodForMeal[i])
  GoodForMeal[i] <- gsub('None',"{}",GoodForMeal[i])
}

GoodForMeal <- as.data.frame(cbind(ID=business_attributes$ID,GoodForMeal=GoodForMeal))
GoodForMeal <- paste("[", paste(GoodForMeal$GoodForMeal, collapse = ","), "]") %>% fromJSON(flatten = T)
GoodForMeal <- GoodForMeal %>% as.data.frame()
write.csv(GoodForMeal,file = 'C:/Users/Student/Desktop/attributes/GoodForMeal.csv',col.names = F,row.names = T)

##############################################################################
