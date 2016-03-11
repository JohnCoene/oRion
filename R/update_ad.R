#' Update an ad
#' 
#' @description Update ad settings, see details and example.
#' 
#' @param body Body of request that includes ad settings. See examples 
#' and details.
#' @param ad.id id of ad to update
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
#' # update ad name
#' update <- updateAd(ad.id = ad$id[1], body = list(
#'                switch = switch("off"), 
#'                name = "New Ad Name - Paused"))
#'                
#' # show updated campaign
#' showAd(ad.id = ads$id[1])
#' }
#' 
#' @details Valid values for \code{body}: 
#' \itemize{
#' \item \code{switch}  Ad switch, use \code{\link{switchIt}} otherwise, 
#' \code{1}: On, \code{0}: Off.
#' \item \code{name} Ad name, unique.
#' \item \code{icon_url} Logo image url. Must be larger than 84*84 px and have 
#' an aspect ratio of 1:1, in JPG or PNG format. File must not exceed 100KB.
#' \item \code{title} Ad headline
#' \item \code{desc} Description tells people a bit more about your Application. 
#' Make sure to clearly explain what you are promoting.
#' \item \code{button_text} Button display text, use \code{\link{buttonText}} to generate otherwise, 
#' \code{1}: Download, \code{2}: Install, \code{3}: Check, \code{4}: Free, 
#' \code{5}: Play, 
#' \code{6}: Buy, \code{7}: More.
#' \item \code{image_url} Image url. Must be larger than 600*314 px and have an 
#' aspect ratio of 1.9:1. Best is 1200*628 px, JPG or PNG format. File size 
#' must not exceed 500KB. Image should come from Orion CDN server, please 
#' upload image using \code{\link{createImage}}.
#' \item \code{video_url} URL to video
#' \item \code{video_img_before_url} Image which will be show before video 
#' starts.
#' \item \code{video_img_after_url} Image which will be show after video ends.
#' }
#' 
#' @seealso \code{\link{orionOAuth}}, \code{\link{listAds}}, 
#' \code{\link{createAd}}
#' 
#' @author John Coene \email{john.coene@@cmcm.com}
#' 
#' @export
updateAd <- function(ad.id, body){
  
  res <- updateObject(object = "ad", body = body, id = ad.id)
  
  return(res)
  
}