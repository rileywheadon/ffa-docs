## ----include = FALSE----------------------------------------------------------
knitr::opts_chunk$set(
  collapse = TRUE,
  comment = "#>"
)

## ----setup--------------------------------------------------------------------
library(ffaframework)
csv_path <- system.file("extdata", "Application_3.3.csv", package = "ffaframework")
df <- read.csv(csv_path)
df <- subset(df, !is.na(max)) # Remove missing values

## -----------------------------------------------------------------------------
mk_test <- eda_mk_test(df$max)

print(mk_test$p_value)

## ----fig.width = 10, fig.height = 8, fig.align = "center", out.width = "100%"----
spearman_test <- eda_spearman_test(df$max)

print(spearman_test$least_lag)

plot_spearman_test(spearman_test)

## ----fig.width = 10, fig.height = 8, fig.align = "center", out.width = "100%"----
bbmk_test <- eda_bbmk_test(df$max)

print(bbmk_test$p_value)

plot_bbmk_test(bbmk_test)

## ----fig.width = 10, fig.height = 8, fig.align = "center", out.width = "100%"----
sens_trend <- eda_sens_trend(df$max, df$year)

plot_sens_trend(sens_trend, "mean")

## ----fig.width = 10, fig.height = 8, fig.align = "center", out.width = "100%"----
runs_test <- eda_runs_test(sens_trend)

print(runs_test$p_value)

plot_runs_test(runs_test, "mean")

## -----------------------------------------------------------------------------
mw <- ams_mw_variance(df$max, df$year)
mwmk_test <- eda_mk_test(mw$std)
print(mwmk_test$p_value)

## -----------------------------------------------------------------------------
white_test <- eda_white_test(df$max, df$year)
print(white_test$p_value)

