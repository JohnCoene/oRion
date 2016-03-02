#' grabCampaigns
#' 
#' @export
grabCampaigns <- function(){
  
  cred <- get("credentials", envir=cred_env)
  
  # GET
  response <- httr::GET(url = paste0(getOption("base_url"), "/campaign"),
                        httr::add_headers(Accept = getOption("accept"),
                                          Authorization = paste0("Bearer ",
                                                                 cred$token)))
  
  content <- httr::content(response)
  
  # return
  return(content)
}