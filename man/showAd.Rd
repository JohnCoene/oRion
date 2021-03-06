% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/show_ad.R
\name{showAd}
\alias{showAd}
\title{Show an ad settings}
\usage{
showAd(ad.id)
}
\arguments{
\item{ad.id}{id of ad to retrieve}
}
\description{
Retrieve settings of a specfic ad.
}
\examples{
\dontrun{
# authenticate
orionOAuth(client.id = 0000,
           client.secret = "0x00000000x00x0x000xxx0000x0xx0")
           
# list ads
ads <- listAds(n = 100)

# fetch random adset settings
(ad <- showAd(ad.id = sample(ads$id, 1)))
}

}
\seealso{
\code{\link{orionOAuth}}, \code{\link{listAds}}
}
\author{
John Coene \email{jcoenep@gmail.com}
}
