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


# game <- function() {
  game <-
  tabPanel("Game", tabsetPanel(id="tab1",
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
                               )
  ))