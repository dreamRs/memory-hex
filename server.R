
#  ------------------------------------------------------------------------
#
# Title : Memory Hex - Server
#    By : dreamRs
#  Date : 2019-02-06
#    
#  ------------------------------------------------------------------------

library("shiny")

function(input, output, session) {
  
  start <- callModule(module = welcome, id = "welcome")
  timer <- callModule(module = time, id = "timer", start = start)
  
  hex_png <- sample(list.files(path = "www/hex/", pattern = "png$"), n_hex)
  hex_png <- sample(rep(hex_png, 2))
  
  results_mods <- reactiveValues()
  results_mods_parse <- reactiveValues(all = NULL, show1 = NULL, show2 = NULL, show3 = NULL)
  reset <- reactiveValues(x = NULL)
  block <- reactiveValues(x = NULL)
  
  lapply(
    X = seq_len(n_hex * 2),
    FUN = function(x) {
      results_mods[[paste0("module", x)]] <- callModule(
        module = hex,
        id = paste0("module", x),
        hex_logo = hex_png[x],
        reset = reset,
        block = block
      )
    }
  )
  
  observe({
    res_mod <- lapply(
      X = reactiveValuesToList(results_mods), 
      FUN = reactiveValuesToList
    )
    results_mods_parse$all <- res_mod
    results_mods_parse$show1 <- which_show(res_mod, 1)
    results_mods_parse$show2 <- which_show(res_mod, 2)
    results_mods_parse$show3 <- which_show(res_mod, 3)
  })
  
  observeEvent(results_mods_parse$show2, {
    hex1 <- which_hex(results_mods_parse$all, results_mods_parse$show1)
    hex2 <- which_hex(results_mods_parse$all, results_mods_parse$show2)
    if (identical(hex1, hex2)) {
      block$x <- hex1
    }
  })
  
  observeEvent(results_mods_parse$show3, {
    reset$x <- which_hex(
      results_mods_parse$all,
      c(results_mods_parse$show1, results_mods_parse$show2)
    )
    results_mods_parse$show1 <- NULL
    results_mods_parse$show2 <- NULL
    results_mods_parse$show1 <- results_mods_parse$show3
    results_mods_parse$show3 <- NULL
  })
  
  
  observe({
    allfound <- all_found(results_mods_parse$all)
    if (isTRUE(allfound)) {
      showModal(modalDialog(
        tags$div(
          style = "text-align: center;",
          tags$h2(
            tags$span(icon("trophy"), style = "color: #F7E32F;"),
            "Well done !",
            tags$span(icon("trophy"), style = "color: #F7E32F;")
          ),
          tags$h4("You've find all matching hex in"),
          tags$h1(isolate(timer()), "seconds!"),
          tags$br(), tags$br(),
          actionButton(
            inputId = "reload",
            label = "Play again !",
            style = "width: 100%;"
          )
        ),
        footer = NULL,
        size = "l",
        easyClose = FALSE
      ))
    }
  })
  
  
  observeEvent(input$reload, {
    session$reload()
  }, ignoreInit = TRUE)
  
  
  output$test_res_show <- renderPrint({
    c(results_mods_parse$show1, results_mods_parse$show2, results_mods_parse$show3)
  })
  
  output$test_res <- renderPrint({
    results_mods_parse$all
  })


  
}
