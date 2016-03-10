#' Get the settings right
#' 
#' These functions attempt to facilitate setting up campaigns, adsets, 
#' ads and audience targeting templates by allowing to pass more readable 
#' settings
#' 
#' @param x Setting to convert
#' 
#' @examples 
#' \dontrun{
#' # authenticate
#' orionOAuth(client.id = 0000,
#'            client.secret = "0x00000000x00x0x000xxx0000x0xx0")
#'            
#' # set campaign
#' settings  <- list(name = "test",
#'                   budget_type = budgetType("daily"),
#'                   budget_daily = "1000", 
#'                   pkg_name = "test",
#'                   objective = objective("installs"), 
#'                   app_type = appType("game"),
#'                   web_type = webType("ecommerce"), 
#'                   landing_page = landingPage("googlePlay"))
#'                   
#' # create campaing
#' createCampaign(body = settings)
#' 
#' }
#' 
#' @return Returns correct value to pass to API.
#' 
#' @seealso \code{\link{orionOAuth}}, \code{\link{createCampaign}}, 
#' \code{\link{createAdset}}, \code{\link{createAd}} and 
#' \code{\link{createAudience}}
#' 
#' @author John Coene \email{john.coene@cmcm.com}
#' 
#' @name helper
NULL

#' @rdname helper
#' @export
budgetType <- function(x){
  
  x <- tolower(x)
  
  valid <- structure(c("daily", "lifetime"), names = 1:2)
  
  if(!x %in% valid){
    stop("x must be one of ", paste0(valid, collapse = ", "), call. = FALSE)
  }
  
  return(x)
  
}

#' @rdname helper
#' @export
objective <- function(x){
  
  x <- tolower(x)
  
  valid <- structure(c("installs", "traffic", "awareness", "reengagement", 
                       "videoviews"), names = 1:5)
  
  x <- setthat(x, valid)
  
  return(x)
}

#' @rdname helper
#' @export
appType <- function(x){
  
  x <- tolower(x)
  
  valid <- structure(c("game", "app"), names = 1:2)
  
  x <- setthat(x, valid)
  
  return(x)
}

#' @rdname helper
#' @export
webType <- function(x){
  
  x <- tolower(x)
  
  valid <- structure(c("none", "ordinary", "ecommerce", "game"), names = 0:3)
  
  x <- setthat(x, valid)
  
  return(x)
}

#' @rdname helper
#' @export
landingPage <- function(x){
  
  x <- tolower(x)
  
  valid <- structure(c("googleplay", "website"), names = 1:2)
  
  x <- setthat(x, valid)
  
  return(x)
}

#' @rdname helper
#' @export
bidType <- function(x){
  
  x <- tolower(x)
  
  valid <- structure(c("cpi", "cpc", "cpm"), names = c(1, 3, 4))
  
  x <- setthat(x, valid)
  
  return(x)
  
}

#' @rdname helper
#' @export
appShowType <- function(x){
  
  x <- tolower(x)
  
  valid <- structure(c("newsfeed", "mininewsfeed","videoad", "applockerad"), 
                     names = c(50000, 50001, 50003, 50008))
  
  x <- setthat(x, valid)
  
  return(x)
}

deliveryType <- function(x){
  
  x <- tolower(x)
  
  valid <- structure(c("standard", "accelerated"), names = 0:1)
  
  x <- setthat(x, valid)
  
  return(x)
}

#' @rdname helper
#' @export
gender <- function(x){
  
  x <- tolower(x)
  
  valid <- structure(c("all", "male", "female"), names = 0:2)
  
  x <- setthat(x, valid)
  
  return(x)
}

#' @rdname helper
#' @export
age <- function(x){
  
  x <- tolower(x)
  
  valid <- structure(c("18-24", "25-30", "31-40", "40+"), names = 1:4)
  
  x <- setthat(x, valid)
  
  return(x)
}

#' @rdname helper
#' @export
netType <- function(x){
  
  x <- tolower(x)
  
  valid <- structure(c("all", "wifi", "2G", "3G", "4G", "2G/3G/4G"), 
                     names = c(0, 1, rep(2, 4)))
  
  x <- setthat(x, valid)
  
  return(x)
}

#' @rdname helper
#' @export
buttonText <- function(x){
  
  x <- tolower(x)
  
  valid <- structure(c("download", "install", "check", "free", "play", 
                       "buy", "more"), names = 1:7)
  
  x <- setthat(x, valid)
  
  return(x)
}

#' @rdname helper
#' @export
switch <- function(x){
  
  x <- tolower(x)
  
  valid <- structure(c("on", "off"), names = c(1, 0))
  
  x <- setthat(x, valid)
  
  return(x)
}