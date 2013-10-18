\name{dbGetRowsAffected}
\alias{dbGetRowsAffected}
\title{The number of rows affected by data modifying query.}
\usage{
  dbGetRowsAffected(res, ...)
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
  The number of rows affected by data modifying query.
}
\seealso{
  Other DBIResult generics: \code{\link{dbClearResult}},
  \code{\link{dbColumnInfo}}, \code{\link{dbFetch}},
  \code{\link{dbGetRowCount}},
  \code{\link{dbGetStatement}},
  \code{\link{dbHasCompleted}}, \code{\link{fetch}}
}

