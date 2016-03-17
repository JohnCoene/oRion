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
#' countries <- dictCountry()
#' 
#' # create audience with country settings
#' createAudience(body = list(
#'                audience_template_name = "countries",
#'                country = paste0(countries$code[1:5], collapse="|")
#'                ))
#' }
#' 
#' @seealso \code{\link{orionOAuth}}, \code{\link{createAudience}}
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
  
  dat <- do.call(plyr::"rbind.fill", lapply(content$data, parseJSON))
  
  # return
  return(dat)
  
}