\name{dbReadTable}
\alias{dbReadTable}
\title{Create a data frame from a database table.}
\usage{
  dbReadTable(conn, name, ...)
}
\arguments{
  \item{name}{A character string specifying a DBMS table
  name.}

  \item{conn}{A \code{\linkS4class{DBIConnection}} object,
  as produced by \code{\link{dbConnect}}.}

  \item{...}{Other parameters passed on to methods.}
}
\value{
  a data.frame.
}
\description{
  Create a data frame from a database table.
}
\note{
  The translation of identifiers between R/Splus and SQL is
  done through calls to \code{\link{make.names}} and
  \code{\link{make.db.names}}, but we cannot guarantee that
  the conversion is reversible.  For details see
  \code{\link{make.db.names}}.
}
\section{Implementation notes}{
  Method should also accept the \code{row.names} argument.
  This can be a string or an index specifying the column in
  the DBMS table to be used as \code{row.names} in the
  output data.frame (a \code{NULL}, \code{""}, or 0
  specifies that no column should be used as
  \code{row.names} in the output).
}
\seealso{
  Other connection methods: \code{\link{dbDisconnect}},
  \code{\link{dbExistsTable}},
  \code{\link{dbGetException}}, \code{\link{dbGetQuery}},
  \code{\link{dbListFields}}, \code{\link{dbListResults}},
  \code{\link{dbListTables}}, \code{\link{dbRemoveTable}},
  \code{\link{dbSendQuery}}, \code{\link{dbWriteTable}}
}

