# Roadmap

## CRAN Package

**Known Issues**:

- `model_diagnostics` has argument `pp.formula` (should be `pp_formula`)
- Bootstrap functions cannot accept custom return periods

## Command Line Interface

**Status**

| Function             | Implemented | Covered |
| -------------------- | ----------- | ------- |
| `validate_config`    | x           | x       |
| `load_data`          | x           | x       |
| `change_points`      | x           | x       |
| `trend_detection`    | x           | x       |
| `frequency_analysis` | x           |         |
| `ffaframework`       |             |         |

**Known Issues**:

- Cross-field checks are not thorough enough in `validate_config`
- Documentation is not up to date with current `config.yml`

## API Development

Starting soon.

## Web App

Starting soon.
