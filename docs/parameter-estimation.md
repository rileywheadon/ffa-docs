# Parameter Estimation

This module estimates parameters for both S-FFA and NS-FFA models. In NS-FFA, it involves estimating regression coefficients for time-varying parameters and constants.

The framework supports three estimation methods:

1. L-moments
2. Maximum Likelihood (MLE)
3. Generalized Maximum Likelihood (GMLE)

**Note**: We adopt the GEV distribution convention from Coles (2001)[^1], where a **positive** shape parameter $\kappa$ indicates a heavy tail.
This differs from the sign convention in some other sources.

[^1]: Coles, S. (2001). *An introduction to statistical modeling of extreme values*. Springer.

## L-Moments

The L-moments method is implemented for parameter estimation for all distributions in S-FFA.
This method uses the sample L-moments ($l_1$, $l_2$) and L-moment ratios ($t_3$, $t_4$) to estimate parameters.
For more information about L-moments, see [here](model-selection.md#an-introduction-to-l-moments).

**Warning**: L-moment-based estimates can yield distributions which do not have support at small values, although this is typically not an issue for quantile estimation in the range of mid- to high-return periods.

## Maximum Likelihood (MLE)

MLE is implemented for all statistical models in S-FFA (for all distributions) and NS-FFA (for all distributions with time-varying location and/or scale parameters).

Maximum likelihood estimation aims to maximize the log-likelihood function $\ell(x : \theta)$ of the data $x = x_{1}, \dots , x_{n}$ given the parameters $\theta$.
The log-likelihood functions for each distribution are defined [here](probability-distributions.md).
To find the optimal parameters, we use the [`nlminb`](https://www.rdocumentation.org/packages/stats/versions/3.6.2/topics/nlminb) function from the `stats` library.
This function implements the "L-BFGS-B" algorithm for constrained optimization.

## Generalized Maximum Likelihood (GMLE)

GMLE is used for GEV models when incorporating **prior knowledge** of the shape parameter $\kappa$ using Bayesian reasoning via [maximum a posteriori estimation](https://en.wikipedia.org/wiki/Maximum_a_posteriori_estimation), which maximizes the product of the likelihood and the prior distribution.

Suppose that $\kappa$ is drawn from $K \sim \text{Beta}(p, q)$ where $p$ and $q$ are determined using prior knowledge. The prior PDF $f_{K}(\kappa)$ is shown below, where $B(p, q)$ is the [Beta function](https://en.wikipedia.org/wiki/Beta_function).

$$
f_{K}(\kappa) = \frac{\kappa ^{p - 1}(1 - \kappa)^{q-1}}{B(p, q)}
$$

As in the case of regular maximum likelihood estimation, the likelihood function is:

$$
f_{X}(x : \mu, \sigma, \kappa) =\prod_{i=1}^{n} \frac{1}{\sigma}t_{i}^{-1 - (1/\kappa)} \exp (-t_{i}^{-1/\kappa}), \quad
t_{i} = 1 + \kappa \left(\frac{x_{i} - \mu }{\sigma } \right)
$$

As mentioned previously, we want to maximize the product $\mathcal{L} = f_{K}(\kappa)f_{X}(x:\mu ,\sigma ,\kappa)$.
To ensure numerical stability, we will maximize $\ln  (\mathcal{L})$ instead, which has the following form:

$$
\begin{aligned}
\ln(\mathcal{L}) &= \ln(f_{K}(\kappa)) + \ln(f_{X}(x:\mu ,\sigma ,\kappa )) \\[10pt]
\ln(f_{K}(\kappa)) &= (p - 1)\ln \kappa + (q-1) \ln (1 - \kappa)  - \ln (B(p, q)) \\[5pt]
\ln(f_{X}(x:\mu ,\sigma ,\kappa )) &= \sum_{i=1}^{n} \left[-\ln \sigma - \left(1 + \frac{1}{\kappa }\right) \ln t_{i} - t_{i}^{-1/\kappa}\right]
\end{aligned}
$$
