# Introduction to Exploratory Data Analysis (EDA)

The EDA module of the FFA Framework is used to evaluate whether the available evidence supports the assumption of stationarity.
To do this, the EDA module applies a structured sequence of statistical tests to the AMS data to detect statistically significant nonstationary signatures. 
These statistical tests serve three purposes:

1. Detect **change points** (i.e., abrupt shifts or trend changes).
2. Detect **trends in the mean** and identify them as deterministic/stochastic, linear/non-linear.
3. Detect **trends in the variability** (i.e., heteroskedasticity and trends in standard deviation).

***The primary goal of EDA is to inform the choice between stationary and nonstationary FFA.***

![Diagram showing current EDA framework.](img/fig-eda-current.png)
