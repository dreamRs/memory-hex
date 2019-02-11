
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
  
  # verbatimTextOutput("test_res_show"),
  
  tags$div(
    style = "width: 60%; margin: auto;",
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
