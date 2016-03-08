#' Delete an ad
#' 
#' @description Delete an ad.
#' 
#' @param ad.id id of object to delete
#' 
#' @examples 
#' \dontrun{
#' # authenticate
#' orionOAuth(client.id = 0000,
#'            client.secret = "0x00000000x00x0x000xxx0000x0xx0")
#'            
#' # list ads
#' ads <- listAds()
#' 
#' # delete random ad
#' deleteAd(ad.id = sample(ads$id, 1))
#' }
#' 
#' @seealso \code{\link{orionOAuth}}, \code{\link{createAd}}
#' 
#' @author John Coene \email{john.coene@@cmcm.com}
#' 
#' @export
deleteAd <- function(ad.id) {
  
  cred <- orionToken()
  
  result <- deleteObject(object = "ad", id = ad.id)
}