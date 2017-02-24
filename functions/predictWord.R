predictWord <- function(text) {
    if (nchar(text) == 0)
        return("")
    
    wordCount <- function(text)
        length(strsplit(text, ' ')[[1]])
    predWord <- ""
    
    if (wordCount(text) >= 3) {
        sentence <- truncateText(text, 3)
        predWord <-
            fourgramFreqDF$w[fourgramFreqDF$s == sentence]
    }
    if (length(predWord) > 0)
        if (nchar(predWord) > 0)
            return(predWord)
    
    if (wordCount(text) >= 2) {
        sentence <- truncateText(text, 2)
        predWord <-
            trigramFreqDF$w[trigramFreqDF$s == sentence]
    }
    if (length(predWord) > 0)
        if (nchar(predWord) > 0)
            return(predWord)
    
    if (wordCount(text) >= 1) {
        sentence <- truncateText(text, 1)
        predWord <-
            bigramFreqDF$w[bigramFreqDF$s == sentence]
    }
    if (length(predWord) > 0)
        if (nchar(predWord) > 0)
            return(predWord)
    
    predWord <- unigramFreqDF$w
    return(predWord)
}
