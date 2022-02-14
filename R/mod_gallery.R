#' gallery UI Function
#'
#' @description A shiny Module.
#'
#' @param id,input,output,session Internal parameters for {shiny}.
#'
#' @noRd 
#' @import rtypedjs 
#' @importFrom shiny NS tagList 
mod_gallery_ui <- function(id){
  ns <- NS(id)
  tagList(
    
    
    h1("The way we R"), 
      
    h3("A portfolio of R Shiny apps, R packages and HTMLWidgets"),
    h5("Zauad Shahreer Abeer", style = "text-align: center; color: #aaa;"),
    
    div(
      class = "container-gallery",
      

      
      shiny.semantic::cards(
        class = "ui link cards",
        
        shiny.semantic::card(
          class = "ui raised card",
          div(
            class = "image image-card",
            tags$img(src = "www/my_blog.png")
          ),
          div(
            class="content",
            div(class="header", "The way we R"),
            div(class="meta", "A blog by Zauad"),
            div(class="description", "Written with {blogdown}")
          ),
          div(class = "extra content", span("See link"))
        ),
        
        
        shiny.semantic::card(
          class = "ui raised card",
          div(
            class = "image",
            tags$img(src = "www/leibniz-psychology_psychtopics.png")
          ),
          div(
            class="content",
            div(class="header", "The way we R"),
            div(class="meta", "A blog by Zauad"),
            div(class="description", "Written with {blogdown}")
          ),
          div(class = "extra content", span("See link"))
        )
        
      )
      
    )
    
  )
}
    
#' gallery Server Functions
#'
#' @noRd 
mod_gallery_server <- function(id){
  moduleServer( id, function(input, output, session){
    ns <- session$ns
    rtypedjs::typed()
  })
}
    
## To be copied in the UI
# mod_gallery_ui("gallery_ui_1")
    
## To be copied in the server
# mod_gallery_server("gallery_ui_1")
