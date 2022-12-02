
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
library(shinyalert)

list_table <- function() {
    tags$div(
      style="width: 100%; overflow:hidden;",
    
      h2("List of Games to explore"),
      
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
      tags$footer(align = "center", shiny::HTML("<br>Copyright © 2022-2023 Game Theory Group CSC-324 Fall  : Made with <3 in Grinnell, Iowa"), style = "position:absolute;bottom:0;width:95%;height:50px; /* Height of the footer */color: black;padding: 0px;background-color: white;z-index: 1000;"
                  ),
)}

box_table <- function(d) {
    # dataTable
    # print(dataTableOutput("mytable")),
    tags$div(d, style="display: flex;flex-wrap: wrap; width:100%;");
}


catalog <- tabPanel(
  "Catalog",
  mainPanel(
    column(2,
           tags$div(
             tags$a(href= NULL, 
                    tags$button(id = "boxmode",
                                class = "btn action-button", 
                                style='background-color:transparent',
                                img(src ="square.png",
                                    height = '40',  
                                    style = "padding-bottom:20px;border-radius: 0px;border-width: 0px"
                                )
                    )
             ),
             tags$a(href= NULL, 
                    tags$button(id = "listmode",
                                class = "btn action-button", 
                                style='background-color:transparent',
                                img(src ="list.png",
                                    height = '40',  
                                    style = "padding-bottom:20px;border-radius: 0px;border-width: 0px"
                                )
                    )
             ),
           ),
           ),
    column(10,
    uiOutput("table")
    )
    # , column(2)
  )
)

box <- function(name, t) {
  return(valueBox(
    value = name,
    subtitle = t,
    width = 4,
    icon = icon("credit-card"),
    color='navy'
  ))
}

merge <- function(t, link) {
  # cat(link);
  if (is.null(link)) {
    return(paste0("<a href=\"https://www.google.com\"  target=_blank rel=noopener noreferrer>", t, "</a>"));
  }
  return(paste0("<a href=\"", link, "\">", t, "</a>"));
}