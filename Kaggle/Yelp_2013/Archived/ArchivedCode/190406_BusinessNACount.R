library(jsonlite)

business <- stream_in(file("C:/Users/richi/Google_Drive/BDSE10_Project/DataSets/yelp_dataset/business.json"))
View(head(business)) 
business_id <- business$business_id
business_name <- business$name
business_address <- business$address
business_city <- business$city
business_state <- business$state
business_postal <- business$postal_code
business_latitude <- business$latitude
business_longtitude <- business$longitude
business_stars <- business$stars
business_review <- business$review_count
business_open <- business$is_open
business_attributes <- business$attributes
business_categories <- business$categories
business_hours <- business$hours

#NA Value Count (FALSE=NA Value)
table(is.na(business_id) == FALSE)
table(is.na(business_name) == FALSE)
table(is.na(business_address) == FALSE)
table(is.na(business_city) == FALSE)
table(is.na(business_state) == FALSE)
table(is.na(business_postal) == FALSE)
table(is.na(business_latitude) == FALSE)
table(is.na(business_longtitude) == FALSE)
table(is.na(business_stars) == FALSE)
table(is.na(business_review) == FALSE)
table(is.na(business_open) == FALSE)
table(is.na(business_attributes) == FALSE)
table(is.na(business_categories) == FALSE)
table(is.na(business_hours) == FALSE)





