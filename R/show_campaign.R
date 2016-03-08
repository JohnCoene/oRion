#' showCampaign
#' 
#' @description Retrieve settings of a specfic campaign
#' 
#' @param campaign.id id of campaign to retrieve
#' 
#' @examples 
#' \dontrun{
#' # authenticate
#' orionOAuth(client.id = 0000,
#'            client.secret = "0x00000000x00x0x000xxx0000x0xx0")
#'            
#' # list campaigns
#' camps <- listCampaigns(n = 100)
#' 
#' # fetch random campaign settings
#' (camp <- showCampaign(campaign.id = sample(camps$id, 1)))
#' }
#' 
#' @author John Coene \email{john.coene@@cmcm.com}
#' 
#' @export
showCampaign <- function(campaign.id){
  
  res <- showObject(object = "campaign", id = campaign.id)
  
  return(res)
  
}