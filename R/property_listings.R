#' Property Listings
#'
#' @param API_key An API key from Zoopla.
#'
#' @return A list.
#' @export
#'
#' @references \url{http://developer.zoopla.com/docs/read/Property_listings}
#'
#' @examples
#' \dontrun{
#' 
#' property_listings()
#' }
#' 
property_listings <- function(postcode=NULL, area=NULL, API_key=NULL){
  #GET("http://api.zoopla.co.uk/api/v1/property_listings.xml?postcode=E15&api_key=") # also works with full postcodes
  #GET("http://api.zoopla.co.uk/api/v1/property_listings.xml?area=Nottingham&api_key=")

  #GET("http://api.zoopla.co.uk/api/v1/property_listings.xml", 
  #query = list(api_key = "value1", postcode = "value2", area = "value3")
  #)
  if (!is.character(postcode) || nchar(postcode) < 2) {
    stop("Please provide a valid UK area name. It should be unambiguous.")
  }
  if (!is.character(API_key)) {
    stop("Please provide an API key.")
  }
  r <- GET("http://api.zoopla.co.uk/api/v1/property_listings.xml",
           query = list(postcode = postcode, area = area, api_key = API_key))
  warn_for_status(r)
  r %>% content(encoding="UTF-8") %>%
    xmlParse() %>%
    xmlToList() %>%
    return()
}