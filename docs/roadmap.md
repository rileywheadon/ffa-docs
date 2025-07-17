# Roadmap

## CRAN Package

**Known Issues**:

- Sample bootstrap yields unusually large CIs for nonstationary models
- RFPL breaks on some stations (i.e. Lake Louise, station ID `05BA001`)

## Command Line Interface

**Status**

| Function             | Implemented | 100% Code Coverage |
| -------------------- | ----------- | ------------------ |
| `validate_config`    | x           | x                  |
| `load_data`          | x           | x                  |
| `change_points`      | x           | x                  |
| `trend_detection`    | x           | x                  |
| `frequency_analysis` | x           | x                  |
| `ffaframework`       | x           |                    |

**Planned Features**:

- Secondary change point analysis
- Option to set trend signatures prior to analysis
- Option to export reports to formats other than `.html`
