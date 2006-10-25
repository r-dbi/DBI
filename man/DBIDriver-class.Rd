% $Id$
\name{DBIDriver-class}
\docType{class}

\alias{DBIDriver-class}
\alias{summary,DBIObject-method}

\title{Class DBIDriver}

\description{  
   Base class for all DBMS drivers (e.g., ODBC, Oracle, MySQL, PostgreSQL).
}
\section{Objects from the Class}{
   A virtual Class: No objects may be created from it.
}
\section{Extends}{
Class \code{"DBIObject"}, directly.
}

\section{Generator}{
   The generator for classes that extend \code{DBIDriver} is
   \code{\link{dbDriver}}.  
}
\section{Methods}{
  The following methods are defined for classes that extend
  \code{DBIDriver}:

  \describe{
    \item{\link{dbUnloadDriver}}{\code{signature(drv = "DBIDriver")}: ... }
    \item{\link{dbConnect}}{\code{signature(drv = "DBIDriver")}: ... }
    \item{\link{dbGetInfo}}{\code{signature(dbObj = "DBIDriver")}: ... }
    \item{\link{dbListConnections}}{\code{signature(drv = "DBIDriver")}: ... }
    \item{\link{summary}}{\code{signature(object = "DBIDriver")}: ... }
  }
}
\references{
  See the Database Interface definition document
  \code{DBI.pdf} in the base directory of this package
  or \url{http://developer.r-project.org/db}.
}
\author{R-SIG-DB}
\seealso{
 DBI classes:
 \code{\link{DBIObject-class}}
 \code{\link{DBIDriver-class}}
 \code{\link{DBIConnection-class}}
 \code{\link{DBIResult-class}}

 The function \code{\link{dbConnect}} is the main generator.

 In addition see the help of the methods above.
}

\examples{\dontrun{
drv <- dbDriver("ODBC")
summary(drv)
dbListConnections(drv)
}
}
\keyword{classes}
\keyword{database}
\keyword{interface}
% vim: syntax=tex
