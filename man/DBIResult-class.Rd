\name{DBIResult-class}
\docType{class}
\alias{DBIResult-class}
\title{Class DBIResult}
\description{
   Base class for all DBMS-specific result objects.
}
\section{Objects from the Class}{
   A virtual Class: No objects may be created from it.
}
\section{Extends}{
   Class \code{"DBIObject"}, directly.
}
\section{Generator}{
   The main generator is \code{\link{dbSendQuery}}.
}
\section{Methods}{

  \describe{
Fetching methods:

    \item{\link{fetch}}{\code{signature(res = "DBIResult", n = "numeric")}: ... }
    \item{\link{fetch}}{\code{signature(res = "DBIResult", n = "missing")}: ... }
Close result set:

    \item{\link{dbClearResult}}{\code{signature(res = "DBIResult")}: ... }

Meta-data:

    \item{\link{dbColumnInfo}}{\code{signature(res = "DBIResult")}: ... }
    \item{\link{dbGetException}}{\code{signature(conn = "DBIResult")}: ... }
    \item{\link{dbGetInfo}}{\code{signature(dbObj = "DBIResult")}: ... }
    \item{\link{dbGetRowCount}}{\code{signature(res = "DBIResult")}: ... }
    \item{\link{dbGetRowsAffected}}{\code{signature(res = "DBIResult")}: ... }
    \item{\link{dbGetStatement}}{\code{signature(res = "DBIResult")}: ... }
    \item{\link{dbHasCompleted}}{\code{signature(res = "DBIResult")}: ... }
    \item{\link{dbListFields}}{\code{signature(conn = "DBIResult", name = "missing")}: ... }
    \item{summary}{\code{signature(object = "DBIResult")}: ... }
    \item{\link{coerce}}{\code{signature(from = "DBIConnection", to = "DBIResult")}: ... }
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
 drv <- dbDriver("Oracle")
 con <- dbConnect(drv, "user/password@dbname")
 res <- dbSendQuery(con, "select * from LASERS where prdata > '2002-05-01'")
 summary(res)
 while(dbHasCompleted(res)){
    chunk <- fetch(res, n = 1000)
    process(chunk)
 }
}
}
\keyword{classes}
\keyword{interface}
\keyword{database}
% vim: syntax=tex
