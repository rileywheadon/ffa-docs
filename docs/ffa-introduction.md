# Flood Frequency Analysis (FFA)

## Overview

**Flood Frequency Analysis (FFA)** uses a _probability distribution_ fitted to extreme streamflow observations (e.g., annual maxima) to estimate the _recurrence likelihood_ of floods. To perform FFA, we require a [probability model](model-selection.md) and corresponding [parameter estimates](parameter-estimation.md) based on the data.

FFA relates flood peak magnitudes $Q$ to their expected frequency of occurrence, expressed as a **return period**. For example, a flood with a 10-year return period—commonly referred to as a **10-year flood**—has a 1-in-10 chance of being equalled or exceeded in any given year. This corresponds to an **annual exceedance probability** $p_e = 0.1$.  
Since the FFA Framework uses **annual maxima** data, this equates to the 90th percentile (i.e., the $0.90$ quantile) of the fitted probability distribution.

Here is a summary of return periods, exceedance probabilities, and associated distribution quantiles used in the FFA framework:

| Return Period ($T$) | Exceedance Probability ($p_e$)   | Quantile ( $F(q)$ )|
|---------------------|----------------------------------|-------------------|
| 2 Years             | 0.50                             | 0.50              |
| 5 Years             | 0.20                             | 0.80              |
| 10 Years            | 0.10                             | 0.90              |
| 20 Years            | 0.05                             | 0.95              |
| 50 Years            | 0.02                             | 0.98              |
| 100 Years           | 0.01                             | 0.99              |

Let $F(q)$ be the cumulative distribution function (CDF) of the fitted model. This function maps flood magnitudes to exceedance probabilities: $p_e = 1 - F(q)$.  
To estimate flood magnitudes for a given exceedance probability, we use the **inverse CDF**, or **quantile function**: $\hat{q} = F^{-1}(p_e)$.


### Example Plot

FFA results are typically visualized with return period on the $x$-axis and flood magnitude on the $y$-axis. These plots can be interpreted in two directions:

1. **Estimate flood magnitude** for a given return period  
   _Example_: A 50-year flood is estimated to be about $85\ \text{m}^3/\text{s}$.

2. **Estimate return period** for a given flood magnitude  
   _Example_: A streamflow of $50\ \text{m}^3/\text{s}$ is expected to occur roughly every 4 years.

![An example of flood frequency estimates.](img/plot-s-uncertainty.png)

**Note**: For an explanation of the confidence bounds in this plot, see [Uncertainty Quantification](uncertainty-quantification.md).

---

## Handling Nonstationarity

A distribution is considered **nonstationary** if its statistical properties (e.g., mean or variance) change over time. In such cases, the quantile function becomes time-dependent: $F^{-1}(p_e, t)$.  
As a result, return levels and exceedance probabilities vary with time, and a static return period curve is no longer valid.

To address this, the FFA framework computes **effective return periods**, which yield flood estimates for a specific year based on the time-varying distribution.

### Example Plot

The plot below illustrates **effective return levels** for the year 2017.

> **Note**: A 100-year effective return level does *not* imply that such a flood is expected to occur once in the next 100 years. It means that in **the year 2017**, the probability of exceeding that flood magnitude is 1 in 100.

![Example of effective return periods in 2017.](img/plot-ns-uncertainty.png)



