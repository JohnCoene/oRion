#' Upload an image
#' 
#' @description Upload an image
#' 
#' @param file Image data, supports JPEG, GIF and PNG.
#' 
#' @examples 
#' \dontrun{
#' # authenticate
#' orionOAuth(client.id = 0000,
#'            client.secret = "0x00000000x00x0x000xxx0000x0xx0")
#' 
#' # upload image            
#' createImage(file = paste0(.libPaths(), "/png/img/Rlogo.png"))
#' }
#' 
#' @details The list of valid values for the body can be found 
#' \href{here}{http://api.ori.cmcm.com/doc/#api-Campaign-create_campaign}
#' 
#' @seealso \code{\link{orionOAuth}}
#' 
#' @author John Coene \email{john.coene@@cmcm.com}
#' 
#' @export
createImage <- function(file){
  
  body <- list(
    file = httr::upload_file(file)
  )
  
  cred <- orionToken()
  
  result <- createObject(body = body, object = "image")
  
  return(result)
  
}