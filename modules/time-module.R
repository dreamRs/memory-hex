

# Time module -------------------------------------------------------------

time_UI <- function(id) {
  ns <- NS(id)
  tags$div(
    style = "width: 100%; text-align: right;",
    "Time elapsed:",
    uiOutput(outputId = ns("timer_ui"), style = "font-size: 180%; font-weight: bold;", inline = TRUE)
  )
}

time <- function(input, output, session, start = reactiveValues(x = FALSE)) {
  
  time_r <- reactiveVal(value = 0)
  
  observe({
    if (start$x) {
      invalidateLater(1000, session)
      isolate({
        newTime <- time_r() + 1
        time_r(newTime)
      })
    }
  })
  
  output$timer_ui <- renderUI({
    as.character(time_r())
  })
  
  return(time_r)
}
