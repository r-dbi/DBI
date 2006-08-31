% $Id$
\name{dbGetInfo}
\alias{dbGetInfo}
\alias{dbGetDBIVersion}
\alias{dbGetStatement}
\alias{dbGetRowCount}
\alias{dbGetRowsAffected}
\alias{dbColumnInfo}
\alias{dbHasCompleted}
\title{
  Database interface meta-data
}
\description{
  Extract meta-data associated with various objects
}
\usage{
  dbGetInfo(dbObj, ...)       # meta-data for any DBIObject
  dbGetDBIVersion(...)           # DBI version 
  dbGetStatement(res, ...)    # statement that produced result "res"
  dbGetRowCount(res, ...)     # number of rows fetched so far
  dbGetRowsAffected(res, ...) # number of affected rows (e.g., DELETE)
  dbColumnInfo(res, ...)      # result set data types
  dbHasCompleted(res, ...)    # are there more rows to fetch on "res"?
}
\arguments{
\item{dbObj}{
  any object that implements some functionality in the R/Splus
  interface to databases (a driver, a connection or a result set).
}
\item{res}{
  refers to a \code{DBIResult} object.
}
\item{\dots}{
  any driver-specific arguments. 
}
}
\value{
  \code{dbGetDBIVersion} returns a character string with the version
  of the database interface API.

  \code{dbGetInfo} produces either a character vector or a named list 
  of (name, value) pairs.

  \code{dbGetStatement} returns a character string with the statement 
  associated with the result set \code{res}.

  \code{dbGetRowCount} returns the number of rows fetched so far.

  \code{dbGetRowsAffected} returns the number of affected rows (e.g., 
  how many rows were deleted, inserted).  Some drivers may set this
  to the total number of rows a query produces.

  \code{dbColumnInfo} returns a data.frame with one row per output field
  in \code{res}.  The columns should report field name, field data type,
  scale and precision (as understood by the DBMS engine), whether the
  field can store \code{NULL} values, and possibly other DBMS-specific
  information.

  \code{dbHasCompleted} a logical describing whether the operations has
  been completed by the DBMS or not.

}
\details{
  These functions implement a minimal set of meta-data describing the 
  most important aspects of the R/Splus to DBMS interface.

  The \code{dbGetInfo} works very similarly to the function
  \code{options} in that it attempts to extract what the user may
  request, possibly NULL if it can't locate the specific piece
  of meta-data.
}
\section{Note}{
  Meta-data associated with a driver should include the version of the
  package, plus the version of the underlying client library.  Connection
  objects should report the version of the DBMS engine, database name, user, 
  possibly password, etc.  Results should include the statement being
  executed, how many rows have been fetched so far (in the case of queries),
  how many rows were affected (deleted, inserted, changed, or total number
  of records to be fetched).
}
\references{
  See the Database Interface definition document
  \code{DBI.pdf} in the base directory of this package
  or \url{http://developer.r-project.org/db}.
}
\seealso{
  \code{\link{dbDriver}},
  \code{\link{dbConnect}},
  \code{\link{dbSendQuery}},
  \code{\link{dbGetQuery}},
  \code{\link{fetch}},
  \code{\link{dbCommit}},
  \code{\link{dbGetInfo}},
  \code{\link{dbListTables}},
  \code{\link{dbReadTable}}.
}
\examples{\dontrun{
drv <- dbDriver("SQLite")
con <- dbConnect(drv)

dbListTables(con)

rs <- dbSendQuery(con, query.sql)
dbGetStatement(rs)
dbHasCompleted(rs)

info <- dbGetInfo(rs)
names(dbGetInfo(drv))  

# DBIConnection info
names(dbGetInfo(con))

# DBIResult info
names(dbGetInfo(rs)) 
}
}
\keyword{interface}
\keyword{database}
% vim: syntax=tex
