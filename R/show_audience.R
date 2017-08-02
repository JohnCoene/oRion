#' Show an audience targeting template
#' 
#' @description Retrieve settings of a specfic audience targeting template. 
#' 
#' @param audience.id id of audience template to retrieve
#' 
#' @examples 
#' \dontrun{
#' # authenticate
#' orionOAuth(client.id = 0000,
#'            client.secret = "0x00000000x00x0x000xxx0000x0xx0")
#'            
#' # list ads
#' audiences <- listAudiences(n = 100)
#' 
#' # fetch random adset settings
#' (audience <- showAudiences(audience.id = sample(audiences$id, 1)))
#' }
#' 
#' @seealso \code{\link{orionOAuth}}, \code{\link{listAudiences}}
#' 
#' @author John Coene \email{jcoenep@@gmail.com}
#' 
#' @export
showAudience <- function(audience.id){
  res <- showObject(object = "audience", id = audience.id)
  return(res)
}