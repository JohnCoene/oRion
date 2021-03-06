% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/delete_audience.R
\name{deleteAudience}
\alias{deleteAudience}
\title{Delete an audience targeting template}
\usage{
deleteAudience(audience.id)
}
\arguments{
\item{audience.id}{id of object to delete}
}
\description{
Delete audience targeting template.
}
\examples{
\dontrun{
# authenticate
orionOAuth(client.id = 0000,
           client.secret = "0x00000000x00x0x000xxx0000x0xx0")
           
# list audiences
audiences <- listAudiences()

# delete random aduience template
deleteAudience(audience.id = sample(audiences$id, 1))
}

}
\seealso{
\code{\link{orionOAuth}}, \code{\link{createAudience}}
}
\author{
John Coene \email{jcoenep@gmail.com}
}
