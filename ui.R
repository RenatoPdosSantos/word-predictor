suppressMessages(library(shiny))

shinyUI(pageWithSidebar(
        headerPanel("Data Science Capstone Project - Word Predictor"),
        sidebarPanel(
                h3("User Input"),
                br(),
                
                strong(""),
                textInput("impText", "Type in the first few words of a sentence below:", value = "(Ex.) 2 b or not 2")
                
        ),
        mainPanel(tabsetPanel(
                tabPanel(
                        "Predictions",
                        
                        h4('The text as interpreted by the application:'),
                        verbatimTextOutput("clnText"),
                        
                        h4('The word predicted based on the phrase provided:'),
                        verbatimTextOutput("nxtWord")
                        
                ),
                
                tabPanel(
                    "Documentation",
                    h4("Introduction"),
                    p(
                        "As people around the world are spending an increasing amount of time on their mobile
                        and accessibility devices, predictive text becomes a most-needed input technology.
                        However, old systems, such as T9 and WordWise, sometimes produced hilarious 'damn you autocorrect' 
                        results."
                    ),
                    p(
                        "This more advanced, probabilistic-language-modeling-based approach 'knows' how certain
                        words tend to be combined together in our language and tends to exhibit a far greater accuracy."
                    ),
                    p(
                        "It was developed within a partnership of Johns Hopkins with ",
                        a("SwiftKey", href = "http://swiftkey.com", target = "_blank"),
                        ", the leading company on predictive text input for Android and iOS keyboards."
                    ),
                    br(),
                    h4("Highlights"),
                    p(
                        "Speed: The probabilities were all previously computed and are loaded prior to execution. 
                        The app looks down the word tables to instantly recover the most probable next word."
                    ),
                    p(
                        "Versatility: The algorithm is handles many contractions used in Internet language: e.g. 
                        '2 b or not 2' will be translated as 'to be or not to' and 'be' will be suggested as the next word."
                    ),
                    p(
                        "Safety: Profanities and bleeped words (e.g. 'f***' and 'f#@%') are removed from user input 
                        as were also previously removed from the tables."
                    ),
                    p(
                        "Naturalness: Stopwords, on the other hand, were left in, as they are present in normal language 
                        and could be the expected next input from a user."
                    ),
                    br(),
                    h4("App Interface"),
                    p(
                        "It is simple and intuitive to use."
                    ),
                    p(
                        "The User Input panel on the left contains a text box to enter the phrase.
                        Just type in the first few words of a sentence.
                        It is analysed on the fly while text is being digited."
                    ),
                    p(
                        "On the right, the app returns the last three words of the phrase as interpreted by algorithm
                        and the word predicted based on the phrase provided." 
                    ),
                    br(),
                    
                    h4("App Functionality"),
                    p(
                        "The first task is to filter the user input to remove profanity, contractions, punctuation,
                        numbers, foreign characters, and any extra white space. This is same text cleaning process
                        used on the initial SwiftKey data."
                    ),
                    p(
                        "It is based on the widely used 4-gram language model and on the ",
                        a(
                            "'Stupid Backoff' approach",
                            href = "http://citeseerx.ist.psu.edu/viewdoc/summary?doi=10.1.1.324.3653",
                            target = "_blank"
                        ),
                        ". More details can be found ",
                        a("here", href = "http://github.com/RenatoPdosSantos/WordPredictor", target = "_blank"),
                        "."
                    ),
                    p(
                        "Step 1: If the user enters e.g. 'to be or not to', it is chopped to the last 3 words ('or not to')."
                    ),
                    p(
                        "Step 2: A search is done for a match to the chopped input."
                    ),
                    p(
                        "Step 3: If a match is found, the algorith skips to Step 4. Otherwise, the user input is 
                        shortened again ('not to', etc.), and the algorithm go back to Step 2."
                    ),
                    p(
                        "Step 4: If a match was found, it is returned to the user interface. Otherwise, the most 
                        frequent word in the corpora is returned."
                    ),
                    br(),
                    h4("Source Code"),
                    p(
                        "All source code and files used to build and run this app can be found on this ",
                        a("git",
                          href = "http://github.com/RenatoPdosSantos/WordPredictor",
                          target = "_blank"),
                        "."
                    )
                    
                )
        ))
))
