#' Geo Autocomplete
#'
#' @import dplyr
#' @import httr
#' @import XML
#' 
#' @param search_term A string holding the search term to be auto completed.
#' @param search_type A string. Allowed values: "listings" or "property". Defaults to "listings".
#' @param API_key An API key from Zoopla.
#'
#' @return A list
#' @export
#'
#' @references \url{http://developer.zoopla.com/docs/read/Geo_Autocomplete}
#'
#' @examples
#' \dontrun{
#' 
#' geo_autocomplete("ruislip", "listings", "YOUR_API_KEY")
#' }
#' 
geo_autocomplete <- function(search_term=NULL, search_type="listings", API_key=NULL){
  if (!is.character(search_term)) {
    stop("Please provide a valid search term. It must be a string.")
  }
  if (!(search_type %in% c("listings", "properties"))) {
    stop("Please provide a valid search term. Allowed values: 'listings' or 'properties'.")
  }
  if (!is.character(API_key)) {
    stop("Please provide an API key.")
  }
  r <- GET("https://api.zoopla.co.uk/api/v1/geo_autocomplete",
           query = list(api_key = API_key, search_term = search_term, search_type = search_type))
  warn_for_status(r)
  r %>% content(encoding="UTF-8") %>%
    xmlParse() %>%
    xmlToList() %>%
    return()
}