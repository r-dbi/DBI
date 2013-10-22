\name{dbWriteTable}
\alias{dbWriteTable}
\title{Create a database table from data frame.}
\usage{
  dbWriteTable(conn, name, value, row.names = FALSE,
    overwrite = FALSE, append = FALSE, ...)
}
\arguments{
  \item{name}{A character string specifying a DBMS table
  name.}

  \item{value}{a data.frame (or coercible to data.frame).}

  \item{row.names}{An string giving the DBMS column name to
  use for row names. Alternatively, a logical flag, where
  \code{TRUE} means use a column called \code{row.names},
  and \code{FALSE} means don't store row names.}

  \item{overwrite}{a logical specifying whether to
  overwrite an existing table or not. Its default is
  \code{FALSE}}

  \item{append}{a logical specifying whether to append to
  an existing table in the DBMS.  Its default is
  \code{FALSE}.}

  \item{conn}{A \code{\linkS4class{DBIConnection}} object,
  as produced by \code{\link{dbConnect}}.}

  \item{...}{Other parameters passed on to methods.}
}
\value{
  a logical vector of length 1 indicating success or
  failure.
}
\description{
  Write the \code{\link{data.frame}} \code{value} into the
  remote table \code{name} in connection \code{conn}.
}
\seealso{
  Other connection methods: \code{\link{dbDisconnect}},
  \code{\link{dbExistsTable}},
  \code{\link{dbGetException}}, \code{\link{dbGetQuery}},
  \code{\link{dbListFields}}, \code{\link{dbListResults}},
  \code{\link{dbListTables}}, \code{\link{dbReadTable}},
  \code{\link{dbRemoveTable}}, \code{\link{dbSendQuery}}
}

