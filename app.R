
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
library(shinyalert)


source("catalog.R")
source("box.R")
source("process.R")
source("home.R")
source("tutorial.R")
source("game.R")

# Define UI for application that draws a histogram
ui <- fluidPage(
  
  theme = shinytheme("journal"),
  useShinyalert(),
  tags$head(
    tags$link(rel="icon", type="image/png", href = "header.png"),
    tags$title("Game Theory Fall 2022")
  ),
  navbarPage(
    id = "navbar",
    actionButton("h_button", HTML('<img src="header.png", height="15px", width="15px"
          style="float:right"/>', '<p style="color:black"></p>')),
    homePage(),
    tutorial(),
    game,
    catalog(),
    process()
  )
)





# Define server logic
server <- function(input, output, session) {
  
  observeEvent(input$goButton, {
    if(input$goButton==1){
      appendTab(inputId = "tab1", tabPanel(id = "tab2",
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
      ))}})
  
  
  ###########################################################################
  #################################SET UP####################################
  ###########################################################################
  
  discount <- function(n) {
    -((x / 2) - 15)^2 + 300
  }
  
  selectdata <- reactive({
    return(tb %>% select(c("name", "Place", "Year", "Description")))
    ## dplyr::filter(nas1, nas1$industry %in% input$picker_sector & nas1$country %in% input$picker_country)
  })
  selectbox <- reactive({
    return(tb %>% select(c("Game", "Players", "index")))
    ## dplyr::filter(nas1, nas1$industry %in% input$picker_sector & nas1$country %in% input$picker_country)
  })
  
  ###########################################################################
  #################################VALUES####################################
  ###########################################################################
  
  x <- seq(0, 100, by = 5)
  y <- lapply(x[1], discount)[1]
  df <- data.frame(x, y)
  df$Discount <- df$x
  df$x <- NULL
  df$Profits <- df$c.75..143.75..200..243.75..275..293.75..300..293.75..275..243.75..
  df$c.75..143.75..200..243.75..275..293.75..300..293.75..275..243.75.. <- NULL
  
  table <- read.csv("data_catalog_games.csv")
  tb <- read.csv("data_catalog_games.csv")
  # add id to table
  tb$index <- 1:nrow(tb)
  # add hyperlinks
  tb$name <- merge(tb$Game, tb$link)
  
  
  ###########################################################################
  #################################OUTPUT####################################
  ###########################################################################
  
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
  output$table_discount <- renderTable(df)
  
  output$mytext_1 <- renderText("")
  
  ## output table for games catalog
  output$mytable <- DT::renderDataTable({
    selectdata()
  }, escape=FALSE)
  
  output$table <- renderUI(list_table())
  ## Reactivity from table
  
  ###########################################################################
  ##############################EVENT LISTENER###############################
  ###########################################################################
  
  observeEvent(input$go, {
    showModal(modalDialog(
      tableOutput("table_discount"),
      footer = NULL,
      easyClose = TRUE
    ))
  })
  observeEvent(input$goButton, {
    # Text output response--> Question1
    output$mytext_1 <- renderText({
      # preventing reactivity
      b <- isolate(input$radio_discount)
      print(b)
      if (b == "existYes") {
        "You decided to provide discount, therefore you collected 50% of the sales for Thanksgiving minus the cost for the discount."
      }
      else{
        "You decided to not provide discount, therefore you collected 0% of the sales for Thanksgiving "
      }
    })
  }
  )
  
  observeEvent(input$show_more_button, {
    output$mytext_6 <- renderUI({
      tags$div(tags$hr(),
               fluidRow(
                 column(1),
                 column(
                   10,
                   shiny::HTML("<center><h2>1. Time: How long does it take a user to accomplish a
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
                   shiny::HTML("<center> <h2>2. Errors: How many errors does a user make and how
                  serious are they?</h2> </center><br>"),
                   shiny::HTML("<center><h4>Users generally do not make errors since it is a pretty
                  straightforward application</center></h4>")
                 )
               ),
               tags$hr(),
               fluidRow(
                 column(
                   12,
                   shiny::HTML("<center> <h2>3. Learning: How long does it take a novice user to
                  learn how to use the system to do a given set of tasks?</h2> </center><br>"),
                   shiny::HTML("<center><h4>It should not take more than 10 minutes for a novice user
                  to learn how to use the application</center></h4>")
                 )
               ),
               tags$hr(),
               fluidRow(
                 column(
                   12,
                   shiny::HTML("<center> <h2>4. Functionality: What range of tasks can a user do
                  in practice with the system?</h2> </center><br>"),
                   shiny::HTML("<center><h4> Users can play and learn throughout the 3 levels about the thinking related to decision making. </center></h4>")
                 )
               ),
               tags$hr(),
               fluidRow(
                 column(
                   12,
                   shiny::HTML("<center> <h2>5. Recall: How easy is it for a user to recall how to use
                   the system on a task that he has not done for some time?</h2> </center><br>"),
                   shiny::HTML("<center><h4> Should be quite straightforward for a user that has any experience with internet.</center></h4>")
                 )
               ),
               tags$hr(),
               fluidRow(
                 column(
                   12,
                   shiny::HTML("<center> <h2>6. Concentration: How many things does a user have to
                  keep in mind while using the system?</h2> </center><br>"),
                   shiny::HTML("<center><h4>The only aspect that requires concentration is during some of the games. The users might have to
                                                           keep track of their learnings at each previous level so that they can make better decisions for the next round.</center></h4>")
                 )
               ),
               tags$hr(),
               fluidRow(
                 column(
                   12,
                   shiny::HTML("<center> <h2>7. Fatigue: How tired do users get when they use the
                  system for extended periods?</h2> </center><br>"),
                   shiny::HTML("<center><h4>Users might get tired since the game requires some thinking, which might be
                                                           exhausting for users that do not have a good foundation in math or economics</center></h4>")
                 )
               ),
               tags$hr(),
               fluidRow(
                 column(
                   12,
                   shiny::HTML("<center> <h2>8. Acceptability: How do users subjectively evaluate
                  the system?</h2> </center><br>"),
                   shiny::HTML("<center><h4>The user can evaluate the system on the basis of the use
                  of the information received, in this case it would be about
                  game thoery</center></h4><br><br><br><br>"),
                   tags$footer(align = "center", shiny::HTML("Copyright © 2022-2023 Game Theory Group CSC-324 Fall  : Made with <3 in Grinnell, Iowa"), style = "position:absolute;bottom:0;width:95%;height:50px; /* Height of the footer */color: black;padding: 0px;background-color: white;z-index: 1000;")
                 )
               ))
    })
  }
  
  )
  
  
  observeEvent(input$game, {
    if (input$game != "0") {
      g <- tb %>% filter(index == input$game)
      print(g)
      
      # updateTextInput(session, 'game', value='0');
      shinyalert(g$Game, tags$div(
        style = "display: flex; flex-direction: column;",
        tags$div(tags$b("Description:"), g$Description, align='left'),
        tags$div(tags$b("Country of Origin:"), g$Place, align='left'),
        tags$div(tags$b("Year of Origin:"), g$Year, align='left'),
        tags$div(
          align='left',
          shiny::HTML(paste0("<a href=\"", g$link, "\"  target=_blank rel=noopener noreferrer>Learn more</a>")))),
        html = TRUE,
      )
    }
  })
  
  observeEvent(input$boxmode, {
    t <- selectbox()
    output$table <- renderUI(box_table(Map(boxCard, t$Game, t$Players, t$index, style = "")))
  })
  observeEvent(input$listmode, {
    output$table <- renderUI(list_table())
  })
  
  observeEvent(input$d_button, {
    updateTabsetPanel(session, "processes", selected = "Design Process")
  })
  
  observeEvent(input$r_button, {
    updateTabsetPanel(session, "processes", selected = "Research Process")
  })
  
  observeEvent(input$a_button, {
    updateTabsetPanel(session, "processes", selected = "Acknowledgements")
  })
  
  observeEvent(input$h_button, {
    updateNavbarPage(session, "navbar", selected = "Home")
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
        tfoot="&dagger; A table footer commment")
      )
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
      
    }
    
    else{
      output$mytext_2  <- renderText({
        # preventing reactivity
        b= isolate(as.numeric(input$picker_2))
        if (b<6){
          paste0("You decided to provide a discount of ",df$Discount[(b*2)+1], "%.
             You lost the price war and made $0 USD profit. Tropical Inc profited $", df$Profits[(6*2)+1], " USD. Try Again!")
          
        }
        else if (b>6){
          paste0("You won the price war! But a discount of ",df$Discount[(b*2)+1], "% led to a loss of $",
                 df$Profits[(b*2)+1], " USD. On the flip side Tropical Inc profited $ 0 USD. Try Again!")
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