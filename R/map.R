#' Visualise your account
#' 
#' @description Return edge list of objects in your account
#' 
#' @param campaigns Data frame of campaigns as returned by 
#' \code{\link{listCampaigns}}
#' @param adsets Data frame of campaigns as returned by 
#' \code{\link{listAdsets}}
#' @param ads Data frame of campaigns as returned by 
#' \code{\link{listAds}}
#' @param audiences Data frame of campaigns as returned by 
#' \code{\link{listAudiences}}
#' 
#' @details Maps the network of object under the authenticated user, follows 
#' typical structure.
#' 
#' \itemize{
#' \item{1}{Campaigns}
#' \item{2}{Adsets}
#' \item{3}{Ads}
#' }
#' 
#' @examples 
#' \dontrun{
#' # authenticate
#' orionOAuth(client.id = 0000,
#'            client.secret = "0x00000000x00x0x000xxx0000x0xx0")
#'            
#' # list required objects
#' ads <- listAds(n = 500)
#' adsets <- listAdsets(n = 500)
#' campaigns <- listCampaigns(n = 500)
#' audiences <- listAudiences(n = 500)
#' 
#' network <- map(campaigns, adsets, ads, audiences)
#' 
#' # plot with igraph
#' # plot ids
#' g <- igraph::graph.data.frame(network[,1:2], directed = TRUE)
#' plot(g)
#' 
#' # plot names
#' g <- igraph::graph.data.frame(network[,3:4], directed = TRUE)
#' plot(g)
#' 
#' # plot with networkd3
#' networkD3::simpleNetwork(Data = network, Source = "source.name", 
#'                          Target = "target.name")
#' }
#' 
#' @seealso \code{\link{orionOAuth}}, \code{\link{listAudiences}}, 
#' \code{\link{listCampaigns}}, \code{\link{listAdsets}}, 
#' \code{\link{listAds}}
#' 
#' @author John Coene \email{john.coene@@cmcm.com}
#' 
#' @export
#' 
map <- function(campaigns, adsets, ads, audiences){
  
  if(missing(campaigns)){
    stop("missing campaigns data.frame")
  }
  
  if(missing(adsets)){
    stop("missing adsets data.frame")
  }
  
  if(missing(ads)){
    stop("missing ads data.frame")
  }
  
  if(missing(audiences)){
    stop("missing audience data.frame")
  }
  
  head <- ads[, c("id", "adset_id")]
  
  body <- adsets[, c("audience_id", "id")]
  
  tail <- ads[, c("adset_id", "campaign_id")]
  
  names(head) <- c("source", "target")
  names(body) <- names(head)
  names(tail) <- names(head)
  
  net <- rbind.data.frame(head, body, tail)
  
  db <- data.frame(names = c(ads$name, adsets$name, campaigns$name, 
                             audiences$audience_template_name),
                   id = c(ads$id, adsets$id, campaigns$id, 
                          audiences$id), 
                   object = c(rep("ad", length(ads$id)),
                              rep("adsets", length(adsets$id)),
                              rep("campaigns", length(campaigns$id)),
                              rep("audience", length(audiences$id))))
  
  net <- merge(net, db, by.x = "target", by.y = "id")
  
  net <- merge(net, db, by.x = "source", by.y = "id")
  
  net <- net[, c(1, 2, 3, 5, 4, 6)]
  
  names(net) <- c("source.id", "target.id", "source.name", "target.name",
                  "source.object", "target.object")
  
  return(net)
  
}