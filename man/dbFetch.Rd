\name{dbFetch}
\alias{dbFetch}
\alias{dbFetch,DBIResult-method}
\alias{fetch}
\title{Fetch records from a previously executed query.}
\usage{
  dbFetch(res, n = -1, ...)

  fetch(res, n = -1, ...)
}
\arguments{
  \item{res}{An object inheriting from
  \code{\linkS4class{DBIResult}}.}

  \item{n}{maximum number of records to retrieve per fetch.
  Use \code{n = -1} to retrieve all pending records.  Some
  implementations may recognize other special values.}

  \item{...}{Other arguments passed on to methods.}
}
\value{
  a data.frame with as many rows as records were fetched
  and as many columns as fields in the result set.
}
\description{
  Fetch the next \code{n} elements (rows) from the result
  set and return them as a data.frame.
}
\details{
  \code{fetch} is provided for compatibility with older DBI
  clients - for all new code you are strongly encouraged to
  use \code{dbFetch}. The default method for \code{dbFetch}
  calls \code{fetch} so that it is compatible with existing
  code. Implementors should provide methods for both
  \code{fetch} and \code{dbFetch} until \code{fetch} is
  deprecated in 2015.
}
\examples{
\dontrun{
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
data2 <- dbFetch(res, n = -1)
}
}
\seealso{
  close the result set with \code{\link{dbClearResult}} as
  soon as you finish retrieving the records you want.

  Other DBIResult generics: \code{\link{dbClearResult}},
  \code{\link{dbColumnInfo}}, \code{\link{dbGetRowCount}},
  \code{\link{dbGetRowsAffected}},
  \code{\link{dbGetStatement}},
  \code{\link{dbHasCompleted}}
}

