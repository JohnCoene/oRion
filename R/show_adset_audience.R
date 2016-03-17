#' Show adset audience targeting template
#' 
#' @description Retrieve the audience templates under a specific adset.
#' 
#' @param adset.id id of adset's template to retrieve
#' 
#' @examples 
#' \dontrun{
#' # authenticate
#' orionOAuth(client.id = 0000,
#'            client.secret = "0x00000000x00x0x000xxx0000x0xx0")
#'            
#' # list 50 adsets
#' adsets <- listAdsets(n = 50)
#' 
#' # show audience template of random adset
#' audience <- showAdsetAudience(adset.id = sample(adsets$id, 1))
#' }
#' 
#' @seealso \code{\link{orionOAuth}}, \code{\link{showAdset}}, 
#' \code{\link{showAudience}}, \code{\link{listAdsets}}, 
#' \code{\link{listAudiences}}
#' 
#' @author John Coene \email{john.coene@@cmcm.com}
#' 
#' @export
showAdsetAudience <- function(adset.id){
  
  if(missing(adset.id)){
    stop("must specify adset.id", call. = FALSE)
  }
  
  cred <- orionToken()
  
  uri <- paste0(getOption("base_url"), "/adset/", adset.id, "/audience")
  
  # GET
  response <- httr::GET(url = uri,
                        httr::add_headers(Accept = getOption("accept"),
                                          Authorization = paste0("Bearer ",
                                                                 cred$token)))
  
  content <- httr::content(response)
  
  testReturn(content)
  
  result <- as.data.frame(t(unlist(content$data)), 
                          stringsAsFactors = FALSE)
  
  return(result)
  
}