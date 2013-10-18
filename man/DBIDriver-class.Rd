\docType{class}
\name{DBIDriver-class}
\alias{DBIDriver-class}
\title{DBIDriver class.}
\description{
  Base class for all DBMS drivers (e.g., ODBC, Oracle,
  MySQL, PostgreSQL). This is a virtual class: No objects
  may be created from it. The function
  \code{\link{dbConnect}} is the main generator.
}
\details{
  Typically, drivers are expected to have a function of the
  same name that does the actual initialization, e.g.,
  \code{MySQL()}, \code{ODBC()}, \code{SQLite()},
}
\examples{
\dontrun{
drv <- dbDriver("ODBC")
summary(drv)
dbListConnections(drv)
}
}
\seealso{
  Other DBI classes: \code{\link{DBIConnection-class}},
  \code{\link{DBIObject-class}},
  \code{\link{DBIResult-class}}
}

