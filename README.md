
<!-- README.md is generated from README.Rmd. Please edit that file -->

# readUCI

<!-- badges: start -->

[![Lifecycle:
experimental](https://img.shields.io/badge/lifecycle-experimental-orange.svg)](https://www.tidyverse.org/lifecycle/#experimental)
[![CRAN
status](https://www.r-pkg.org/badges/version/readUCI)](https://CRAN.R-project.org/package=readUCI)
[![Travis build
status](https://travis-ci.org/emmal73/readUCI.svg?branch=master)](https://travis-ci.org/emmal73/readUCI)
<!-- badges: end -->

`readUCI` facilitates the process of importing data from the [University
of California Irvine Machine Learning
Repository](%22https://archive.ics.uci.edu/ml/datasets.php%22).

You can install the package through GitHub:

``` r
#devtools::install_github("emmal73/readUCI")

library(readUCI)
```

## Common Use

![Abalone](%22abalone_annotated.JPG%22)

``` r
read_UCI("abalone", "abalone.data")
#> Parsed with column specification:
#> cols(
#>   X1 = col_character(),
#>   X2 = col_double(),
#>   X3 = col_double(),
#>   X4 = col_double(),
#>   X5 = col_double(),
#>   X6 = col_double(),
#>   X7 = col_double(),
#>   X8 = col_double(),
#>   X9 = col_double()
#> )
#> # A tibble: 4,177 x 9
#>    X1       X2    X3    X4    X5     X6     X7    X8    X9
#>    <chr> <dbl> <dbl> <dbl> <dbl>  <dbl>  <dbl> <dbl> <dbl>
#>  1 M     0.455 0.365 0.095 0.514 0.224  0.101  0.15     15
#>  2 M     0.35  0.265 0.09  0.226 0.0995 0.0485 0.07      7
#>  3 F     0.53  0.42  0.135 0.677 0.256  0.142  0.21      9
#>  4 M     0.44  0.365 0.125 0.516 0.216  0.114  0.155    10
#>  5 I     0.33  0.255 0.08  0.205 0.0895 0.0395 0.055     7
#>  6 I     0.425 0.3   0.095 0.352 0.141  0.0775 0.12      8
#>  7 F     0.53  0.415 0.15  0.778 0.237  0.142  0.33     20
#>  8 F     0.545 0.425 0.125 0.768 0.294  0.150  0.26     16
#>  9 M     0.475 0.37  0.125 0.509 0.216  0.112  0.165     9
#> 10 F     0.55  0.44  0.15  0.894 0.314  0.151  0.32     19
#> # ... with 4,167 more rows
```
