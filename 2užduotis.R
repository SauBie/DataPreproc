#2 uzd ----
tidyr::billboard
names(tidyr::billboard)
str(tidyr::billboard)

billboard <- tidyr::billboard
billboard <- billboard %>%
  pivot_longer(names_to = 'week_number',
               values_to = 'rank',
               cols = -c(artist, track, date.entered))

billboard <- billboard %>% drop_na()

x1 <- as.Date("2000-01-01")
x2 <- as.Date("2000-12-31")
billboard2000 <- billboard %>%
  filter(x1 <= date.entered & date.entered <= x2) %>%
  count(track)
billboard2000BestSong <- billboard2000 %>%
  arrange(desc(n))
print(billboard2000BestSong[1,1])