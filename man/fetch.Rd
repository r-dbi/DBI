\name{fetch}
\alias{dbClearResult}
\alias{fetch}
\title{Fetch records from a previously executed query.}
\arguments{
  \item{res}{a result set object (one whose class extends
  \code{DBIResult}).  This object needs to be the result of
  a statement that produces output, such as SQL's
  \code{SELECT} or \code{SELECT}-like statement, this
  object \code{res} is typically produced by a call to or
  \code{dbSendQuery}.}

  \item{n}{maximum number of records to retrieve per fetch.
  Use \code{n = -1} to retrieve all pending records.  Some
  implementations may recognize other special values.}

  \item{...}{any other database-engine specific arguments.}
}
\value{
  \code{fetch}: a data.frame with as many rows as records
  were fetched and as many columns as fields in the result
  set.

  \code{dbClearResult} returns a logical indicating whether
  clearing the result set was successful or not.
}
\description{
  See the notes for the various database server
  implementations.
}
\details{
  \code{dbClearResult} frees all resources (local and
  remote) associated with a result set.  It some cases
  (e.g., very large result sets) this can be a critical
  step to avoid exhausting resources (memory, file
  descriptors, etc.)
}
\note{
  Make sure you close the result set with
  \code{\link{dbClearResult}} as soon as you finish
  retrieving the records you want.
}
\section{Side Effects}{
  As the R/Splus client fetches records the remote database
  server updates its cursor accordingly.
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
  Other DBIResult generics: \code{\link{dbColumnInfo}},
  \code{\link{dbGetRowCount}},
  \code{\link{dbGetRowsAffected}},
  \code{\link{dbGetStatement}},
  \code{\link{dbHasCompleted}}
}

