## ----include = FALSE----------------------------------------------------------
knitr::opts_chunk$set(
  collapse = TRUE,
  comment = "#>"
)

## ----setup--------------------------------------------------------------------
library(ffaframework)

csv_path <- system.file("extdata", "Application_2.csv", package = "ffaframework")
df <- read.csv(csv_path)
df <- subset(df, !is.na(max)) # Remove missing values

head(df)

## ----fig.width = 10, fig.height = 8, fig.align = "center", out.width = "100%"----
pettitt_test <- eda_pettitt_test(df$max, df$year)

print(pettitt_test$p_value)

print(pettitt_test$change_year)

plot_pettitt_test(pettitt_test)

## ----fig.width = 10, fig.height = 8, fig.align = "center", out.width = "100%"----
mks_test <- eda_mks_test(df$max, df$year)

print(mks_test$p_value)

print(mks_test$change_df$year)

plot_mks_test(mks_test)

