#' orionAuthenticate
#' 
#' @description Authenticate the Orion API
#' 
#' @param client.id Your \code{client_id}
#' @param client.secret Your \code{client_secret}
#' @param grant.type Currently only supports \code{client_credentials} 
#' (default)
#' @param save If \code{TRUE} will save the token for future sessions, 
#' default to \code{FALSE}
#' 
#' @details Please see the official documentation to apply for the API and 
#' get your \code{client_id} and \code{client_secret}: 
#' \url{api.ori.cmcm.com/doc/#api-Auth-access_token}. If the token is stored 
#' (\code{save = TRUE}) then \code{orionOAuth} does not need to be run in 
#' future sessions, see example.
#' 
#' @examples 
#' \dontrun{
#' # authenticate
#' orionOAuth(client.id = 0000,
#'            client.secret = "0x00000000x00x0x000xxx0000x0xx0")
#'            
#' # test
#' campaigns <- listCampaigns()
#'            
#' # authenticate and save
#' orionOAuth(client.id = 0000,
#'            client.secret = "0x00000000x00x0x000xxx0000x0xx0", 
#'            save = TRUE)
#'            
#' # detach and unload package
#' detach("package:oRion", unload = TRUE)
#' 
#' # re-load
#' library(oRion)
#' 
#' # test
#' campaigns <- listCampaigns()
#' }
#' 
#' @author John Coene \email{john.coene@@cmcm.com}
#' 
#' @export
orionOAuth <- function (client.id, client.secret, 
                        grant.type = "client_credentials", save = FALSE) {
  
  # check required inputs
  if(missing(client.id)){
    stop("must specify client.id", call. = FALSE)
  } else if (missing(client.secret)){
    stop("must specify client.secret", call. = FALSE)
  } else if (grant.type != "client_credentials"){
    stop("currently grant.type only supports 'client_credentials'")
  }
  
  # POST
  response <- httr::POST(paste0(getOption("base_url"), "/oauth/access_token"),
                         encode = "multipart",
                         body = list(grant_type = grant.type,
                                     client_id = client.id,
                                     client_secret = client.secret))
  
  testReturn(response)
  
  # parse
  return <- jsonlite::fromJSON(rawToChar(response$content))
  
  constructCred(return, pars = list(client.id = client.id, 
                                    client.secret = client.secret))
  
  cat("authentication successful")
  
  if(save == TRUE){
    
    credentials <- get("credentials", envir=cred_env)
    
    credentials$client.id <- charToRaw(credentials$client.id)
    credentials$client.secret <- charToRaw(credentials$client.secret)
    
    save(credentials, file = ".orionToken")
    
  }
    
  # return(get("credentials", envir=cred_env))

}
