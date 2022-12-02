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
        shiny::HTML("<br><center> <h1>Game Theory Group!<h1> </center>"),
        div(img(src = "puzzle.png", height = "100px"), style = "text-align: center;"),
        tags$hr(),
        column(
          12,
          shiny::HTML("<center> <h4 style= color:#696969>E-learning platform powered by the Game Theory Group.</h4> </center>"),
          shiny::HTML("<center><h3>We provide a user-friendly interactive tool that allows users to learn more about 
          Game Theory through a tutorial and example game simulations for further Game Theory exploration.</h3><br></center>"),
          
          
          br(),br(),br(),br(),br(),br(),br(),br(),br(),br(),br(),br(),br(),br(),br(),
          tags$footer(align = "center", shiny::HTML("Copyright © 2022-2023 Game Theory Group CSC-324 Fall  : Made with <3 in Grinnell, Iowa"), style = "position:absolute;bottom:0;width:95%;height:50px; /* Height of the footer */color: black;padding: 0px;background-color: white;z-index: 1000;")
        )
      )
    ),
    tabPanel(
      "Tutorial",
      fluidRow(
        column(
          12,
          
          shiny::HTML("<h1> Game Theory Tutorial</h1><br>"),
          
          shiny::HTML("<p style= color:black;font-size:120%;><b>Welcome!</b> Before exploring the rest of our app, we'll begin by giving a bit of an introduction into Game Theory
          and providing resources to be explored to gain a deeper understanding of Game Theory.</p><br>"),
          
          shiny::HTML("<p style= color:black;font-size:120%;>The tutorial will be composed of the following:</p>
                      <ul style= color:black;font-size:120%;>
                          <li>What is a game?</li>
                          <li>What is Game Theory?</li>
                          <li>Applications of Game Theory</li>
                          <li>Key Elements of a Game</li>
                          <li>Nash Equilibrium</li>
                          <li>Frequent Terms</li>
                      </ul>"),
          
          shiny::HTML("<h3> What is a game?</h3>"),
          
          shiny::HTML("<p style= color:black;font-size:120%;> A game is all situations in which at least one agent 
          can only act to maximize his utility through anticipating the responses to his actions by one or more 
          other agents. Examples: Chess, RPS, Checkers <p>
                      <dl>
                      <dt> Examples</dt>
                      <dd>Chess, RPS, Checkers</dd>"),
          
          shiny::HTML("<h3> What is Game Theory?</h3>"),
          
          shiny::HTML("<p style= color:black;font-size:120%;> GT is the study of interdependent choice and action, 
          which includes the study of strategic decision making. In short, GT is a study of how to mathematically determine the 
          best strategy for given conditions in order to optimize outcome.<p>"),
          
          shiny::HTML("<h3> Applications of Game Theory</h3>"),
          
          shiny::HTML("<p style= color:black;font-size:120%;> Mathematics, Economics, Political Science, International 
          Relations, Philosophy, Psychology... in short, it’s everywhere! GT does not solve the problem at hand. Instead, it 
          helps to illuminate the problem and offers us a different way of interpreting the competitive interactions and 
          possible results.<p>"),
          
          shiny::HTML("<h3> Key Elements of a Game</h3>"),
          
          shiny::HTML("<ul style= color:black;font-size:100%;>
                          <li>Players: Who is interacting?</li>
                          <li>Strategies: What are their options?</li>
                          <li>Payoffs: What are their incentives?</li>
                          <li>Information: What do they know?</li>
                          <li>Rationality: How do they think?</li>
                      </ul>"),
          
          shiny::HTML("<h3> Nash Equilibrium (NE) </h3>"),
          
          shiny::HTML("<p style= color:black;font-size:120%;>
                      Nash equilibrium is set of strategies such that no player can obtain a higher payoff by switching to 
                      a different strategy while the strategies of all other players are held fixed. In short, every player 
                      is doing what is best for them given what the other person is doing.<p>"),
          
          shiny::HTML("<h3>Frequent Terms</h3>"),
          
          shiny::HTML("<ul style= color:black;font-size:100%;>
                          <li>Payoff: Net outcome of playing  game.</li>
                          <li>Payoff Matrix: It is the table showing outcomes or payoffs of different strategies of the game.</li>
                          <li>Dominant Strategy: A strategy is called dominant if regardless of what the other player does, that player 
                          should always play that way.</li>
                      </ul>"),
          
          shiny::HTML("<h2>Further Resources</h2>"),
          
          shiny::HTML("<p style= color:black;font-size:100%;> For users interested in learning more beyond our tutorial, we'd 
                      recommend watching the following videos:</p> 
                      &nbsp;&nbsp;&nbsp; <a href=https://www.youtube.com/watch?v=PCcVODWm-oY target=_blank rel=noopener noreferrer> Game Theory Crash Course</a><br>
                      &nbsp;&nbsp;&nbsp; <a href=https://www.youtube.com/watch?v=MHS-htjGgSY target=_blank rel=noopener noreferrer> Game Theory Decision Making</a><br>
                      &nbsp;&nbsp;&nbsp; <a href=https://www.youtube.com/watch?v=0i7p9DNvtjk target=_blank rel=noopener noreferrer> Nash Equilibrium</a>"),
        ),
      ),
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
                                                plotOutput("plot_discount"), tags$hr(), span(textOutput("lossMessage"), style="color:red"), 
                                                span(textOutput("winMessage"), style="color:green"), span(textOutput("hintMessage"), style="color:blue"),
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
                                              ),
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
      
      tabsetPanel(
        id = "processes",
        tabPanel(
          "Process & Acknowledgement",
          actionButton("d_button", HTML('<img src="design.png",  height = "150px", width = "300px", style="float:right"/>', '<p style="color:black"></p>')),
          
          actionButton("r_button", HTML('<img src="research.png",  height = "150px", width = "300px", style="float:right"/>', '<p style="color:black"></p>')),
          
        ),
        tabPanel(
          "Design Process",
          id="Design Process",
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
        ),
        
        
        tabPanel(
          "Research Process",
          id="Research Process",
          shiny::HTML("<br><center><h2>Research</h2></center><br>")
        ),
        
        tabPanel(
          "Acknowledgments",
          id="acknowledgments",
          shiny::HTML("<br><center><h2>Acknowledge</h2></center><br>")
        )
        
        
      )
    )

  )
)





# Define server logic required to draw a histogram
server <- function(input, output, session) {
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
    
    observeEvent(input$d_button, {
      updateTabsetPanel(session, "processes",selected = "Design Process")
    })
    
    observeEvent(input$r_button, {
      updateTabsetPanel(session, "processes",selected = "Research Process")
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
  
  
  
  
  
  
  observeEvent(input$goButton_2, {
    output$lossMessage <- renderText("")
    output$winMessage <- renderText("")
    output$hintMessage <- renderText("")
    if (input$pretty_1 == TRUE) {
      b <- isolate(as.numeric(input$picker_2))
      if (b < 6) {
        output$lossMessage  <- renderText(paste("Oh No! TRY AGAIN! You decided to provide a discount of ", as.character(df$Discount[(b * 2) + 1]), "%.
             You lost the price war and made $0 USD profit. Tropical Inc profited $", as.character(df$Profits[(b * 2) + 3])," USD."))
        output$hintMessage <- renderText(paste("Hint: We highly recommend checking out the table of discounts and potential profits.
                                               You can access the table by clicking on the folder button next to the green implement button.
                                               You lost because you decided to give less discount than your competitior. How can you maximize
                                               your earnings given that your opponent already knows your decision? Avoid loss as much as possible. What is
                                               the minimum discount you can give that will leave your competitive with no option other than picking the same
                                               discount as yours?"))
      }  else if (b > 6) {
        output$lossMessage <- renderText(paste("TRY AGAIN! You won the price war! But a discount of ", as.character(df$Discount[(b * 2) + 1]), "% led to a loss of $",
                                               as.character(df$Profits[(b * 2) + 1]), " USD. On the flip side Tropical Inc profited $ 0 USD."))
        output$hintMessage <- renderText(paste("Hint: We highly recommend checking out the table of discounts and potential profits.
                                               You can access the table by clicking on the folder button next to the green implement button. You lost because
                                               you provided a lot of discount that did not bring you any profit. Find the minimum discount such that 
                                               you will still earn and your competitor has no choice other than picking the same discount as yours."))
      } else {
        output$winMessage <- renderText(paste("You decided to provide a discount of ", as.character(df$Discount[(b * 2) + 1]), "% and you won  $", as.character(df$Profits[(b * 2) + 1] / 2),
                                              " USD in profits.Tropical Inc profited $", as.character(df$Profits[(6 * 2) + 1] / 2), " USD. Congrats! You found the optimal solution! You won
        because 60% is the minimum discount give that will leave no choice for your competitor to offer a better deal than yours. Anything more
        than 60% discount will lead to profit loss causing your competitor to pick 60% discount as well. You should not provide more than 60% either
        because the profits are less than 0 for any discount more than 60%."))
      }
      
    } else {
      # preventing reactivity
      b <- isolate(as.numeric(input$picker_2))
      if (b < 6) {
        output$lossMessage <- renderText(paste("You decided to provide a discount of ", as.character(df$Discount[(b * 2) + 1]), "%.
           You lost the price war and made $0 USD profit. Tropical Inc profited $", as.character(df$Profits[(6 * 2) + 1]), " USD. Try Again!"))
        output$hintMessage <- renderText(paste("Hint: Look at the table next to the green implement button. You should provide more
        discount because the competitor collected all the profits by providing more discoun than you do. Without knowing your decision,
                                               the computer picked a discount amount so that they will still profit but making it impossible
                                               for you to profit more than them. What is this discount amount?"))
      } else if (b > 6) {
        output$lossMessage <- renderText(paste("You won the price war! But a discount of ", as.character(df$Discount[(b * 2) + 1]), "% led to a loss of $",
                                               as.character(df$Profits[(b * 2) + 1]), " USD. On the flip side Tropical Inc profited $ 0 USD. Try Again!"))
        output$hintMessage <- renderText(paste("Hint: You provided excessive discount causing you to make negative profit.
                                               Look at the table next to the green button. Which discount amount is causing you
                                               to make profit and is the safest choice such that you will not earn less than your
                                               competitor."))
      } else {
        output$winMessage <- renderText(paste("You decided to provide a discount of ", as.character(df$Discount[(b * 2) + 1]), "% and you won  $", as.character(df$Profits[(b * 2) + 1] / 2),
                                              " USD in profits.Tropical Inc profited $", as.character(df$Profits[(6 * 2) + 1] / 2), " USD. Congrats! You found the optimal solution!"))
      }
      
    }
  })
  
  
}

# Run the application
shinyApp(ui = ui, server = server)
