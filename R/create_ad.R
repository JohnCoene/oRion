#' createAd
#' 
#' @description Create an ad, see details and example.
#' 
#' @param body Body of request that includes ad settings. See examples 
#' and details.
#' 
#' @author John Coene \email{john.coene@@cmcm.com}
#' 
#' @export
createAd <- function(body){
  
  if(class(body) != "list"){
    stop("body must be a list. see examples", call. = FALSE)
  }
  
  cred <- orionToken()
  
  result <- createObject(body = body, object = "ad")
  
  return(result)
  
}