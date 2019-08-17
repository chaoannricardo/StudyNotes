library(rvest)
library(magrittr)

get_stock_df <- function(page_url) {
  html_doc <- read_html(page_url, encoding = "big5")
  tickers_companies <- html_doc %>% 
    html_nodes(".name a") %>% 
    html_text() %>% 
    strsplit(split = " ")
  tickers <- c()
  companies <- c()
  for (i in 1:length(tickers_companies)) {
    tickers <- c(tickers, tickers_companies[[i]][1])
    companies <- c(companies, tickers_companies[[i]][2])
  }
  prices <- html_doc %>% 
    html_nodes(".name+ td") %>% 
    html_text() %>% 
    as.numeric()
  volumes <- html_doc %>% 
    html_nodes("td:nth-child(9)") %>% 
    html_text() %>% 
    gsub(pattern = ",", replacement = "") %>% 
    as.integer()
  mkt_values <- html_doc %>% 
    html_nodes("td:nth-child(10)") %>% 
    html_text() %>% 
    as.numeric() %>% 
    `*`(100000000)
  stock_df <- data.frame(
    ticker = tickers,
    company = companies,
    price = prices,
    volume = volumes,
    mkt_value = mkt_values,
    stringsAsFactors = FALSE
  )
  return(stock_df)
}

tse_url <- "https://tw.stock.yahoo.com/d/i/rank.php?t=pri&e=tse&n=100"
otc_url <- "https://tw.stock.yahoo.com/d/i/rank.php?t=pri&e=otc&n=100"
tse_df <- get_stock_df(tse_url)
otc_df <- get_stock_df(otc_url)
tse_df$type <- "¤W¥«"
otc_df$type <- "¤WÂd"
stock_df <- rbind(tse_df, otc_df)
head(stock_df)
tail(stock_df)
write.csv(stock_df, file = "stock.csv", row.names = FALSE)

endgame_rating <- "https://www.imdb.com/title/tt4154796" %>% 
  read_html() %>% 
  html_nodes(xpath = "//strong/span") %>% 
  html_text() %>% 
  as.numeric()
endgame_rating





