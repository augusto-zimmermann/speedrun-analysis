# Análisis de Runs en Speedrun.com

Un proyecto de exploración de datos y modelado estadístico sobre [**Speedrun.com**](https://www.speedrun.com/). Aplicamos modelos lineales para entender qué factores influyen en los tiempos récord y cómo impacta la competitividad de la comunidad en el rendimiento de un juego.

## Pautas del Proyecto

- **Unidad de Estudio:** Una run / juego individual registrado en la plataforma.
- **Variable Objetivo ($Y$):** Duración en segundos (`time_seconds`), cuantitativa continua.
- **Metodología:** Regresión Lineal Múltiple (MCO / OLS) y verificación de supuestos estadísticos.
- **Muestra:** $+200$ observaciones reales y verificadas.

---

## Para bajar el dataset

[Kaggle.com - Speedrun-com-data by alexmerren1](https://www.kaggle.com/datasets/alexmerren1/speedrun-com-data)

### Linux / Mac

```bash
#!/bin/bash
curl -L -o ~/Downloads/speedrun-com-data.zip https://www.kaggle.com/api/v1/datasets/download/alexmerren1/speedrun-com-data
```

### Windows

```cmd
curl -L -o "%USERPROFILE%\Downloads\speedrun-com-data.zip" https://www.kaggle.com/api/v1/datasets/download/alexmerren1/speedrun-com-data
```

---

## Preguntas de Investigación Consideradas

### Cómo varía la duración del récord mundial según la cantidad de runners activos?

- **Objetivo:** Analizar el impacto de la competitividad y el volumen de la comunidad sobre la reducción en el tiempo final del récord.
- **Variables Predictoras Candidatas:**
  - `active_runners` (Numérica): Cantidad de jugadores únicos con subidas registradas.
  - `game_age` (Numérica): Años desde el lanzamiento del juego.
  - `platform` (Categórica): Plataforma (PC, Consolas, Handheld).
  - `is_emulated` (Categórica/Dummie): Uso de emulador (Sí/No).

> Existe un techo de habilidad para un jugador según el tiempo runneando un juego?
