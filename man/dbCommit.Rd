% $Id$
\name{dbCommit}
\alias{dbCommit}
\alias{dbRollback}
\title{
  DBMS Transaction Management
}
\description{
  Commit/rollback SQL transactions
}
\usage{
  dbCommit(conn, ...)
  dbRollback(conn, ...)
}
\arguments{
\item{conn}{
  a \code{DBIConnection} object, as produced by the function 
\code{dbConnect}.
}
\item{\dots }{
  any database-specific arguments.
}
}
\value{
  a logical indicating whether the operation succeeded or not.
}
\section{Side Effects}{
  The current transaction on the connections \code{con}
  is committed or rolled back.
}
\details{
  Not all database engines implement transaction management,
  older versions of MySQL, for instance.
}
\references{
  See the Database Interface definition document
  \code{DBI.pdf} in the base directory of this package
  or
  \url{http://developer.r-project.org/db}.
}
\seealso{
\code{\link{dbConnect}}
\code{\link{dbSendQuery}}
\code{\link{dbGetQuery}}
\code{\link{fetch}}
\code{\link{dbCommit}}
\code{\link{dbGetInfo}}
\code{\link{dbReadTable}}
}
\examples{\dontrun{
ora <- dbDriver("Oracle")
con <- dbConnect(ora)
rs <- dbSendQuery(con, 
      "delete * from PURGE as p where p.wavelength<0.03")
if(dbGetInfo(rs, what = "rowsAffected") > 250){
  warning("dubious deletion -- rolling back transaction")
  dbRollback(con)
}
}
}
\keyword{interface}
\keyword{database}
% vim: syntax=tex
