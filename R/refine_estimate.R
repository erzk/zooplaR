#' Refine Estimate
#'
#' Request a more accurate Zoopla.co.uk Zed-Index based on extra data provided.
#'
#' @param property_id Property id. Can be extracted with postcode_properties. Need to be a live listing.
#' @param session Session ID. Use get_session_id to fetch it.
#' @param property_type Type of property. Must be one of the following: detached, link_detached, semi_detached, terraced, flat, end_terrace, maisonette, mews, town_house, cottage, bungalow, farm_barn, park_home
#' @param tenure Tenure. Allowed values: freehold, leasehold, share_of_freehold.
#' @param num_bedrooms The number of bedrooms located at the property.
#' @param num_bathrooms The number of bathrooms located at the property.
#' @param num_receptions The number of receptions located at the property.
#' @param API_key An API key from Zoopla.
#'
#' @return A list.
#' @export
#'
#' @references \url{http://developer.zoopla.com/docs/read/Refine_Estimate}
#'
#' @examples
#' \dontrun{
#' 
#' s_id <- get_session_id(APIKEY)
#' 
#' # get the property id but make sure that the ad is still live
#' prop_id <- postcode_properties("EH12NG", "YOUR_API_KEY")
#' p_id <- prop_id$agent$property_id
#' 
#' # if the values provided are incorrect then error 400 is returned
#' refine_estimate(p_id, s_id, "detached", "freehold", "4", "1", "1", APIKEY)
#' # refine_estimate("965889", "839ddfa0fa5d810d9afa148960775007",
#' "detached", "freehold", "4", "1", "1", APIKEY)
#' }
#' 
refine_estimate <- function(property_id, session, property_type, tenure,
                            num_bedrooms, num_bathrooms, num_receptions, API_key) {
  defined <- ls()
  passed <- names(as.list(match.call())[-1])
  # TODO add missing(property_id) etc.
  if (any(!defined %in% passed)) {
    stop(paste("Missing values for", paste(setdiff(defined, passed), collapse = ", ")))
  }
  if (!is.character(API_key)) {
    stop("Please provide an API key.")
  }
  # TODO check for the valid entries
  r <- GET("https://api.zoopla.co.uk/api/v1/refine_estimate",
           query = list(api_key = API_key, session_id = session, property_id = property_id,
                        property_type = property_type, tenure = tenure,
                        num_bedrooms = num_bedrooms, num_bathrooms = num_bathrooms,
                        num_receptions = num_receptions))
  warn_for_status(r)
  r %>% content(encoding = "UTF-8") %>%
    xmlParse() %>%
    xmlToList() %>%
    return()
}
