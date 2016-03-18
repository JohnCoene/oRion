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
#' # set body of request
#' camp <- list(name = "My Campaign",
#'              budget_type = "daily",
#'              budget_daily = "1000", 
#'              pkg_name = "someting.test.com",
#'              objective = objective("installs"), 
#'              app_type = "2",
#'              web_type = "1")
#' 
#' # create campaign            
#' campaign <- createCampaign(body = camp)
#' 
#' # delete random campaign
#' deleteCampaign(campaign.id = campaign$id)
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