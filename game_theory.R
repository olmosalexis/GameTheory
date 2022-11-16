library(shiny)
library(shinythemes)

# Define UI
ui <- fluidPage (
  theme = shinytheme("slate"),
  
  tabsetPanel(
    id = "tabs",
    
    tabPanel(
      title = "Home",
      value = "home",
      paste("Welcome to our game theory app. This app allows you to not only learn about different games.")
    ),
    
    tabPanel(
      title = "Play a Game!",
      value = "play_game",
    ), 
    
    tabPanel(
      title = "Catalog",
      value = "catalog",
    ),
    
    tabPanel(
      title = "Design Process",
      value = "process",
    )
    
  ),
  
)

# Define server logic --
server <- function(input, output, session) {

}

# Run the app
shinyApp(ui = ui, server = server)