#' fun UI Function
#'
#' @description A shiny Module.
#'
#' @param id,input,output,session Internal parameters for {shiny}.
#'
#' @noRd 
#'
#' @importFrom shiny NS tagList 
mod_fun_ui <- function(id){
  ns <- NS(id)
  tagList(
    div(
      class = "container-fun",
      
      div(),
      
      
      div(
        h1("Let's have some fun!"),
        p("What fun is a shiny app without interactivity? Let's have some fun with ggplot2"),
        plotOutput(ns("plot")),
        downloadButton(ns("download")),
        
        br(),
        
        div(
          class = "inputs",
          
          
          numericInput(ns("n"), "Number of rectangles", 100, 1),
          selectInput(ns("prob"), "Proportion of colored rectangles", c("< 30%" = 1, "~50%" = 2, "> 80%" = 3)),
          selectInput(ns("palette"), "Color Palette", c("Pastel", "Bold", "Antique", "Safe")),
          colourpicker::colourInput(ns("bg_col"), "Background", value = "white", allowTransparent = TRUE),
          colourpicker::colourInput(ns("main_col"), "Main (The common rectangles)", value = "lightgrey", allowTransparent = TRUE),
          numericInput(ns("size"), "Pencil size", 1, 0, 5),
          textInput(ns("caption"), "Caption", "A gift from Zauad Shahreer"),
          numericInput(ns("font_size"), "Caption font size", 15, 10),
          colourpicker::colourInput(ns("caption_col"), "Caption font-color", value = "darkgrey"),
          checkboxInput(ns("fixed_seed"), "No randomness?", FALSE) %>% 
            tagAppendAttributes(style = "margin-top: 30px")

        )
        

        

      )
      

    )

  )
}
    
#' fun Server Functions
#'
#' @noRd 
mod_fun_server <- function(id){
  moduleServer( id, function(input, output, session){
    ns <- session$ns
    
    seed = reactiveVal()
    
    observeEvent(input$fixed_seed, {
      if (input$fixed_seed) {
        seed(123)
      } else {
        seed(NULL)
      }
    })
    
    output$plot = renderPlot({
      
      req(input$n, input$font_size)
      
      set.seed(seed())
      
      p = dplyr::case_when(
        input$prob == 1 ~ c(rep(0.02, 12), 0.76),
        input$prob == 2 ~ c(rep(0.04, 12), 0.52),
        input$prob == 3 ~ c(rep(0.07, 12), 0.16)
      )
      
      make_plot(
        n = input$n,
        caption = input$caption,
        col_palette = input$palette,
        bg_col = input$bg_col,
        main_col = input$main_col,
        size = input$size,
        caption_font_size = input$font_size,
        caption_col = input$caption_col,
        p = p
      )
    })
    
    output$download = downloadHandler(
      filename = function() {
        paste0("souvenir.png")
      },
      content = function(file) {
        ggplot2::ggsave(file)
      }
    )
    
  })
}
    
## To be copied in the UI
# mod_fun_ui("fun_ui_1")
    
## To be copied in the server
# mod_fun_server("fun_ui_1")
