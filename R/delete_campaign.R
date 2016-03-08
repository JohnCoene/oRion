#' Delete a campaign
#' 
#' @description Delete a campaign.
#' 
#' @param campaign.id id of object to delete
#' 
#' @examples 
#' \dontrun{
#' # authenticate
#' orionOAuth(client.id = 0000,
#'            client.secret = "0x00000000x00x0x000xxx0000x0xx0")
#'            
#' # get campaigns
#' campaigns <- listCampaigns()
#' 
#' # delete random campaign
#' deleteCampaign(campaign.id = sample(campaigns$id, 1))
#' }
#' 
#' @seealso \code{\link{orionOAuth}}, \code{\link{createCampaign}}
#' 
#' @author John Coene \email{john.coene@@cmcm.com}
#' 
#' @export
deleteCampaign <- function(campaign.id) {
  
  cred <- orionToken()
  
  result <- deleteObject(object = "campaign", id = campaign.id)
}