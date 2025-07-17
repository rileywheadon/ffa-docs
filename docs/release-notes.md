# Changelog

## v0.2.1

Changes to the CLI:

- Fix `load_data` to better handle missing entries.
- Add Mission Creek and Lake Louise stations to the example datasets.
- Add station information to the top of each CSV file.

Changes to the package:

- Report error producing unreasonably wide confidence interval in `uncertainty_bootstrap`.
- Report numerical stability errors in `uncertainty_rfpl`.
- Add function `plot_ams_data` for plotting raw AMS data.
- Add an option to plot a trend in the variance when using `plot_sens_trend`.
- Modify `select_lkurtosis` to only recommend 3-parameter distributions.

Changes to the vignettes:

- Provide information about each station and a plot of the data at the start of each vignette.
- Split the trend identification vignette into two (one for mean, one for variability).
- Replace the Okanagan River dataset with Mission Creek for the trend in variability vignette.

Changes to the documentation website:

- Add a cheat sheet for the R package.

## v0.2.0

July 14th, 2025

- The first version of the [CLI](cli-installation-instructions.md) is here!
    - Perform stationary and nonstationary flood frequency analysis
    - Configure the framework using the `config.yml` file
    - Generate HTML reports using `knitr` and `rmarkdown`

## v0.1.0

July 9th, 2025

- The first version of the [R Package](r-installation-instructions.md) is here!
    - Implements all features from the MATLAB version (both EDA and FFA).
    - Generate [PDF user manual](r-user-manual.pdf) using `roxygen2`.
    - Achieve 100% code coverage using the `covr` library.
- A full list of features is described in the "Concepts" sidebar.

## v0.0.3

May 22nd, 2025

- Return information about nonstationary structure(s) at the end of EDA.
- Use the `/data` and `/reports` directories as defaults in `config.yml`.
- Refactor code for batching EDA in `stats.R`, `eda.R`.
- Implement support for PDF reports using a custom $\LaTeX$ template.

## v0.0.2
 
May 21st, 2025

- Host documentation at [rileywheadon.github.io/ffa-docs](https://rileywheadon.github.io/ffa-framework/).
- Implement splitting (for change points) in `stats.R` and `eda.R`.
- Run EDA on multiple files by setting `csv_files` to a list in `config.yml`.

## v0.0.1 

May 16th, 2025

- Execute individual statistical tests using `stats.R`.
- Run a suite of unit tests using `tests.R`.
- Run the entire EDA pipeline (without data splitting) using `eda.R`.
