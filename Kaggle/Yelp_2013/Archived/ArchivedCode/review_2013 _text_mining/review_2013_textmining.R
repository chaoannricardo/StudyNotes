library(jsonlite)
library(tm)
library(SnowballC)
library(wordcloud)
library(dplyr)
#讀資料、切割、合併
review_2013 <- stream_in(file("F:\\project\\yelp_2013\\yelp_training_set_review.json"))
data.i <- as.data.frame(review_2013[,6])
data.t <- as.data.frame(review_2013[,8])
data_text <- cbind(data.t, data.i)
colnames(data_text) <- c("business_id","text")

#讀入business_id資料
business <- read.csv("F:\\project\\yelp_2013\\cat_business.csv", header = TRUE)
business_id <- business$business_id

data <- data_text[which(data_text$business_id %in% business_id),]


#tf-idf
output <- NULL

#轉成Corpus格式
review_corpus <-  Corpus(VectorSource(data$text))
#清除標點符號、數字,轉換成小寫英文
review_corpus <-  tm_map(review_corpus, removePunctuation)
review_corpus <-  tm_map(review_corpus, removeNumbers)
review_corpus <-  tm_map(review_corpus, content_transformer(tolower))
#清除stopwords
review_corpus <-  tm_map(review_corpus, removeWords, c("the", "and", stopwords("english")))
#review_corpus <-  tm_map(review_corpus,stemDocument)
#清除\n
review_corpus <- tm_map(review_corpus, function(word) {
  gsub("\n", "", word)
})

inspect(review_corpus)
#生成文檔DTM矩陣
review_dtm <- DocumentTermMatrix(review_corpus)
#去掉出現頻率太低的詞
review_dtm <-  removeSparseTerms(review_dtm, 0.99)
findFreqTerms(review_dtm, 1000)
freq <-  data.frame(sort(colSums(as.matrix(review_dtm)), decreasing=TRUE))
#wordcloud(rownames(freq), freq[,1], max.words=50, colors=brewer.pal(1, "Dark2"))

#使用tf_idf作為詞頻權重
review_dtm_tfidf <- DocumentTermMatrix(review_corpus, control = list(weighting = weightTfIdf))
#去掉tf_idf太低的詞
review_dtm_tfidf <-  removeSparseTerms(review_dtm_tfidf, 0.95)
freq2 <-  data.frame(sort(colSums(as.matrix(review_dtm_tfidf)), decreasing=TRUE))
#wordcloud(rownames(freq2), freq[,1], max.words=100, colors=brewer.pal(1, "Dark2"))
freq2 <- cbind(rownames(freq2),freq2)
colnames(freq2) <- c("word","freqency")

#把tf-idf資料寫入dataframe
word <- as.character(freq2$word)
frequency <- freq2$freqency
df <- data.frame(word,
                 frequency,
                 stringsAsFactors=FALSE)
output <- rbind(output,df)

write.csv(output,"tf_idf_review_2013.csv",row.names = FALSE)




data_order <- data_order[3:length(data_order$business_id),]

for( i in 1:1000){
  if(duplicated(data_order$business_id)[i] == FALSE){
    for(n in 1:i){
      data <- subset(data_order,business_id == data_order$business_id[n] ,text)
    }
    #轉成Corpus格式
    review_corpus <-  Corpus(VectorSource(data$text))
    #清除標點符號、數字,轉換成小寫英文
    review_corpus <-  tm_map(review_corpus, removePunctuation)
    review_corpus <-  tm_map(review_corpus, removeNumbers)
    review_corpus <-  tm_map(review_corpus, content_transformer(tolower))
    #清除stopwords
    review_corpus <-  tm_map(review_corpus, removeWords, c("the", "and", stopwords("english")))
    #review_corpus <-  tm_map(review_corpus,stemDocument)
    #清除\n
    review_corpus <- tm_map(review_corpus, function(word) {
      gsub("\n", "", word)
    })
    
    inspect(review_corpus)
    review_dtm <- DocumentTermMatrix(review_corpus)
    review_dtm <-  removeSparseTerms(review_dtm, 0.99)
    #findFreqTerms(review_dtm, 1000)
    freq <-  data.frame(sort(colSums(as.matrix(review_dtm)), decreasing=TRUE))
    #wordcloud(rownames(freq), freq[,1], max.words=50, colors=brewer.pal(1, "Dark2"))
    
    review_dtm_tfidf <- DocumentTermMatrix(review_corpus, control = list(weighting = weightTfIdf))
    review_dtm_tfidf <-  removeSparseTerms(review_dtm_tfidf, 0.95)
    freq2 <-  data.frame(sort(colSums(as.matrix(review_dtm_tfidf)), decreasing=TRUE))
    #wordcloud(rownames(freq2), freq[,1], max.words=100, colors=brewer.pal(1, "Dark2"))
    freq2 <- cbind(rownames(freq2),freq2)
    colnames(freq2) <- c("word","freqency")
    #把tf-idf資料寫入dataframe
    for( k in 1:5){
      business_id <- as.character(data_order$business_id[n])
      word <- as.character(freq2$word[k])
      frequency <- freq2$freqency[k]
      df <- data.frame(business_id,
                       word,
                       frequency,
                       stringsAsFactors=FALSE)
      output <- rbind(output,df)
    }
  }
}


output <- unique(output)
write.csv(output,"tf_idf_output3.csv",row.names = FALSE)


