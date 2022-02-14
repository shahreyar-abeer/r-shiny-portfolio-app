#' about_me UI Function
#'
#' @description A shiny Module.
#'
#' @param id,input,output,session Internal parameters for {shiny}.
#'
#' @noRd 
#'
#' @importFrom shiny NS tagList 
mod_about_me_ui <- function(id){
  ns <- NS(id)
  tagList(
    
    div(),
    
    div(
      h1("Zauad Shahreer Abeer"),
      
      div(
        div(
          class = "about-me",
          
          tags$p(
            "> This is me",
            br(),
            "> Not this though",
            br(),
            "The way we are",
            "The way we R."
          )
          
          #tags$p(stringr::str_sub(shinipsum::lorem, 1, 600)),
          
        ),
        tags$span(id = "typed")
        
      )
    )
    
    
    

    
  )
}
    
#' about_me Server Functions
#'
#' @noRd 
mod_about_me_server <- function(id){
  moduleServer( id, function(input, output, session){
    ns <- session$ns
    
    
  })
}
    
## To be copied in the UI
# mod_about_me_ui("about_me_ui_1")
    
## To be copied in the server
# mod_about_me_server("about_me_ui_1")
