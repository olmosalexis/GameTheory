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

process <- function() {
  tabPanel(
    "Process",
    tabsetPanel(
      id = "processes",
      type = "pills",
      tabPanel(
        "Process & Acknowledgement",
        br(),
        actionButton("d_button", HTML('<img src="design.png",  height = "150px", width = "300px", style="float:right"/>', '<p style="color:black"></p>')),
        shiny::HTML(" "),
        actionButton("r_button", HTML('<img src="research.png",  height = "150px", width = "300px", style="float:right"/>', '<p style="color:black"></p>')),
        shiny::HTML(" "),
        actionButton("a_button", HTML('<img src="acknowledgement.png",  height = "150px", width = "300px", style="float:right"/>', '<p style="color:black"></p>')),
      ),
      tabPanel(
        "Design Process",
        id = "Design Process",
        fluidRow(
          shiny::HTML("<center> <h1>DESIGN PROCESS<h1> </center>"),
          div(img(src = "design.png", height = "100px"), style = "text-align: center;"),
          tags$hr(),
          column(1),
          column(
            10,
            shiny::HTML("<br><center><h2>Usage of wireframe and screen mockup</h2></center><br>"),
            shiny::HTML("<h4><ul><li>At first, we were still determining how we wished to present
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
            shiny::HTML("<br><center><h2>1. Time: How long does it take a user to accomplish a
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
            shiny::HTML("<br><center> <h2>2. Errors: How many errors does a user make and how
                  serious are they?</h2> </center><br>"),
            shiny::HTML("<center><h4>Users generally do not make errors since it is a pretty
                  straightforward application</center></h4>")
          )
        ),
        tags$hr(),
        fluidRow(
          column(
            12,
            shiny::HTML("<br><center> <h2>3. Learning: How long does it take a novice user to
                  learn how to use the system to do a given set of tasks?</h2> </center><br>"),
            shiny::HTML("<center><h4>It should not take more than 10 minutes for a novice user
                  to learn how to use the application</center></h4>")
          )
        ),
        tags$hr(),
        fluidRow(
          column(
            12,
            shiny::HTML("<br><center> <h2>4. Functionality: What range of tasks can a user do
                  in practice with the system?</h2> </center><br>"),
            shiny::HTML("<center><h4> Users can play and learn throughout the 3 levels about the thinking related to decision making. </center></h4>")
          )
        ),
        tags$hr(),
        fluidRow(
          column(
            12,
            shiny::HTML("<br><center> <h2>5. Recall: How easy is it for a user to recall how to use
                   the system on a task that he has not done for some time?</h2> </center><br>"),
            shiny::HTML("<center><h4> Should be quite straightforward for a user that has any experience with internet.</center></h4>")
          )
        ),
        tags$hr(),
        fluidRow(
          column(
            12,
            shiny::HTML("<br><center> <h2>6. Concentration: How many things does a user have to
                  keep in mind while using the system?</h2> </center><br>"),
            shiny::HTML("<center><h4>The only aspect that requires concentration is during some of the games. The users might have to
                                                           keep track of their learnings at each previous level so that they can make better decisions for the next round.</center></h4>")
          )
        ),
        tags$hr(),
        fluidRow(
          column(
            12,
            shiny::HTML("<br><center> <h2>7. Fatigue: How tired do users get when they use the
                  system for extended periods?</h2> </center><br>"),
            shiny::HTML("<center><h4>Users might get tired since the game requires some thinking, which might be
                                                           exhausting for users that do not have a good foundation in math or economics</center></h4>")
          )
        ),
        tags$hr(),
        fluidRow(
          column(
            12,
            shiny::HTML("<br><center> <h2>8. Acceptability: How do users subjectively evaluate
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
        id = "Research Process",
        shiny::HTML("<br><center><h2>Research</h2></center><br>")
      ),
      tabPanel(
        "Acknowledgements",
        id = "Acknowledgements",
        shiny::HTML("<br><center><h2>Acknowledge</h2></center><br>")
      )
    )
  )
}