

# Welcome module ----------------------------------------------------------


welcome_UI <- function(id) {
  ns <- NS(id)
  modalDialog(
    title = "Welcome to memory Hex game !",
    "Blabla", 
    footer = actionButton(
      inputId = ns("play"),
      label = "Play !",
      icon = icon("play"),
      style = "width: 100%"
    )
  )
}

welcome <- function(input, output, session) {
  
  id <- gsub("-$", "", session$ns(""))
  showModal(ui = welcome_UI(id))
  
  observeEvent(input$play, {
    removeModal()
  })
  
  return(reactive(input$play))
}

