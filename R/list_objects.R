#' grabCampaigns
#' 
#' @export
grabObjects <- function(object = c("campaign", "adset", "ad")){
  
  cred <- orionToken()
  
  # GET
  response <- httr::GET(url = paste0(getOption("base_url"), "/", object),
                        httr::add_headers(Accept = getOption("accept"),
                                          Authorization = paste0("Bearer ",
                                                                 cred$token)))
  
  content <- httr::content(response)
  
  # return
  return(content)
}