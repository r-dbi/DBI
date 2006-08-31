% $Id$
\name{fetch-methods}
\docType{methods}
\alias{fetch}
\alias{fetch-methods}
\alias{fetch,DBIResult,numeric-method}
\title{Fetch records from a previously executed query}
\description{
  Fetch records from a previously executed query
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
  Some implementations may recognize other special values, e.g.,
  \code{RMySQL}, \code{ROracle}, and \code{RSQLite} use a value 
  of \code{n = 0} for fetching the defined \code{fetch.default.rec} in 
  the \code{\link{dbDriver}} invocation.
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
  As the R/S-Plus client fetches records the remote database server
  updates its cursor accordingly.
}
\details{
  How the actual fetching is done is implementation-dependent.
  Some implementations may leave the result in the DBMS and bring
  chunks of size \code{n} to prevent exhausting 
  the R/S-Plus memory, but there may be a performance penalty;
  other implementations may copy the entire result set to the a
  memory space under the driver's control;
  others may yet return the entire result set directly to R/S-Plus.
  See the individual drivers' documentation.
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
drv <- dbDriver("Oracle")
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
\keyword{methods}
\keyword{interface}
\keyword{database}
% vim: syntax=tex
