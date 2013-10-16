\name{DBIObject-class}
\docType{class}
\alias{DBIObject-class}
\title{Class DBIObject}
\description{ 
   Base class for all other DBI classes (e.g., drivers, connections).
}
\section{Objects from the Class}{
   A virtual Class: No objects may be created from it.
}
\section{Methods}{
  Methods defined for classes that extend \code{DBIObject}:
  \describe{
    \item{\link{dbDataType}}{\code{signature(dbObj = "DBIObject")}: ... }
    \item{\link{isSQLKeyword}}{\code{signature(dbObj = "DBIObject")}: ... }
    \item{\link{make.db.names}}{\code{signature(dbObj = "DBIObject")}: ... }
    \item{\link{SQLKeywords}}{\code{signature(dbObj = "DBIObject")}: ... }
    \item{\link{summary}}{\code{signature(object = "DBIObject")}: ... }
  }
  Plus many other specific to the other DBI classes.
}
\references{ 
  See the Database Interface definition document
  \code{DBI.pdf} in the base directory of this package
  or
  \url{http://developer.r-project.org/db}.
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
drv <- dbDriver("MySQL")
con <- dbConnect(drv, group = "rs-dbi")
res <- dbSendQuery(con, "select * from vitalSuite")
is(drv, "DBIObject")   ## True
is(con, "DBIObject")   ## True
is(res, "DBIObject")
}
}
\keyword{classes}
\keyword{interface}
\keyword{database}
% vim: syntax=tex
