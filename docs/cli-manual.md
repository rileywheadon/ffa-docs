# User Manual

The `ffaframework.R` script runs the complete EDA and FFA frameworks. 
The optional command line argument `--config` can be used to specify a custom configuration file (default is `config.yml`). 

**Example Usage** (default configuration)

```
Rscript ffaframework.R
```

**Example Usage** (custom configuration)

```
Rscript ffaframework.R --config='custom-config.yml'
```

## Configuration Reference

<p style="color: red;"><b>Note</b>: All configuration options are specified using <i>lowercase characters</i>.</p>

### Data Preparation

**`data_source`**: Character (1); method for sourcing data for the framework. Must be one of:

- `"local"`: Source data locally using the **`csv_files`** option.
- `"geomet"`: Pull data from the [MSC GeoMet API](https://www.canada.ca/en/environment-climate-change/services/weather-general-tools-resources/weather-tools-specialized-data/msc-geomet-api-geospatial-web-services.html) using the **`station_ids`** option.

**`csv_files`**: Character; CSV files located in `/data` used to run the framework.

**`station_ids`**: Character; station IDs for hydrological monitoring stations.

### EDA

**`run_eda`**: Boolean (1); if set to `true`, run [exploratory data analysis](eda.md).

**`split_selection`**: Character (1); method for determining split points. Must be one of:

- `"automatic"`: Identify split points and split the data automatically.
- `"manual"`: Confirm split points after identification.
- `"preset"`: Set the split points ahead of time using **`split_points`**.

**`split_points`**: Integer; preset values for split points or `null` for no split points. 

**`significance_level`**: Numeric (1); significance level. Must be between `0.01` and `0.1`.

**`bbmk_samples`**: Integer (1); number of bootstrap samples to use for the [BB-MK Test](eda.md/#bb-mk-test).

### FFA

**`run_ffa`**: Boolean (1); if set to `true`, run [flood frequency analysis](frequency-analysis.md).

**`ns_selection`**: Character (1); non-stationary signature selection method. Must be one of:  

- `"automatic"`: Non-stationarity is identified and handled automatically.
- `"manual"`: Confirm non-stationary patterns after EDA. Requires `run_eda: true`.
- `"preset"`: Set non-stationary signature ahead of time with **`ns_signature`**.

**`ns_signature`**: Character (1); stationary or non-stationary signature. Must be one of:

- `null`: No non-stationarity.
- `"10"`: Linear trend in the mean.
- `"11"`: Linear trend in the mean and variance.

### Distribution Selection

**`z_samples`**: Integer (1); number of bootstrap samples for [Z-statistic selection](model-selection.md#z-statistic).

**`distribution_selection`**: Character (1); [distribution selection](model-selection.md) method:

- `"l-distance"`: Euclidian distance from (L-skewness, L-kurtosis) point.
- `"l-kurtosis"`: Difference between theoretical and sample L-kurtosis. 
- `"z-statistic"`: Bootstrapped Z-statistic computed using the Kappa distribution.
- `"preset"`: Specify a distribution ahead of time with the **`distribution_name`** option.

**`distribution_name`**: Character (1); name of the [probability distributions](distributions.md) to use.

### Parameter Estimation

**`gev_prior`**: Numeric (2); prior parameters for the shape parameter of the GEV distribution.

**`s_estimation`**: Character (1); [parameter estimation method](parameter-estimation.md) for stationary models:

- `"l-moments"`: Method of L-moments using formulas from Hosking (1997).
- `"mle"`: Maximum likelihood estimation.
- `"gmle"`: Generalized maximum likelihood estimation (GEV distribution only).

**`ns_estimation`**: Character (1); parameter estimation method for non-stationary models:

- `"mle"`: Maximum likelihood estimation.
- `"gmle"`: Generalized maximum likelihood estimation (GEV distribution only).

### Uncertainty Quantification

**`return_periods`**: Numeric; list of return periods for estimating return levels.

**`sb_samples`**: Integer (1); number of samples for [bootstrap uncertainty quantification](uncertainty-quantification.md#sample-bootstrap).

**`rfpl_tolerance`**: Numeric (1); log-likelihood tolerance for [RFPL uncertainty quantification](uncertainty-quantification.md#regula-falsi-profile-likelihood-rfpl).

**`s_uncertainty`**: Character (1); [uncertainty quantification](uncertainty-quantification.md) method for stationary models:

- `"s-bootstrap"`: Sample bootstrap method.
- `"rfpl"`: Regula-falsi profile likelihood (MLE estimation only).
- `"rfgpl"`: Generalized regula-falsi profile likelihood (GMLE estimation only).

**`ns_uncertainty`**: Character (1); uncertainty quantification method for non-stationary models:

- `"s-bootstrap"`: Sample bootstrap method.
- `"rfpl"`: Regula-falsi profile likelihood (MLE estimation only).
- `"rfgpl"`: Generalized regula-falsi profile likelihood (GMLE estimation only).

### Model Assessment

**`pp_formula`**: Character (1); plotting position formula for [model assessment](model-assessment.md). Must be one of: 

- `"weibull"`: $i / (n + 1)$
- `"blom"`: $(i - 0.375) / (n + 0.25)$
- `"cunnane"`: $(i - 0.4) / (n + 0.2)$
- `"gringorten"`: $(i - 0.44) / (n + 0.12)$
- `"hazen"`: $(i - 0.5) / n$

### Plot Generation

**`show_trend`**: Boolean (1); if `true`, add a trend line through the AMS data where applicable. 

**`anchor_year`**: Integer (1); year used to generate return level plot for non-stationary models. 

### Report Generation

**`generate_report`**: Boolean (1); if `true`, generate a report with specified **`report_formats`**.

**`report_formats`**: Character; list of report formats (`"markdown"`, `"pdf"`, `"html"`, or `"json"`).

