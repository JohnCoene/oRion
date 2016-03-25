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
#' # list adsets
#' adsets <- listAdsets()
#' 
#' # list images
#' images <- listImages()
#' 
#' # create an ad
#' # define ad settings
#' body <- list(
#'    adset_id = adsets$id[1],
#'    name = "My Ad",
#'    icon_url = images$thumb[1],
#'    title = "Ad Title",
#'    desc = "Ad description",
#'    button_text = buttonText("install"),
#'    image_url = images$local_url[1])
#'    
#' # post ad
#' ad <- createAd(body = body)
#' 
#' # delete the ad
#' deleteAd(ad.id = ad$id)
#' }
#' 
#' @seealso \code{\link{orionOAuth}}, \code{\link{createAd}}
#' 
#' @author John Coene \email{john.coene@@cmcm.com}
#' 
#' @export
deleteAd <- function(ad.id) {
  result <- deleteObject(object = "ad", id = ad.id)
  return(result)
}