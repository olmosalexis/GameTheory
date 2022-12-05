library(shiny)

# this function makes a html box with title and content.
boxCard <- function(title, content="", id="0", style="") {
  tags$div(
    style=paste0("border-radius: 5px; 
                 box-shadow: 1px 2px; 
                 margin: 5px 5px; 
                 width:30%; 
                 height:80px; 
                 border-color:black; 
                 border-left: 1px solid #000;
                 border-right: 1px solid #000;
                 border-top: 1px solid #000;
                 border-down: 1px solid #000;
                 padding:10px;
                 background-color: #00FFF6",
                 style),
    id=id,
    onclick = sprintf(
      "Shiny.setInputValue('game', '%d');",
      id
    ) ,
    tags$div(
      title
    ),
    tags$div(
      paste("# of players:",content)
    )
  )
}