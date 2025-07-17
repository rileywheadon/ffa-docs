## ----include = FALSE----------------------------------------------------------
knitr::opts_chunk$set(
  collapse = TRUE,
  comment = "#>"
)

## ----fig.width = 10, fig.height = 8, fig.align = "center", out.width = "100%"----
library(ffaframework)

csv_path <- system.file("extdata", "Application_3.1.csv", package = "ffaframework")
df <- read.csv(csv_path, comment.char = "#")
df <- subset(df, !is.na(max)) # Remove missing values

head(df)

plot_ams_data(df$max, df$year, title = "Bow River at Banff (05BB001)")

## -----------------------------------------------------------------------------
mk_test <- eda_mk_test(df$max)

print(mk_test$p_value)

## ----fig.width = 10, fig.height = 8, fig.align = "center", out.width = "100%"----
spearman_test <- eda_spearman_test(df$max)

print(spearman_test$least_lag)

plot_spearman_test(spearman_test)

## ----fig.width = 10, fig.height = 8, fig.align = "center", out.width = "100%"----
mean_trend <- eda_sens_trend(df$max, df$year)

plot_sens_trend(df$max, df$year, mean_trend = mean_trend)

## ----fig.width = 10, fig.height = 8, fig.align = "center", out.width = "100%"----
runs_test <- eda_runs_test(mean_trend)

print(runs_test$p_value)

plot_runs_test(runs_test, "Runs Test (AMS Mean)")

