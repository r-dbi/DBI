\name{sqlCreateTable}
\alias{sqlCreateTable}
\alias{sqlCreateTable,DBIConnection-method}
\title{Generate SQL: CREATE TABLE}
\usage{
  sqlCreateTable(conn, name, fields, types, ...)
}
\arguments{
  \item{conn}{A subclass of
  \code{\linkS4class{DBIConnection}} describing an active
  database connection.}

  \item{name}{A string giving the table name to create.
  Escaped with \code{\link{dbQuoteIdentifier}}}

  \item{fields,types}{Character vectors of equal lengths
  giving the names and types of the table's columns. Fields
  is escaped with \code{\link{dbQuoteIdentifier}}. Types is
  not escaped.}

  \item{...}{Other arguments passed on to methods. Not
  otherwise used.}
}
\description{
  Generate SQL: CREATE TABLE
}
\examples{
conn <- setClass("Mock", "DBIConnection")()

sqlCreateTable(conn, "mtcars", names(mtcars), dbDataType(conn, mtcars))
}

