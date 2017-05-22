#' Average Sold Prices
#'
#' @import dplyr
#' @import httr
#' @import XML
#' 
#' @param postcode A string representing a valid UK outcode or postcode, e.g. "NW10" or "EH1 2NG".
#' @param output A string representing desired output: "outcode" or "county". "county" can be combined with "streets", "towns" or "outcodes" in the area_type. "outcode" can be combined with "postcodes" or "streets" in the area_type.
#' @param area_type A string representing desired area: "streets", "towns", "outcodes" or "postcodes".
#' @param API_key An API key from Zoopla.
#'
#' @return A list.
#' @export
#'
#' @references \url{http://developer.zoopla.com/docs/read/Average_Sold_Prices}
#'
#' @examples
#' \dontrun{
#' 
#' average_sold_prices("EH1 2NG", "outcode", "streets", "YOUR_API_KEY")
#' average_sold_prices("CF10 3XQ", "county", "outcodes", "YOUR_API_KEY")
#' }
#' 
average_sold_prices <- function(postcode=NULL, output=NULL, area_type=NULL, API_key=NULL){
  if (!is.character(postcode) || nchar(postcode) < 2) {
    stop("Please provide a valid UK outcode.")
  }
  if (!(output %in% c("outcode", "county"))) {
    stop("Please provide desired output: 'outcode' or 'county'.")
  }
  if (!(area_type %in% c("streets", "towns", "outcodes", "postcodes"))) {
    stop("Please provide desired output: 'streets', 'towns', 'outcodes', 'postcodes'.")
  }
  if (!is.character(API_key)) {
    stop("Please provide an API key.")
  }
  postcode <- gsub(" ", "", postcode, fixed = TRUE)
  r <- GET(paste0("https://api.zoopla.co.uk/api/v1/average_sold_prices.xml?postcode=",
                  postcode,
                  "&output_type=",
                  output,
                  "&area_type=",
                  area_type,
                  "&api_key=",
                  API_key))
  warn_for_status(r)
  r %>% content(encoding="UTF-8") %>% xmlParse() %>%  xmlToList() %>% return()
}
