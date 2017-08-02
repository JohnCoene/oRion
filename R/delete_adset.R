#' Delete an adset
#' 
#' @description Delete an adset.
#' 
#' @param adset.id id of object to delete
#' 
#' @examples 
#' \dontrun{
#' # authenticate
#' orionOAuth(client.id = 0000,
#'            client.secret = "0x00000000x00x0x000xxx0000x0xx0")
#'            
#' # list of campaigns
#' camps <- listCampaigns()
#'            
#' # list of audience templates
#' audiences <- listAudiences()
#'                                                 
#' # create adset using random template, in random campaign
#' adset <- createAdset(body = list(
#'    name = "My Adset",
#'    bid_type = bidType("CPI"),
#'    unit_price = 1000,
#'    budget_lifetime = 10000,
#'    campaign_id = sample(camps$id, 1),
#'    audience_create_way = 2,
#'    app_show_type = appShowType("newsfeed"),
#'    audience_template_id = sample(audiences$id, 1),
#'    click_url = "http://app.adjust.io"))
#' 
#' # delete random adset
#' deleteAdset(adset.id = adset$id)
#' }
#' 
#' @seealso \code{\link{orionOAuth}}, \code{\link{createAdset}}
#' 
#' @author John Coene \email{jcoenep@@gmail.com}
#' 
#' @export
deleteAdset <- function(adset.id) {
  result <- deleteObject(object = "adset", id = adset.id)
  return(result)
}