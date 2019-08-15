
# WebAPI ===================================================================
# pkgs <- c("jsonlite", "rvest", "httr", "magrittr")
# install.packages(pkgs)

library("jsonlite")
library("rvest")
library("httr")
library("magrittr")

today_scoreboard <- fromJSON("http://data.nba.net/prod/v1/20190514/scoreboard.json")
names(today_scoreboard)
names(today_scoreboard$games)
today_scoreboard$games$hTeam$score
today_scoreboard$games$vTeam$score


TodayAQI <- fromJSON("https://opendata.epa.gov.tw/ws/Data/AQI/?$format=json")
View(TodayAQI)
nrow(TodayAQI)


# WebAPI ===================================================================



