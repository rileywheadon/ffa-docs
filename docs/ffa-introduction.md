# Frequency Analysis

## Overview

FFA uses a _fitted probability distribution_ to make predictions about the _frequency_ of extreme streamflow events (i.e., floods).
To do this, we require a [probability model](model-selection.md) [fitted](parameter-estimation.md) to the sample.

Typically, we describe the severity of floods in terms of their _return period_.
Suppose we have a flood, referred to as $Q$.
If we expect to see a flood _at least as severe as_ $Q$, every ten years, then we say that $Q$ is a _ten-year flood_.
Since the FFA framework uses _annual_ maximum series data, a ten-year flood corresponds to an _exceedance probability_ of $0.1$.
Note that an exceedance probability of $0.1$ corresponds to the $1 - 0.1 = 0.90$ quantile (non-exceedance probability) of our distribution.
Here is a table of the return periods, exceedance probabilities, and quantiles used in the FFA framework:

| Return Period | Exceedance Probability | Quantile |
| ------------- | ---------------------- | -------- |
| $2$ Years     | $0.50$                 | $0.50$   |
| $5$ Years     | $0.20$                 | $0.80$   |
| $10$ Years    | $0.10$                 | $0.90$   |
| $20$ Years    | $0.05$                 | $0.95$   |
| $50$ Years    | $0.02$                 | $0.98$   |
| $100$ Years   | $0.01$                 | $0.99$   |

Suppose our fitted probability distribution has a cumulative distribution function $F(x)$.
The function $F(x)$ maps annual maximum flood magnitudes to quantiles/non-exceedance probabilities.
However, we want to determine flood magnitudes from the quantiles/non-exceedance probabilities, so we use the inverse of the cumulative distribution $F^{-1}(x)$ instead.
The function $F^{-1}(x)$ is also known as the **Quantile Function**.

### Example Plot

We typically present the results of a flood frequency analysis as a graph with time on the $x$-axis and annual maximum series on the $y$-axis.
There are two ways to read a graph like this:

1. Estimate the severity of a flood for a given time period.
    From the graph below, we could determine that every 50 years, we can expect a flood of approximately $85\text{m}^3/\text{s}$.
2. Estimate the frequency of a flood for a given severity.
    From the graph below, we could determine that a flood of $50\text{m}^3/\text{s}$ or higher will occur every 4 years.

![An example of flood frequency estimates.](img/plot-s-uncertainty.png)

**Note**: For information about how the confidence bounds in this figure are determined, see [here](uncertainty-quantification.md).

## Handling Nonstationarity

We say that a distribution is **Nonstationary** if its mean or variance (or both) are changing over time.
Under nonstationarity, the quantile function of our fitted probability distribution is also a function of time $F^{-1}(x, t)$.
This means that our estimates and return periods also vary with time, so we cannot report a single set of estimates and confidence intervals as we did in the plot above. 
For nonstationary models, the FFA framework computes **Effective Return Periods**, which are estimates based on the quantile function *for a specific year*.

### Example Plot

The plot below shows the effective return periods for the year 2017.

**Note**: A flood with an effective return period of 100 years *will not* occur every 100 years due to the nonstationarity of the model.
Instead, an effective return period of 100 years means that *in the anchor year* (2017), we predict there is a $1/100$ probability of a flood with the given severity. 

![](img/plot-ns-uncertainty.png)
