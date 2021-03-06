---
title           : "The Central Limit Theorem"
author          : "Coursera: Developing Data Products Assessment"
date            : "Wednesday, May 20, 2015"
subtitle    : Understanding CLT, one of the most important theorem is statistics.
job         : 
framework   : io2012        # {io2012, html5slides, shower, dzslides, ...}
highlighter : highlight.js  # {highlight.js, prettify, highlight}
hitheme     : tomorrow      # 
widgets     : [mathjax]            # {mathjax, quiz, bootstrap}
mode        : selfcontained # {standalone, draft}
knit        : slidify::knit2slides

--- {id: "Title"}


## The Definition

In probability theory, the Central Limit Theorem (CLT) states that, given certain conditions, the arithmetic mean of a sufficiently large number of iterates of independent random variables, each with a well-defined expected value and well-defined variance, will be approximately normally distributed, regardless of the underlying distribution.

That is, suppose that a sample is obtained containing a large number of observations, each observation being randomly generated in a way that does not depend on the values of the other observations, and that the arithmetic average of the observed values is computed. If this procedure is performed many times, the central limit theorem says that the computed values of the average will be distributed according to the normal distribution (commonly known as a "bell curve").


--- {id: "Definition"}


## CLT in short...

- The **Central Limit Theorem** (CLT) is one of the most important theorems in statistics
- For our purposes, the CLT states that the distribution of averages of iid variables, properly normalized, becomes that of a standard normal as the sample size increases
- The CLT applies in an endless variety of settings
- Let $X_1,\ldots,X_n$ be a collection of iid random variables with mean $\mu$ and variance $\sigma^2$
- Let $\bar X_n$ be their sample average
- Then $\frac{\bar X_n - \mu}{\sigma / \sqrt{n}}$ has a distribution like that of a standard normal for large $n$.
- Remember the form
$$\frac{\bar X_n - \mu}{\sigma / \sqrt{n}} = 
    \frac{\mbox{Estimate} - \mbox{Mean of estimate}}{\mbox{Std. Err. of estimate}}.
$$
- Usually, replacing the standard error by its estimated value doesn't change the CLT

--- {id: "InShort"}

## Expected Value

Let $X$ be a numerically-valued discrete random variable with sample space
$\Omega$ and distribution function $m(x)$. The _expected value_ $E(X)$ is defined by

$$E(X) = \sum _{x \in \Omega} {x ~ m(x)}$$

provided this sum converged absolutely. We often refer to the expected value as the _mean_, and denote $E(X)$ by $\mu$ for short. If the above sum does not converge absolutely, then we say that $X$ does not have and expected value.


--- {id: "distributions"}

## Simulation of mean of $n$ dice


```r
par(mfrow = c(1, 3))
for (n in c(1, 2, 6)){
  temp <- matrix(sample(1 : 6, n * 10000, replace = TRUE), ncol = n)
  temp <- apply(temp, 1, mean)
  temp <- (temp - 3.5) / (1.71 / sqrt(n)) 
  dty <- density(temp)
  plot(dty$x, dty$y, xlab = "", ylab = "density", type = "n", xlim = c(-3, 3), ylim = c(0, .5))
  title(paste("sample mean of", n, "obs"))
  lines(seq(-3, 3, length = 100), dnorm(seq(-3, 3, length = 100)), col = grey(.8), lwd = 3)
  lines(dty$x, dty$y, lwd = 2)
}
```

![plot of chunk unnamed-chunk-1](assets/fig/unnamed-chunk-1-1.png) 





