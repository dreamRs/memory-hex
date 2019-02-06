

# utiils ------------------------------------------------------------------

which_show <- function(l, indice = NULL) {
  res <- lapply(l, `[[`, "show")
  res <- unlist(res)
  if (all(!res)) {
    return(NULL)
  }
  ts <- unlist(lapply(l[res], `[[`, "ts"), use.names = FALSE)
  res <- names(l)[res]
  res <- res[order(ts, decreasing = FALSE)]
  if (is.null(indice)) {
    res
  } else {
    as_null(res[indice])
  }
}

as_null <- function(x) {
  if (is.na(x)) {
    NULL
  } else {
    x
  }
}

which_hex <- function(l, module) {
  res <- lapply(module, function(x) l[[x]]$hex)
  unlist(res, use.names = FALSE)
}
