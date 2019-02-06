
#  ------------------------------------------------------------------------
#
# Title : Memory Hex - Server
#    By : dreamRs
#  Date : 2019-02-06
#    
#  ------------------------------------------------------------------------

library("shiny")

function(input, output, session) {
  
  hex_png <- sample(list.files(path = "www/hex/", pattern = "png$"), n_hex)
  hex_png <- sample(rep(hex_png, 2))
  
  results_mods <- reactiveValues()
  results_mods_parse <- reactiveValues(all = NULL, show1 = NULL, show2 = NULL)
  
  lapply(
    X = seq_len(n_hex * 2),
    FUN = function(x) {
      results_mods[[paste0("module", x)]] <- callModule(
        module = hex,
        id = paste0("module", x),
        hex_logo = hex_png[x]
      )
    }
  )
  
  observe({
    res_mod <- lapply(
      X = reactiveValuesToList(results_mods), 
      FUN = reactiveValuesToList
    )
    results_mods_parse$all <- res_mod
  })
  
  output$test_res <- renderPrint({
    results_mods_parse$all
  })


  
}
