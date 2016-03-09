#' List valid cities
#' 
#' @description Fetch list of cities.
#' 
#' @param state.code Code of country as returned by \code{\link{dictState}}, 
#' see examples.
#' 
#' @examples 
#' \dontrun{
#' # authenticate
#' orionOAuth(client.id = 0000,
#'            client.secret = "0x00000000x00x0x000xxx0000x0xx0")
#' 
#' # dict states of random country
#' states <- dictState(country.code = "US")
#' 
#' # dict cities
#' cities <- dictCity(state.code = sample(states$code, 1))
#' }
#' 
#' @author John Coene \email{john.coene@@cmcm.com}
#' 
#' @export
dictCity <- function(state.code){
  
  if(missing(state.code)){
    stop("must pass state.code see dictState")
  }
  
  cred <- orionToken()
  
  # GET
  response <- httr::GET(url = paste0(getOption("base_url"), "/dict/city",
                                     "?state_code=", state.code),
                        httr::add_headers(Accept = getOption("accept"),
                                          Authorization = paste0("Bearer ",
                                                                 cred$token)))
  
  content <- httr::content(response)
  
  dat <- do.call(plyr::"rbind.fill", lapply(content$data, parseJSON))
  
  # return
  return(dat)
  
}