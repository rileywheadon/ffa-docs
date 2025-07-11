## ----include = FALSE----------------------------------------------------------
knitr::opts_chunk$set(
  collapse = TRUE,
  comment = "#>"
)

## ----setup--------------------------------------------------------------------
library(ffaframework)

csv_path <- system.file("extdata", "Application_3.1.csv", package = "ffaframework")
df <- read.csv(csv_path)
df <- subset(df, !is.na(max)) # Remove missing values

head(df)

## -----------------------------------------------------------------------------
trend <- list(location = TRUE, scale = FALSE)

## ----fig.width = 10, fig.height = 8, fig.align = "center", out.width = "100%"----
data_decomposed <- ams_decomposition(df$max, df$year, trend)

selection <- select_ldistance(data_decomposed)

print(selection$recommendation)

plot_lmom_diagram(selection)

## -----------------------------------------------------------------------------
fit <- fit_maximum_likelihood(
	df$max,
	"GNO",
	years = df$year,
	trend = trend
)

print(fit$params)

print(fit$mll)

## ----fig.width = 10, fig.height = 8, fig.align = "center", out.width = "100%"----
uncertainty <- uncertainty_rfpl(
	df$max,
	"GNO",
	years = df$year,
	trend = trend,
	slices = c(1925, 2025)
)

print(uncertainty[[2]]$estimates)

plot_nsffa(uncertainty)

