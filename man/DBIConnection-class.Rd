\docType{class}
\name{DBIConnection-class}
\alias{DBIConnection-class}
\title{DBIConnection class.}
\description{
  This virtual class encapsulates the connection to a DBMS,
  and it provides access to dynamic queries, result sets,
  DBMS session management (transactions), etc.
}
\section{Implementation note}{
  Individual drivers are free to implement single or
  multiple simultaneous connections.
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

