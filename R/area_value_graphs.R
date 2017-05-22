#' Area Value Graphs
#'
#' @import httr
#' 
#' @param area A string representing a valid UK outcode, e.g. "W12".
#' @param API_key An API key from Zoopla.
#'
#' @return A list.
#' @export
#'
#' @references \url{http://developer.zoopla.com/docs/read/Area_Value_Graphs}
#'
#' @examples
#' \dontrun{
#' 
#' area_value_graphs("W12", "YOUR_API_KEY")
#' }
area_value_graphs <- function(area=NULL, API_key=NULL){
  if (!is.character(area) || nchar(area) < 2) {
    stop("Please provide a valid UK outcode.")
  }
  if (!is.character(API_key)) {
    stop("Please provide an API key.")
  }
  area <- gsub(" ", "", area, fixed = TRUE)
  r <- GET(paste0("https://api.zoopla.co.uk/api/v1/area_value_graphs.js?area=",
                  area,
                  "&output_type=outcode&api_key=",
                  API_key))
  warn_for_status(r)
  content(r, encoding="UTF-8")
}
