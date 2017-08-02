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
#' 
#' # filter states starting with A (because why not?)
#' a_states <- us[grep("^A", us$value),]
#' 
#' # create audience
#' createAudience(body = list(
#'                audience_template_name = "A-states",
#'                country = "US",
#'                region = paste0(a_states$code, collapse="|")
#' ))
#' }
#' 
#' @author John Coene \email{jcoenep@@gmail.com}
#' 
#' @export
dictState <- function(country.code){
  if (missing(country.code)){
    stop("must pass country.code see dictCountry")
  }
  cred <- orionToken()
  uri <- paste0(getOption("base_url"), "/",
                file.path("dict", "state", fsep = "/"),
                "?location_code=", country.code)
  response <- httr::GET(url = uri,
                         httr::add_headers(Accept = getOption("accept"),
                                          Authorization = paste0("Bearer ",
                                                                 cred$token)))
  content <- httr::content(response)
  testReturn(content)
  dat <- do.call(plyr::"rbind.fill", lapply(content$data, parseJSON))
  return(dat)
}