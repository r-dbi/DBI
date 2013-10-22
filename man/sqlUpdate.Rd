\name{sqlUpdate}
\alias{sqlUpdate}
\alias{sqlUpdate,DBIConnection-method}
\title{Generate SQL: UPDATE}
\usage{
  sqlUpdate(conn, name, set, where = NULL, ...)
}
\arguments{
  \item{name}{A string giving the table name to update.
  Escaped with \code{\link{dbQuoteIdentifier}}}

  \item{set}{a named list of character vectors or
  \code{\link{SQL}} objects.  Not escaped (because it's
  hard in general to do a good job of it).  Names are
  escaped with \code{\link{dbQuoteIdentifier}}.}

  \item{where}{An optional string providing an SQL
  expression used to restrict the set of rows to be
  updated. Not escaped.}

  \item{conn}{A subclass of
  \code{\linkS4class{DBIConnection}} describing an active
  database connection.}

  \item{...}{Other arguments passed on to methods. Not
  otherwise used.}
}
\description{
  Generate SQL: UPDATE
}
\examples{
conn <- setClass("Mock", "DBIConnection")()

sqlUpdate(conn, "mtcars", c(mpg = "mpg / 22"))
}

