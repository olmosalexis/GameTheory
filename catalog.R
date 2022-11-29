
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

catalog <- tabPanel(
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
)