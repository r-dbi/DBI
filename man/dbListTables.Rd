\name{dbListTables}
\alias{dbListTables}
\title{List remote tables.}
\arguments{
  \item{conn}{A \code{\linkS4class{DBIConnection}} object,
  as produced by \code{\link{dbConnect}}.}

  \item{...}{Other parameters passed on to methods.}

  \item{...}{other arguments passed on to methods}
}
\value{
  a character vector
}
\description{
  This should, where possible, include temporary tables.
}
\seealso{
  Other connection methods: \code{\link{dbDisconnect}},
  \code{\link{dbExistsTable}},
  \code{\link{dbGetException}}, \code{\link{dbGetQuery}},
  \code{\link{dbListFields}}, \code{\link{dbListResults}},
  \code{\link{dbReadTable}}, \code{\link{dbRemoveTable}},
  \code{\link{dbSendQuery}}, \code{\link{dbWriteTable}}
}

