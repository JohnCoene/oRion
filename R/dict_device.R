#' List valid device models
#' 
#' @description Fetch list of device models.
#' 
#' @examples 
#' \dontrun{
#' # authenticate
#' orionOAuth(client.id = 0000,
#'            client.secret = "0x00000000x00x0x000xxx0000x0xx0")
#'            
#' # dict mobile devices
#' (devices <- dictDevice())
#' 
#' # create audience with device setting
#' createAudience(body = list(
#'                audience_template_name = "target specific device users",
#'                device_brand = sample(devices$id, 1)
#'                ))
#' }
#' 
#' @seealso \code{\link{orionOAuth}}, \code{\link{createAudience}}
#' 
#' @author John Coene \email{john.coene@@cmcm.com}
#' 
#' @export
dictDevice <- function(){
  cred <- orionToken()
  uri <- paste0(getOption("base_url"), "/",
                file.path("dict", "deviceModel", fsep = "/"))
  response <- httr::GET(url = uri,
                        httr::add_headers(Accept = getOption("accept"),
                                          Authorization = paste0("Bearer ",
                                                                 cred$token)))
  content <- httr::content(response)
  dat <- do.call(plyr::"rbind.fill", lapply(content$data, parseJSON))
  return(dat)
}