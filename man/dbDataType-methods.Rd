% $Id$
\name{dbDataType-methods}
\docType{methods}
\alias{dbDataType}
\alias{dbDataType-methods}
\alias{dbDataType,DBIObject-method}
\title{
  Determine the SQL Data Type of an S object
}
\description{
  Determine an (approximately) appropriate SQL data type for an R/S-Plus object.
}
\usage{
  dbDataType(dbObj, obj, ...)
}
\arguments{
\item{dbObj}{
  a \code{DBIDriver} object, e.g., \code{ODBCDriver},
  \code{OracleDriver}.
}
\item{obj}{
  R/S-Plus object whose SQL type we want to determine.
}
\item{\dots }{
  any other parameters that individual methods may need.
}
}
\value{
  A character string specifying the SQL data type for \code{obj}.
}
\details{
  This is a generic function.  The default method determines the
  SQL type of an R/S-Plus object according to the SQL 92 specification,
  which may serve as a starting point for driver implementations.
}
\references{
  See the Database Interface definition document
  \code{DBI.pdf} in the base directory of this package
  or \url{http://developer.r-project.org/db}.
}
\seealso{
  \code{\link{isSQLKeyword}}
  \code{\link{make.db.names}}
}
\examples{\dontrun{
data(quakes)
ora <- dbDriver("MySQL")
sql.type <- dbDataType(ora, quakes)
}
}
\keyword{methods}
\keyword{interface}
\keyword{database}
% docclass is function
% Converted by Sd2Rd version 1.15.2.1.
% vim: syntax=tex
