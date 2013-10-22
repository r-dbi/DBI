\name{sqlInsertInto}
\alias{sqlInsertInto}
\alias{sqlInsertInto,DBIConnection-method}
\title{Generate SQL: INSERT INTO}
\usage{
  sqlInsertInto(conn, name, values, fields = names(values),
    ...)
}
\arguments{
  \item{name}{A string giving the table name to insert
  into. Escaped with \code{\link{dbQuoteIdentifier}}}

  \item{values}{a data frame containing values to insert
  into the table.  Character columns will be escaped with
  \code{\link{dbQuoteString}}.}

  \item{fields}{The names of the fields to insert into.
  Defaults to \code{names(values)}.}

  \item{conn}{A subclass of
  \code{\linkS4class{DBIConnection}} describing an active
  database connection.}

  \item{...}{Other arguments passed on to methods. Not
  otherwise used.}
}
\value{
  A \code{\link{SQL}} of length \code{nrow(values)}.
}
\description{
  Generate SQL: INSERT INTO
}
\examples{
conn <- setClass("Mock", "DBIConnection")()

sqlInsertInto(conn, "mtcars", mtcars)
}

