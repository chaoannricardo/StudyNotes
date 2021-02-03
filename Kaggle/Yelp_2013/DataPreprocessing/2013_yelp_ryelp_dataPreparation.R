# 2013 Data Preparing


# ===============================
# ==== Test Data Merge ==========
business_category <- read.csv("C:/Users/Student/Google_Drive/BDSE10_Project/CleanDataSets/yelp-recsys-2013/Test_business_category.csv")
business_normalized <- read.csv("C:/Users/Student/Google_Drive/BDSE10_Project/CleanDataSets/yelp-recsys-2013/Test_business_normalized.csv")
checkin <- read.csv("C:/Users/Student/Google_Drive/BDSE10_Project/CleanDataSets/yelp-recsys-2013/Test_checkin_clean_count.csv")
review <- read.csv("C:/Users/Student/Google_Drive/BDSE10_Project/CleanDataSets/yelp-recsys-2013/Test_review_clean.csv")
user <- read.csv("C:\\Users\\Student\\Google_Drive\\BDSE10_Project\\CleanDataSets\\yelp-recsys-2013\\Test_user_clean.csv")

View(business_category)
View(business_normalized)
View(checkin)
View(review)
View(user)

?merge

review_user <- merge(x = review, y = user, by.x = "user_id", all.x = TRUE)



user_review_checkin <- merge(x = user_review, y = checkin, by.x = "business_id", all.x = TRUE)
  
  
  
View(user_review)
