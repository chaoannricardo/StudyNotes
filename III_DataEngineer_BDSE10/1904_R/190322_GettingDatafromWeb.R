#Getting Data from Web

##<Web API> jsonlite::from JSON
library(jsonlite)
nba_players <- fromJSON("https://data.nba.net/prod/v1/2018/players.json")
View(nba_players)
nba_players$league$standard
class(nba_players)

##HTML
install.packages("rvest")
library(rvest)
html_doc <- read_html("https://en.wikipedia.org/wiki/List_of_current_NBA_team_rosters")
class(html_doc)
html_doc
html_doc %>% 
  html_nodes(css = "td:nth-child(3) a") %>%
  html_text() #value inside text
  #html_attr("href") 

html_doc <- read_html("https://www.imdb.com/title/tt4154664/?ref_=nv_sr_1")
html_doc %>% 
  html_nodes(css = "#title-overview-widget img") %>%
  html_attr("src")


sum(1:10)
1:10 %>% sum()
#too many lines of codes
y <- 1:10
y_hat <- 11:20
err <- y_hat - y
se <- err^2
sum_se <- sum(se)
mse <- mean(sum_se)
rmse <- sqrt(mse)
rmse
#%>% operator: readdable and clean (Ctrl+Shift+M)
y <- 1:10
y_hat <- 11:20
rmse <- (y_hat - y) 
rmse %>% '^'(2) %>% sum() %>% mean() %>% sqrt()







