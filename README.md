
<!-- README.md is generated from README.Rmd. Please edit that file -->
fstplyr
=======

Provides a simple yet complete [dplyr](http://dplyr.tidyverse.org/) interface to [fst](http://www.fstpackage.org/) files. Currently only `select()` and `head()` make use of fst's superior performance, all other methods offload to the default data frame implementation. The data is always returned as a [tibble](http://tibble.tidyverse.org/).

Example
-------

``` r
path <- tempfile()
dir.create(path)
fst::write_fst(iris, file.path(path, "iris.fst"))
fst::write_fst(mtcars, file.path(path, "mtcars"))

library(fstplyr)
src <- src_fst(path)
src
#> src:  fst files in /tmp/RtmpXEdf13/file1c792e2daad6
#> tbls: iris, mtcars
dplyr::tbl(src, "mtcars")
#> # A tibble: 32 x 11
#>      mpg   cyl  disp    hp  drat    wt  qsec    vs    am  gear  carb
#>    <dbl> <dbl> <dbl> <dbl> <dbl> <dbl> <dbl> <dbl> <dbl> <dbl> <dbl>
#>  1  21.0  6.00   160 110    3.90  2.62  16.5  0     1.00  4.00  4.00
#>  2  21.0  6.00   160 110    3.90  2.88  17.0  0     1.00  4.00  4.00
#>  3  22.8  4.00   108  93.0  3.85  2.32  18.6  1.00  1.00  4.00  1.00
#>  4  21.4  6.00   258 110    3.08  3.22  19.4  1.00  0     3.00  1.00
#>  5  18.7  8.00   360 175    3.15  3.44  17.0  0     0     3.00  2.00
#>  6  18.1  6.00   225 105    2.76  3.46  20.2  1.00  0     3.00  1.00
#>  7  14.3  8.00   360 245    3.21  3.57  15.8  0     0     3.00  4.00
#>  8  24.4  4.00   147  62.0  3.69  3.19  20.0  1.00  0     4.00  2.00
#>  9  22.8  4.00   141  95.0  3.92  3.15  22.9  1.00  0     4.00  2.00
#> 10  19.2  6.00   168 123    3.92  3.44  18.3  1.00  0     4.00  4.00
#> # ... with 22 more rows
```
