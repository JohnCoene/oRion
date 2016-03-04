cred_env <- new.env(hash=TRUE)

.onAttach <- function(libname = find.package("oRion"), pkgname = "oRion") {
  packageStartupMessage("oRion by Cheetah Mobile")
}

.onLoad <- function(libname = find.package("oRion"), pkgname = "oRion") {
  options(base_url = "http://alpha.api.ori.cmcm.com",
          accept = "application/json,application/x.orion.v1+json")
}


# .onUnload <- function(libname = find.package("oRion"), pkgname = "oRion") {
#   options(base_url = NULL, accept = NULL)
# }
# 
# .onDetach <- function(libname = find.package("oRion"), pkgname = "oRion") {
#   options(base_url = NULL, accept = NULL)
# }