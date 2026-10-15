library(tidyverse)
library(ggplot2)
library(lubridate)

df <- read_csv("runs-data.csv")
head(df, 5)
# Limpieza de variables
df_clean <- df %>%
  # Filtrar solo ejecuciones verificadas (descarta las rechazadas)
  filter(status == "verified") %>%
  # Parsear fecha y extraer el año como variable numerica
  mutate(
    date_parsed = as.Date(date),
    year = year(date_parsed)
  ) %>%
  # Filtrar filas con nulos en las variables clave del modelo
  drop_na(time_seconds, platform, year) %>%
  # Asegurar tiempos positivos
  filter(time_seconds > 0)

# Verificacion de los resultados
cat("=== VERIFICACIÓN DEL DATASET LIMPIO ===\n")
cat("Filas originales:", nrow(df), "\n")
cat("Filas tras la limpieza:", nrow(df_clean), "\n\n")

# Estructura del dataset limpio
glimpse(df_clean)

# Guardar el archivo limpio
write_csv(df_clean, "runs_clean.csv")
