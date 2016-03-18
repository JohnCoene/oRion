#' List campaigns
#' 
#' @description List of campaigns under the authenticated account.
#' 
#' @param n Number of campaigns to retrieve, defaults to \code{50}
#' 
#' @examples 
#' \dontrun{
#' # authenticate
#' orionOAuth(client.id = 0000,
#'            client.secret = "0x00000000x00x0x000xxx0000x0xx0")
#'            
#' head(camps <- listCampaigns(n = 100))
#' }
#' 
#' @seealso \code{\link{orionOAuth}}
#' 
#' @author John Coene \email{john.coene@@cmcm.com}
#' 
#' @export
listCampaigns <- function(n = 50){
  
  res <- listObjects(object = "campaign", n = n)
  
  # return
  return(res)
}