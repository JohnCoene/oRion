#' GET data
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
#' @param filter Defaults to \code{NULL}. Optional.
#' 
#' @details Valid values for \code{column}:
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
#'                   
#' # get daily adset ratios for the past 30 days by age and gender
#' dat <- getReport(column = c("ctr", "cpm", "cpc"), 
#'                  group.by = c("datetime", "adset", "age", "gender"),
#'                  start = Sys.Date() - 30)
#'                  
#' # get impressions and clicks for January 2016's ads
#' dat <- getReport(column = c("impression", "click"), 
#'                  group.by = c("datetime", "ad"), start = "2016-01-01",
#'                  end = "2016-02-01")
#' }
#' 
#' @seealso \code{\link{orionOAuth}}
#' 
#' @author John Coene \email{john.coene@@cmcm.com}
#' 
#' @export
getReport <- function(column = c("impression", "click"), 
                      group.by = c("datetime", "campaign"), filter = NULL, 
                      start, end = Sys.Date()){
  
  cred <- orionToken()
  
  body <- list(
    column = column,
    groupby = group.by,
    filter = filter,
    start = start,
    end = end
  )
  
  reportInput(body)
  
  # POST
  response <- httr::POST(url = paste0(getOption("base_url"), "/report/advertiser"),
                         encode = "json", body = body,
                         httr::add_headers(Accept = getOption("accept"),
                                           Authorization = paste0("Bearer ",
                                                                  cred$token)))
  
  testReturn(response)
  
  content <- httr::content(response)
  
  dat <- do.call(plyr::"rbind.fill", lapply(content$data$data, parseJSON))
  
  return(dat)
}