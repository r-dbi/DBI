\name{dbGetRowCount}
\alias{dbGetRowCount}
\title{The number of rows fetched so far.}
\usage{
  dbGetRowCount(res, ...)
}
\arguments{
  \item{res}{An object inheriting from
  \code{\linkS4class{DBIResult}}.}

  \item{...}{Other arguments passed on to methods.}
}
\value{
  a numeric vector of length 1
}
\description{
  The number of rows fetched so far.
}
\seealso{
  Other DBIResult generics: \code{\link{dbClearResult}},
  \code{\link{dbColumnInfo}}, \code{\link{dbFetch}},
  \code{\link{dbGetRowsAffected}},
  \code{\link{dbGetStatement}},
  \code{\link{dbHasCompleted}}, \code{\link{fetch}}
}

