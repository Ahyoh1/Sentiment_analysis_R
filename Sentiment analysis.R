library (tm)
library(wordcloud)
library(syuzhet)

library(dplyr)
tr <- read.csv ("tourist_accommodation_reviews.csv")

t_ <-  filter (tr, Location == "Kathu")

  
t_
#,Location=="Cape Panwa", Location=="Choeng Thale"

reviews <- read.csv("text mining.csv")
rev <- reviews$Reviews
re <- read.csv("text mining.csv", header = FALSE, nrows=1)
re_ <- re$V5

getTermMatrix <-(function(corpus) {
  
  corpus <- rev
  corpus <- Corpus(VectorSource(corpus))
  corpus <- tm_map(corpus, tolower)
  corpus <- tm_map(corpus, removePunctuation)
  corpus <- tm_map(corpus, removeNumbers)
  corpus <- tm_map(corpus, stripWhitespace)
  corpus <- tm_map(corpus, removeWords, c(stopwords("SMART"),"restaurant", 
                                          "phuket"))
  reviews_final <- corpus
  tdm <- TermDocumentMatrix(reviews_final,
                            control = list(minWordLength = 1))
  tdm <- as.matrix(tdm)
  w <- sort(rowSums(tdm), decreasing = T)
})

sentiment_data <- iconv(rev)
s <- get_nrc_sentiment(sentiment_data)
s[1:10,]
