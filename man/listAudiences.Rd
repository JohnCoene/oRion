% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/list_audiences.R
\name{listAudiences}
\alias{listAudiences}
\title{List audience targeting templates}
\usage{
listAudiences(n = 50)
}
\arguments{
\item{n}{Number of audience templates to retrieve, defaults to \code{50}}
}
\description{
List of audience templates under the authenticated 
account.
}
\examples{
\dontrun{
# authenticate
orionOAuth(client.id = 0000,
           client.secret = "0x00000000x00x0x000xxx0000x0xx0")
           
(aud <- listAudiences(n = 50))
}

}
\seealso{
\code{\link{orionOAuth}}
}
\author{
John Coene \email{jcoenep@gmail.com}
}
