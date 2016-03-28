cred_env <- new.env(hash=TRUE)

.onAttach <- function(libname = find.package("oRion"), pkgname = "oRion") {
  if(file.exists(".orionToken")){
    credentials <- get(load(".orionToken"))
    credentials$client.id <- rawToChar(credentials$client.id)
    credentials$client.secret <- rawToChar(credentials$client.secret)
    assign("credentials", credentials, envir = cred_env)
    packageStartupMessage("credentials loaded")
  } else {
    packageStartupMessage("help('oRion') for examples")
  }
}

.onLoad <- function(libname = find.package("oRion"), pkgname = "oRion") {
  options(base_url = "http://api.ori.cmcm.com",
          accept = "application/json,application/x.orion.v1+json")
  if(file.exists(".orionToken")){
    credentials <- get(load(".orionToken"))
    credentials$client.id <- rawToChar(credentials$client.id)
    credentials$client.secret <- rawToChar(credentials$client.secret)
    assign("credentials", credentials, envir = cred_env)
  }
}


.onUnload <- function(libpath = find.package("oRion")) {
  options(base_url = NULL, accept = NULL)
}

.onDetach <- function(libpath = find.package("oRion")) {
  options(base_url = NULL, accept = NULL)
}