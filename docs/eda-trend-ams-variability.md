# Identifying Trends in the AMS Variability

## MW-MK Test

The **Moving Window Mann-Kendall (MW-MK) Test** is used to identify a statistically significant monotonic trend in the variances of an AMS time series.

- Null hypothesis: There is no significant trend in the variance of the AMS.
- Alternative hypothesis: There is a significant trend in the variance of the AMS.

To compute the AMS variances we use a moving window algorithm:

1. Let $w$ be the length of the moving window and $s$ be the step size.
2. Initialize the moving window at indices $[1, w]$.
3. Compute the sample standard deviation within the moving window.
4. Move the window forward by $s$ indices.
5. Check if last index in the window is greater than the length of the data. If it is, all moving window variances have been computed. Otherwise, go to step (3).

Then, we perform the Mann-Kendall Test on the time series of variances.

For more information about the Mann-Kendall test, see [here](eda-trend-ams-mean.md#mann-kendall-test).

## Sen's Trend Estimator 

See [here](eda-trend-ams-mean.md#sens-trend-estimator).

## Runs Test

See [here](eda-trend-ams-mean.md#runs-test).

## White Test

The **White Test** is used to detect changes in the variance of a time series.

- Null hypothesis: The variance of the time series is constant (homoskedasticity).
- Alternative hypothesis: The variance of the time series is time-dependent (heteroskedasticity).

Consider a simple linear regression model:

$$y_{i} = \beta_{0} + \beta_{1} x_{i} + \epsilon_{i}$$

Use ordinary least squares to fit the model. Then compute the squared residuals:

$${\hat{r}}_{i}^{2} = (y_{i} - \hat{y}_{i})^{2}$$

Next, fit an auxillary regression model to the squared residuals.
This model includes each regressor, the square of each regressor, and the cross products between all regressors.
Since $x$ is the only regressor, the regression model is simply:

$${\hat{r}}_{i}^{2} = \alpha_{0} + \alpha_{1}x_{i} + \alpha_{2}x_{i}^{2} + u_{i}$$

Next, we compute the [coefficient of determination](https://en.wikipedia.org/wiki/Coefficient_of_determination) $R^2$ for the auxillary model.
The test statistic is $nR^2 \sim \chi_{d}^2$, where $n$ is the number of observations and $d = 2$ is the number of regressors, excluding the intercept.
If $nR^2 > \chi^2_{1-\alpha, d}$, we reject the null hypothesis and conclude that the time series exhibits heteroskedasticity.
