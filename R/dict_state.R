#' List valid states
#' 
#' @description Fetch list of states.
#' 
#' @param country.code Code of country as returned by \code{\link{dictCountry}}, 
#' see examples.
#' 
#' @examples 
#' \dontrun{
#' # authenticate
#' orionOAuth(client.id = 0000,
#'            client.secret = "0x00000000x00x0x000xxx0000x0xx0")
#'            
#' # dict countries
#' country <- dictCountry()
#' 
#' # dict states of random country
#' states <- dictState(country.code = sample(country$code, 1))
#' 
#' # dict US states
#' us <- dictState(country.code = "US")
#' }
#' 
#' @author John Coene \email{john.coene@@cmcm.com}
#' 
#' @export
dictState <- function(country.code){
  
  if(missing(country.code)){
    stop("must pass country.code see dictCountry")
  }
  
  cred <- orionToken()
  
  # GET
  response <- httr::GET(url = paste0(getOption("base_url"), "/dict/state",
                                     "?location_code=", country.code),
                         httr::add_headers(Accept = getOption("accept"),
                                          Authorization = paste0("Bearer ",
                                                                 cred$token)))
  
  content <- httr::content(response)
  
  dat <- do.call(plyr::"rbind.fill", lapply(content$data, parseJSON))
  
  # return
  return(dat)
  
}