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
#' @author John Coene \email{jcoenep@@gmail.com}
#' 
#' @export
dictCity <- function(state.code){
  if (missing(state.code)){
    stop("must pass state.code see dictState")
  }
  cred <- orionToken()
  uri <- paste0(getOption("base_url"), "/",
                file.path("dict", "city", fsep = "/"),
                "?state_code=", state.code)
  response <- httr::GET(url = uri,
                        httr::add_headers(Accept = getOption("accept"),
                                          Authorization = paste0("Bearer ",
                                                                 cred$token)))
  content <- httr::content(response)
  testReturn(content)
  dat <- do.call(plyr::"rbind.fill", lapply(content$data, parseJSON))
  return(dat)
}