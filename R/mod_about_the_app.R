#' about_the_app UI Function
#'
#' @description A shiny Module.
#'
#' @param id,input,output,session Internal parameters for {shiny}.
#'
#' @noRd 
#'
#' @importFrom shiny NS tagList 
mod_about_the_app_ui <- function(id){
  ns <- NS(id)
  tagList(
    
    div(
      class = "container-about-app",
      div(
        class = "app-col1",
        "AA"
      ),
      
      div(
        class = "app-col2",
        
        h1("About the App"),
        
        tags$ul(
          tags$li("This is an R Shiny App that works as a kind of portofolio for the author, Zauad."),
          tags$li("The app uses {golem} for framework.")
        )
      )
    )
    
  )
}
    
#' about_the_app Server Functions
#'
#' @noRd 
mod_about_the_app_server <- function(id){
  moduleServer( id, function(input, output, session){
    ns <- session$ns
 
  })
}
    
## To be copied in the UI
# mod_about_the_app_ui("about_the_app_ui_1")
    
## To be copied in the server
# mod_about_the_app_server("about_the_app_ui_1")
