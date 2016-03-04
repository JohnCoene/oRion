
# construct credentials
construct.cred <- function(json, pars) {
  
  credentials <- list(client.id = pars$client.id,
                      client.secret = pars$client.secret,
                      token = json$data$access_token,
                      expires_in_sec = json$data$expires_in,
                      expires_in_date = Sys.time() + json$data$expires_in)
  
  attr(credentials, "hidden") <- c("client.id", "client.secret")
  
  class(credentials) <- "orionToken"
  
  assign("credentials", credentials, envir = cred_env)
  
}

parse.cred <- function(response){
  
  json <- jsonlite::fromJSON(rawToChar(response$content))
  
  # check if success
  if(json$status != 200){
    
    msg <- paste0("OAuth error. API returned status ", json$status, 
                  ": ", json$message)
    
    stop(msg, call. = FALSE)
    
  } else {
    
    return(json)
    
  }
  
}

orionToken <- function() {
  
  cred <- get("credentials", envir=cred_env)
  
  if(cred$expires_in_date <= Sys.time()) {
    
    cred <- orionOAuth(cred$client.id, cred$client.secret)
    
  }
  
  return(cred)
  
}

checkObjects <- function(objects){
  
  valid <- c("campaign", "ad", "adset", "audience")
  
  sapply(objects, function(x) {
    if(objects %in% valid == FALSE){
      stop("invalid object", call. = FALSE)
    }
  })
  
  objects[objects %in% "audience"] <- "audience/targeting/template"
  
  return (objects)
  
}

encodeBody <- function(body){
  
  body <- jsonlite::toJSON(auto_unbox = TRUE, x = body)
  
  return(body)
}
