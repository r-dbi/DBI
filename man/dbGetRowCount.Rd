\name{dbGetRowCount}
\alias{dbGetRowCount}
\alias{dbGetRowCount,DBIResult-method}
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
  The default method extracts \code{row.count} from the
  result of \code{\link{dbGetInfo}(res)}.
}
\seealso{
  Other DBIResult generics: \code{\link{dbClearResult}},
  \code{\link{dbColumnInfo}}, \code{\link{dbFetch}},
  \code{\link{dbGetRowsAffected}},
  \code{\link{dbGetStatement}},
  \code{\link{dbHasCompleted}}, \code{\link{fetch}}
}

