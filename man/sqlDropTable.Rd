\name{sqlDropTable}
\alias{sqlDropTable}
\alias{sqlDropTable,DBIConnection-method}
\title{Generate SQL: DROP TABLE}
\usage{
  sqlDropTable(conn, name, ...)
}
\arguments{
  \item{name}{A string giving the table name to drop.
  Escaped with \code{\link{dbQuoteIdentifier}}}

  \item{conn}{A subclass of
  \code{\linkS4class{DBIConnection}} describing an active
  database connection.}

  \item{...}{Other arguments passed on to methods. Not
  otherwise used.}
}
\description{
  Generate SQL: DROP TABLE
}
\examples{
conn <- setClass("Mock", "DBIConnection")()

sqlDropTable(conn, "mtcars")
}

