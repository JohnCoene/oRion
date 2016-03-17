#' Update any object
#' 
#' @description Update any object, see details and example.
#' 
#' @param body Body of request that includes campaigns settings. See examples.
#' @param object Object to be updated, see details for valid values.
#' @param id id of object to update
#' 
#' @examples 
#' \dontrun{
#' # authenticate
#' orionOAuth(client.id = 0000,
#'            client.secret = "0x00000000x00x0x000xxx0000x0xx0")
#' 
#' # list current adsets
#' adsets <- listAdsets()
#' 
#' # new settings                       
#' settings <- list(switch = switchIt("on"), name = "New Adset Name")
#' 
#' # update adset
#' update <- updateObject(object = "adset", adset.id = adsets$id[1], 
#'                        body = settings)
#' 
#' # equivalent to
#' # update <- updateAdset(adset.id = adsets$id[1], body = settings)
#' 
#' # fetch updated list
#' adsets <- listAdsets()
#' }
#' 
#' @details Valid values for \code{object}: 
#' \itemize{
#' \item \code{audience} see \code{\link{updateAudience}} for details.
#' \item \code{campaign} see \code{\link{updateCampaign}} for details.
#' \item \code{adset} see \code{\link{updateAdset}} for details.
#' \item \code{ad} see \code{\link{updateAd}} for details.
#' }
#' 
#' \code{upodateObject} can essentially replace any other \code{update} 
#' family functions. See examples.
#' 
#' @seealso \code{\link{orionOAuth}}, \code{\link{updateAudience}}, 
#' \code{\link{updateCampaign}}, \code{\link{updateAdset}}, 
#' \code{\link{updateAd}} and \code{\link{helpers}}
#' 
#' @author John Coene \email{john.coene@@cmcm.com}
#' 
#' @export
updateObject <- function(object, body, id){
  
  if(missing(body)){
    stop("must pass body")
  }
  
  if(class(body) != "list"){
    stop("body must be a list. see examples", call. = FALSE)
  }
  
  cred <- orionToken()
  
  object <- checkObjects(object)
  
  response <- httr::POST(paste0(getOption("base_url"), "/", object, "/", id),
                         encode = "multipart", body = body, 
                         httr::add_headers(Accept = getOption("accept"),
                                           Authorization = paste0("Bearer ",
                                                                  cred$token)))
  
  content <- httr::content(response)
  
  testReturn(content)
    
  result <- as.data.frame(t(do.call("rbind", content$data)), 
                          stringsAsFactors = FALSE)
  
  message("update successful")
  
  return(result)
  
}