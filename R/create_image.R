#' createImage
#' 
#' @description Create campaigns
#' 
#' @param file Image data,support JPEG,GIF and PNG.
#' 
#' @examples 
#' \dontrun{
#' # authenticate
#' orionOAuth(client.id = 0000,
#'            client.secret = "0x00000000x00x0x000xxx0000x0xx0")
#' 
#' # upload image            
#' createImage(file = "path_to_R_version/library/pn/img/Rlogo.png")
#' }
#' 
#' @details The list of valid values for the body can be found 
#' \href{here}{http://api.ori.cmcm.com/doc/#api-Campaign-create_campaign}
#' 
#' 
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