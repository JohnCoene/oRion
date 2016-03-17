#' Update an audience targeting template
#' 
#' @description Update audience targeting template settings, see details and 
#' example.
#' 
#' @param body Body of request that includes audience template settings. 
#' See examples and details.
#' @param audience.id id of audience to update
#' 
#' @examples 
#' \dontrun{
#' # authenticate
#' orionOAuth(client.id = 0000,
#'            client.secret = "0x00000000x00x0x000xxx0000x0xx0")
#'            
#' # list audiences
#' audiences <- listAudiences()
#' 
#' # update audience name
#' update <- updateAudience(audience.id = audiences$id[1], body = list(
#'                audience_template_name = "New Audienced Name",
#'                audience_template_desc = "New Description"))
#'                
#' # show updated campaign
#' showAudience(audience.id = audiences$id[1])
#' }
#' 
#' @details Valid values for \code{body}: 
#' \itemize{
#' \item \code{audience_template_name} Audience targeting template name 
#' (unique). 
#' \item \code{audience_template_desc} Description for the audience targeting 
#' template. 
#' \item \code{country} Audience country code. Narrow your potential audience 
#' to the people in those countries. Using '|' separated if more than one country. 
#' i.e.: \code{US|ID|CN}, typically returned by \code{\link{dictCountry}}
#' \item \code{language} Audience language code, i.e.: \code{en}, 
#' typically returned by \code{\link{dictLanguage}}
#' \item \code{gender} Use \code{\link{gender}} to generate otherwise, 
#' \code{0}: All, \code{1}: Male, \code{2} Female
#' \item \code{age} Audience age. Use \code{\link{age}} to generate otherwise, 
#' \code{1}: 18-24, \code{2}: 25-30, \code{3}: 32-40, \code{4}: 41+.
#' \item \code{interest} Audience interest. Reach users based on their specific 
#' interests, typically returned by \code{\link{dictInterest}}
#' \item \code{behavior} Audience behavior. Reach users based on app usage and 
#' other behaviors, typically returned by \code{\link{dictBehaviour}}
#' \item \code{device_brand} Audience device brand, typically returned by 
#' \code{\link{dictDevice}}
#' \item \code{min_device_os} Min OS version of audience used, blank for 
#' unrestricted, typically returned by \code{\link{dictOS}}
#' \item \code{max_device_os} Max OS version of audience used, blank for 
#' unrestricted, typically returned by \code{\link{dictOS}}
#' \item \code{net_type} Use \code{\link{netType}} to generate otherwise, 
#' \code{0}: All, \code{1}: Wifi, \code{2}: 2G/3G/4G
#' \item \code{dsp_url} Bid request url of DSP when this pre-targeting 
#' condition meets.
#' }
#' 
#' @seealso \code{\link{orionOAuth}}, \code{\link{listAudiences}}, 
#' \code{\link{createAudience}}, \code{\link{helpers}}
#' 
#' @author John Coene \email{john.coene@@cmcm.com}
#' 
#' @export
updateAudience <- function(audience.id, body){
  
  res <- updateObject(object = "audience", body = body, id = audience.id)
  
  return(res)
  
}