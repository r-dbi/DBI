\name{dbRemoveTable}
\alias{dbRemoveTable}
\title{Remove a table from the database.}
\arguments{
  \item{}{}
}
\value{
  a logical vector of length 1 indicating success or
  failure.
}
\description{
  Executes the sql \code{DROP TABLE name}.
}
\seealso{
  Other connection methods: \code{\link{dbDisconnect}},
  \code{\link{dbExistsTable}},
  \code{\link{dbGetException}}, \code{\link{dbGetQuery}},
  \code{\link{dbListFields}}, \code{\link{dbListResults}},
  \code{\link{dbListTables}}, \code{\link{dbReadTable}},
  \code{\link{dbSendQuery}}, \code{\link{dbWriteTable}}
}

