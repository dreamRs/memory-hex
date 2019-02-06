
#  ------------------------------------------------------------------------
#
# Title : Memory Hex - UI
#    By : dreamRs
#  Date : 2019-02-06
#    
#  ------------------------------------------------------------------------

library("shiny")

fluidPage(
  
  tags$div(
    style = "text-align: center; width: 100%; margin-top: 60px;",
    tags$h2("Hex memory game"),
    tags$h4("Find mathing hex!")
  ),
  tags$br(),
  tags$hr(),
  
  verbatimTextOutput("test_res_show"),
  
  tags$div(
    style = "width: 80%; margin: auto;",
    lapply(
      X = seq_len(n_hex * 2),
      FUN = function(x) {
        hex_UI(id = paste0("module", x))
      }
    ),
    verbatimTextOutput("test_res")
  )
  
)
