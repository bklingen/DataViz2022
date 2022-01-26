library(shiny)
library(shinydashboard)

dashboardPage(
    
    dashboardHeader(title="Industry Codes"),
    
    dashboardSidebar(
        
        selectInput("Division",
                    "Select a Division",
                    choices=c("All Divisions" = "all",
                              "Natural Sciences" = "Natural Sciences",
                              "Social Sciences" = "Social Sciences",
                              "Humanities" = "Humanities",
                              "Interdisciplinary" = "Interdisciplinary"))
    ),
    
    dashboardBody(
        valueBoxOutput("nCodes")
    )
    
)