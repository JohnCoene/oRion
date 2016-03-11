cred_env <- new.env(hash=TRUE)

.onAttach <- function(libname = find.package("oRion"), pkgname = "oRion") {
  packageStartupMessage("package?oRion for examples")
}

.onLoad <- function(libname = find.package("oRion"), pkgname = "oRion") {
  options(base_url = "http://alpha.api.ori.cmcm.com",
          accept = "application/json,application/x.orion.v1+json")
}


.onUnload <- function(libpath = find.package("oRion")) {
  options(base_url = NULL, accept = NULL)
}

.onDetach <- function(libpath = find.package("oRion")) {
  options(base_url = NULL, accept = NULL)
}