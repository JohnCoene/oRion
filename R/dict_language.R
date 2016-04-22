#' List valid languages
#' 
#' @description Fetch list of languages.
#' 
#' @examples 
#' \dontrun{
#' # authenticate
#' orionOAuth(client.id = 0000,
#'            client.secret = "0x00000000x00x0x000xxx0000x0xx0")
#'            
#' # dict languages
#' head(lang <- dictLanguage())
#' 
#' # filter russian language code
#' russian <- subset(lang, value == "Russian")$code
#' 
#' # create audience
#' createAudience(body= list(
#'                audience_template_name = "target Russian speakers",
#'                language = russian
#' ))
#' }
#' 
#' @seealso \code{\link{orionOAuth}}, \code{\link{createAudience}}
#' 
#' @author John Coene \email{jcoenep@@gmail.com}
#' 
#' @export
dictLanguage <- function(){
  cred <- orionToken()
  uri <- paste0(getOption("base_url"), "/",
                file.path("dict", "language", fsep = "/"))
  response <- httr::GET(url = uri,
                        httr::add_headers(Accept = getOption("accept"),
                                          Authorization = paste0("Bearer ",
                                                                 cred$token)))
  content <- httr::content(response)
  dat <- do.call(plyr::"rbind.fill", lapply(content$data, parseJSON))
  return(dat)
}