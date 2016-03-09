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
#' settings <- list(switch = 0, name = "New Adset Name")
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
#' \code{\link{updateCampaign}}, \code{\link{updateAdset}} and 
#' \code{\link{updateAd}}
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
  
  if(content$status == 200){
    
    result <- as.data.frame(t(do.call("rbind", content$data)))
    
    message("update successful")
    
    return(result)
    
  } else if (content$status == 422) {
    
    error <- do.call(plyr::"rbind.fill", content$errors)
    
    stop(as.character(error[1,]), call. = FALSE)
    
  } else {
    
    stop(paste0("Unsuccessful query. ", content$message), call. = FALSE)
    
  }
  
}