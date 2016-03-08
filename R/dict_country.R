#' List valid countries
#' 
#' @description Fetch list of countries.
#' 
#' @examples 
#' \dontrun{
#' # authenticate
#' orionOAuth(client.id = 0000,
#'            client.secret = "0x00000000x00x0x000xxx0000x0xx0")
#'            
#' # dict countries
#' head(dictCountry())
#' }
#' 
#' @author John Coene \email{john.coene@@cmcm.com}
#' 
#' @export
dictCountry <- function(){
  
  cred <- orionToken()
  
  # GET
  response <- httr::GET(url = paste0(getOption("base_url"), "/dict/location"),
                        httr::add_headers(Accept = getOption("accept"),
                                          Authorization = paste0("Bearer ",
                                                                 cred$token)))
  
  content <- httr::content(response)
  
  dat <- do.call("rbind.data.frame", lapply(content$data, parseJSON))
  
  # return
  return(dat)
  
}