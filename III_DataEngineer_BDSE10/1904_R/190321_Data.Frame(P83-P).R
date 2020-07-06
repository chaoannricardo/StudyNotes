#data.frame
worker <- c("Ricardo Chao", "Emily Wang", "Danny Len")
position <- c("Director", "Executive", "Staff")
Rcompany <- data.frame(worker, position, stringsAsFactors = FALSE)
View(Rcompany) #view in console
str(Rcompany) #structure
nrow(Rcompany) #number of row
ncol(Rcompany) #number of columns
dim(Rcompany) #dimension
head(Rcompany)
tail(Rcompany)

#Diamonds
View(diamonds_csv) #view in console
str(diamonds_csv) #structure
nrow(diamonds_csv) #number of row
ncol(diamonds_csv) #number of columns
dim(diamonds_csv) #dimension
head(diamonds_csv)
tail(diamonds_csv)

#data.frame manipulation
player_name <- c("Ricardo", "Tom", "Evan", "Tim", "Danny")
jersey <- c(13, 34, 41, 21, 34)
has_ring <- c(FALSE, TRUE, TRUE, TRUE, TRUE)
df <- data.frame(
  name = player_name,
  jersey = jersey,
  hasRing = has_ring,
  stringAsFactors = FALSE
)
str(df)
#output csv
write.csv(df, file = "C:/Users/richi/Desktop/dataFrameTest.csv", row.names = FALSE)
#output JSON
jsonstr <- toJSON(df)
writeLines(jsonstr, con = "C:/Users/richi/Desktop/dataFrameTest.json")

install.packages("jsonlite")
install.packages('curl')
library(jsonlite)
aqi <- fromJSON("https://opendata.epa.gov.tw/ws/Data/AQI/?$format=json")
class(aqi)
View(aqi)

#select columns
aqi$County
aqi[ , "County"] #difficult
aqi[3, "SiteName"] #aqi[m,n]
aqi[, 2]

#select rows
head(aqi)
aqi[3,]
aqi[aqi$County == "臺南市", c("SiteName", "Longitude", "Latitude")]

#mutate
aqi$PublishTime <- as.POSIXct("2019-03-21 14:00:00")
View(aqi)
aqi$PublishTime <- NULL
aqi$PM2.5 <- as.numeric(aqi$PM2.5)

#summarize
summary(aqi)
summary(aqi$PM2.5)
str(aqi)
nrow(aqi)
max(aqi$PM2.5, na.rm = TRUE) #remove na value
min(aqi$PM2.5, na.rm = TRUE) #remove na value

counties <- unique(aqi$County)
counties
substr(counties, start = 1, stop = 2)
grep("臺", counties) #[1]  3  6 14 18
grepl("臺", counties)  #[1] FALSE FALSE  TRUE FALSE FALSE  TRUE FALSE FALSE FALSE FALSE FALSE FALSE FALSE  TRUE FALSE FALSE
counties[grep("臺", counties)]
counties[grepl("臺", counties)]
sub(pattern = "臺", counties, replacement = "台") #first character of each value
gsub(pattern = "臺", counties, replacement = "台") #all characters
district_level <- substr(counties, start = 3, stop = 3)
district_name <- substr(counties, start = 1, stop = 2)
paste(district_name, district_level) #with default blank
paste0(district_name, district_level) #without default blank

















