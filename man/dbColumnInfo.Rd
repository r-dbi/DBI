\name{dbColumnInfo}
\alias{dbColumnInfo}
\title{Information about result types.}
\usage{
  dbColumnInfo(res, ...)
}
\arguments{
  \item{res}{An object inheriting from
  \code{\linkS4class{DBIResult}}.}

  \item{...}{Other arguments passed on to methods.}
}
\value{
  A data.frame with one row per output field in \code{res}.
  Methods MUST include \code{name} and \code{type} columns,
  and MAY contain other database specific information like
  scale and precision or whether the field can store
  \code{NULL}s.
}
\description{
  Information about result types.
}
\seealso{
  Other DBIResult generics: \code{\link{dbClearResult}},
  \code{\link{dbFetch}}, \code{\link{dbGetRowCount}},
  \code{\link{dbGetRowsAffected}},
  \code{\link{dbGetStatement}},
  \code{\link{dbHasCompleted}}, \code{\link{fetch}}
}

