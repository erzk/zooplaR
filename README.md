zooplaR
================

<!-- README.md is generated from README.Rmd. Please edit that file -->
[![Travis-CI Build Status](https://travis-ci.org/erzk/zooplaR.svg?branch=master)](https://travis-ci.org/erzk/zooplaR) [![Coverage Status](https://img.shields.io/codecov/c/github/erzk/zooplaR/master.svg)](https://codecov.io/github/erzk/zooplaR?branch=master) [![Package-License](http://img.shields.io/badge/license-GPL--3-brightgreen.svg?style=flat)](http://www.gnu.org/licenses/gpl-3.0.html) [![CRAN\_Status\_Badge](http://www.r-pkg.org/badges/version/zooplaR)](https://cran.r-project.org/package=zooplaR)

### About

This package is an API wrapper for accessing the UK housing market data from [Zoopla](http://www.zoopla.co.uk/). Check the package's [website](https://erzk.github.io/zooplaR/) for more examples.

### Installation

-   Install *devtools* if you don't have it yet: `install.packages("devtools")`
-   Use `devtools::install_github("erzk/zooplaR")` to install the package.

-   Read the zooplaR's [vignette](https://github.com/erzk/zooplaR/blob/master/vignettes/Introduction_to_zooplaR.Rmd).

-   [Register](http://developer.zoopla.com/member/register/) for an account and an API key.

-   Store the key in an environment variable.

``` r
file.edit("~/.Renviron")
```

Then create a variable in the `.Renviron` file like this:

``` r
zoopla_key <- "YOUR_KEY_GOES_HERE"
```

For other options of storing a key, read this [vignette](https://cran.r-project.org/web/packages/httr/vignettes/secrets.html).

In my case, the API key is stored in the variable `zoopla_key`. You can check whether it's defined and loaded correctly and save it to a variable using:

``` r
zoopla_key <- Sys.getenv("zoopla_key")
```

The functions in this package assume that the API key is stored in the system environment as a `zoopla_key` variable. If not, then most function calls will fail.

### Usage

Load the package

``` r
library(zooplaR)
```

Get the session id
------------------

This will be useful for other calls

``` r
get_session_id(zoopla_key)
#> [1] "2a1ff049229e54b76fb2be7d226b1dcd"
```

Get the average property prices
-------------------------------

Focus on a particular outcode:

``` r
aasp <- average_area_sold_price("EH1 2NG", "outcode", zoopla_key)

# overview
str(aasp)
#> List of 19
#>  $ area_name               : chr "Castle Terrace, Edinburgh EH1"
#>  $ average_sold_price_1year: chr "332627"
#>  $ average_sold_price_3year: chr "307581"
#>  $ average_sold_price_5year: chr "287203"
#>  $ average_sold_price_7year: chr "277088"
#>  $ bounding_box            :List of 4
#>   ..$ latitude_max : chr "55.948965"
#>   ..$ latitude_min : chr "55.947094"
#>   ..$ longitude_max: chr "-3.201478"
#>   ..$ longitude_min: chr "-3.205499"
#>  $ country                 : chr "Scotland"
#>  $ county                  : chr "Edinburgh"
#>  $ latitude                : chr "55.9480295"
#>  $ longitude               : chr "-3.2034885"
#>  $ number_of_sales_1year   : chr "88"
#>  $ number_of_sales_3year   : chr "320"
#>  $ number_of_sales_5year   : chr "530"
#>  $ number_of_sales_7year   : chr "715"
#>  $ postcode                : chr "EH1"
#>  $ prices_url              : chr "https://www.zoopla.co.uk/home-values/edinburgh/castle-terrace"
#>  $ street                  : chr "Castle Terrace"
#>  $ town                    : chr "Edinburgh"
#>  $ turnover                : chr "10.4"
```

Or another use another function to focus on individual streets:

``` r
asp <- average_sold_prices("EH1 2NG", "outcode", "streets", zoopla_key)

# overview
str(asp)
#> List of 20
#>  $ area_name   : chr " EH1"
#>  $ areas       :List of 10
#>   ..$ average_sold_price_1year: chr "752750"
#>   ..$ average_sold_price_3year: chr "790600"
#>   ..$ average_sold_price_5year: chr "790600"
#>   ..$ average_sold_price_7year: chr "760166"
#>   ..$ number_of_sales_1year   : chr "4"
#>   ..$ number_of_sales_3year   : chr "5"
#>   ..$ number_of_sales_5year   : chr "5"
#>   ..$ number_of_sales_7year   : chr "6"
#>   ..$ prices_url              : chr "https://www.zoopla.co.uk/home-values/edinburgh/ramsay-garden"
#>   ..$ turnover                : chr "12.8"
#>  $ areas       :List of 10
#>   ..$ average_sold_price_1year: chr "0"
#>   ..$ average_sold_price_3year: chr "715000"
#>   ..$ average_sold_price_5year: chr "715000"
#>   ..$ average_sold_price_7year: chr "715000"
#>   ..$ number_of_sales_1year   : chr "0"
#>   ..$ number_of_sales_3year   : chr "1"
#>   ..$ number_of_sales_5year   : chr "1"
#>   ..$ number_of_sales_7year   : chr "1"
#>   ..$ prices_url              : chr "https://www.zoopla.co.uk/home-values/new-town/albany-street-lane"
#>   ..$ turnover                : chr "11.1"
#>  $ areas       :List of 10
#>   ..$ average_sold_price_1year: chr "507500"
#>   ..$ average_sold_price_3year: chr "631318"
#>   ..$ average_sold_price_5year: chr "592055"
#>   ..$ average_sold_price_7year: chr "503331"
#>   ..$ number_of_sales_1year   : chr "2"
#>   ..$ number_of_sales_3year   : chr "8"
#>   ..$ number_of_sales_5year   : chr "10"
#>   ..$ number_of_sales_7year   : chr "15"
#>   ..$ prices_url              : chr "https://www.zoopla.co.uk/home-values/new-town/dublin-street-eh1"
#>   ..$ turnover                : chr "16.1"
#>  $ areas       :List of 10
#>   ..$ average_sold_price_1year: chr "0"
#>   ..$ average_sold_price_3year: chr "616250"
#>   ..$ average_sold_price_5year: chr "448750"
#>   ..$ average_sold_price_7year: chr "448750"
#>   ..$ number_of_sales_1year   : chr "0"
#>   ..$ number_of_sales_3year   : chr "2"
#>   ..$ number_of_sales_5year   : chr "4"
#>   ..$ number_of_sales_7year   : chr "4"
#>   ..$ prices_url              : chr "https://www.zoopla.co.uk/home-values/edinburgh/rutland-street"
#>   ..$ turnover                : chr "17.4"
#>  $ areas       :List of 10
#>   ..$ average_sold_price_1year: chr "795000"
#>   ..$ average_sold_price_3year: chr "614668"
#>   ..$ average_sold_price_5year: chr "613235"
#>   ..$ average_sold_price_7year: chr "608291"
#>   ..$ number_of_sales_1year   : chr "3"
#>   ..$ number_of_sales_3year   : chr "16"
#>   ..$ number_of_sales_5year   : chr "26"
#>   ..$ number_of_sales_7year   : chr "34"
#>   ..$ prices_url              : chr "https://www.zoopla.co.uk/home-values/new-town/albany-street"
#>   ..$ turnover                : chr "21.0"
#>  $ areas       :List of 10
#>   ..$ average_sold_price_1year: chr "420000"
#>   ..$ average_sold_price_3year: chr "513750"
#>   ..$ average_sold_price_5year: chr "423463"
#>   ..$ average_sold_price_7year: chr "423463"
#>   ..$ number_of_sales_1year   : chr "1"
#>   ..$ number_of_sales_3year   : chr "4"
#>   ..$ number_of_sales_5year   : chr "10"
#>   ..$ number_of_sales_7year   : chr "10"
#>   ..$ prices_url              : chr "https://www.zoopla.co.uk/home-values/new-town/dublin-street-lane-south"
#>   ..$ turnover                : chr "32.3"
#>  $ areas       :List of 10
#>   ..$ average_sold_price_1year: chr "429533"
#>   ..$ average_sold_price_3year: chr "494714"
#>   ..$ average_sold_price_5year: chr "479109"
#>   ..$ average_sold_price_7year: chr "409507"
#>   ..$ number_of_sales_1year   : chr "3"
#>   ..$ number_of_sales_3year   : chr "9"
#>   ..$ number_of_sales_5year   : chr "13"
#>   ..$ number_of_sales_7year   : chr "22"
#>   ..$ prices_url              : chr "https://www.zoopla.co.uk/home-values/new-town/broughton-place"
#>   ..$ turnover                : chr "13.3"
#>  $ areas       :List of 10
#>   ..$ average_sold_price_1year: chr "453663"
#>   ..$ average_sold_price_3year: chr "470584"
#>   ..$ average_sold_price_5year: chr "449681"
#>   ..$ average_sold_price_7year: chr "459440"
#>   ..$ number_of_sales_1year   : chr "5"
#>   ..$ number_of_sales_3year   : chr "15"
#>   ..$ number_of_sales_5year   : chr "18"
#>   ..$ number_of_sales_7year   : chr "25"
#>   ..$ prices_url              : chr "https://www.zoopla.co.uk/home-values/new-town/gayfield-square"
#>   ..$ turnover                : chr "16.4"
#>  $ areas       :List of 10
#>   ..$ average_sold_price_1year: chr "579500"
#>   ..$ average_sold_price_3year: chr "468250"
#>   ..$ average_sold_price_5year: chr "413750"
#>   ..$ average_sold_price_7year: chr "403214"
#>   ..$ number_of_sales_1year   : chr "2"
#>   ..$ number_of_sales_3year   : chr "4"
#>   ..$ number_of_sales_5year   : chr "6"
#>   ..$ number_of_sales_7year   : chr "7"
#>   ..$ prices_url              : chr "https://www.zoopla.co.uk/home-values/edinburgh/cambridge-street"
#>   ..$ turnover                : chr "31.6"
#>  $ areas       :List of 10
#>   ..$ average_sold_price_1year: chr "537512"
#>   ..$ average_sold_price_3year: chr "445006"
#>   ..$ average_sold_price_5year: chr "395026"
#>   ..$ average_sold_price_7year: chr "383875"
#>   ..$ number_of_sales_1year   : chr "2"
#>   ..$ number_of_sales_3year   : chr "4"
#>   ..$ number_of_sales_5year   : chr "14"
#>   ..$ number_of_sales_7year   : chr "17"
#>   ..$ prices_url              : chr "https://www.zoopla.co.uk/home-values/new-town/union-street"
#>   ..$ turnover                : chr "23.7"
#>  $ bounding_box:List of 4
#>   ..$ latitude_max : chr "55.959714"
#>   ..$ latitude_min : chr "55.945666"
#>   ..$ longitude_max: chr "-3.183098"
#>   ..$ longitude_min: chr "-3.20958"
#>  $ country     : chr "Scotland"
#>  $ county      : chr "Edinburgh"
#>  $ latitude    : chr "55.95269"
#>  $ longitude   : chr "-3.196339"
#>  $ postcode    : chr "EH1"
#>  $ result_count: chr "127"
#>  $ street      : NULL
#>  $ town        : NULL
```

In the example above, the streets can be found in the URLs, e.g.

``` r
asp[2]$areas$prices_url
#> [1] "https://www.zoopla.co.uk/home-values/edinburgh/ramsay-garden"
```

Zed indices
-----------

Zoopla prepared its own indices, they can be accessed with the following functions:

``` r
zi <- zed_index("E151AZ", "town", zoopla_key)

# overview
str(zi)
#> List of 18
#>  $ area_name       : chr "London"
#>  $ area_url        : chr "https://www.zoopla.co.uk/home-values/london"
#>  $ bounding_box    :List of 4
#>   ..$ latitude_max : chr "51.667934"
#>   ..$ latitude_min : chr "51.386276"
#>   ..$ longitude_max: chr "0.137295"
#>   ..$ longitude_min: chr "-0.347077"
#>  $ country         : chr "England"
#>  $ county          : chr "London"
#>  $ latitude        : chr "51.527105"
#>  $ longitude       : chr "-0.104891"
#>  $ postcode        : NULL
#>  $ street          : NULL
#>  $ town            : chr "London"
#>  $ zed_index       : chr "772866"
#>  $ zed_index_1year : chr "761203"
#>  $ zed_index_2year : chr "726696"
#>  $ zed_index_3month: chr "762424"
#>  $ zed_index_3year : chr "661104"
#>  $ zed_index_4year : chr "605264"
#>  $ zed_index_5year : chr "542110"
#>  $ zed_index_6month: chr "771079"
```

Function `zed_index()` can also provide indices on other aggregation levels. Please consult documentation for more info.

There is also another zed index function that takes more arguments:

``` r
azi <- area_zed_indices("sw185rw", "postcodes", "outcode", 1, 10, zoopla_key, "descending")

# overview
str(azi)
#> List of 21
#>  $ area_name   : chr " SW18"
#>  $ bounding_box:List of 4
#>   ..$ latitude_max : chr "51.465056"
#>   ..$ latitude_min : chr "51.436391"
#>   ..$ longitude_max: chr "-0.169658"
#>   ..$ longitude_min: chr "-0.21581"
#>  $ country     : chr "England"
#>  $ county      : chr "London"
#>  $ latitude    : chr "51.4507235"
#>  $ longitude   : chr "-0.192734"
#>  $ postcode    : chr "SW18"
#>  $ result_count: chr "796"
#>  $ results     :List of 4
#>   ..$ name     : chr "SW18 2SX"
#>   ..$ latitude : chr "51.456826"
#>   ..$ longitude: chr "-0.177483"
#>   ..$ zed_index: chr "5126553"
#>  $ results     :List of 4
#>   ..$ name     : chr "SW18 3SW"
#>   ..$ latitude : chr "51.447786"
#>   ..$ longitude: chr "-0.170402"
#>   ..$ zed_index: chr "4850104"
#>  $ results     :List of 4
#>   ..$ name     : chr "SW18 3RJ"
#>   ..$ latitude : chr "51.448754"
#>   ..$ longitude: chr "-0.169658"
#>   ..$ zed_index: chr "4355191"
#>  $ results     :List of 4
#>   ..$ name     : chr "SW18 3SP"
#>   ..$ latitude : chr "51.446405"
#>   ..$ longitude: chr "-0.172429"
#>   ..$ zed_index: chr "4223654"
#>  $ results     :List of 4
#>   ..$ name     : chr "SW18 2RE"
#>   ..$ latitude : chr "51.451899"
#>   ..$ longitude: chr "-0.181608"
#>   ..$ zed_index: chr "4037904"
#>  $ results     :List of 4
#>   ..$ name     : chr "SW18 3RH"
#>   ..$ latitude : chr "51.448611"
#>   ..$ longitude: chr "-0.170844"
#>   ..$ zed_index: chr "3653447"
#>  $ results     :List of 4
#>   ..$ name     : chr "SW18 2SU"
#>   ..$ latitude : chr "51.458202"
#>   ..$ longitude: chr "-0.176391"
#>   ..$ zed_index: chr "3569062"
#>  $ results     :List of 4
#>   ..$ name     : chr "SW18 2RG"
#>   ..$ latitude : chr "51.452716"
#>   ..$ longitude: chr "-0.181547"
#>   ..$ zed_index: chr "3527584"
#>  $ results     :List of 4
#>   ..$ name     : chr "SW18 3RN"
#>   ..$ latitude : chr "51.449004"
#>   ..$ longitude: chr "-0.171260"
#>   ..$ zed_index: chr "3475355"
#>  $ results     :List of 4
#>   ..$ name     : chr "SW18 3LG"
#>   ..$ latitude : chr "51.447621"
#>   ..$ longitude: chr "-0.174294"
#>   ..$ zed_index: chr "2998400"
#>  $ results_url : chr "https://www.zoopla.co.uk/home-values/london/sw18/wandsworth-earlsfield"
#>  $ street      : NULL
#>  $ town        : NULL
```

Property listings
-----------------

You can get the Zoopla listings for a particular area using the following call:

``` r
listings <- property_listings(postcode = "E15 4QS", API_key = zoopla_key)

# overview
names(listings)
#>  [1] "area_name"    "bounding_box" "country"      "county"      
#>  [5] "latitude"     "listing"      "listing"      "listing"     
#>  [9] "listing"      "listing"      "listing"      "listing"     
#> [13] "listing"      "listing"      "listing"      "longitude"   
#> [17] "postcode"     "result_count" "street"       "town"

str(listings[6])
#> List of 1
#>  $ listing:List of 42
#>   ..$ agent_address       : chr "5 Harbour Exchange Square, Canary Wharf, London"
#>   ..$ agent_logo          : chr "https://st.zoocdn.com/zoopla_static_agent_logo_(457665).png"
#>   ..$ agent_name          : chr "Ernest-Brooks International"
#>   ..$ agent_phone         : chr "020 8115 8214"
#>   ..$ category            : chr "Residential"
#>   ..$ country             : chr "England"
#>   ..$ country_code        : chr "gb"
#>   ..$ county              : chr "London"
#>   ..$ description         : chr "*investors portfolio* We are delighted to offer a 5 property off-plan investment portfolio, available for bulk "| __truncated__
#>   ..$ details_url         : chr "https://www.zoopla.co.uk/for-sale/details/45389808?utm_source=v1:7-KHQG7DHECLpUX8bL0ztmDrIhQoz7qY&utm_medium=api"
#>   ..$ displayable_address : chr "Stratford City, Stratford E15"
#>   ..$ first_published_date: chr "2017-10-26 15:46:22"
#>   ..$ floor_area          :List of 3
#>   .. ..$ name : chr "max_floor_area"
#>   .. ..$ units: chr "sq_feet"
#>   .. ..$ value: chr "782"
#>   ..$ floor_area          :List of 3
#>   .. ..$ name : chr "min_floor_area"
#>   .. ..$ units: chr "sq_feet"
#>   .. ..$ value: chr "782"
#>   ..$ furnished_state     : NULL
#>   ..$ image_150_113_url   : chr "https://lid.zoocdn.com/150/113/f6d43e81376feadce3f176390bcff7f7dac92a49.jpg"
#>   ..$ image_354_255_url   : chr "https://lid.zoocdn.com/354/255/f6d43e81376feadce3f176390bcff7f7dac92a49.jpg"
#>   ..$ image_50_38_url     : chr "https://lid.zoocdn.com/50/38/f6d43e81376feadce3f176390bcff7f7dac92a49.jpg"
#>   ..$ image_645_430_url   : chr "https://lid.zoocdn.com/645/430/f6d43e81376feadce3f176390bcff7f7dac92a49.jpg"
#>   ..$ image_80_60_url     : chr "https://lid.zoocdn.com/80/60/f6d43e81376feadce3f176390bcff7f7dac92a49.jpg"
#>   ..$ image_caption       : NULL
#>   ..$ image_url           : chr "https://lid.zoocdn.com/354/255/f6d43e81376feadce3f176390bcff7f7dac92a49.jpg"
#>   ..$ last_published_date : chr "2017-12-18 19:24:22"
#>   ..$ latitude            : chr "51.54048"
#>   ..$ listing_id          : chr "45389808"
#>   ..$ listing_status      : chr "sale"
#>   ..$ longitude           : chr "0.00032"
#>   ..$ new_home            : chr "true"
#>   ..$ num_bathrooms       : chr "0"
#>   ..$ num_bedrooms        : chr "8"
#>   ..$ num_floors          : chr "0"
#>   ..$ num_recepts         : chr "0"
#>   ..$ outcode             : chr "E15"
#>   ..$ post_town           : chr "London"
#>   ..$ price               : chr "2950000"
#>   ..$ price_change        :List of 4
#>   .. ..$ date     : chr "2017-10-26 15:45:57"
#>   .. ..$ direction: NULL
#>   .. ..$ percent  : chr "0%"
#>   .. ..$ price    : chr "2950000"
#>   ..$ property_report_url : chr "https://www.zoopla.co.uk/area-report/?listing_id=45389808&z_cmp=property%20report&z_con=get%20a%20report&z_med="| __truncated__
#>   ..$ property_type       : chr "Flat"
#>   ..$ short_description   : chr "<p class=\"top\">*investors portfolio* We are delighted to offer a 5 property off-plan investment portfolio, av"| __truncated__
#>   ..$ status              : chr "for_sale"
#>   ..$ street_name         : chr "Stratford City"
#>   ..$ thumbnail_url       : chr "https://lid.zoocdn.com/80/60/f6d43e81376feadce3f176390bcff7f7dac92a49.jpg"
```

Get house price charts
----------------------

Chart showing prices in the last three months in a particular outcode:

``` r
avgr <- area_value_graphs("W12", zoopla_key)

# overview
str(avgr)
#> List of 14
#>  $ country                 : chr "England"
#>  $ longitude               : num -0.235
#>  $ area_name               : chr " W12"
#>  $ street                  : chr ""
#>  $ town                    : chr ""
#>  $ average_values_graph_url: chr "https://www.zoopla.co.uk/dynimgs/graph/average_prices/W12?width=400&height=212"
#>  $ latitude                : num 51.5
#>  $ value_ranges_graph_url  : chr "https://www.zoopla.co.uk/dynimgs/graph/price_bands/W12?width=400&height=212"
#>  $ county                  : chr "London"
#>  $ value_trend_graph_url   : chr "https://www.zoopla.co.uk/dynimgs/graph/local_type_trends/W12?width=400&height=212"
#>  $ postcode                : chr "W12"
#>  $ area_values_url         : chr "https://www.zoopla.co.uk/home-values/london/w12/shepherds-bush"
#>  $ bounding_box            :List of 4
#>   ..$ longitude_min: chr "-0.25271"
#>   ..$ latitude_min : chr "51.498647"
#>   ..$ longitude_max: chr "-0.216383"
#>   ..$ latitude_max : chr "51.519761"
#>  $ home_values_graph_url   : chr "https://www.zoopla.co.uk/dynimgs/graph/home_value/oc/W12?width=400&height=212"

# to see a chart, follow the URLs, e.g.
avgr$average_values_graph_url
#> [1] "https://www.zoopla.co.uk/dynimgs/graph/average_prices/W12?width=400&height=212"
```

More detailed charts can also include information about council tax, crime, education, or population age range. These charts can be generated by Zoopla using the following also on an incode level.

``` r
ligr <- local_info_graphs("W12", zoopla_key)

# overview
str(ligr)
#> List of 13
#>  $ area_name            : chr " W12"
#>  $ bounding_box         :List of 4
#>   ..$ latitude_max : chr "51.519761"
#>   ..$ latitude_min : chr "51.498647"
#>   ..$ longitude_max: chr "-0.216383"
#>   ..$ longitude_min: chr "-0.25271"
#>  $ council_tax_graph_url: chr "https://www.zoopla.co.uk/dynimgs/graph/local_info_chart/600-285-CouncilTax-W12"
#>  $ country              : chr "England"
#>  $ county               : chr "London"
#>  $ crime_graph_url      : chr "https://www.zoopla.co.uk/dynimgs/graph/local_info_chart/600-285-Crime-W12"
#>  $ education_graph_url  : chr "https://www.zoopla.co.uk/dynimgs/graph/local_info_chart/600-285-education-W12"
#>  $ latitude             : chr "51.509204"
#>  $ longitude            : chr "-0.2345465"
#>  $ people_graph_url     : chr "https://www.zoopla.co.uk/dynimgs/graph/local_info_chart/600-285-People-W12"
#>  $ postcode             : chr "W12"
#>  $ street               : NULL
#>  $ town                 : NULL

# to see a chart, follow the URLs, e.g.
ligr$council_tax_graph_url
#> [1] "https://www.zoopla.co.uk/dynimgs/graph/local_info_chart/600-285-CouncilTax-W12"
```

Suggest autocompletions for locations
-------------------------------------

If you are not sure how to spell a location, you can use the API to get suggestions. On this example I made a typo when writing Ruislip:

``` r
geo_ac <- geo_autocomplete("ruisli", "listings", zoopla_key)

# overview
str(geo_ac)
#> List of 12
#>  $ area_name  : NULL
#>  $ county     : NULL
#>  $ postcode   : NULL
#>  $ street     : NULL
#>  $ suggestions:List of 2
#>   ..$ identifier: chr "ruislip"
#>   ..$ value     : chr "Ruislip, London"
#>  $ suggestions:List of 2
#>   ..$ identifier: chr "ruislip-manor"
#>   ..$ value     : chr "Ruislip Manor, London"
#>  $ suggestions:List of 2
#>   ..$ identifier: chr "station/tube/ruislip-gardens"
#>   ..$ value     : chr "Ruislip Gardens Station, London"
#>  $ suggestions:List of 2
#>   ..$ identifier: chr "station/tube/ruislip-manor"
#>   ..$ value     : chr "Ruislip Manor Station, London"
#>  $ suggestions:List of 2
#>   ..$ identifier: chr "station/tube/ruislip"
#>   ..$ value     : chr "Ruislip Station, London"
#>  $ suggestions:List of 2
#>   ..$ identifier: chr "schools/primary/ruislip-gardens-primary-school"
#>   ..$ value     : chr "Ruislip Gardens Primary School, London, HA4"
#>  $ suggestions:List of 2
#>   ..$ identifier: chr "schools/secondary/ruislip-high-school"
#>   ..$ value     : chr "Ruislip High School, London, HA4"
#>  $ town       : NULL
```

### Limitations

As most APIs, Zoopla [limits](http://developer.zoopla.com/API_terms_of_use) the number of calls. The limit is 100 calls per second and 100 per hour. Once you hit the limit, the 403 error will appear.

### Thanks

![](https://www.zoopla.co.uk/static/images/mashery/powered-by-zoopla-150x73.png)
