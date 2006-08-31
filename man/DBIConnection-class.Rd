% $Id$
\name{DBIConnection-class}
\docType{class}
\alias{DBIConnection-class}
\title{Class DBIConnection}
\description{
   Base class for all DBMS connection classes.  Individual
   drivers (ODBC, Oracle, PostgreSQL, MySQL, etc.) 
   extend this class in a database-specific manner.
}
\section{Objects from the Class}{
   A virtual Class: No objects may be created from it.
}

\section{Extends}{
Class \code{"DBIObject"}, directly.
}
\section{Generator}{
    The main generator is \code{\link{dbConnect}}.  
 }
\section{Methods}{

The following methods take objects from classes derived
from \code{DBIConnection}:

    \describe{
Create and close connections:

    \item{\link{dbConnect}}{\code{signature(drv = "DBIConnection")}: ... }
    \item{\link{dbDisconnect}}{\code{signature(conn = "DBIConnection")}: ... }

Execute SQL commands:

    \item{\link{dbSendQuery}}{\code{signature(conn = "DBIConnection", statement = "character")}: ... }
    \item{\link{dbGetQuery}}{\code{signature(conn = "DBIConnection", statement = "character")}: ... }

    \item{\link{dbCallProc}}{\code{signature(conn = "DBIConnection")}: ... }

Transaction management:

    \item{\link{dbCommit}}{\code{signature(conn = "DBIConnection")}: ... }
    \item{\link{dbRollback}}{\code{signature(conn = "DBIConnection")}: ... }

Meta-data:
    \item{\link{dbListResults}}{\code{signature(conn = "DBIConnection")}: ... }
    \item{\link{dbGetInfo}}{\code{signature(dbObj = "DBIConnection")}: ... }
    \item{\link{summary}}{\code{signature(object = "DBIConnection")}: ... }

Exceptions:

    \item{\link{dbGetException}}{\code{signature(conn = "DBIConnection")}: ... }

    \item{\link{dbListFields}}{\code{signature(conn = "DBIConnection", name = "character")}: ... }

    Convenience functions:

    \item{\link{dbListTables}}{\code{signature(conn = "DBIConnection")}: ... }

    \item{\link{dbReadTable}}{\code{signature(conn = "DBIConnection", name = "character")}: ... }
    \item{\link{dbExistsTable}}{\code{signature(conn = "DBIConnection", name = "character")}: ... }
    \item{\link{dbRemoveTable}}{\code{signature(conn = "DBIConnection", name = "character")}: ... }
    \item{\link{dbWriteTable}}{\code{signature(conn = "DBIConnection", name = "character", value = "data.frame")}: ... }
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
}

\examples{\dontrun{
ora <- dbDriver("Oracle")
con <- dbConnect(ora, "user/password@dbname")

pg <- dbDriver("PostgreSQL")
con <- dbConnect(pg, "user", "password")
}
}
\keyword{classes}
\keyword{database}
\keyword{interface}
% vim: syntax=tex
