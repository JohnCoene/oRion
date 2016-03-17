#' Show any object settings
#' 
#' @description Retrieve settings of an object, see details.
#' 
#' @param object Object to retrieve, see details for valid values.
#' @param id id of object to retrieve
#' 
#' @details Valid values for \code{object}: 
#' \itemize{
#' \item \code{audience} see \code{\link{showAudience}} for details.
#' \item \code{campaign} see \code{\link{showCampaign}} for details.
#' \item \code{adset} see \code{\link{showAdset}} for details.
#' \item \code{ad} see \code{\link{showAd}} for details.
#' }
#' 
#' \code{showObject} can essentially replace any other \code{show} 
#' family functions a the execption of \code{\link{showAdsetAudience}}. 
#' See examples.
#' 
#' @examples 
#' \dontrun{
#' # authenticate
#' orionOAuth(client.id = 0000,
#'            client.secret = "0x00000000x00x0x000xxx0000x0xx0")
#'            
#' # list ads
#' ads <- listObjects(object = "ad", n = 100)
#' 
#' # fetch first ad
#' ad <- showObject(object = "ad", id = ads$id[1])
#' 
#' # list campaigns
#' campaigns <- listObjects(object = "campaign")
#' 
#' # fetch random campaign
#' campaign <- showObject(id = campaigns$id[1])
#' 
#' # equivalent to 
#' campaign2 <- showCampaign(campaign.id = campaigns$id[1])
#' 
#' identical(campaign, campaign2)
#' }
#' 
#' @seealso \code{\link{orionOAuth}}, \code{\link{showAudience}}, 
#' \code{\link{showCampaign}}, \code{\link{showAdset}} and 
#' \code{\link{showAd}}
#' 
#' @author John Coene \email{john.coene@@cmcm.com}
#' 
#' @export
showObject <- function(object, id){
  
  if(missing(id)){
    stop("must specify id", call. = FALSE)
  }
  
  if(missing(object)){
    stop("must specify object see details", call. = FALSE)
  }
  
  cred <- orionToken()
  
  object <- checkObjects(object)
  
  # GET
  response <- httr::GET(url = paste0(getOption("base_url"), "/", object, "/", id),
                        httr::add_headers(Accept = getOption("accept"),
                                          Authorization = paste0("Bearer ",
                                                                 cred$token)))
  
  content <- httr::content(response)
  
  testReturn(content)
    
  result <- as.data.frame(t(unlist(content$data)), stringsAsFactors = FALSE)
  
  return(result)
  
}