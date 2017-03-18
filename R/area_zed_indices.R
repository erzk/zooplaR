#' Area Zed-Indices
#'
#' @param API_key An API key from Zoopla.
#'
#' @return A list.
#' @export
#'
#' @references \url{http://developer.zoopla.com/docs/read/area_zed_indices}
#'
#' @examples
#' \dontrun{
#' 
#' area_zed_indices("descending", "sw185rw", "postcodes", "outcode", 1, 10, "YOUR_API_KEY")
#' area_zed_indices(postcode = "sw185rw", area_type = "postcodes", output_type = "outcode", API_key = "YOUR_API_KEY")
#' }
#' 
area_zed_indices <- function(ordering="descending", postcode=NULL, area_type=NULL, output_type=NULL,
                             page_number=NULL, page_size=NULL, API_key=NULL){
  if (!is.character(postcode) || nchar(postcode) < 2) {
    stop("Please provide a valid UK area.")
  }
  if (!is.character(API_key)) {
    stop("Please provide a valid API key. It must be a string.")
  }
  postcode <- gsub(" ", "", postcode, fixed = TRUE)
  #http://api.zoopla.co.uk/api/v1/zed_indices.xml?api_key=xxxxxx&postcode=DE39AH&output_type=outcode&area_type=postcodes
  #http://api.zoopla.co.uk/api/v1/zed_indices?api_key=xxxxxxxx&postcode=DE39AH&output_type=outcode&area_type=streets
  r <- GET("http://api.zoopla.co.uk/api/v1/zed_indices",
           query = list(ordering = ordering, postcode = postcode, area_type = area_type, output_type = output_type,
                        page_number = page_number, page_size = page_size, api_key = API_key))
  warn_for_status(r)
  r %>% content(encoding="UTF-8") %>%
    xmlParse() %>%
    xmlToList() %>%
    return()
}