

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

hex <- function(input, output, session, hex_logo, reset = reactiveValues(x = NULL), block = reactiveValues(x = NULL)) {
  
  click_status <- reactiveValues(show = FALSE, hex = hex_logo, ts = Sys.time(), found = FALSE)
  
  observeEvent(input$hex_click, {
    if (!click_status$found) {
      click_status$show <- !click_status$show
      click_status$ts <- Sys.time()
    }
  })
  
  observeEvent(block$x, {
    if (hex_logo %in% block$x) {
      click_status$found <- TRUE
    }
  })
  
  observeEvent(reset$x, {
    if (hex_logo %in% reset$x & !click_status$found) {
      click_status$show <- FALSE
    }
  })
  
  output$hex <- renderImage({
    if (!click_status$show) {
      list(
        src = "www/rstats-hex.png", 
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


