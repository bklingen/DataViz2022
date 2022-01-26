library(shiny)
library(shinydashboard)
library(readr)
library(dplyr)

shinyServer(function(input, output, session) {
    
    df <- reactiveFileReader(
        intervalMillis = 20000,
        session = session,
        filePath = 'https://raw.githubusercontent.com/bklingen/DataViz2022/main/Data/NCAlumn.csv',
        readFunc = read_csv
    )
    
    output$nCodes <- renderValueBox({
        
        if(input$Division=="all") {
            uniqueCats <- df() %>% select(Industry) %>%
                distinct() %>%
                count()
        } else {
            uniqueCats <- df() %>% select(DIVISION_1, Industry) %>%
                filter(DIVISION_1 == input$Division) %>%
                select(Industry) %>%
                distinct() %>%
                count()
        }
        
        valueBox(
            value = uniqueCats,
            subtitle = paste("Number of Industry Codes in ", 
                             ifelse(input$Division=="all", 
                                    "all Divisions", 
                                    input$Division))
        )
    })
    
})