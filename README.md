
<!-- README.md is generated from README.Rmd. Please edit that file -->
fstplyr
=======

[![Travis-CI Build Status](https://travis-ci.org/krlmlr/fstplyr.svg?branch=master)](https://travis-ci.org/krlmlr/fstplyr) [![Coverage status](https://codecov.io/gh/krlmlr/fstplyr/branch/master/graph/badge.svg)](https://codecov.io/github/krlmlr/fstplyr?branch=master) [![CRAN status](http://www.r-pkg.org/badges/version/fstplyr)](https://cran.r-project.org/package=fstplyr)

Provides a simple yet complete [dplyr](http://dplyr.tidyverse.org/) interface to [fst](http://www.fstpackage.org/) files. Currently only `select()` and `head()` make use of fst's superior performance, all other methods offload to the default data frame implementation. The data is always returned as a [tibble](http://tibble.tidyverse.org/).

Example
-------

``` r
path <- tempfile()
dir.create(path)
fst::write_fst(iris, file.path(path, "iris.fst"))
fst::write_fst(mtcars, file.path(path, "mtcars"))

library(fstplyr)
#> 
#> Attaching package: 'fstplyr'
#> The following object is masked from 'package:stats':
#> 
#>     filter
#> The following objects are masked from 'package:base':
#> 
#>     intersect, setdiff, setequal, union
src <- src_fst(path)
src
#> src:  fst files in /tmp/Rtmp4bnyzc/file44ed48c52e06
#> tbls: iris, mtcars
tbl(src, "mtcars") %>%
  select(mpg:wt, -drat, gear)
#> # A tibble: 32 x 6
#>      mpg   cyl  disp    hp    wt  gear
#>    <dbl> <dbl> <dbl> <dbl> <dbl> <dbl>
#>  1  21.0  6.00   160 110    2.62  4.00
#>  2  21.0  6.00   160 110    2.88  4.00
#>  3  22.8  4.00   108  93.0  2.32  4.00
#>  4  21.4  6.00   258 110    3.22  3.00
#>  5  18.7  8.00   360 175    3.44  3.00
#>  6  18.1  6.00   225 105    3.46  3.00
#>  7  14.3  8.00   360 245    3.57  3.00
#>  8  24.4  4.00   147  62.0  3.19  4.00
#>  9  22.8  4.00   141  95.0  3.15  4.00
#> 10  19.2  6.00   168 123    3.44  4.00
#> # ... with 22 more rows
```

Installation
------------

``` r
# install.packages("remotes")
remotes::install_github("krlmlr/fstplyr")
```
