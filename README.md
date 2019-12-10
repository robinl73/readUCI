
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

## Common Use: `readUCI`

![Abalone](inst/abalone_annotated.jpg)

``` r
abalone <- read_UCI("abalone", "abalone.data")
head(abalone)
#> # A tibble: 6 x 9
#>   X1       X2    X3    X4    X5     X6     X7    X8    X9
#>   <chr> <dbl> <dbl> <dbl> <dbl>  <dbl>  <dbl> <dbl> <dbl>
#> 1 M     0.455 0.365 0.095 0.514 0.224  0.101  0.15     15
#> 2 M     0.35  0.265 0.09  0.226 0.0995 0.0485 0.07      7
#> 3 F     0.53  0.42  0.135 0.677 0.256  0.142  0.21      9
#> 4 M     0.44  0.365 0.125 0.516 0.216  0.114  0.155    10
#> 5 I     0.33  0.255 0.08  0.205 0.0895 0.0395 0.055     7
#> 6 I     0.425 0.3   0.095 0.352 0.141  0.0775 0.12      8
```

### Adding Names

The data that gets imported does not have variable names, as we can see
by just calling `preview_names`.

We can add those manually, based on the information provided in the
`abalone.names` file. This can also be found at the homepage for the
`Abalone`.

``` r
abalone_names <- read_UCI("abalone", "abalone.names")
abalone_names[58:79,]
#> # A tibble: 22 x 1
#>    X1                                                                      
#>    <chr>                                                                   
#>  1 7. Attribute information:                                               
#>  2 "   Given is the attribute name"                                        
#>  3 "   brief description.  The number of rings is the value to predict: ei~
#>  4 "   as a continuous value or as a classification problem."              
#>  5 "\tName\t\tData Type\tMeas.\tDescription"                               
#>  6 "\t----\t\t---------\t-----\t-----------"                               
#>  7 "\tSex\t\tnominal\t\t\tM"                                               
#>  8 "\tLength\t\tcontinuous\tmm\tLongest shell measurement"                 
#>  9 "\tDiameter\tcontinuous\tmm\tperpendicular to length"                   
#> 10 "\tHeight\t\tcontinuous\tmm\twith meat in shell"                        
#> # ... with 12 more rows
```

Here we will manually add the
names.

``` r
names(abalone) <- c("Sex", "Length", "Diameter", "Height", "Whole Weight", "Shucked Weight", "Viscera Weight", "Shell Weight", "Rings")
```

Next we can run `preview_names` to clean up the column names and display
the names.

``` r
names(abalone) <- preview_names(abalone)
#> [1] "sex"            "length"         "diameter"       "height"        
#> [5] "whole_weight"   "shucked_weight" "viscera_weight" "shell_weight"  
#> [9] "rings"
```
