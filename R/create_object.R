#' Create any object
#' 
#' @description Create any object, see details.
#' 
#' @param body Body of request that includes campaigns settings. See examples.
#' @param object Object to be created, see details for valid values.
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
#' \item \code{audience}, see \code{\link{createAudience}} for details.
#' \item \code{campaign}, see \code{\link{createCampaign}} for details.
#' \item \code{adset}, see \code{\link{createAdset}} for details.
#' \item \code{ad}, see \code{\link{createAd}} for details.
#' }
#' 
#' \code{createObject} can essentially replace any other \code{create} 
#' family functions. See examples.
#' 
#' @seealso \code{\link{orionOAuth}}, \code{\link{createAudience}}, 
#' \code{\link{createCampaign}}, \code{\link{createAdset}} and 
#' \code{\link{createAd}}
#' 
#' @author John Coene \email{john.coene@@cmcm.com}
#' 
#' @export
createObject <- function(object, body){
  
  if(missing(body)){
    stop("must pass body")
  }
  
  if(class(body) != "list"){
    stop("body must be a list. see examples", call. = FALSE)
  }

  cred <- orionToken()
  
  object <- checkObjects(object)
  
  response <- httr::POST(paste0(getOption("base_url"), "/", object),
                         encode = "multipart", body = body, 
                         httr::add_headers(Accept = getOption("accept"),
                                           Authorization = paste0("Bearer ",
                                                                  cred$token)))
  
  content <- httr::content(response)
  
  if(content$status == 200){
    
    result <- as.data.frame(t(do.call("rbind", content$data)))
    
    message("object successfully created")
    
    return(result)
    
  } else if (content$status == 422) {
    
    error <- do.call("rbind.data.frame", content$errors)
    
    stop(as.character(error[1,]), call. = FALSE)
    
  } else {
    
    stop(paste0("Unsuccessful query. ", content$message), call. = FALSE)
    
  }
  
}