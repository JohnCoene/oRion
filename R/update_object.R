#' updateObject
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
#' # set body of request for campaign
#' camp <- list(name = "test",
#'              budget_type = "daily",
#'              budget_daily = "1000", 
#'              pkg_name = "test",
#'              objective = "1", 
#'              app_type = "2",
#'              web_type = "1", 
#'              landing_page = "2")
#' 
#' # create campaign             
#' createObject(body = camp, object = "campaign")
#' 
#' # equivalent to
#' # createCampaign(body = camp)
#' 
#' # list campaigns
#' listCampaigns()
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
    
    error <- do.call("rbind.data.frame", content$errors)
    
    stop(as.character(error[1,]), call. = FALSE)
    
  } else {
    
    stop(paste0("Unsuccessful query. ", content$message), call. = FALSE)
    
  }
  
}