#' Property Listings
#' 
#' Retrieve property listings for a given area.
#' 
#' @import dplyr
#' @import httr
#' @import XML
#' 
#' @param postcode A string. Valid UK postcode or outcode.
#' @param area A string. Area of interest, e.g. "Nottingham".
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
#' property_listings(postcode = "E1", API_key = "YOUR_API_KEY")
#' property_listings(area = "Nottingham", API_key = "YOUR_API_KEY")
#' }
#' 
property_listings <- function(postcode=NULL, area=NULL, API_key=NULL){
  # if (missing(postcode) || missing(area)) {
  #   stop("Please provide a valid UK postcode or area name. It should be unambiguous.")
  # }
  if (!is.character(API_key)) {
    stop("Please provide an API key.")
  }
  r <- GET("https://api.zoopla.co.uk/api/v1/property_listings.xml",
           query = list(postcode = postcode, area = area, api_key = API_key))
  warn_for_status(r)
  r %>% content(encoding = "UTF-8") %>%
    xmlParse() %>%
    xmlToList() %>%
    return()
}
