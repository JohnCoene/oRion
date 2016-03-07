#' deleteObject
#' 
#' @description Delete campaign, adsets, ads or audience temapltes, 
#' see details and examples.
#' 
#' @param object Object to be created, see details for valid values.
#' @param id id of object to delete
#' 
#' @details Valid values for \code{object}: 
#' \itemize{
#' \item \code{audience} see \code{\link{createAudience}} for details.
#' \item \code{campaign} see \code{\link{createCampaign}} for details.
#' \item \code{adset} see \code{\link{createAdset}} for details.
#' \item \code{ad} see \code{\link{createAd}} for details.
#' }
#' 
#' @examples 
#' \dontrun{
#' # authenticate
#' orionOAuth(client.id = 0000,
#'            client.secret = "0x00000000x00x0x000xxx0000x0xx0")
#'            
#' # get ads
#' ads <- listObjects(object = "ad")
#' 
#' # delete random ad
#' deleteObject(object = "ad", id = sample(ads$id, 1))
#' }
#' 
#' @author John Coene \email{john.coene@@cmcm.com}
#' 
#' @export
deleteObject <- function(object = "campaign", id) {
  
  if(missing(id)){
    stop("must specify id", call. = FALSE)
  }
  
  cred <- orionToken()
  
  object <- checkObjects(object)
  
  response <- httr::POST(paste0(getOption("base_url"), "/", object, "/", id),
                         encode = "multipart", 
                         httr::add_headers(Accept = getOption("accept"),
                                           Authorization = paste0("Bearer ",
                                                                  cred$token)))
  
  content <- httr::content(response)
  
  if(content$status == 200){
    
    result <- as.data.frame(t(do.call("rbind", content$data)))
    
    return(result)
    
  } else if (content$status == 422) {
    
    error <- do.call("rbind.data.frame", content$errors)
    
    stop(as.character(error[1,]), call. = FALSE)
    
  } else {
    
    stop(paste0("Unsuccessful query. ", content$message), call. = FALSE)
    
  }
}