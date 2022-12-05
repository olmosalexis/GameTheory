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



homePage <- function() {
  tabPanel("Home",
           fluidRow(
             shiny::HTML("<br><br><center> <h1>Game Theory Group!<h1> </center><br>"),
             div(img(src="header.png",height="100px"), style="text-align: center;"),
             tags$hr(),
             column(12,
                    shiny::HTML("<center> <h4 style= color:#696969>E-learning platform powered by the Game Theory Group.</h4> </center>"),
                    shiny::HTML("<center><h3>We provide a user-friendly interactive tool that allows users to learn more about
          Game Theory through a tutorial and example game simulations for further Game Theory exploration.</h3><br></center>"),
                    br(), br(), br(), br(), br(), br(), br(), br(), br(), br(), br(), br(), br(), br(), br(),
                    tags$footer(align = "center", shiny::HTML("Copyright © 2022-2023 Game Theory Group CSC-324 Fall  : Made with <3 in Grinnell, Iowa"), style = "position:absolute;bottom:0;width:95%;height:50px; /* Height of the footer */color: black;padding: 0px;background-color: white;z-index: 1000;")
             )
           )
  )
}