# Introduction to EDA

The exploratory data analysis (EDA) module of the flood frequency analysis (FFA) framework contains a collection of statistical tests for annual maximum streamflow (AMS) data.
These tests are performed in a specific order to accomplish the four goals listed below:

1. Identify change points ("jumps" or "kinks") in the AMS data.
2. Identify [autocorrelation](https://en.wikipedia.org/wiki/Autocorrelation) in the AMS data.
3. Identify trends in the mean value of the AMS data.
4. Identify trends in the variance of the AMS data.

***Ultimately the goal of EDA is to choose between stationary and non-stationary FFA.***

A diagram showing the current EDA framework is shown below:

![Diagram showing current EDA framework.](img/fig-eda-current.png)
