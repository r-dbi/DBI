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
 con <- dbConnect(drv, "user/password
}
\seealso{
  Other DBI classes: \code{\link{DBIConnection-class}},
  \code{\link{DBIDriver-class}},
  \code{\link{DBIObject-class}}
}

