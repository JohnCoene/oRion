#' List adsets
#' 
#' @description Fetch the list of adsets under the authenticated account.
#' 
#' @param n Number of adsets to retrieve, defaults to \code{50}
#' 
#' @examples 
#' \dontrun{
#' # authenticate
#' orionOAuth(client.id = 0000,
#'            client.secret = "0x00000000x00x0x000xxx0000x0xx0")
#'            
#' (adsets <- listAdsets(n = 50))
#' }
#' 
#' @seealso \code{\link{orionOAuth}}
#' 
#' @author John Coene \email{john.coene@@cmcm.com}
#' 
#' @export
listAdsets <- function(n = 50){
  
  res <- listObjects(object = "adset", n = n)
  
  # return
  return(res)
}