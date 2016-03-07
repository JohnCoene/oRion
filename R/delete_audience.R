#' deleteAudience
#' 
#' @description Delete audience targeting template.
#' 
#' @param audience.id id of object to delete
#' 
#' @examples 
#' \dontrun{
#' # authenticate
#' orionOAuth(client.id = 0000,
#'            client.secret = "0x00000000x00x0x000xxx0000x0xx0")
#'            
#' # get ads
#' ads <- listAudiences()
#' 
#' # delete random adsets
#' deleteAudience(audience.id = sample(audiences$id, 1))
#' }
#' 
#' @author John Coene \email{john.coene@@cmcm.com}
#' 
#' @export
deleteAudience <- function(audience.id) {
  
  cred <- orionToken()
  
  result <- deleteObject(object = "audience", id = audience.id)
}