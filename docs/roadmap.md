# Roadmap

## CRAN Package

### Status

| File                | Roxygen2 | Website | Tested | Validated | Covered |
| ------------------- | -------- | ------- | ------ | --------- | ------- |
| ams-decomposition.R | x        | x       | x      |           |         |
| assessment-plot.R   | x        | x       | x      |           |         |
| bbmk-plot.R         | x        | x       | x      |           |         |
| bbmk-test.R         | x        | x       | x      |           |         |
| gll-functions.R     | x        | x       | x      | x         |         |
| kpss-test.R         | x        | x       | x      |           |         |
| ld-selection.R      | x        | x       | x      |           |         |
| lk-selection.R      | x        | x       | x      |           |         |
| llv-functions.R     | x        | x       | x      | x         |         |
| lmom-plot.R         | x        | x       | x      |           |         |
| lmom-sample.R       | x        | x       | x      |           |         |
| lmr-functions.R     | x        | x       | x      |           |         |
| mks-plot.R          | x        | x       | x      |           |         |
| mks-test.R          | x        | x       | x      |           |         |
| mk-test.R           | x        | x       | x      |           |         |
| mle-estimation.R    | x        | x       | x      |           |         |
| model-assessment.R  | x        | x       | x      |           |         |
| mw-variance.R       | x        | x       | x      |           |         |
| pel-functions.R     | x        | x       | x      |           |         |
| pelkap.R            | x        | x       | x      |           |         |
| pettitt-plot.R      | x        | x       | x      |           |         |
| pettitt-test.R      | x        | x       | x      |           |         |
| pp-test.R           | x        | x       | x      |           |         |
| qnt-functions.R     | x        | x       | x      |           |         |
| rfpl-uncertainty.R  | x        | x       | x      |           |         |
| runs-plot.R         | x        | x       | x      |           |         |
| runs-test.R         | x        | x       | x      |           |         |
| sb-uncertainty.R    | x        | x       | x      |           |         |
| sens-plot.R         | x        | x       | x      |           |         |
| sens-trend.R        | x        | x       | x      |           |         |
| spearman-plot.R     | x        | x       | x      |           |         |
| spearman-test.R     | x        | x       | x      |           |         |
| uncertainty-plot.R  | x        | x       | x      |           |         |
| white-test.R        | x        | x       | x      |           |         |
| z-selection.R       | x        | x       | x      |           |         |

### Planned Features

- Add support for custom plot labels using an optional argument.
- Implement models with variance-only trends.
- Use 2-parameter Weibull for `rfpl-uncertainty`, reparamaterized on $\sigma$.

### Planned Improvements

- Replace `nlminb` with `optim`, update documentation.
- Ensure that all references are to Hosking, 1997 (not 1996).
- Add parameter validation to _every_ function.
- Achieve 100% code coverage using the `covr` library.

## Command Line Interface

| Helper Function      | Implemented | Tested |
| -------------------- | ----------- | ------ |
| `validate.config`    |             |        |
| `load.data`          |             |        |
| `change.points`      |             |        |
| `trend.detection`    |             |        |
| `frequency.analysis` |             |        |
| `report.html`        |             |        |
| `report.pdf`         |             |        |
| `report.markdown`    |             |        |
| `report.json`        |             |        |

## API Development

In progress.

## Web App

In progress.
