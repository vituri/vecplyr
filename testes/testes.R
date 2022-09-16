# genericas ---------------------------------------------------------------
#' @export
filter.default = function(.data, .f, ..., .preserve = FALSE) {
  .x = .data
  v_filter(.x = .x, .f = .f)
}

#' @export
mutate.default = function(.tbl, .funs, .predicate = NULL, ...) {
  .x = .tbl
  .f = .funs
  .p = .predicate

  v_mutate(.x = .x, .f = .f, .p = .p)
}

1:10 %>%
  filter(\(x) x >= 4)

letters[2:6] %>%
  filter(\(x) x %in% letters[1:3])

iris$Species %>%
  filter(\(x) x %in% 'setosa')

1:10 %>%
  mutate(\(x) x^2, \(x) x >= 4)

1:10 %>%
  mutate(999, \(x) x >= 4)

1:10 %>%
  mutate(\(x) x^4, in_set_func(7:9))

iris %>%
  slice_sample(n = 30) %>%
  mutate(Teste = Species %>% mutate('aaa', \(x) x %in% 'setosa'))

1:10 %>%
  in_set(5:14)

1:10 %>%
  v_filter(\(x) x >= 4)

1:10 %>%
  v_mutate(~ .x^2)

1:10 %>%
  v_mutate(\(x) x^5 + 10, \(x) x <= 4)

1:10 %>%
  v_mutate(999, \(x) x <= 4)

1:10 %>%
  v_mutate(999, ~ .x <= 4)

1:10 %>%
  v_mutate(\(x) x^2, \(x) x %% 2 == 0)

1:10 %>%
  v_mutate(999, FALSE)

1:10 %>%
  v_mutate(999, TRUE)

1:10 %>%
  v_mutate(999, c(TRUE, FALSE) %>% vituripackage::sample_safe(10))

dplyr::tibble(
  a = c(NA_character_, 'a') %>% vituripackage::sample_safe(10)
  ,b = 'b'
) %>%
  dplyr::mutate(
    if_a_is_na_then_b = a %>% v_mutate(b, is.na)
  )

1:10 %>%
  v_filter(\(x) x^2 < 7)

NA %>%
  v_filter(is.na %>% (purrr::negate))

mbm = microbenchmark::microbenchmark(
  vecplyr = {
    1:1e5 %>% v_filter(\(x) x^2 <= 5000)
  }
  ,purrr = {
    1:1e5 %>% purrr::keep(\(x) x^2 <= 5000)
  }

  ,times = 25L
)

ggplot2::autoplot(mbm)

