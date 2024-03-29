if_is_formula_then_mapper = function(.f) {
  if (purrr::is_formula(.f)) {
    .f = purrr::as_mapper(.f)
  }

  .f
}

#' Filter a vector
#' @param .x A vector.
#' @param .f A single predicate function (or purrr formula) or a logical vector of the same length as .x.
#' @return The vector .x with (possibly) some entries deleted.
#' @export
v_filter = function(.x, .f = v_all_true) {
  if (purrr::is_empty(.x)) return(.x)
  .f %<>% if_is_formula_then_mapper()

  ids = .f(.x)
  y = .x[ids]
  return(y)
}

#' Modify a vector with some function
#' @param .x A vector.
#' @param .f A function (or purrr formula) to apply in .x or a vector of the same length as .x.
#' @param .p A single predicate function (or purrr formula) or a logical vector of the same length as .x. Only those elements where .p evaluates to TRUE will be modified.
#' @return The vector .x with possibly some entries modified by .f.
#' @export
#' @export
v_mutate = function(.x, .f = identity, .p = v_all_true) {

  if (purrr::is_empty(.x)) return(.x)

  .f %<>% if_is_formula_then_mapper()
  .p %<>% if_is_formula_then_mapper()

  .p = v_to_fun(.p)
  ids = .p(.x)

  if (all(!ids)) {
    return(.x)
  }

  .f = v_to_fun(.f)

  y = .x

  y[ids] = (.f(.x))[ids]

  return(y)
}

#' @export
in_set = function(x, set = x) {
  x %in% set
}

#' @export
in_set_func = function(x, set = x) {
 purrr::partial(in_set, set = set)
}

#' Check if two objects are identical
#' @param a an object.
#' @param b an object.
#' @return TRUE if a and b are identical; FALSE otherwise.
#' @export
`%is%` = function(a, b) {
  identical(a, b)
}
