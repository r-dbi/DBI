\name{dbListFields}
\alias{dbListFields}
\title{List field names of a remote table.}
\usage{
  dbListFields(conn, name, ...)
}
\arguments{
  \item{conn}{A \code{\linkS4class{DBIConnection}} object,
  as produced by \code{\link{dbConnect}}.}

  \item{...}{Other parameters passed on to methods.}

  \item{name}{a character string with the name of the
  remote table.}
}
\value{
  a character vector
}
\description{
  List field names of a remote table.
}
\seealso{
  Other connection methods: \code{\link{dbDisconnect}},
  \code{\link{dbExistsTable}},
  \code{\link{dbGetException}}, \code{\link{dbGetQuery}},
  \code{\link{dbListResults}}, \code{\link{dbListTables}},
  \code{\link{dbReadTable}}, \code{\link{dbRemoveTable}},
  \code{\link{dbSendQuery}}, \code{\link{dbWriteTable}}
}

