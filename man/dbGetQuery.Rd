\name{dbGetQuery}
\alias{dbGetQuery}
\alias{dbGetQuery,DBIConnection,character-method}
\title{Send query, retrieve results and then clear result set.}
\arguments{
  \item{conn}{A \code{\linkS4class{DBIConnection}} object,
  as produced by \code{\link{dbConnect}}.}

  \item{...}{Other parameters passed on to methods.}
}
\description{
  \code{dbGetQuery} comes with a default implementation
  that calls \code{\link{dbSendQuery}}, then if
  \code{\link{dbHasCompleted}} is TRUE, it uses
  \code{\link{fetch}} to return the results.
  \code{\link{on.exit}} is used to ensure the result set is
  always freed by \code{\link{dbClearResult}}.  Subclasses
  should override this method only if they provide some
  sort of performance optimisation.
}
\seealso{
  Other connection methods: \code{\link{dbDisconnect}},
  \code{\link{dbExistsTable}},
  \code{\link{dbGetException}}, \code{\link{dbListFields}},
  \code{\link{dbListResults}}, \code{\link{dbListTables}},
  \code{\link{dbReadTable}}, \code{\link{dbRemoveTable}},
  \code{\link{dbSendQuery}}, \code{\link{dbWriteTable}}
}

