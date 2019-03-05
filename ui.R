
#  ------------------------------------------------------------------------
#
# Title : Memory Hex - UI
#    By : dreamRs
#  Date : 2019-02-06
#    
#  ------------------------------------------------------------------------

library("shiny")

fluidPage(
  
  tags$head(
    tags$link(href="styles.css", rel="stylesheet", type="text/css"),
    tags$script(src = "http://platform.twitter.com/widgets.js")
  ),
  
  tags$div(
    class = "title-app",
    tags$h1("Hex memory game"),
    tags$h4("Find matching hex!")
  ),
  tags$br(),
  
  # verbatimTextOutput("test_res_show"),
  
  tags$div(
    style = "width: 650px; margin: auto;",
    time_UI("timer"),
    tags$br(),
    lapply(
      X = seq_len(n_hex * 2),
      FUN = function(x) {
        hex_UI(id = paste0("module", x))
      }
    )#,
    # verbatimTextOutput("test_res")
  )
  
)
