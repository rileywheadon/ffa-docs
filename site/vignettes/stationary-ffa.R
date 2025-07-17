## ----include = FALSE----------------------------------------------------------
knitr::opts_chunk$set(
  collapse = TRUE,
  comment = "#>"
)

## ----fig.width = 10, fig.height = 8, fig.align = "center", out.width = "100%"----
library(ffaframework)

csv_path <- system.file("extdata", "Application_1.csv", package = "ffaframework")
df <- read.csv(csv_path, comment.char = "#")
df <- subset(df, !is.na(max)) # Remove missing values

head(df)

plot_ams_data(df$max, df$year, title = "Athabasca River at Athabasca (07BE001)")

## ----fig.width = 10, fig.height = 8, fig.align = "center", out.width = "100%"----
selection <- select_ldistance(df$max)

print(selection$recommendation)

plot_lmom_diagram(selection)

## -----------------------------------------------------------------------------
params <- fit_lmom_gev(df$max)$params

print(params)

## ----fig.width = 10, fig.height = 8, fig.align = "center", out.width = "100%"----
uncertainty <- uncertainty_bootstrap(df$max, "GEV", "L-moments")

print(uncertainty[[1]]$estimates)

plot_sffa(uncertainty)

## ----fig.width = 10, fig.height = 8, fig.align = "center", out.width = "100%"----
diagnostics <- model_diagnostics(df$max, "GEV", params, uncertainty)

plot_model_diagnostics(diagnostics)

