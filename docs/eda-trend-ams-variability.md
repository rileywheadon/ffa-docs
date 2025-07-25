# Detecting Trends in the AMS Variability

This section describes the methods used to detect trends or changes in the **variability** (e.g., variance or standard deviation) of annual maximum series (AMS) data.

---

## Moving Window Mann-Kendall (MW-MK) Test

The **MW-MK test** detects statistically significant monotonic trends in the standard deviation of AMS data.

- Null hypothesis: No significant trend in the standard deviation.
- Alternative hypothesis: Significant monotonic trend in the standard deviation.

### Steps

To compute the standard deviations of the AMS data, we use a moving window algorithm. Let $w$ be the length of the moving window and $s$ be the step size. Then,

1. Initialize the moving window at indices $[1, w]$.
2. Compute the sample standard deviation within the window.
3. Move the window forward by $s$ steps.
4. Repeat steps 2 and 3 until the window reaches the end of the data.

This produces a time series of moving-window standard deviations. 
Then, the [Mann-Kendall Test](eda-trend-ams-mean.md#mann-kendall-mk-test) is used to test for a monotonic trend in the standard deviation.

---

## Sen's Trend Estimator 

Used to estimate the slope of a trend in the standard deviations (see [here](eda-trend-ams-mean.md#sens-trend-estimator)).

---

## Runs Test

Used to the check residuals of trend fitted to the standard deviations for randomness (see [here](eda-trend-ams-mean.md#runs-test)).

---

## White Test

The **White Test** detects changes in variability (heteroskedasticity) in a time series.

- Null hypothesis: Constant variability (homoskedasticity).
- Alternative hypothesis: Time-dependent variability (heteroskedasticity).

### Steps

1. Fit a simple linear regression model using ordinary least squares:

    $$y_{i} = \beta_{0} + \beta_{1} x_{i} + \epsilon_{i}$$

2. Compute the squared residuals:

    $$
    \hat{r}_i^2 = \left(y_i - \hat{y}_i\right)^2
    $$

3. Fit an auxiliary regression model to the squared residuals. This model includes each regressor, the square of each regressor, and the cross products between all regressors. Since $x$ is the only regressor, the regression model is simply:

    $$
    \hat{r}_i^2 = \alpha_0 + \alpha_1 x_i + \alpha_2 x_i^2 + u_i
    $$

4. Compute the [coefficient of determination](https://en.wikipedia.org/wiki/Coefficient_of_determination) $R^2$ for the auxillary model.

5. Compute the test statistic $nR^2 \sim \chi_{d}^2$ where $n$ is the number of observations and $d = 2$ is the number of regressors, excluding the intercept.

6. If $nR^2 > \chi^2_{1-\alpha, d}$, we reject the null hypothesis and conclude that the time series exhibits heteroskedasticity.
