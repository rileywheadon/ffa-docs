## ----include = FALSE----------------------------------------------------------
knitr::opts_chunk$set(
  collapse = TRUE,
  comment = "#>"
)

## ----fig.width = 10, fig.height = 8, fig.align = "center", out.width = "100%"----
library(ffaframework)

csv_path <- system.file("extdata", "Application_5.csv", package = "ffaframework")
df <- read.csv(csv_path, comment.char = "#")
df <- subset(df, !is.na(max)) # Remove missing values

head(df)

plot_ams_data(df$max, df$year, title = "Mission Creek near East Kelowna (08NM116)")

## -----------------------------------------------------------------------------
mw <- ams_mw_variability(df$max, df$year)
mwmk_test <- eda_mk_test(mw$std)
print(mwmk_test$p_value)

## -----------------------------------------------------------------------------
white_test <- eda_white_test(df$max, df$year)
print(white_test$p_value)

## ----fig.width = 10, fig.height = 8, fig.align = "center", out.width = "100%"----
variability_trend <- eda_sens_trend(mw$std, mw$year)

plot_sens_trend(df$max, df$year, variability_trend = variability_trend)

## ----fig.width = 10, fig.height = 8, fig.align = "center", out.width = "100%"----
runs_test <- eda_runs_test(variability_trend)

print(runs_test$p_value)

plot_runs_test(runs_test, title = "Runs Test (AMS Variability)")

