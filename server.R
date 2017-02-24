suppressMessages(library(shiny))

shinyServer(function(input, output) {
        # Wait for the user to finish his/her input
        Sys.sleep(0.1)
        
        # Display 'clean' version of user text
        cleanText <- reactive({
                prepareText(input$impText, 3)
        })
        output$clnText <- renderText({
                paste("...", cleanText())
        })
        
        # Get predicted word
        nextWord <- reactive({
                predictWord(cleanText())
        })
        output$nxtWord <- renderText({
                 nextWord()
        })
        
})
