# skip testing functions that need authentication
# https://cran.r-project.org/web/packages/httr/vignettes/secrets.html
skip_if_no_auth <- function() {
  if (identical(Sys.getenv("zoopla_key"), "")) {
    testthat::skip("No authentication available")
  }
}

# TODO add packages
return_content <- function(x) {
  httr::warn_for_status(x)
  
  if (httr::status_code(x) == 200) {
    x %>%
    httr::content(encoding = "UTF-8") %>%
    XML::xmlParse() %>%
    XML::xmlToList() %>%
    return()
  }
}
