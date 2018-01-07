#' Postcode Properties
#'
#' Allows developers to build their own Appraisal engine like the one on Zoopla
#' by making three separate API calls to find a property and contact the agent for a valuation. Step 1 only.
#'
#' @import dplyr
#' @import httr
#' @import XML
#' 
#' @param postcode A string representing a valid UK postcode, e.g. "EH1 2NG".
#' @param API_key An API key from Zoopla.
#'
#' @return A list.
#' @export
#'
#' @references \url{https://developer.zoopla.co.uk/docs/read/Arrange_Appraisals}
#'
#' @examples
#' \dontrun{
#' 
#' postcode_properties("EH12NG", "YOUR_API_KEY")
#' postcode_properties("EH1 2NG", "YOUR_API_KEY")
#' }
#' 
postcode_properties <- function(postcode=NULL, API_key=NULL){
  if (!is.character(postcode) || nchar(postcode) < 2) {
    stop("Please provide a valid UK outcode.")
  }
  if (!is.character(API_key)) {
    stop("Please provide an API key.")
  }
  postcode <- gsub(" ", "", postcode, fixed = TRUE)
  r <- GET("https://api.zoopla.co.uk/api/v1/postcode_properties",
           query = list(postcode = postcode, api_key = API_key))
  warn_for_status(r)
  r %>% content(encoding = "UTF-8") %>% xmlParse() %>%  xmlToList() %>% return()
}
