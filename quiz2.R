# Introduction

#  The motivation for this project is to:
# 1. Demonstrate that you've downloaded the data and have successfully loaded it in.
# 2. Create a basic report of summary statistics about the data sets.
# 3. Report any interesting findings that you amassed so far.
# 4. Get feedback on your plans for creating a prediction algorithm and Shiny app.

# Review Criteria

# 1. Does the link lead to an HTML page describing the exploratory analysis of the training data set?

# Data Processing
# set the working directory
setwd("W:/Coursera/Capstone Project/Capstone-Project/Coursera-SwiftKey/final/en_US")

# I am using only the english sets.

# Read the files
blogfile <- readLines("en_US.blogs.txt",skipNul = TRUE,encoding = "UTF-8")
twitterfile <- readLines("en_US.twitter.txt",skipNul = TRUE,encoding = "UTF-8")
newsfile <- readLines("en_US.news.txt",skipNul = TRUE,encoding = "UTF-8")


#con <- file("en_US.news.txt",open="rb")
#news <- readLines(con, encoding="UTF-8")
#close(con) 
#head(newsfile,2)


# 2. Has the data scientist done basic summaries of the three files? Word counts, line counts and basic data tables?

# File Size
FileSize <- sapply(list(blogs, news, twitter), function(x){format(object.size(x),"MB")})

# Line Counts
length(blogfile)
length(twitterfile)
length(newsfile)

# Total Characters
TotalChar <- sapply(list(blogfile,twitterfile,newsfile), function(x){sum(nchar(x))})
TotalChar

# 3. Has the data scientist made basic plots, such as histograms to illustrate features of the data?
# 4. Was the report written in a brief, concise style, in a way that a non-data scientist manager could appreciate?

# Data Cleaning
# As the data is too big so we take a subset of data to analyse.

set.seed(1436)
sampleSize <- 0.01

blogsIndex <- sample(seq_len(length(blogs)),length(blogs)*sampleSize)
newsIndex <- sample(seq_len(length(news)),length(news)*sampleSize)
twitterIndex <- sample(seq_len(length(twitter)),length(twitter)*sampleSize)

blogsSubset <- blogs[blogsIndex[]]
newsSubset <- news[newsIndex[]]
twitterSubset <- twitter[twitterIndex[]]

library(tm)

# Create the corpus
corpus <- Corpus(VectorSource(sapply(corpus, function(row) iconv(row, "latin1", "ASCII", sub="")))) # Remove non-ASCII

corpus <- tm_map(corpus, removePunctuation) # Remove punctuation
corpus <- tm_map(corpus, stripWhitespace) # Remove unneccesary white spaces
corpus <- tm_map(corpus, content_transformer(tolower)) # Convert to lowercase
corpus <- tm_map(corpus, removeNumbers) # Remove numbers
corpus <- tm_map(corpus, PlainTextDocument) # Plain text

# Top 10 Unigrams
library(RWeka)

unigramToken <- function(x) NGramTokenizer(x, Weka_control(min = 1, max = 1))

bigramToken <- function(x) NGramTokenizer(x, Weka_control(min = 2, max = 2))

trigramToken <- function(x) NGramTokenizer(x, Weka_control(min = 3, max = 3)) 


unigram <- TermDocumentMatrix(samplecorp, control = list(tokenize = unigramToken))

bigram <- TermDocumentMatrix(samplecorp, control = list(tokenize = bigramToken))

trigram <- TermDocumentMatrix(samplecorp, control = list(tokenize = trigramToken))

# frequencies of n-grams



