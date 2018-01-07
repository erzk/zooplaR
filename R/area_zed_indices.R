#' Area Zed-Indices
#' 
#' Retrieve a list of house price estimates for the requested area.
#' 
#' @import dplyr
#' @import httr
#' @import XML
#'
#' @param postcode A string. Valid UK postcode.
#' @param area_type A string. Area type: "postcodes", "streets", "outcodes", "areas", "towns", "counties". Read the API documentation for details.
#' @param output_type A string. Required output: "outcode", "area", "town", "county", "country". Read the API documentation for details.
#' @param page_number An integer. The page number of results to request, default is 1.
#' @param page_size An integer. The size of each page of results, default is 10, maximum is 20.
#' @param API_key An API key from Zoopla.
#' @param ordering A string. The order in which the results should be returned in, either "descending" (default) or "ascending".
#'
#' @return A list.
#' @export
#'
#' @references \url{http://developer.zoopla.com/docs/read/area_zed_indices}
#'
#' @examples
#' \dontrun{
#' 
#' area_zed_indices("sw185rw", "postcodes", "outcode", 1, 10, "YOUR_API_KEY", "descending")
#' area_zed_indices(postcode = "sw185rw", area_type = "postcodes", output_type = "outcode", API_key = "YOUR_API_KEY")
#' }
#' 
area_zed_indices <- function(postcode=NULL, area_type=NULL, output_type=NULL,
                             page_number=NULL, page_size=NULL, API_key=NULL, ordering="descending"){
  if (!is.character(postcode) || nchar(postcode) < 2) {
    stop("Please provide a valid UK area.")
  }
  if (!is.character(API_key)) {
    stop("Please provide a valid API key. It must be a string.")
  }
  postcode <- gsub(" ", "", postcode, fixed = TRUE)
  r <- GET("https://api.zoopla.co.uk/api/v1/zed_indices",
           query = list(postcode = postcode, area_type = area_type, output_type = output_type,
                        page_number = page_number, page_size = page_size,
                        api_key = API_key, ordering = ordering))
  warn_for_status(r)
  r %>% content(encoding="UTF-8") %>%
    xmlParse() %>%
    xmlToList() %>%
    return()
}