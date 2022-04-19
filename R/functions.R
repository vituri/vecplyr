#' @export
filter.numeric = function(.data, .f, ..., .preserve = FALSE) {
  x = .data
  ids = .f(x)
  y = x[ids]
  return(y)
}

#' @export
filter.character = filter.numeric

#' @export
filter.factor = filter.character
