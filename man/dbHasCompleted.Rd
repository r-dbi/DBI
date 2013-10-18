\name{dbHasCompleted}
\alias{dbHasCompleted}
\title{Has the operation completed?}
\arguments{
  \item{res}{An object inheriting from
  \code{\linkS4class{DBIResult}}.}

  \item{...}{Other arguments passed on to methods.}
}
\value{
  a logical vector of length 1
}
\description{
  Has the operation completed?
}
\seealso{
  Other DBIResult generics: \code{\link{dbClearResult}},
  \code{\link{dbColumnInfo}}, \code{\link{dbFetch}},
  \code{\link{dbGetRowCount}},
  \code{\link{dbGetRowsAffected}},
  \code{\link{dbGetStatement}}, \code{\link{fetch}}
}

