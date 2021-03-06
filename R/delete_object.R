#' Delete any object
#' 
#' @description Delete campaign, adsets, ads or audience temapltes, 
#' see details and examples.
#' 
#' @param object Object to be deleted, see details for valid values.
#' @param id id of object to delete
#' 
#' @details Valid values for \code{object}: 
#' \itemize{
#' \item \code{audience}, see \code{\link{deleteAudience}} for details.
#' \item \code{campaign}, see \code{\link{deleteCampaign}} for details.
#' \item \code{adset}, see \code{\link{deleteAdset}} for details.
#' \item \code{ad}, see \code{\link{deleteAd}} for details.
#' }
#' 
#' \code{deleteObject} can essentially replace any other \code{delete} 
#' family functions. See examples.
#' 
#' @examples 
#' \dontrun{
#' # authenticate
#' orionOAuth(client.id = 0000,
#'            client.secret = "0x00000000x00x0x000xxx0000x0xx0")
#'            
#' # list ads
#' ads <- listObjects(object = "ad")
#' 
#' # delete
#' # set seed for reproducibility
#' set.seed(19880525)
#' 
#' # delete random ad
#' deleteObject(object = "ad", id = sample(ads$id, 1))
#' 
#' # the above is equivalent to
#' # deleteAd(ad.id = sample(ads$id, 1))
#' }
#' 
#' @seealso \code{\link{orionOAuth}}, \code{\link{deleteAudience}}, 
#' \code{\link{deleteCampaign}}, \code{\link{deleteAdset}} and 
#' \code{\link{deleteAd}}
#' 
#' @author John Coene \email{jcoenep@@gmail.com}
#' 
#' @export
deleteObject <- function(object, id) {
  if (missing(id)){
    stop("must specify id", call. = FALSE)
  }
  if (missing(object)){
    stop("must specify object see details", call. = FALSE)
  }
  cred <- orionToken()
  object <- checkObjects(object)
  response <- httr::DELETE(paste0(getOption("base_url"), "/", object, "/", id),
                         encode = "multipart",
                         httr::add_headers(Accept = getOption("accept"),
                                           Authorization = paste0("Bearer ",
                                                                  cred$token)))
  content <- httr::content(response)
  testReturn(content)
  result <- as.data.frame(t(do.call("rbind", content$data)),
                          stringsAsFactors = FALSE)
  return(result)
}