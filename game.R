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


game <- function() {
  tabPanel("Game", tabsetPanel(type = "tabs",
                               tabPanel(
                                 "Level 1", br(),
                                 sidebarLayout(
                                   mainPanel(shiny::HTML("<p> <h4>Scenario: You are one of the most well-known CEOs in America running a retail company.
                                                      Your store in Grinnell is competing only against another retail company named Tropical Inc. in the sales of Turkey. You have two options:
                                                      Apply discounts for Thanksgiving or not. But you do not know your rival's decision. Can you make a better decision than your competitor?
                                                      (Lets apply game theory)</h4></p><br>"), 
                                             div(img(src = "level_2.png", height = "300px", width="500px"), style = "text-align: center;"),
                                             fluidRow(
                                               column(12, align="center",
                                                      uiOutput("matrix")
                                               )), textOutput("mytext_1")),
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
                               )
  ))
}