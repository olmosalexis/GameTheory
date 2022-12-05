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
        fluidRow(column(4, align="center", actionButton("d_button", HTML('<img src="design.png",  height = "150px", width = "300px" style="padding: 0;
border: none;
background: none;">'), style="color: #fff; background-color: #fff; border-color: #fff")),
                 
                 column(8, shiny::HTML("<center> <h3>The design process of our application refers to the series of steps or stages that we followed in order to create a successful and user-friendly application. <br><br>Press the icon to read more about it<br><br>
                    This process typically included steps such as identifying the problem, gathering and analyzing user requirements, creating wireframes and prototypes, testing and refining the design, and finally developing and launching the application.</h2> </center>"))),
        
        
        tags$hr(),
        fluidRow(column(4, align="center", actionButton("r_button", HTML('<img src="research.png",  height = "150px", width = "300px" style="padding: 0;
border: none;
background: none;">'), style="color: #fff; background-color: #fff; border-color: #fff")),
                 
                 column(8, shiny::HTML("<center> <h3>The research process of our application refers to the series of steps or stages that are followed in order to gather and analyze information that will be used to inform the design and development of the application. <br><br>Press the icon to read more about it<br><br>
        This process includes activities such as methodology, conducting user interviews and surveys to gather feedback and insights, and analyzing data to identify trends and patterns that can inform the design of the application.</h2> </center>"))),
        
        tags$hr(),
        fluidRow(align="center", column(4, align="center", actionButton("a_button", HTML('<img src="acknowledgement.png",  height = "150px", width = "300px" style="padding: 0;
border: none;
background: none;">'), style="color: #fff; background-color: #fff; border-color: #fff")),
                 
                 column(8, shiny::HTML("<center> <h3>The acknowledgements section of our application is a brief section in which we are giving thanks to individuals who have contributed to the success of our application. <br><br>Press the icon to read more about it<br><br>
        This section includes thanks to individuals who provided valuable feedback or support during the development process, and others who played a significant role in the creation of our application.</h2> </center>"))),
        
      ),
      tabPanel(
        "Design Process",
        id = "Design Process",
        fluidRow(
          div(img(src = "design.png", height = "200px"), style = "text-align: center;"),
          tags$hr(),
          column(1),
          column(
            10,
            shiny::HTML("<center><h2>Usage of wireframe and screen mockup</h2></center><br>"),
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
                  they are taken to the home page.</h4><br><br>")
          ),
          column(1)
        ),
        fluidRow(
          column(12, align="center",
                 actionButton("show_more_button", p(h5("Learn More"))
                 ))),
        fluidRow(
          column(12, align="center",
                 br())
        ),
        uiOutput('mytext_6')
      ),
      tabPanel(
        "Research Process",
        id = "Research Process",
        fluidRow(
          div(img(src = "research.png", height = "200px"), style = "text-align: center;"),
          tags$hr(),
          column(1),
          column(
            10,
            shiny::HTML("<center><h2>Title: Game Theory</h2></center><br>"),
          ),
          column(1)
        ),
        tags$hr(),
        fluidRow(
          column(
            6,
            shiny::HTML("<center> <h2>Members</h2> </center><br>"),
            shiny::HTML("<center><h4>Alper, Anil | Chandgothia, Deepit | Lu, Hanfeng (Paul) <br><br> Olmos, Alexis (Alex) | Ono Sant'anna, Vinicius | Thompson, Madeline (Maddy)</center></h4>")
          ),
          column(
            6,
            shiny::HTML("<center> <h2>ROLES</h2> </center><br>"),
            shiny::HTML("<center><h4>Scrum Master: Thompson, Madeline (Maddy)<br><br>
Product Owner: Olmos, Alexis (Alex)<br><br>
Designers: Chandgothia, Deepit | Lu, Hanfeng (Paul)<br><br>
Developers: Alper, Anil | Chandgothia, Deepit | Ono Sant'anna, Vinicius
</center></h4>")
          )
        ),
        tags$hr(),
        fluidRow(
          column(
            12,
            shiny::HTML("<center> <h2>Methodology</h2> </center><br>"),
            shiny::HTML("<center><h4>We used R Shiny along with GitHub for software development and version control using Git. <br><br>
            Our team came up with the 2 levels of games in our app with the help of Professor Abhinaba Nandy (Instructor in Economics, Grinnell College). <br><br>
            Each person on the development team was responsible for a tab which they ownership over. 
            They would pull the most recent version of the application from the master branch and work in their own separate branch. <br><br>
            In this way once they were done implementing a new feature, they could easily create a pull request where other members of the development team could review their changes, 
            and eventually merge their code to the master branch if everything was working as expected.
</center></h4>")
          )
        ),
        tags$hr(),
        fluidRow(
          column(
            12,
            shiny::HTML("<center> <h2>Identify the problem</h2> </center><br>"),
            shiny::HTML("<center><h4>The first step in the research process was to identify the problem that we wanted to solve with the game app. <br><br>
            We decided to use game theory as a framework for the game because it is a simple yet interesting concept that is applicable in many real-life situations.
</center></h4>")
          )
        ),
        tags$hr(),
        fluidRow(
          column(
            12,
            shiny::HTML("<center> <h2>Develop a research question</h2> </center><br>"),
            shiny::HTML("<center><h4>After identifying the problem, we developed a research question that would guide our design process.<br><br> 
            Our research question was: How can we create a game app that uses game theory to help users understand this concept and make it interesting and educational?
</center></h4>")
          )
        ),
        tags$hr(),
        fluidRow(
          column(
            12,
            shiny::HTML("<center> <h2>Conduct literature review</h2> </center><br>"),
            shiny::HTML("<center><h4>We conducted a literature review to gather information about game theory and its applications in different fields, as well as to understand how other game apps have been designed and how they have been received by users.
</center></h4>")
          )
        ),
        tags$hr(),
        fluidRow(
          column(
            12,
            shiny::HTML("<center> <h2>Design the game app</h2> </center><br>"),
            shiny::HTML("<center><h4>Based on the information gathered from the literature review, we designed the game app using wireframes and screen mockups. <br><br>
            The design included a home page that would provide an overview of the game, a game page where the user could play the game, and a catalog page where the user could see the results of the game.
</center></h4>")
          )
        ),
        tags$hr(),
        fluidRow(
          column(
            12,
            shiny::HTML("<center> <h2>Test the game app</h2> </center><br>"),
            shiny::HTML("<center><h4>The first step in the research process was to identify the problem that we wanted to solve with the game app. <br><br>
            We decided to use game theory as a framework for the game because it is a simple yet interesting concept that is applicable in many real-life situations.
</center></h4>")
          )
        ),
        tags$hr(),
        fluidRow(
          column(
            12,
            shiny::HTML("<center> <h2>Analyze and interpret the results</h2> </center><br>"),
            shiny::HTML("<center><h4>We analyzed the data collected from the testing of the game app to understand its effectiveness in achieving our research question. <br><br>
            We interpreted the results to determine the strengths and weaknesses of the app and made recommendations for improvement.
</center></h4>")
          )
        ),
        tags$hr(),
        fluidRow(
          column(
            12,
            shiny::HTML("<center> <h2>Write the research report</h2> </center><br>"),
            shiny::HTML("<center><h4>Finally, we wrote a research report summarizing the process, findings, and recommendations of our research.<br><br><br><br>
</center></h4>")
          )
        )
      ),
      tabPanel(
        "Acknowledgements",
        id = "Acknowledgements",
        fluidRow(
          div(img(src = "acknowledgement.png", height = "200px"), style = "text-align: center;"),
          tags$hr(),
          column(1),
          column(
            10,
            shiny::HTML("<center><h2>Letter of Acknowledgement</h2></center><br>"),
            shiny::HTML("<h4>We would like to express our profound gratitude to Professor Eliott, of the Computer Science Department at Grinnell College for giving us this great opportunity and for their contributions to the completion of our project titled Game Theory.<br><br>
We would also like to express our sincere thank you to Professor Abhinaba Nandy (Instructor in Economics, Grinnell College) for their help in the brainstorming stage of this application and for thieir constant input which helped us as we developed this application.<br><br>
Our special thanks to our mentor JaeChul Jung and the students of TUT-100-13 Machines, Space, & Topology for their time and efforts they provided throughout the semester. Their useful advice and suggestions were really helpful to us during the project’s completion. In this aspect, we are eternally grateful to all of them.<br>
<br>
To conclude we would like to acknowledge that this project was completed entirely by us and not by anyone else.<br>
<br>
Sincerely<br>
Game Theory Group (CSC-324 Fall 2022)<br>
</h4>")
          ),
          column(1)
        )
        
      )
    )
  )
}