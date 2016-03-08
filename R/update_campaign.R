#' updateCampaign
#' 
#' @description Update campaign settings, see details and example.
#' 
#' @param body Body of request that includes campaigns settings. See examples 
#' and details.
#' @param campaign.id id of campaign to update
#' 
#' @examples 
#' \dontrun{
#' # authenticate
#' orionOAuth(client.id = 0000,
#'            client.secret = "0x00000000x00x0x000xxx0000x0xx0")
#'            
#' # list campaigns
#' camps <- listCampaign()
#' 
#' # update campaign name
#' update <- updateCampaign(campaign.id = camps$id[1], body = list(
#'                          switch = 0, 
#'                          name = "New campaign Name"))
#'                
#' # show updated campaign
#' showCampaign(campaign.id = camps$id[1])
#' }
#' 
#' @details Valid values for \code{body}: 
#' \itemize{
#' \item \code{switch} Ad switch \code{1}: On, \code{0}: Off.
#' \item \code{name} Campaign name should be unique under the same user account.
#' \item \code{budget_type} can take either \code{daily} or \code{lifetime}
#' \item \code{budget_daily} Required when \code{budget_type} equals to 
#' \code{daily}
#' \item \code{budget_lifetime} Required when \code{budget_type} equals to 
#' \code{lifetime}
#' }
#' 
#' @author John Coene \email{john.coene@@cmcm.com}
#' 
#' @export
updateCampaign <- function(campaign.id, body){
  
  res <- updateObject(object = "campaign", body = body, id = campaign.id)
  
  return(res)
  
}