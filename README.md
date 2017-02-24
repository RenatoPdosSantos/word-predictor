# Word Predictor

A Word Prediction Algorithm based on Stupid Backoff N-gram Model built within the partnership of Johns Hopkins with SwiftKey, the leading company on predictive text input for Android and iOS keyboards, to fulfil the Johns Hopkins Data Science Specialization Capstone Project requirements.

This README describes the algorithm and all files used to build and run this app.


# Introduction

As people around the world are spending more and more time on their mobile devices for email, social networking, banking, and many other activities, any device that makes it easier for people to type is welcome. But typing on mobile devices can be an acute pain, and old systems, such as T9 and WordWise, sometimes produced hilarious "damn you autocorrect" results.

[SwiftKey](http://swiftkey.com), the partner in this capstone, among other things, is a world leader in predictive text analytics. Their custom keyboard app on Android and the SwiftKey Note app on iOS are well-known. SwiftKey has been even integrating their predictive text technology into [Professor Stephen Hawking's](http://swiftkey.com/en/giving-back/#hawking) existing system to improve his ability to communicate. 

The goal of this Capstone Project involves developing a predictive text application that is capable of inferring meaning and intent from text the user types to predict his next word, very similar to Swiftkey's technology implemented in our present smartphone keyboards. 

This more advanced, probabilistic-language-modeling-based approach 'knows' how certain words tend to be combined together in our language and tends to exhibit a far greater accuracy.

The application comprises of two parts: 

- a prediction model algorithm, based on a predictive model of text starting with a vast, unstructured database of the English language, and 
- a Shiny app UI that implements it.

In this capstone, Data Science will be applied to the area of Natural Language Processing (NLP). 

In this report, we will highlight the results of some exploratory data analysis and detail the next steps to complete the application.

This work was done with the resources of the R statistical data analysis language (R Core Team, 2016). All efforts were made to conform to the best practices of Reproducible Research (Peng, 2011, 2016a). 

The following R packages were used for the data cleaning and analysis:

- *tm*, for text mining,
- *knitr*, for report generation (including nice tables),
- *stringr*, for text manipulation, and
- *RWeka*, for machine learning algorithms for data mining

# Highlights
- **Speed**: The probabilities were all previously computed and are loaded before execution. The app looks down the word tables to instantly recover the most likely next word.

- **Versatility**: The algorithm handles many contractions used in Internet language: e.g. "I'll b there 2day"  will be translated as "i will be there today."

- **Safety**: Profanities and bleeped words (e.g. 'f***' and 'f#@%') are removed from user input as were also previously removed from the tables.

- **Naturalness**: Stopwords, on the other hand, were left in, as they are present in ordinary language and could be the expected next input from a user.

# Project Requirements
The goal of this project is to create a product to highlight the prediction algorithm built and to provide an interface that can be accessed by others. 

For this project it was developed:

1. A R program to create the 1-, 2-, 3-, and 4-gram probability tables .RData files, using the "Stupid Backoff" smoothing.
2. A Shiny app that takes as input a phrase (multiple words) in a text box input and outputs a prediction of the next word.
3. An R-Studio Presenter slide deck consisting of no more than 5 slides pitching the algorithm and app as if it were being presented to a boss or an investor.

This repository (see below) contains all the files necessary to satisfy the project requirements.

# Repository Files
- **createTables.Rmd**: this file contains the code that takes the raw data and creates the 1-, 2-, 3-, and 4-gram probability tables .RData files, using the "Stupid Backoff" smoothing
- **profanitywords.RData**: a list of profanity words to remove used by the **prepareText.R** code, based on the list of profanity words obtained from the [Shutterstock repo](http://github.com/shutterstock/List-of-Dirty-Naughty-Obscene-and-Otherwise-Bad-Words). 
- **unigramFreq.RData**, etc.: the four 1-, 2-, 3-, and 4-gram probability tables files created by the **createTables.Rmd** code
- **global.R**: loads the lookup tables to search for matches, as well as additional libraries and functions
- **prepareText.R**: this is the main function called both by **createTables.Rmd** to clean the raw data and by **server.R** to clean the user input for the application interface
- **predictWord.R**: this is the function that predicts the next word and returns it to the user interface
- **server.R**: code necessary to access user input, calls functions necessary to clean the input, predict the next word, and return it to the user interface 
- **ui.R**: code necessary for the application interface
	+ Input: Text box that accepts a phrase 
	+ Output: The phrase as interpreted by the algorithm, and the predicted word


# Shiny interface app 
For the user interface, it was created a Shiny app with a simple and intuitive front end interface for the user. The text input is tokenized, its last 3 or 2 (or 1 if it's a unigram) words isolated and cross-checked against the tables to get the highest probability next word, which is then displayed.

The working app is available [here](https://renatopdossantos.shinyapps.io/word_predictor/) and the slide deck is available [here](http://rpubs.com/RenatoPdosSantos/WordPredictor).

See companion Documentation.pdf file for more details.

# References
- Brants, T., Popat, A. C., Xu, P., Och, F. J., & Dean, J. (2007). Large Language Models in Machine Translation. In *Proceedings of the 2007 Joint Conference on Empirical Methods in Natural Language Processing and Computational Natural Language Learning*, Prague, June 2007 (pp. 858-867). Stroudsburg, PA: ACL - Association for Computational Linguistics.
- Markov, A. A. (1906). Rasprostranenie zakona bol'shih chisel na velichiny, zavisyaschie drug ot druga (The extension of the law of large numbers onto quantities depending on each other). *Izvestiya Fiziko-Matematicheskogo Obschestva Pri Kazanskom Universitete*, 2-Ya Seriya, 15, 135-156.
- Peng, R. D. (2011). *Reproducible Research in Computational Science*. Victoria, CA-BC: Leanpub.
- Peng, R. D. (2016a). *Report Writing for Data Science in R*. Victoria, CA-BC: Leanpub.
- Peng, R. D. (2016b). *Exploratory Data Analysis with R*. Victoria, CA-BC: Leanpub. 
- R Core Team (2016). *R: A language and environment for statistical computing*. R Foundation for Statistical Computing, Vienna, Austria. Available at R site: https://www.R-project.org/.
- Toman, M., Tesar, R., & Jezek, K. (2006). Influence of Word Normalization on Text Classification. In *I International Conference on Multidisciplinary Information Sciences and Technologies (InSciT2006)*, Merida, Spain, October 25-28th, 2006 (pp. 354-358). Mérida: University of Extremadura and the Open Institute of Knowledge.
