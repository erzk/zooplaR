#' Get Session ID
#'
#' Obtain a session ID parameter for use with associated method calls.
#'
#' @import dplyr
#' @import httr
#' @import XML
#' 
#' @param API_key An API key from Zoopla.
#'
#' @return A string - session ID.
#' @export
#'
#' @references \url{http://developer.zoopla.com/docs/read/Get_Session_ID}
#'
#' @examples
#' \dontrun{
#' 
#' get_session_id("YOUR_API_KEY")
#' }
#' 
get_session_id <- function(API_key=NULL){
  if (!is.character(API_key)) {
    stop("Please provide an API key.")
  }
  r <- GET(paste0("https://api.zoopla.co.uk/api/v1/get_session_id?api_key=", API_key))
  warn_for_status(r)
  r %>% content(encoding="UTF-8") %>%
    xmlParse() %>%
    xmlToList() %>%
    .$session_id %>%
    return()
}
