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
library(shinythemes)
library(htmlTable)
library(latex2exp)
library(ggeasy)
library(ggplot2)
library(shinydashboard)
library(formattable)
library(dplyr)

# Define UI for application that draws a histogram
ui <- fluidPage(
  theme = shinytheme("journal"),
  tags$head(
    tags$link(rel="icon", type="image/png", href = "header.png"),
    tags$title("Game Theory Fall 2022")
  ),
  navbarPage(
    title = list(
      tags$head(tags$style()),
      HTML('<img src="puzzle.png", height="30px"
          style="float:right"/>', '<p style="color:black"></p>')
    ),
    tabPanel(
      "Home",
      fluidRow(
        shiny::HTML("<br><center> <h1>Game Theory Group!<h1> </center><br>"),
        div(img(src = "puzzle.png", height = "100px"), style = "text-align: center;"),
        tags$hr(),
        column(
          12,
          shiny::HTML("<center> <h2>What you'll find here</h2> </center><br>"),
          shiny::HTML("<center><h4>An interactive tool to help you explore your interest in Game theory games or even
                                                        just get to know about this topic for the first time.</center></h4>"),
          br(),br(),br(),br(),br(),br(),br(),br(),br(),br(),br(),br(),br(),br(),br(),br(),br(),br(),br(),br(),br(),
          tags$footer(align = "center", shiny::HTML("Copyright © 2022-2023 Game Theory Group CSC-324 Fall  : Made with <3 in Grinnell, Iowa"), style = "position:absolute;bottom:0;width:95%;height:50px; /* Height of the footer */color: black;padding: 0px;background-color: white;z-index: 1000;")
        )
      )
    ),
    tabPanel("Game", tabsetPanel(
      type = "tabs",
      tabPanel(
        "Level 1", br(),
        sidebarLayout(
          mainPanel(shiny::HTML("<p> <h4>Scenario: You are one of the most well-known CEOs in America running a retail company.
                                                      Your store in Grinnell is competing only against another retail company named Tropical Inc. You have two options:
                                                      Apply discounts for Thanksgiving or not. But you do not know your rival's decision. Can you make a better decision than your competitor?
                                                      (Lets apply game theory)</h4></p><br>"), uiOutput("matrix"), textOutput("mytext_1")),
          sidebarPanel(
            radioGroupButtons(
              inputId = "radio_discount",
              label = h4("Strategy selection:"),
              choices = c("Discount" = "existYes", "No discount" = "existNo"),
              status = "primary"
            ), actionButton("goButton", "Implement Changes", class = "btn-success")
          )
        ), br(),br(),br(),br(),br(),br(),br(),br(),br(),br(),br(),br(),br(),br(),br(),br(),br(),br(),br(),br(),br(),br(),br(),br(),br(),
        tags$footer(align = "center", shiny::HTML("<p>Copyright © 2022-2023 Game Theory Group CSC-324 Fall  : Made with <3 in Grinnell, Iowa</p>"))
      ),
      tabPanel(
        "Level 2", br(),
        sidebarLayout(
          mainPanel(
            shiny::HTML("<p><h4>Let's make it more interesting! Could you select the discount amount to
                                                                     compete against Tropical Inc.? Take as a reference the table provided below and make a decision! Level 2 has two variations:
                                                                       Sequential or simultaneous game. Sequential means Tropical Inc. has complete information about your decision. Simultaneous means Tropical Inc will decide without knowing your move!
                                                                       </h4></p><br>"),
            plotOutput("plot_discount"), tags$hr(), textOutput("mytext_2"), 
            br(),br(),br(),br(),br(),
            tags$footer(align = "center", shiny::HTML("<p>Copyright © 2022-2023 Game Theory Group CSC-324 Fall  : Made with <3 in Grinnell, Iowa</p>"))),
          
          sidebarPanel(
            verticalLayout(
              prettyCheckbox(
                inputId = "pretty_1", label = "Sequential Game?", icon = icon("check")
              ),
              pickerInput(
                inputId = "picker_2",
                label = h4("Strategy selection:"),
                choices = c("No Discount" = 0, "10%" = 1, "20%" = 2, "30%" = 3, "40%" = 4, "50%" = 5, "60%" = 6, "70%" = 7, "80%" = 8, "90%" = 9, "100%" = 10),
                options = list(
                  `live-search` = TRUE
                )
              ), splitLayout(
                actionButton("goButton_2", "Implement Changes", class = "btn-success"),
                actionButton("go", HTML('<img src="data_pic.png", height="30px"style="float:right"/>', '<p style="color:black"></p>'))
              )
            )
          )
        )
      ),
      tabPanel("Level 3"),
      
    )),
    tabPanel(
      "Catalog",
      mainPanel(
        column(2),
        column(
          8,
          h2("List of Games"),
          DT::dataTableOutput("mytable"),
          shiny::HTML("<b>Column Name Descriptions</b><br>
                                                  <b>Player:</b> The number of players needed for the game<br>
                                                  <b>Strategies.per.player:</b> The number of strategies available
                                                  for each player<br>
                                                  <b>Number.of.pure.strategy.Nash.equilibria:</b> The number of
                                                  possible nash equilibrium situations<br>
                                                  <b>Sequential:</b> Whether the game is sequential or not<br>
                                                  <b>Perfect Information:</b> The game is sequential, and every player
                                                  knows the actions of previous players.<br>
                                                  <b>Constant Sum:</b>Whether one player gains if and only if another
                                                  player loses.<br><br><br><br>
                                                  "),
          tags$footer(align = "center", shiny::HTML("<br>Copyright © 2022-2023 Game Theory Group CSC-324 Fall  : Made with <3 in Grinnell, Iowa"), style = "position:absolute;bottom:0;width:95%;height:50px; /* Height of the footer */color: black;padding: 0px;background-color: white;z-index: 1000;")
        ), column(2)
      )
    ),
    tabPanel(
      "Process",
      fluidRow(
        shiny::HTML("<center> <h1>DESIGN PROCESS<h1> </center>"),
        div(img(src = "design.png", height = "100px"), style = "text-align: center;"),
        tags$hr(),
        column(1),
        column(
          10,
          shiny::HTML("<br><center><h2>Usage of wireframe and screen mockup</h2></center><br>"),
          shiny::HTML("<h4>

                                             <ul><li>At first, we were still determining how we wished to present
                our data but making a wireframe and screen mockup helped us
                visualize what we wanted to do and then perform the
                tasks in a given order.  <br><br><li>We decided to use game theory to create
                this game because it is a straightforward yet interesting concept.
                We wanted to make a game that was not only fun but also educational.
                Game theory is applicable in many real-life situations, and we wanted to
                make a game that would help the user understand this concept. <br><br><li>
                We also wanted to make it interesting, so we added a catalog of games to it.
                The user can play the game and then see the results.  <br><br><li>The user can
                also see the catalog of games and click on a game to see the results
                of that game.  <br><br><li>We also added a home page that would give the user
                an overview of the game and the catalog of games.  <br><br><li>We also added a
                button on the home page which would take the user directly to the game.
                The user sees the home page as the first page when they open the app.
                <br><br><li> We also made it so that when the user clicks the back button on the browser,
                they are taken to the home page.</h4>")
        ),
        column(1)
      ),
      tags$hr(),
      fluidRow(
        column(1),
        column(
          10,
          shiny::HTML("<br><center><h2>Time: How long does it take a user to accomplish a
                given set of tasks using the system?</h2></center><br>"),
          shiny::HTML("<center><h4>It takes about 5-10 minutes for a user to go through the
                entire application and viewing the statistics of all the
                colleges using the graphs</center></h4>")
        ),
        column(1)
      ),
      tags$hr(),
      fluidRow(
        column(
          12,
          shiny::HTML("<br><center> <h2>Errors: How many errors does a user make and how
                serious are they?</h2> </center><br>"),
          shiny::HTML("<center><h4>Users generally do not make errors since it is a pretty
                straightforward application</center></h4>")
        )
      ),
      tags$hr(),
      fluidRow(
        column(
          12,
          shiny::HTML("<br><center> <h2>Learning: How long does it take a novice user to
                learn how to use the system to do a given set of tasks?</h2> </center><br>"),
          shiny::HTML("<center><h4>It should not take more than 10 minutes for a novice user
                to learn how to use the application</center></h4>")
        )
      ),
      tags$hr(),
      fluidRow(
        column(
          12,
          shiny::HTML("<br><center> <h2>Functionality: What range of tasks can a user do
                in practice with the system?</h2> </center><br>"),
          shiny::HTML("<center><h4> Users can play and learn throughout the 3 levels about the thinking related to decision making. </center></h4>")
        )
      ),
      tags$hr(),
      fluidRow(
        column(
          12,
          shiny::HTML("<br><center> <h2>Recall: How easy is it for a user to recall how to use
                 the system on a task that he has not done for some time?</h2> </center><br>"),
          shiny::HTML("<center><h4> Should be quite straightforward for a user that has any experience with internet.</center></h4>")
        )
      ),
      tags$hr(),
      fluidRow(
        column(
          12,
          shiny::HTML("<br><center> <h2>Concentration: How many things does a user have to
                keep in mind while using the system?</h2> </center><br>"),
          shiny::HTML("<center><h4>The only aspect that requires concentration is during some of the games. The users might have to
                                                         keep track of their learnings at each previous level so that they can make better decisions for the next round.</center></h4>")
        )
      ),
      tags$hr(),
      fluidRow(
        column(
          12,
          shiny::HTML("<br><center> <h2>Fatigue: How tired do users get when they use the
                system for extended periods?</h2> </center><br>"),
          shiny::HTML("<center><h4>Users might get tired since the game requires some thinking, which might be
                                                         exhausting for users that do not have a good foundation in math or economics</center></h4>")
        )
      ),
      tags$hr(),
      fluidRow(
        column(
          12,
          shiny::HTML("<br><center> <h2>Acceptability: How do users subjectively evaluate
                the system?</h2> </center><br>"),
          shiny::HTML("<center><h4>The user can evaluate the system on the basis of the use
                of the information received, in this case it would be about
                game thoery</center></h4><br><br><br><br>"),
          tags$footer(align = "center", shiny::HTML("Copyright © 2022-2023 Game Theory Group CSC-324 Fall  : Made with <3 in Grinnell, Iowa"), style = "position:absolute;bottom:0;width:95%;height:50px; /* Height of the footer */color: black;padding: 0px;background-color: white;z-index: 1000;")
        )
      )
    )
  )
)





# Define server logic required to draw a histogram
server <- function(input, output) {
  discount <- function(n) {
    -((x / 2) - 15)^2 + 300
  }
  x <- seq(0, 100, by = 5)
  y <- lapply(x[1], discount)[1]
  df <- data.frame(x, y)
  df$Discount <- df$x
  df$x <- NULL
  df$Profits <- df$c.75..143.75..200..243.75..275..293.75..300..293.75..275..243.75..
  df$c.75..143.75..200..243.75..275..293.75..300..293.75..275..243.75.. <- NULL
  
  
  
  output$plot_discount <- renderPlot(
    ggplot(df, aes(Discount, Profits)) +
      geom_point() +
      geom_smooth() +
      theme_minimal() +
      ylab(TeX("Profit: $\\Pi$")) +
      xlab(TeX("Discount Amount: $n\\%$")) +
      labs(title = TeX("Discount Function: $\\Pi(n)$: $-\\left(\\frac{n}{2}-15\\right)^{2}+300$")) +
      ggeasy::easy_center_title()
  )
  
  observeEvent(input$go, {
    showModal(modalDialog(
      tableOutput("table_discount"),
      footer = NULL,
      easyClose = TRUE
    ))
  })
  
  
  output$table_discount <- renderTable(df)
  
  ## Reactivity from table
  selectdata <- reactive({
    table <- read.csv("data_catalog_games.csv")
    table <- select(table, c(-X))
    ## dplyr::filter(nas1, nas1$industry %in% input$picker_sector & nas1$country %in% input$picker_country)
  })
  
  ## output table for games catalog
  output$mytable <- DT::renderDataTable({
    selectdata()
  })
  
  
  observeEvent(input$goButton, {
    output$matrix <- renderUI({
      HTML(
        htmlTable(matrix(c("TR/2-c,  TR/2-c", " TR-c,  0", " 0, TR-c", " TR/2,  TR/2"),
                         ncol = 2, byrow = TRUE
        ),
        header = paste(c("Discount", "No Discount")),
        rnames = paste(c("Discount", "No Discount")),
        rgroup = "Your company",
        n.rgroup = c(2),
        cgroup = "Tropical Inc.",
        n.cgroup = c(2),
        caption = "Basic table with both column spanners (groups) and row
              groups",
        tfoot = "&dagger; A table footer commment"
        )
      )
    })
    
    
    # Text output response--> Question1
    output$mytext_1 <- renderText({
      
      # preventing reactivity
      b <- isolate(input$radio_discount)
      if (b == "existYes") {
        "You decided to provide discount, therefore you collected 50% of the sales for Thanksgiving minus the cost for the discount."
      } else {
        "You decided to not provide discount, therefore you collected 0% of the sales for Thanksgiving "
      }
    })
  })
  
  observeEvent(input$goButton_2, {
    if (input$pretty_1 == TRUE) {
      output$mytext_2 <- renderText({
        # preventing reactivity
        b <- isolate(as.numeric(input$picker_2))
        if (b < 6) {
          paste0("You decided to provide a discount of ", df$Discount[(b * 2) + 1], "%.
             You lost the price war and made $0 USD profit. Tropical Inc profited $", df$Profits[(b * 2) + 3], " USD. Try Again!")
        } else if (b > 6) {
          paste0(
            "You won the price war! But a discount of ", df$Discount[(b * 2) + 1], "% led to a loss of $",
            df$Profits[(b * 2) + 1], " USD. On the flip side Tropical Inc profited $ 0 USD. Try Again!"
          )
        } else {
          paste0(
            "You decided to provide a discount of ", df$Discount[(b * 2) + 1], "% and you won  $", df$Profits[(b * 2) + 1] / 2,
            " USD in profits.Tropical Inc profited $", df$Profits[(6 * 2) + 1] / 2, " USD. Congrats! You found the optimal solution!"
          )
        }
      })
    } else {
      output$mytext_2 <- renderText({
        # preventing reactivity
        b <- isolate(as.numeric(input$picker_2))
        if (b < 6) {
          paste0("You decided to provide a discount of ", df$Discount[(b * 2) + 1], "%.
             You lost the price war and made $0 USD profit. Tropical Inc profited $", df$Profits[(6 * 2) + 1], " USD. Try Again!")
        } else if (b > 6) {
          paste0(
            "You won the price war! But a discount of ", df$Discount[(b * 2) + 1], "% led to a loss of $",
            df$Profits[(b * 2) + 1], " USD. On the flip side Tropical Inc profited $ 0 USD. Try Again!"
          )
        } else {
          paste0(
            "You decided to provide a discount of ", df$Discount[(b * 2) + 1], "% and you won  $", df$Profits[(b * 2) + 1] / 2,
            " USD in profits.Tropical Inc profited $", df$Profits[(6 * 2) + 1] / 2, " USD. Congrats! You found the optimal solution!"
          )
        }
      })
    }
  })
}

# Run the application
shinyApp(ui = ui, server = server)
