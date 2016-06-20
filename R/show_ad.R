#' Show an ad settings
#' 
#' @description Retrieve settings of a specfic ad. 
#' 
#' @param ad.id id of ad to retrieve
#' 
#' @examples 
#' \dontrun{
#' # authenticate
#' orionOAuth(client.id = 0000,
#'            client.secret = "0x00000000x00x0x000xxx0000x0xx0")
#'            
#' # list ads
#' ads <- listAds(n = 100)
#' 
#' # fetch random adset settings
#' (ad <- showAd(ad.id = sample(ads$id, 1)))
#' }
#' 
#' @seealso \code{\link{orionOAuth}}, \code{\link{listAds}}
#' 
#' @author John Coene \email{john.coene@@cmcm.com}
#' 
#' @export
showAd <- function(ad.id){
  res <- showObject(object = "ad", id = ad.id)
  return(res)
}