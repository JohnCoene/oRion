#' orionAuthenticate
#' 
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
