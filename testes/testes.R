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

