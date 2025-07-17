# User Manual

The `ffaframework.R` script runs the complete EDA and FFA frameworks. 

## Configuration Reference

The configuration is stored in the `config.yml` file using the [YAML](https://learnxinyminutes.com/yaml/) markup language.

### Data Preparation

**`data_source`**: Character (1); method for sourcing data for the framework. Must be one of:

- `"Local"`: Source data locally using the **`csv_files`** option.
- `"GeoMet"`: Pull data from the [MSC GeoMet API](https://www.canada.ca/en/environment-climate-change/services/weather-general-tools-resources/weather-tools-specialized-data/msc-geomet-api-geospatial-web-services.html) using the **`station_ids`** option.

**`csv_files`**: Character; CSV files located in `/data` used to run the framework.

**`station_ids`**: Character; station IDs for hydrological monitoring stations.
You can search for station IDs by name, province, drainage basin, and location [here](https://wateroffice.ec.gc.ca/search/real_time_e.html).
Some stations may have little or no data.

### EDA

**`split_selection`**: Character (1); method for determining split points. Must be one of:

- `"Automatic"`: Identify split points and split the data automatically.
- `"Manual"`: Confirm split points after identification.
- `"Preset"`: Set the split points ahead of time using **`split_points`**.

**`split_points`**: Integer; preset values for split points or `null` for no split points. 

**`significance_level`**: Numeric (1); significance level. Must be between `0.01` and `0.1`.

**`bbmk_samples`**: Integer (1); number of bootstrap samples to use for the [BB-MK Test](eda-trend-ams-mean.md/#bb-mk-test).

### Distribution Selection

**`distribution_selection`**: Character (1); [distribution selection](model-selection.md) method:

- `"L-distance"`: Euclidian distance from (L-skewness, L-kurtosis) point.
- `"L-kurtosis"`: Difference between theoretical and sample L-kurtosis. 
- `"L-statistic"`: Bootstrapped Z-statistic computed using the Kappa distribution.
- `"Preset"`: Specify a distribution ahead of time with the **`distribution_name`** option.

**`distribution_name`**: Character (1); name of the [probability distributions](probability-distributions.md) to use.

**`z_samples`**: Integer (1); number of bootstrap samples for [Z-statistic selection](model-selection.md#z-statistic).

### Parameter Estimation

**`s_estimation`**: Character (1); [parameter estimation method](parameter-estimation.md) for stationary models:

- `"L-moments"`: Method of L-moments using formulas from Hosking (1997).
- `"MLE"`: Maximum likelihood estimation.
- `"GMLE"`: Generalized maximum likelihood estimation (GEV distribution only).

**`ns_estimation`**: Character (1); parameter estimation method for nonstationary models:

- `"MLE"`: Maximum likelihood estimation.
- `"GMLE"`: Generalized maximum likelihood estimation (GEV distribution only).

**`gev_prior`**: Numeric (2); prior parameters for the shape parameter of the GEV distribution. If you are using maximum likelihood estimation without a prior, set this option to `null`. 

### Uncertainty Quantification

**`s_uncertainty`**: Character (1); [uncertainty quantification](uncertainty-quantification.md) method for stationary models:

- `"Bootstrap"`: Parametric bootstrap method.
- `"RFPL"`: Regula-falsi profile likelihood (MLE estimation only).
- `"RFGPL"`: Generalized regula-falsi profile likelihood (GMLE estimation only).

**`ns_uncertainty`**: Character (1); uncertainty quantification method for nonstationary models:

- `"Bootstrap"`: Parametric bootstrap method.
- `"RFPL"`: Regula-falsi profile likelihood (MLE estimation only).
- `"RFGPL"`: Generalized regula-falsi profile likelihood (GMLE estimation only).

**`return_periods`**: Numeric; list of return periods (in years) for estimating return levels.

**`sb_samples`**: Integer (1); number of samples for [bootstrap uncertainty quantification](uncertainty-quantification.md#parametric-bootstrap).

**`rfpl_tolerance`**: Numeric (1); log-likelihood tolerance for [RFPL uncertainty quantification](uncertainty-quantification.md#regula-falsi-profile-likelihood-rfpl).

### Model Assessment

**`pp_formula`**: Character (1); plotting position formula for [model assessment](model-assessment.md). Must be one of: 

- `"Weibull"`: $i / (n + 1)$
- `"Blom"`: $(i - 0.375) / (n + 0.25)$
- `"Cunnane"`: $(i - 0.4) / (n + 0.2)$
- `"Gringorten"`: $(i - 0.44) / (n + 0.12)$
- `"Hazen"`: $(i - 0.5) / n$

### Plot Generation

**`show_trend`**: Boolean (1); if `true`, add a trend line through the AMS data where applicable. 

**`slices`**: Integer; years used to estimate return levels for nonstationary models. Slices outside of the dataset (or trend-stationary partition) will be ignored.

### Report Generation

**`generate_report`**: Boolean (1); if `true`, generate a report in `.html` format.
