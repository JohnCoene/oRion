#' List any object
#' 
#' @description List any objects from the API, see details for valid 
#' values.
#' 
#' @param object Nodes to target. See details
#' @param n Number of objects to retrieve, defaults to \code{50}
#' 
#' @details Valid values for \code{objects}:
#' \itemize{
#' \item \code{image}, see \code{\link{listImages}}
#' \item \code{audience}, see \code{\link{listAudiences}}
#' \item \code{campaign}, see \code{\link{listCampaigns}}
#' \item \code{adset}, see \code{\link{listAdsets}}
#' \item \code{ad}, see \code{\link{listAds}}
#' }
#' 
#' @details \code{listObject} can essentially replace any other \code{list} 
#' family functions. See examples.
#' 
#' @examples 
#' \dontrun{
#' # authenticate
#' orionOAuth(client.id = 0000,
#'            client.secret = "0x00000000x00x0x000xxx0000x0xx0")
#'            
#' # list campaigns with listCampaigns
#' camps <- listCampaigns()
#' 
#' # list campaigns with listObjects
#' obj <- listObjects(object = "campaign")
#' 
#' # identical results
#' identical(camps, obj)
#' }
#' 
#' @seealso \code{\link{orionOAuth}}, \code{\link{listImages}}, 
#' \code{\link{listAudiences}}, \code{\link{listCampaigns}}, 
#' \code{\link{listAdsets}} and \code{\link{listAds}}
#' 
#' @author John Coene \email{john.coene@@cmcm.com}
#' 
#' @export
listObjects <- function(object, n = 50){
  
  obj_print <- object
  
  if(missing(object)) {
    stop("missing object", call. = FALSE)
  } else if(length(object) > 1){
    stop("can only pass one object", call. = FALSE)
  }
  
  cred <- orionToken()
  
  object <- checkObjects(object)
  
  # GET
  response <- httr::GET(url = paste0(getOption("base_url"), "/", object),
                        httr::add_headers(Accept = getOption("accept"),
                                          Authorization = paste0("Bearer ",
                                                                 cred$token)))
  
  content <- httr::content(response)
  
  if(length(content$data)) {
    
    dat <- do.call(plyr::"rbind.fill", lapply(content$data$data, parseJSON))
    
    while(nrow(dat) < n && length(content$data$next_page_url)) {
      
      response <- httr::GET(url = content$data$next_page_url, 
                            httr::add_headers(Accept = getOption("accept"),
                                              Authorization = paste0("Bearer ",
                                                                     cred$token)))
      
      content <- httr::content(response)
      
      page_dat <- do.call(plyr::"rbind.fill", 
                          lapply(content$data$data, parseJSON))
      
      dat <- rbind.data.frame(dat, page_dat)
      
    }
    
    # return
    return(dat)
    
  } else {
    
    warning("No ", obj_print, " found", call. = FALSE)
    
  }
  
}