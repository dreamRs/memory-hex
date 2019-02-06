

# utiils ------------------------------------------------------------------

which_show <- function(l, indice = NULL) {
  res <- lapply(l, `[[`, "show")
  if (is.null(indice)) {
    names(l)[unlist(res)]
  } else {
    as_null(names(l)[unlist(res)][indice])
  }
}

as_null <- function(x) {
  if (is.na(x)) {
    NULL
  } else {
    x
  }
}

