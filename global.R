# Load libraries
suppressMessages(library(tm))
suppressMessages(library(stringr))

# Auxiliary functions
truncateText <- function(text, wordCount = 3) {
        truncText <- paste(tail(unlist(strsplit(text, " ")),
                                wordCount),
                           collapse = " ")
        return(truncText)
}

ConvertTo <- function(text, pattern1, pattern2)
        gsub(pattern1, pattern2, text)

removePattern <- function(text, pattern)
        ConvertTo(text, pattern, "")

# Load n-gram frequency tables
load("data/unigramFreq.RData")
load("data/bigramFreq.RData")
load("data/trigramFreq.RData")
load("data/fourgramFreq.RData")

source('functions/prepareText.R')
source('functions/predictWord.R')
