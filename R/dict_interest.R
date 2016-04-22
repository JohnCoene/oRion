#' List available interests
#' 
#' @description Fetch list of interests.
#' 
#' @examples 
#' \dontrun{
#' # authenticate
#' orionOAuth(client.id = 0000,
#'            client.secret = "0x00000000x00x0x000xxx0000x0xx0")
#'            
#' # dict interests
#' head(int <- dictInterest())
#' 
#' # filter transportation-related interests
#' trans <- int[grep("Transportation", int$value),]
#' 
#' # create target audience template 
#' createAudience(body = list(
#'                audience_template_name = "target specific interests",
#'                interest = trans$pid[1]
#'                ))
#' }
#' 
#' @author John Coene \email{jcoenep@@gmail.com}
#' 
#' @export
dictInterest <- function(){
  cred <- orionToken()
  uri <- paste0(getOption("base_url"), "/",
                file.path("dict", "interest", fsep = "/"))
  response <- httr::GET(url = uri,
                        httr::add_headers(Accept = getOption("accept"),
                                          Authorization = paste0("Bearer ",
                                                                 cred$token)))
  content <- httr::content(response)
  dat <- do.call(plyr::"rbind.fill", lapply(content$data, parseJSON))
  return(dat)
}