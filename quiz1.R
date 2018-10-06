# set the environment
setwd("W:/Coursera/Capstone Project/Capstone-Project/Coursera-SwiftKey/final/en_US")

# The en_US.twitter.txt|en_US.twitter.txt has how many lines of text?

twitterfile <- readLines(con <- file("./en_US.twitter.txt"),encoding = "UTF-8",skipNul = TRUE)
close(con)

length(twitterfile)

# What is the length of the longest line seen in any of the three en_US data sets?

filename <- "en_US.blogs.txt"
con <- file(filename, open = "r")
blogs <- readLines(con)
lengthblog <- length(blogs)
close(con)


filename <- "en_US.news.txt"
con <- file(filename,open = "r")
news <- readLines(con)
lengthnews <- length(news)
close(con)


filename <- "en_US.twitter.txt"
con <- file(filename,open = "r")
twitter <- readLines(con)
lengthtwitter <- length(twitter)
close(con)

# require package stringi

install.packages("stringi")
library(stringi)

longestblog <- stri_length(blogs)
max(longestblog)

longesttwitter <- stri_length(twitter)
max(longesttwitter)

longestnews <- stri_length(news)
max(longestnews)

# In the en_US twitter data set, if you divide the number of lines where the word "love" (all lowercase) 
# occurs by the number of lines the word "hate" (all lowercase) occurs, about what do you get?

# count of lines with “love” (lowercase)

lovelines <- grep("love", twitter)
love <- length(lovelines)

hatelines <- grep("hate",twitter)
hate <- length(hatelines)

# divide
love/hate

# The one tweet in the en_US twitter data set that matches the word "biostats" says what?

biostats <- grep("biostats",twitter)
twitter[biostats]

# How many tweets have the exact characters "A computer once beat me at chess, but it was no match for me 
# at kickboxing". (I.e. the line matches those characters exactly.)

characterTwitter<-grep("A computer once beat me at chess, but it was no match for me at kickboxing",
                      twitter)
length(characterTwitter)

