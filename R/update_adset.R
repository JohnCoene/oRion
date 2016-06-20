#' Update an adset
#' 
#' @description Update adset settings, see details and example.
#' 
#' @param body Body of request that includes adset settings. See examples 
#' and details.
#' @param adset.id id of adset to update
#' 
#' @examples 
#' \dontrun{
#' # authenticate
#' orionOAuth(client.id = 0000,
#'            client.secret = "0x00000000x00x0x000xxx0000x0xx0")
#'            
#' # list adsets
#' adsets <- listAdsets()
#' 
#' # update adset name
#' update <- updateCampaign(adset.id = adsets$id[1], body = list(
#'                switch = switchIt("on"), 
#'                name = "New adset Name - Running"))
#'                
#' # show updated campaign
#' showAdset(adset.id = adsets$id[1])
#' }
#' 
#' @details Valid values for \code{body}: 
#' \itemize{
#' \item \code{switch} Ad switch, use \code{\link{switchIt}} otherwise, 
#' \code{1}: On, \code{0}: Off.
#' \item \code{name} Ad set name (unique)
#' \item \code{unit_price} Unit Price. Amount you want to spend to pay per click 
#' (CPC) or per 1,000 impressions (CPM)
#' \item \code{click_url} click_url, protocol is required (http://, https://).
#' \item \code{deeplink} Deep link is the ability to link into a specific page 
#' or function inside of your app, making an app linkable just like a web site. 
#' If you are only targeting people who already installed your app, you do not 
#' need to add deferred deep linking. Used when the objective of campaign which 
#' ad set belonged to is "Get App Reengagement" (\code{objective = 4})
#' \item \code{imp_url} Impression Tracking. An Impression tracking is an 
#' optional URL that allows you to track how many people viewed your ads 
#' through third-party tracking system, and our system supported macro is Gaid, 
#' e.g. http://host/imp?gaid={gaid}. Used when the bid type is "CPM" 
#' \code{bid_type = 4}
#' \item \code{budget_lifetime} Your budget is the maximum amount you want to 
#' spend. If you choose lifetime, the amount you enter is the maximum you'll 
#' spend during the lifetime of your ad set. At least one of \code{budget_daily} 
#' and \code{budget_lifetime} is filled.
#' \item \code{budget_daily} Your budget is the maximum amount you want to 
#' spend. If you choose Per Day, the amount you enter is the maximum you'll 
#' spend each day. At least one of "budget_daily" and "budget_lifetime" is 
#' filled.
#' \item \code{start_time} Start time for the adset (i.e.: \code{2015-09-09 10:10})
#' \item \code{end_time} End time for the adset (i.e.: \code{2015-09-09 10:10})
#' \item \code{ad_scheduling} Your ad set will either run continuously within 
#' some days or within some hours range you select. (\code{JSON}) 
#' i.e.: \code{{1:[1,2],7:[1,2,23]}}
#' \item \code{delivery_type} Use \code{\link{deliveryType}} to generate otherwise, 
#' \code{0}: Standard delivery, 
#' \code{1}: Accelerated delivery. 
#' Standard delivery is recommended and the preferred option for most 
#' advertisers. Accelerated delivery can be useful for promoting time-sensitive 
#' events and quickly reaching a target audience.
#' \item \code{target_cpi} Target CPI. Only for KA user. \code{3}: Click (CPC)
#' \item \code{freq_type} Frequency Capping type. Frequency capping controls 
#' frequency capping of the ad set per user. 
#' \item \code{freq_times} Frequency Capping type. Frequency capping controls 
#' frequency capping of the ad set per user.
#' \item \code{country} Audience country code. Narrow your potential audience 
#' to the people in those countries. Using '|' separated if more than one country. 
#' i.e.: \code{US|ID|CN}. See \code{\link{dictCountry}}
#' \item \code{language} Audience language code, i.e.: \code{en} see 
#' \code{\link{dictLanguage}}
#' \item \code{gender} Use \code{\link{gender}} to generate otherwise, 
#' \code{0}: All, \code{1}: Male, \code{2} Female
#' \item \code{age} Use \code{\link{age}} to generate otherwise, 
#' Audience age. \code{1}: 18-24, \code{2}: 25-30, 
#' \code{3}: 32-40, \code{4}: 41+.
#' \item \code{interest} Audience interest. Reach users based on their specific 
#' interests. See \code{\link{dictInterest}}
#' \item \code{behavior} Audience behaviour. Reach users based on app usage and 
#' other behaviors. See \code{\link{dictBehaviour}}
#' \item \code{device_brand} Audience device brand. See \code{\link{dictDevice}}
#' \item \code{min_device_os} Min OS version of audience used, blank for 
#' unrestricted. See \code{\link{dictOS}}
#' \item \code{max_device_os} Max OS version of audience used, blank for 
#' unrestricted. See \code{\link{dictOS}}
#' \item \code{net_type} Use \code{\link{netType}} to generate otherwise, 
#' \code{0}: All, \code{1}: Wifi, \code{2}: 2G/3G/4G
#' \item \code{dsp_url} Bid request url of DSP when this pre-targeting 
#' condition meets.
#' }
#' 
#' @seealso \code{\link{orionOAuth}}, \code{\link{listAdsets}}, 
#' \code{\link{createAdset}}, \code{\link{helpers}}, \code{\link{dictCountry}}, 
#' \code{\link{dictLanguage}}, \code{\link{dictInterest}}, 
#' \code{\link{dictBehaviour}}, \code{\link{dictDevice}}, \code{\link{dictOS}}
#' 
#' @author John Coene \email{john.coene@@cmcm.com}
#' 
#' @export
updateAdset <- function(adset.id, body){
  res <- updateObject(object = "adset", body = body, id = adset.id)
  return(res)
}