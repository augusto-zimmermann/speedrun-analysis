library(tidyverse)
library(lubridate)
library(dplyr)

df <- read_csv("runs-data.csv")
head(df, 5)

# Limpieza de variables
df_clean <- df %>%
  # Dropeamos las columnas que no vamos a usar
  select(-c(realTime, realTimeNoLoads, inGameTime, levelId, examiner, variablesAndValues, verifiedDate, statusReason)) %>%
  # Filtra solo ejecuciones verificadas y tiempos positivos
  filter(
    status == "verified",
    primaryTime > 0
  ) %>%
  # Extrae el año como variable numerica (gracias lubridate)
  mutate(
    year = year(date)
  ) %>%
  filter(year > 2024) %>%
  # Dropea filas con nulos en las variables clave del modelo
  drop_na(platform, year)

# Estructura del dataset limpio
head(df_clean, 5)
glimpse(df_clean)

# Guardar el archivo limpio
write_csv(df_clean, "runs-clean.csv")
