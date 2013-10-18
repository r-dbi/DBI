\docType{class}
\name{DBIResult-class}
\alias{DBIResult-class}
\title{DBIResult class.}
\description{
  This virtual class describes the result and state of
  execution of a DBMS statement (any statement, query or
  non-query).  The result set \code{res} keeps track of
  whether the statement produces output how many rows were
  affected by the operation, how many rows have been
  fetched (if statement is a query), whether there are more
  rows to fetch, etc.
}
\details{
  Individual drivers are free to allow single or multiple
  active results per connection.
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

