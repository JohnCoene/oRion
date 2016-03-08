#' List images
#' 
#' @description Fetch the list of images under the authenticated account.
#' 
#' @param n Number of images to retrieve, defaults to \code{50}
#' 
#' @examples 
#' \dontrun{
#' # authenticate
#' orionOAuth(client.id = 0000,
#'            client.secret = "0x00000000x00x0x000xxx0000x0xx0")
#'            
#' (images <- listImages())
#' }
#' 
#' @seealso \code{\link{orionOAuth}}
#' 
#' @author John Coene \email{john.coene@@cmcm.com}
#' 
#' @export
listImages <- function(n = 50){
  
  res <- listObjects(object = "image", n = n)
  
  # return
  return(res)
}