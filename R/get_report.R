#' Get data
#' 
#' @description Fetch data.
#' 
#' @param column Variables to retrieve, see details for valid values. Defaults 
#' to \code{c("impression", "click")}. Must pass  at least 2 values 
#' (vector of length >= 2). Required.
#' @param group.by How to breakdown the data, see @@details for valid values. 
#' Defaults to \code{c("datetime", "campaign")}. Must pass at least 2 values 
#' (vector of length >= 2). 
#' Required.
#' @param start Start date (YYYY-MM-DD). Required.
#' @param end End date (YYYY-MM-DD), defaults to \code{Sys.Date()}. Required.
#' @param action target node, currently only supports \code{"advertiser"} 
#' (default).
#' @param filter Defaults to \code{NULL}. Optional.
#' 
#' @details The official documentation can be found 
#' \href{http://api.ori.cmcm.com/doc/#api-Report-Report_API}{here}.
#' 
#' Valid values for \code{column}:
#' \itemize{
#' \item \code{impression}
#' \item \code{click}
#' \item \code{conversion}
#' \item \code{revenue}
#' \item \code{ctr}
#' \item \code{cpm}
#' }
#' 
#' Valid values for \code{group.by}:
#' \itemize{
#' \item \code{age}
#' \item \code{gender}
#' \item \code{location}
#' \item \code{brand}
#' \item \code{ad}
#' \item \code{adset}
#' \item \code{campaign}
#' \item \code{videotype}
#' }
#' 
#' @examples 
#' \dontrun{
#' # authenticate
#' orionOAuth(client.id = 0000, 
#'            client.secret = "0x00000000x00x0x000xxx0000x0xx0")
#'            
#' # get daily campaign impressions and conversions for the past 7 days
#' dat <- getReport(column = c("impression", "conversion"), 
#'                  group.by = c("datetime", "campaign"), 
#'                  start = Sys.Date() - 7)
#' }
#' 
#' @seealso \code{\link{orionOAuth}}
#' 
#' @author John Coene \email{john.coene@@cmcm.com}
#' 
#' @export
getReport <- function(column = c("impression", "click"),
                      group.by = c("datetime", "campaign"),
                      action = "advertiser", filter = NULL, start,
                      end = Sys.Date()){
  cred <- orionToken()
  body <- list(
    column = column,
    groupby = group.by,
    filter = filter,
    start = start,
    end = end)
  reportInput(body)
  uri <- paste0(getOption("base_url"), "/", "report", "/", action)
  response <- httr::POST(url = uri,
                         encode = "json", body = body,
                         httr::add_headers(Accept = getOption("accept"),
                                           Authorization = paste0("Bearer ",
                                                                  cred$token)))
  content <- httr::content(response)
  testReturn(content)
  dat <- do.call(plyr::"rbind.fill", lapply(content$data$data, parseJSON))
  names(dat) <- content$data$title
  if(length(grep("^datetime$", names(dat)))){
    year <- substring(dat$datetime, 1, 4)
    month <- substring(dat$datetime, 5, 6)
    day <- substring(dat$datetime, 7, 9)
    dat$datetime <- as.Date(paste0(year, "-", month, "-", day))
  }
  return(dat)
}