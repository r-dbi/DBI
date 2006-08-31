% $Id$
\name{dbListTables}
\alias{dbListTables}
\alias{dbListFields}
\alias{dbListConnections}
\alias{dbListResults}
\title{
  List items from a remote DBMS and from objects that implement
  the database interface DBI.
}
\description{
  List remote tables, fields of a remote table, opened connections
  and pending statements in a connection.
}
\usage{
  dbListTables(conn, ...)
  dbListFields(conn, name, ...)
  dbListConnections(drv, ...)
  dbListResults(conn, ...)
}
\arguments{

  \item{drv}{a driver object (e.g., \code{ODBC}, \code{Oracle})}
  \item{conn}{a connection object}
  \item{name}{a character string with the name of the remote table.}
  \item{\dots}{optional arguments for the actual driver implementation.}

}
\value{
  \code{dbListTables} returns a character vector with the names of the
  tables in the remote database associated with the connection in 
  \code{conn} object.

  \code{dbListFields} returns a character vector with the names of the
  fields of the \code{res} result object (it must be a query statement).

  \code{dbListConnections} returns a list of all currently open
  connections on driver \code{drv}.  Drivers that implement single
  connections would return the one single connection object.

  \code{dbListResults} returns a list of objects for all pending results 
  (statements) on the \code{conn} connection.
}
\references{
  See the Database Interface definition document
  \code{DBI.pdf} in the base directory of this package
  or
  \url{http://developer.r-project.org/db}.
}
\seealso{
  \code{\link{dbGetInfo}},
  \code{\link{dbColumnInfo}},
  \code{\link{dbDriver}},
  \code{\link{dbConnect}},
  \code{\link{dbSendQuery}}
}

\examples{\dontrun{
odbc <- dbDriver("ODBC")
# after working awhile...
for(con in dbListConnections(odbc)){
   dbGetStatement(dbListResults(con))
}
}
}
\keyword{interface}
\keyword{database}
% vim: syntax=tex
