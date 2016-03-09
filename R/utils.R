
# construct credentials
constructCred <- function(json, pars) {
  
  credentials <- list(client.id = pars$client.id,
                      client.secret = pars$client.secret,
                      token = json$data$access_token,
                      expires_in_sec = json$data$expires_in,
                      expires_in_date = Sys.time() + json$data$expires_in)
  
  attr(credentials, "hidden") <- c("client.id", "client.secret")
  
  class(credentials) <- "orionToken"
  
  assign("credentials", credentials, envir = cred_env)
  
}

testReturn <- function(response) {
  
  json <- jsonlite::fromJSON(rawToChar(response$content))
  
  # check if success
  if(json$status != 200){
    
    msg <- paste0("API returned status ", json$status, 
                  ": ", json$message)
    
    stop(msg, call. = FALSE)
    
  } 
  
}

orionToken <- function() {
  
  cred <- tryCatch(get("credentials", envir=cred_env),
                   error = function(e){
                     stop("No credentials see ?orionOAuth", call. = FALSE)})
  
  if(cred$expires_in_date <= Sys.time()) {
    
    cred <- orionOAuth(cred$client.id, cred$client.secret)
    
  }
  
  return(cred)
  
}

checkObjects <- function(objects){
  
  valid <- c("campaign", "ad", "adset", "audience", "image")
  
  sapply(objects, function(x) {
    if(x %in% valid == FALSE){
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

parseJSON <- function(data){
  
  data <- as.data.frame(t(unlist(data)), stringsAsFactors = FALSE)
  
  return(data)
}


reportInput <- function(body){
  
  col <- c("impression", "click", "revenue", "conversion", 
           "videoview", "cpc", "ctr", "cpm")
  groups = c("datetime", "age", "gender", "location","brand", "ad", "adset", 
             "campaign", "videotype")
  
  sapply(body$column, function(x){
    if(!x %in% col) {
      stop(paste0("invalid column. valid values are ", 
                  paste0(col, collapse = ", ")), call. = FALSE)
    }
  })
  
  sapply(body$group.by, function(x){
    if(!x %in% groups) {
      stop(paste0("invalid column. valid values are ", 
                  paste0(groups, collapse = ", ")), call. = FALSE)
    }
  })
  
  if(length(body$groupby) == 1) {
    
    stop("must specify at least 2 arguments for group.by", call. = FALSE)
    
  }
  
  if(length(body$column) == 1) {
    
    stop("must specify at least 2 arguments for column", call. = FALSE)
    
  }
  
}