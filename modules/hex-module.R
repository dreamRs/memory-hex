

# Hex Image Module --------------------------------------------------------



hex_UI <- function(id) {
  ns <- NS(id)
  tagList(
    imageOutput(
      outputId = ns("hex"), 
      click = clickOpts(id = ns("hex_click"), clip = FALSE),
      width = 120, 
      height = 139, 
      inline = TRUE
    )
  )
}

hex <- function(input, output, session, hex_logo) {
  
  click_status <- reactiveValues(show = FALSE, hex = hex_logo)
  
  observeEvent(input$hex_click, {
    click_status$show <- !click_status$show
  })
  
  output$hex <- renderImage({
    if (!click_status$show) {
      list(
        src = "www/hex/RStudio.png", 
        width = 120, 
        height = 139, 
        contentType = "image/png"
      )
    } else {
      list(
        src = paste0("www/hex/", hex_logo), 
        width = 120, 
        height = 139, 
        contentType = "image/png"
      )
    }
  }, deleteFile = FALSE)
  
  return(click_status)
}


