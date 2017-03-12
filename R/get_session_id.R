#' Get Session ID
#'
#' @param 
#'
#' @return A list
#' @export
#'
#' @references \url{http://developer.zoopla.com/docs/read/Get_Session_ID}
#'
#' @examples
#' get_session_id()
#' 
get_session_id <- function(){
  r <- GET("http://api.zoopla.co.uk/api/v1/get_session_id")
  warn_for_status(r)
  content(r, encoding="UTF-8")
}