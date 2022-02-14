#' The application User-Interface
#' 
#' @param request Internal parameter for `{shiny}`. 
#'     DO NOT REMOVE.
#' @import shiny shiny.semantic
#' @noRd
app_ui <- function(request) {
  tagList(
    # Leave this function for adding external resources
    golem_add_external_resources(),
    # Your application UI logic 
    
    shiny.semantic::semanticPage(
      
      
      # tags$ul(
      #   id = "myMenu",
      #   tags$li(tags$a(href = "#firstPage", "First Section")) %>% tagAppendAttributes(`data-menuanchor` = "firstPage"),
      #   tags$li(tags$a(href = "#secondPage", "Second Section")) %>% tagAppendAttributes(`data-menuanchor` = "secondPage")
      # ),
      
      div(
        id = "pagepiling",
        div(
          id = "section1",
          class = "section pp-scrollable",
          mod_gallery_ui("gallery")
        ),
        
        div(
          class = "section pp-scrollable",
          mod_fun_ui("fun")
        ),
        div(
          class = "section pp-scrollable",
          mod_about_the_app_ui("about_the_app")
        ),
        div(
          class = "section pp-scrollable",
          
          div(
            class = "container",
            mod_about_me_ui("about_me")
            
          )
          
          
        )
        
      )
      
    )
    
  )
}

#' Add external Resources to the Application
#' 
#' This function is internally used to add external 
#' resources inside the Shiny application. 
#' 
#' @import shiny
#' @importFrom golem add_resource_path activate_js favicon bundle_resources
#' @noRd
golem_add_external_resources <- function(){
  
  add_resource_path(
    'www', app_sys('app/www')
  )
 
  tags$head(
    favicon(),
    bundle_resources(
      path = app_sys('app/www'),
      app_title = 'shiny.me'
    ),
    # Add here other external resources
    # for example, you can add shinyalert::useShinyalert() ,
    tags$script(type = "text/javascript", src = "https://cdnjs.cloudflare.com/ajax/libs/pagePiling.js/1.5.6/jquery.pagepiling.min.js"),
    tags$link(rel = "stylesheet", type = "text/css", href = "https://cdnjs.cloudflare.com/ajax/libs/pagePiling.js/1.5.6/jquery.pagepiling.css"),
    tags$script(type ="text/javascript", src="https://cdn.jsdelivr.net/npm/typed.js@2.0.12")
  )
}

