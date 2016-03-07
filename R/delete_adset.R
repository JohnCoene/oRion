#' deleteAdset
#' 
#' @description Delete adset.
#' 
#' @param adset.id id of object to delete
#' 
#' @examples 
#' \dontrun{
#' # authenticate
#' orionOAuth(client.id = 0000,
#'            client.secret = "0x00000000x00x0x000xxx0000x0xx0")
#'            
#' # get ads
#' adsets <- listAdsets()
#' 
#' # delete random adsets
#' deleteAdset(adset.id = sample(adsets$id, 1))
#' }
#' 
#' @author John Coene \email{john.coene@@cmcm.com}
#' 
#' @export
deleteAdset <- function(adset.id) {
  
  cred <- orionToken()
  
  result <- deleteObject(object = "adset", id = adset.id)
}