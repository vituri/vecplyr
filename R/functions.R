#' @export
filter.default = function(.data, .f, ..., .preserve = FALSE) {
  x = .data
  ids = .f(x)
  y = x[ids]
  return(y)
}

#' @export
mutate.default = function(.tbl, .funs, .predicate = NULL, ...) {

  x = .tbl

  if (is.null(.predicate)) {
    .predicate = \(x) rep(x = TRUE, times = length(x))
  }

  ids = .predicate(x)

  if (all(!ids)) {
    return(x)
  }

  y = x

  if (is.function(.funs)) {
    values = .funs(x[ids])
  } else {

    if (length(.funs) == 1) {
      .funs = rep(.funs, times = length(ids))
    }

    values = .funs[ids]
  }

  y[ids] = values

  return(y)
}

#' @export
in_set = function(x, set = x) {
  x %in% set
}

#' @export
in_set_func = function(x, set = x) {
  \(x) in_set(x, set)
}
