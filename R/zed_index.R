#' Zed-Index
#'
#' @param area A string representing a valid UK outcode or postcode, e.g. "NW10" or "EH1 2NG".  
#' @param output A string representing desired output: "town", "outcode", "county", "country".
#' @param API_key An API key from Zoopla.
#'
#' @return A list
#' @export
#'
#' @references \url{http://developer.zoopla.com/docs/read/Zed_Index_API}
#'
#' @examples
#' zed_index("NW10", "outcode", "YOUR_API_KEY")
#' zed_index("E151AZ", "town", "YOUR_API_KEY")
#' zed_index("EH1 2NG", "county", "YOUR_API_KEY")
#' zed_index("CF10 3XQ", "country", "YOUR_API_KEY")
#' 
zed_index <- function(area=NULL, output=NULL, API_key=NULL){
  if (!is.character(area) || nchar(area) < 2) {
    stop("Please provide a valid UK outcode.")
  }
  if (!(output %in% c("town", "outcode", "county", "country"))) {
    stop("Please provide a desired output: 'town', 'outcode', 'county', 'country'.")
  }
  if (!is.character(API_key)) {
    stop("Please provide a correct API key.")
  }
  area <- gsub(" ", "", area, fixed = TRUE)
  r <- GET(paste0("http://api.zoopla.co.uk/api/v1/zed_index?area=",
                  area,
                  "&output_type=",
                  output,
                  "&api_key=",
                  API_key))
  warn_for_status(r)
  r %>% content(encoding="UTF-8") %>% xmlParse() %>%  xmlToList() %>% return()
}
