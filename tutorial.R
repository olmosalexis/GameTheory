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

tutorial <- function() {
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
  )
}