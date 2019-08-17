pkgs <- c("jsonlite", "rvest", "httr", "magrittr", "dplyr")
install.packages(pkgs)

library(jsonlite)
library(rvest)
library(magrittr) # %>%
library(dplyr)

today_scoreboard <- fromJSON("http://data.nba.net/prod/v1/20190514/scoreboard.json")
names(today_scoreboard)
today_scoreboard$games$hTeam$score
today_scoreboard$games$vTeam$score

aqi_data <- fromJSON("https://opendata.epa.gov.tw/ws/Data/AQI/?$format=json")
View(aqi_data)
# How many sites in Taiwan?
nrow(aqi_data)
# How many sites in Taipei City?
sum(aqi_data$County == "»O¥_¥«")
# Highest PM2.5 site name?
aqi_data$PM2.5 <- as.numeric(aqi_data$PM2.5)
max_pm25 <- max(aqi_data$PM2.5, na.rm = TRUE)
min_pm25 <- min(aqi_data$PM2.5, na.rm = TRUE)
aqi_data$SiteName[aqi_data$PM2.5 == max_pm25 & is.na(aqi_data$PM2.5) == FALSE]
# Lowest PM2.5 site name?
aqi_data$SiteName[aqi_data$PM2.5 == min_pm25 & is.na(aqi_data$PM2.5) == FALSE]

pchome_data <- fromJSON("https://ecshweb.pchome.com.tw/search/v3.3/all/results?q=macbook&page=1&sort=sale/dc")

# imdb.com
html_doc <- read_html("https://www.imdb.com/title/tt4154796/releaseinfo")
countries <- html_doc %>% 
  html_nodes(css = ".release-date-item__country-name a") %>% 
  html_text() %>% 
  gsub(pattern = "\n", replacement = "")
release_dates <- html_doc %>% 
  html_nodes(css = ".release-date-item__date") %>% 
  html_text()
df <- data.frame(country = countries, release_date = release_dates, stringsAsFactors = FALSE)
df %>% 
  group_by(release_date) %>% 
  count()
df$release_date[df$country == "Taiwan"]

html_doc <- read_html("https://www.imdb.com/title/tt4154796/")
poster_img_link <- html_doc %>% 
  html_nodes(".poster img") %>% 
  html_attr("src")
