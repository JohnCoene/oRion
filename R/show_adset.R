#' Show an adset settings
#' 
#' @description Retrieve settings of a specfic adset. 
#' 
#' @param adset.id id of adset to retrieve
#' 
#' @examples 
#' \dontrun{
#' # authenticate
#' orionOAuth(client.id = 0000,
#'            client.secret = "0x00000000x00x0x000xxx0000x0xx0")
#'            
#' # list adsets
#' adsets <- listAdsets(n = 100)
#' 
#' # fetch random adset settings
#' (adset <- showAdset(adset.id = sample(adsets$id, 1)))
#' }
#' 
#' @seealso \code{\link{orionOAuth}}, \code{\link{listAdsets}}
#' 
#' @author John Coene \email{jcoenep@@gmail.com}
#' 
#' @export
showAdset <- function(adset.id){
  res <- showObject(object = "adset", id = adset.id)
  return(res)
}