#
# This is a Shiny web application. You can run the application by clicking
# the 'Run App' button above.
#
# Find out more about building applications with Shiny here:
#
#    http://shiny.rstudio.com/
#

library(xtable)
library(shiny)
library(shinyWidgets)

# Define UI for application that draws a histogram
ui <- fluidPage(
  shinythemes::themeSelector(),

  # theme = shinytheme("journal"),
  tabsetPanel(
    tabPanel("Home"),
    tabPanel(
      "Game",
      sidebarLayout(
        mainPanel(paste("Scenario: You are one of the most well known CEOs in America running a retail company.
                                                      Your store in Grinnell is competing only against another retail company named Tropical Inc.You have two options:
                                                      Apply discounts for Thanksgiving or not. But you do not know your rival's decision. Can you make a better decision than your competitor?
                                                      (Lets apply game theory)
                                                      "), uiOutput("matrix"), textOutput("mytext_1")),
        radioGroupButtons(
          inputId = "radio_discount",
          label = "Strategy selection:",
          choices = c("Discount" = "existYes", "No discount" = "existNo"),
          status = "primary"
        )
      ),
    ),
    tabPanel(
      "Catalog",
      mainPanel(
        h2("List of Games"),
        DT::dataTableOutput("mytable")
      )
    ),
    tabPanel("Process")
  )
)

# Define server logic required to draw a histogram
server <- function(input, output) {
  observeEvent(input$radio_discount, {
    "You decided to provide discount, therefore you collected 50% of the sales for Thanksgiving."
  })

  output$mytext_1 <- renderText({
    exitAnswer <- switch(input$radio_discount,
      existYes = "You decided to provide discount, therefore you collected 50% of the sales for Thanksgiving.",
      existNo = "You decided to not provide discount, therefore you collected 50% of the sales for Thanksgiving "
    )
  })

  selectdata <- reactive({
    table <- read.csv("data_catalog_games.csv")
    ## dplyr::filter(nas1, nas1$industry %in% input$picker_sector & nas1$country %in% input$picker_country)
  })

  output$mytable <- DT::renderDataTable({
    selectdata()
  })

  output$matrix <- renderUI({
    M <- matrix(rep(1, 4), nrow = 2)
    rownames(M) <- c("a", "b")
    M <- print(xtable(M, align = rep("c", ncol(M) + 1)),
      floating = FALSE, tabular.environment = "array", comment = FALSE, print.results = FALSE
    )
    html <- paste0("$$", M, "$$")
    list(
      withMathJax(HTML(html))
    )
  })
}

# Run the application
shinyApp(ui = ui, server = server)
