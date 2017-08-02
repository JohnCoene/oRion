#' List valid OS versions
#' 
#' @description Fetch list of OS versions.
#' 
#' @examples 
#' \dontrun{
#' # authenticate
#' orionOAuth(client.id = 0000,
#'            client.secret = "0x00000000x00x0x000xxx0000x0xx0")
#'            
#' # dict os versions
#' versions <- dictOS()
#' 
#' # create audience
#' createAudience(body = list(
#'                audience_template_name = "target android >= 3.0",
#'                min_device_os = versions[versions$value == "3.0", ]
#'                ))
#' }
#' 
#' @seealso \code{\link{orionOAuth}}, \code{\link{createAudience}}
#' 
#' @author John Coene \email{jcoenep@@gmail.com}
#' 
#' @export
dictOS <- function(){
  cred <- orionToken()
  uri <- paste0(getOption("base_url"), "/",
                file.path("dict", "osVersion", fsep = "/"))
  response <- httr::GET(url = uri,
                        httr::add_headers(Accept = getOption("accept"),
                                          Authorization = paste0("Bearer ",
                                                                 cred$token)))
  content <- httr::content(response)
  dat <- do.call(plyr::"rbind.fill", lapply(content$data, parseJSON))
  return(dat)
}