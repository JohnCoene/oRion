#' List audience targeting templates
#' 
#' @description Fetch the list of audience templates under the authenticated 
#' account.
#' 
#' @param n Number of audience templates to retrieve, defaults to \code{50}
#' 
#' @examples 
#' \dontrun{
#' # authenticate
#' orionOAuth(client.id = 0000,
#'            client.secret = "0x00000000x00x0x000xxx0000x0xx0")
#'            
#' (aud <- listAudiences(n = 50))
#' }
#' 
#' @seealso \code{\link{orionOAuth}}
#' 
#' @author John Coene \email{john.coene@@cmcm.com}
#' 
#' @export
listAudiences <- function(n = 50){
  
  res <- listObjects(object = "audience", n = n)
  
  # return
  return(res)
}