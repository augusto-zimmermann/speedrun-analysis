library(tidyverse)
library(modelr)

# leaderboards-data.csv?
df <- read_csv("runs-clean.csv")

# Agrupacion por juego para obtener el record mundial y cantidad de runners únicos
game_stats <- df_clean %>%
  group_by(gameId) %>%
  summarise(
    wr_time = min(primaryTime),
    active_runners = n_distinct(players)
  )

# Ajuste del modelo de regresion lineal simple
modelo <- lm(wr_time ~ active_runners, data = game_stats)
summary(modelo)