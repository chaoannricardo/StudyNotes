#install.packages("rvest")
library(rvest)
html_doc <- read_html("https://www.ptt.cc/bbs/Gossiping/index.html")
class(html_doc)
