# Changelog

## v0.2.0

July 14th, 2025

- The first version of the [CLI](cli-installation-instructions.md) is here!
    - Perform stationary and non-stationary flood frequency analysis
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

- Return information about non-stationary structure(s) at the end of EDA.
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
- Run the entire EDA pipeline (without data spliting) using `eda.R`.
