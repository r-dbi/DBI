\docType{class}
\name{DBIResult-class}
\alias{DBIResult-class}
\title{DBIResult class.}
\description{
  Base class for all DBMS-specific result objects. This is
  a virtual class: No objects may be created from it.
}
\examples{
\dontrun{
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
\seealso{
  Other DBI classes: \code{\link{DBIConnection-class}},
  \code{\link{DBIDriver-class}},
  \code{\link{DBIObject-class}}
}

