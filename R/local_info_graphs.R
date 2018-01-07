#' Local Info Graphs
#'
#' Generate a set of graphs of local info for an outcode (and optional incode) and return the URL to the generated image.
#'
#' @import dplyr
#' @import httr
#' @import XML
#' 
#' @param area A string representing a valid UK outcode, e.g. "W12".
#' @param API_key An API key from Zoopla.
#'
#' @return A list.
#' @export
#'
#' @references \url{http://developer.zoopla.com/docs/read/Local_Info_Graphs}
#'
#' @examples
#' \dontrun{
#' 
#' local_info_graphs("W12", "YOUR_API_KEY")
#' }
#' 
local_info_graphs <- function(area=NULL, API_key=NULL){
  if (!is.character(area) || nchar(area) < 2) {
    stop("Please provide a valid UK outcode. Incode is optional.")
  }
  if (!is.character(API_key)) {
    stop("Please provide a valid API key. It must be a string.")
  }
  r <- GET("https://api.zoopla.co.uk/api/v1/local_info_graphs",
           query = list(area = area, api_key = API_key))
  warn_for_status(r)
  r %>% content(encoding="UTF-8") %>%
    xmlParse() %>%
    xmlToList() %>%
    return()
}