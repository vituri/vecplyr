# genericas ---------------------------------------------------------------
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

# novas -------------------------------------------------------------------
v_to_fun = function(.x) {
  if (is.function(.x)) {
    .f = .x
  } else {
    .f = function(x) {
      if (length(.x) == 1) {
        rep(.x, times = length(x))
      } else {
        .x
      }
    }
  }

  return(.f)
}

v_all_true = function(.x) {
  rep(TRUE, length(.x))
}

#' @export
v_filter = function(.x, .f = v_all_true) {
  ids = .f(.x)
  y = .x[ids]
  return(y)
}

.x = 1:10
.f = c(99, 100) %>% vituripackage::sample_safe(10)
.p = c(TRUE, FALSE) %>% vituripackage::sample_safe(10)

#' @export
v_mutate = function(.x, .f = v_all_true, .p = v_all_true) {

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
  \(x) in_set(x, set)
}
