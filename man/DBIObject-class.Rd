\docType{class}
\name{DBIObject-class}
\alias{DBIObject-class}
\title{DBIObject class.}
\description{
  Base class for all other DBI classes (e.g., drivers,
  connections). This is a virtual Class: No objects may be
  created from it.
}
\examples{
\dontrun{
drv <- dbDriver("MySQL")
con <- dbConnect(drv, group = "rs-dbi")
res <- dbSendQuery(con, "select * from vitalSuite")
is(drv, "DBIObject")   ## True
is(con, "DBIObject")   ## True
is(res, "DBIObject")
}
}
\seealso{
  Other DBI classes: \code{\link{DBIConnection-class}},
  \code{\link{DBIDriver-class}},
  \code{\link{DBIResult-class}}
}

