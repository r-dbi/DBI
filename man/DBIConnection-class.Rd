\docType{class}
\name{DBIConnection-class}
\alias{DBIConnection-class}
\title{DBIConnection class.}
\description{
  Base class for all DBMS connection classes.  Individual
  drivers (ODBC, Oracle, PostgreSQL, MySQL, etc.)  extend
  this class in a database-specific manner.
}
\examples{
\dontrun{
ora <- dbDriver("Oracle")
con <- dbConnect(ora, "user/password@dbname")

pg <- dbDriver("PostgreSQL")
con <- dbConnect(pg, "user", "password")
}
}
\seealso{
  Other DBI classes: \code{\link{DBIDriver-class}},
  \code{\link{DBIObject-class}},
  \code{\link{DBIResult-class}}
}

