
<!-- README.md is generated from README.Rmd. Please edit that file -->
zooplaR
=======

[![Travis-CI Build Status](https://travis-ci.org/erzk/zooplaR.svg?branch=master)](https://travis-ci.org/erzk/zooplaR)

### About

*Work in progress*

This package is an API wrapper for accessing the UK housing market data from [Zoopla](http://www.zoopla.co.uk/).

### Installation

-   Install *devtools* if you don't have it yet: `install.packages("devtools")`
-   Use `devtools::install_github("erzk/zooplaR")` to install the package.

-   Read the [vignette](https://github.com/erzk/zooplaR/blob/master/vignettes/Introduction_to_zooplaR.Rmd).

-   [Register](http://developer.zoopla.com/member/register/) for an account and an API key.

-   Store the key in an environment variable. For instructions how to do it read the [Appendix](https://cran.r-project.org/web/packages/httr/vignettes/api-packages.html).

In my case, the API key is stored in the variable `zoopla_key`. You can check whether it's defined and loaded correctly using `Sys.getenv("zoopla_key")`.

The functions in this package assume that the API key is stored in the system environment as a `zoopla_key` variable. If not, then most function calls will fail.

### Usage

Load the package

``` r
library(zooplaR)
```

### Limitations

As most APIs, Zoopla [limits](http://developer.zoopla.com/API_terms_of_use) the number of calls. The last time I checked it was 100 calls per hour. Once you hit the limit, the 403 error will appear.

### Thanks

![](https://www.zoopla.co.uk/static/images/mashery/powered-by-zoopla-150x73.png)
