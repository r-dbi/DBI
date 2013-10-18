\name{dbExistsTable}
\alias{dbExistsTable}
\title{Does a table exist?}
\arguments{
  \item{conn}{A \code{\linkS4class{DBIConnection}} object,
  as produced by \code{\link{dbConnect}}.}

  \item{name}{A character string specifying a DBMS table
  name.}

  \item{...}{Other parameters passed on to methods.}
}
\value{
  a logical vector of length 1.
}
\description{
  Does a table exist?
}
\seealso{
  Other connection methods: \code{\link{dbDisconnect}},
  \code{\link{dbGetException}}, \code{\link{dbGetQuery}},
  \code{\link{dbListFields}}, \code{\link{dbListResults}},
  \code{\link{dbListTables}}, \code{\link{dbReadTable}},
  \code{\link{dbRemoveTable}}, \code{\link{dbSendQuery}},
  \code{\link{dbWriteTable}}
}

