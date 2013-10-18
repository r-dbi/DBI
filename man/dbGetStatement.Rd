\name{dbGetStatement}
\alias{dbGetStatement}
\title{Get the statement associated with a result set}
\arguments{
  \item{res}{An object inheriting from
  \code{\linkS4class{DBIResult}}.}

  \item{...}{Other arguments passed on to methods.}
}
\value{
  a character vector
}
\description{
  Get the statement associated with a result set
}
\seealso{
  Other DBIResult generics: \code{\link{dbClearResult}},
  \code{\link{dbColumnInfo}}, \code{\link{dbGetRowCount}},
  \code{\link{dbGetRowsAffected}},
  \code{\link{dbHasCompleted}}, \code{\link{fetch}}
}

