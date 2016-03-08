#' List valid device models
#' 
#' @description Fetch list of device models.
#' 
#' @examples 
#' \dontrun{
#' # authenticate
#' orionOAuth(client.id = 0000,
#'            client.secret = "0x00000000x00x0x000xxx0000x0xx0")
#'            
#' # dict mobile devices
#' head(dictDevice())
#' }
#' 
#' @author John Coene \email{john.coene@@cmcm.com}
#' 
#' @export
dictDevice <- function(){
  
  cred <- orionToken()
  
  # GET
  response <- httr::GET(url = paste0(getOption("base_url"), "/dict/deviceModel"),
                        httr::add_headers(Accept = getOption("accept"),
                                          Authorization = paste0("Bearer ",
                                                                 cred$token)))
  
  content <- httr::content(response)
  
  dat <- do.call("rbind.data.frame", lapply(content$data, parseJSON))
  
  # return
  return(dat)
  
}