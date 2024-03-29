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
  v_mutate(\(x) x^2)

1:10 %>%
  v_mutate(\(x) x^5 + 10, \(x) x <= 4)

1:10 %>%
  v_mutate(999, \(x) x <= 4)

1:10 %>%
  v_mutate(\(x) x^2, \(x) x %% 2 == 0)


1:10 %>%
  v_mutate(999, FALSE)

1:10 %>%
  v_mutate(999, TRUE)

1:10 %>%
  v_mutate(999, c(TRUE, FALSE) %>% vituripackage::sample_safe(10))

tibble(
  a = c(NA_character_, 'a') %>% vituripackage::sample_safe(10)
  ,b = 'b'
) %>%
  mutate(
    a = a %>% v_mutate(b, is.na)
  )

1:10 %>%
  v_filter(\(x) x^2 < 7)

iris %>%
  as_tibble()
