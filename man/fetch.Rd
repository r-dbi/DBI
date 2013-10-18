\name{fetch}
\alias{fetch}
\title{Fetch records from a previously executed query.}
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
  Fetch records from a previously executed query.
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
data2 <- fetch(res, n = -1)
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

