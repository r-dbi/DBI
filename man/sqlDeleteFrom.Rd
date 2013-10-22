\name{sqlDeleteFrom}
\alias{sqlDeleteFrom}
\alias{sqlDeleteFrom,DBIConnection-method}
\title{Generate SQL: DELETE FROM}
\usage{
  sqlDeleteFrom(conn, name, where = NULL, ...)
}
\arguments{
  \item{name}{A string giving the table name to delete
  from. Escaped with \code{\link{dbQuoteIdentifier}}}

  \item{where}{An optional string providing an SQL
  expression used to restrict the set of rows to be
  deleted. Not escaped.}

  \item{conn}{A subclass of
  \code{\linkS4class{DBIConnection}} describing an active
  database connection.}

  \item{...}{Other arguments passed on to methods. Not
  otherwise used.}
}
\description{
  Generate SQL: DELETE FROM
}
\examples{
conn <- setClass("Mock", "DBIConnection")()

sqlDeleteFrom(conn, "mtcars")
sqlDeleteFrom(conn, "mtcars", "cyl = 4")
}

