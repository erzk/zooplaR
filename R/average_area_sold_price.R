#' Average Area Sold Price
#'
#' @param area A string representing desired area. Could be a postcode, outcode, or a name. Should unambiguous, otherwise the API will return an error.
#' @param output A string representing desired output: "outcode", "town", "county", "country". This should cover a larger area than the 'area' variable.
#' @param API_key An API key from Zoopla.
#'
#' @return A list.
#' @export
#'
#' @references \url{http://developer.zoopla.com/docs/read/Average_area_sold_price}
#'
#' @examples
#' \dontrun{
#' 
#' average_area_sold_price("Edinburgh", "country", "YOUR_API_KEY")
#' average_area_sold_price("EH1 2NG", "outcode", "YOUR_API_KEY")
#' average_area_sold_price("EH1", "county", "YOUR_API_KEY")
#' }
#' 
average_area_sold_price <- function(area=NULL, output=NULL, API_key=NULL){
  if (!is.character(area) || nchar(area) < 2) {
    stop("Please provide a valid UK area name. It should be unambiguous.")
  }
  if (!(output %in% c("outcode", "town", "county", "country"))) {
    stop("Please provide desired output: 'outcode', 'town', 'county', or 'country'.")
  }
  if (!is.character(API_key)) {
    stop("Please provide an API key.")
  }
  area <- gsub(" ", "", area, fixed = TRUE)
  r <- GET(paste0("http://api.zoopla.co.uk/api/v1/average_area_sold_price.xml?api_key=",
                  API_key,
                  "&output_type=",
                  output,
                  "&area=",
                  area))
  warn_for_status(r)
  r %>% content(encoding="UTF-8") %>% xmlParse() %>%  xmlToList() %>% return()
}