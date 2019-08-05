#Install Packages
library(curl)
library(jsonlite)

install.packages('listviewer')
library(listviewer)

#Basic JSON
post <- list(Like = list( list(name = "lee", times = "2017/11/20"),
                          list(name = "yen", times = "2017/12/1")),
             Comment = list(list(name = "wang", times = "2017/12/3", msg = "good")),
             message = "YA! 100 Dollars")
jsonedit(post)

jpost <- toJSON(post, auto_unbox = T)
jsonedit(jpost)

lpost <- fromJSON('{"Like":[{"name":"lee","times":"2017/11/20"},{"name":"yes","times":"2017/12/1"}],"Comment":[{"name":"wang","times":"2017/12/3","msg":"good"}],"message":"YA! 100 Dollars"}')
lpost <- fromJSON(jpost)
lpost

jsonedit(post)

#細懸浮微粒資料（PM2.5）

PM2.5 <-  fromJSON('https://opendata.epa.gov.tw/ws/Data/ATM00625/?$format=json')
PM2.5
jsonedit(PM2.5)


#觀測站基本資料
weather <-  fromJSON('http://opendata.epa.gov.tw/webapi/Data/ATM00698/?$skip=0&$top=1000&format=json')
weather
str(weather, max.level = 1)
jsonedit(weather)

#PTT 爬蟲
library(rvest)

ptt_get <- read_html('https://www.ptt.cc/bbs/hotboards.html')

result <- html_text(ptt_get)
print(result)
result %>% cat() #cat(result)
substr(result, 1, 1000) %>% cat()

#利用X-PATH爬蟲
ptt_nodes <- html_nodes(ptt_get, xpath = "//*[@class='board-name']")
name <- html_text(ptt_nodes)

ptt_nodes <- html_nodes(ptt_get, xpath = "//*[@class='board-nuser']")
nuser <- html_text(ptt_nodes)

ptt_nodes <- html_nodes(ptt_get, xpath = "//*[@class='board-class']")
pclass <- html_text(ptt_nodes)

ptt_nodes <- html_nodes(ptt_get, xpath = "//*[@class='board-title']")
title <- html_text(ptt_nodes)
title <- gsub("◎","",title)

data <- data.frame(Name=name, NUser=nuser, PClass=pclass, Title=title)
View(data)

#中時電子報爬蟲
library(stringr)

#Title
china_times_get <- read_html('http://www.chinatimes.com/realtimenews')
china_times_nodes <- html_nodes(china_times_get, 
                                xpath = "//*[@class='col']/h3")
news_title <- html_text(china_times_nodes)

#Link
china_times_get <- read_html('http://www.chinatimes.com/realtimenews')
china_times_nodes <- html_nodes(china_times_get, 
                                xpath = "//*[@class='col']/h3/a")

news_addrs <- str_c("http://www.chinatimes.com",
                    html_attr(china_times_nodes,'href'))

data <- data.frame(Title=news_title, URL=news_addrs)

#News Content
china_times_get <- read_html(news_addrs[1])
china_times_nodes <- html_nodes(china_times_get, 
                                xpath = "//*[@class='article-body']/p")
news_content <- html_text(china_times_nodes, trim = T)
news_content <- paste(news_content, collapse = '')

#Date - Time
china_times_get <- read_html('http://www.chinatimes.com/realtimenews')
china_times_nodes <- html_nodes(china_times_get, 
                                xpath = "//*[@class='meta-info']/time")
news_time <- html_text(china_times_nodes, trim = T)

#Category
china_times_get <- read_html('http://www.chinatimes.com/realtimenews')
china_times_nodes <- html_nodes(china_times_get, 
                                xpath = "//*[@class='category']/a")
news_category <- html_text(china_times_nodes, trim = T)

data <-  data.frame(Title=news_title, DateTime=news_time, Category=news_category)
View(data)

#Multiple Pages
news_title <- c()
news_addrs <- c()
news_content <- c()
news_time <- c()
news_category <- c()

for(i in 1:10) {
  print(i)
  
  china_times_get <- read_html(
    str_c("http://www.chinatimes.com/realtimenews?page=",i))
  china_times_nodes <- html_nodes(china_times_get, 
                                  xpath = "//*[@class='col']/h3/a")
  news_title <- c(news_title, html_text(china_times_nodes, trim = T))
  
  library(stringr)
  current_addr <- str_c("http://www.chinatimes.com",
                        html_attr(china_times_nodes,'href'))
  
  china_times_nodes <- html_nodes(china_times_get, 
                                  xpath = "//*[@class='meta-info']/time")
  news_time <- c(news_time, html_text(china_times_nodes, trim = T))
  
  china_times_nodes <- html_nodes(china_times_get, 
                                  xpath = "//*[@class='category']/a")
  news_category <- c(news_category, html_text(china_times_nodes, trim = T))
  
  for(j in 1:length(current_addr)){
    china_times_get <- read_html(current_addr[j])
    china_times_nodes <- html_nodes(china_times_get, 
                                    xpath = "//*[@class='article-body']/p")
    t_content <- html_text(china_times_nodes, trim = T)
    t_content <- paste(t_content, collapse = '')
    news_content <- c(news_content,t_content)
  }
  
  news_addrs <- c(news_addrs, current_addr)
  
  Sys.sleep(3)
}

data <- data.frame(Title=news_title, Data_Time=news_time,
                   Category=news_category, URL=news_addrs, Content=news_content)

View(data)



















