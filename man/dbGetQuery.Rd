\name{dbGetQuery}
\alias{dbGetQuery}
\title{Send query, retrieve results and then clear result set.}
\arguments{
  \item{conn}{A \code{\linkS4class{DBIConnection}} object,
  as produced by \code{\link{dbConnect}}.}

  \item{...}{Other parameters passed on to methods.}
}
\description{
  Send query, retrieve results and then clear result set.
}
\seealso{
  Other connection methods: \code{\link{dbDisconnect}},
  \code{\link{dbExistsTable}},
  \code{\link{dbGetException}}, \code{\link{dbListFields}},
  \code{\link{dbListResults}}, \code{\link{dbListTables}},
  \code{\link{dbReadTable}}, \code{\link{dbRemoveTable}},
  \code{\link{dbSendQuery}}, \code{\link{dbWriteTable}}
}

