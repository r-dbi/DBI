% $Id$
\name{fetch}
\alias{fetch}
\title{
  Fetch records from a previously executed query
}
\description{
  Fetch records from a previously executed query.
}
\usage{
  fetch(res, n, ...)
}
\arguments{

\item{res}{
  a result set object (one whose class extends \code{DBIResult}).
  This object needs to be the result of a statement that produces
  output, such as SQL's \code{SELECT} or \code{SELECT}-like statement,
  this object \code{res} is typically produced by a call to
  or \code{dbSendQuery}.
  }
\item{n}{
  maximum number of records to retrieve per fetch.
  Use \code{n = -1} to retrieve all pending records.
  Some implementations may recognize other special values.
  }
\item{\dots }{
  any other database-engine specific arguments.
  }
}

\value{
  a data.frame with as many rows as records  were fetched
  and as many columns as fields in the result set.
}

\section{Side Effects}{
  As the R/Splus client fetches records the remote database server
  updates its cursor accordingly.
}
\details{
  See the notes for the various database server implementations.
}
\note{
  Make sure you close the result set with \code{\link{dbClearResult}}
  as soon as you finish retrieving the records you want.
}
\references{
  See the Database Interface definition document
  \code{DBI.pdf} in the base directory of this package
  or \url{http://developer.r-project.org/db}.
}
\seealso{
  \code{\link{dbConnect}},
  \code{\link{dbSendQuery}},
  \code{\link{dbGetQuery}},
  \code{\link{dbClearResult}},
  \code{\link{dbCommit}},
  \code{\link{dbGetInfo}},
  \code{\link{dbReadTable}}.
}
\examples{\dontrun{
# Run an SQL statement by creating first a resultSet object
drv <- dbDriver("ODBC")
con <- dbConnect(drv, ...)
res <- dbSendQuery(con, statement = paste(
                      "SELECT w.laser_id, w.wavelength, p.cut_off",
                      "FROM WL w, PURGE P", 
                      "WHERE w.laser_id = p.laser_id",
                      "ORDER BY w.laser_id"))
# we now fetch the first 100 records from the resultSet into a data.frame
data1 <- fetch(res, n = 100)   
dim(data1)

dbHasCompleted(res)

# let's get all remaining records
data2 <- fetch(res, n = -1)
}
}
\keyword{interface}
\keyword{database}
% vim: syntax=tex
