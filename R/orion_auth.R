#' orionAuthenticate
#' 
#' @description Authenticate the Orion API
#' 
#' @param client.id Your \code{client_id}
#' @param client.secret Your \code{client_secret}
#' @param grant.type Currently only supports \code{client_credentials} 
#' (default).
#' 
#' @details Please see the official documentation to apply for the API and 
#' get your \code{client_id} and \code{client_secret}: 
#' \url{api.ori.cmcm.com/doc/#api-Auth-access_token}
#' 
#' @author John Coene \email{john.coene@@cmcm.com}
#' 
#' @export
orionOAuth <- function (client.id, client.secret, 
                        grant.type = "client_credentials") {
  
  # check required inputs
  if(missing(client.id)){
    stop("must specify client.id", call. = FALSE)
  } else if (missing(client.secret)){
    stop("must specify client.secret", call. = FALSE)
  }
  
  # POST
  response <- httr::POST(paste0(getOption("base_url"), "/oauth/access_token"),
                         encode = "multipart",
                         body = list(grant_type = grant.type,
                                     client_id = client.id,
                                     client_secret = client.secret))
  
  pars <- list(client.id = client.id,
               client.secret = client.secret)
  
  # parse
  return <- parse.cred(response)
  
  construct.cred(return, pars = pars)
  
  return(get("credentials", envir=cred_env))

}
