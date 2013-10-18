\name{dbDataType}
\alias{dbDataType}
\alias{dbDataType,DBIObject,Date-method}
\alias{dbDataType,DBIObject,POSIXct-method}
\alias{dbDataType,DBIObject,character-method}
\alias{dbDataType,DBIObject,factor-method}
\alias{dbDataType,DBIObject,integer-method}
\alias{dbDataType,DBIObject,logical-method}
\alias{dbDataType,DBIObject,numeric-method}
\title{Determine the SQL data type of an object.}
\usage{
  dbDataType(dbObj, obj, ...)
}
\arguments{
  \item{obj}{R/Splus object whose SQL type we want to
  determine.}

  \item{...}{Other arguments passed on to methods.}
}
\value{
  A character string specifying the SQL data type for
  \code{obj}.
}
\description{
  This is a generic function. The default method determines
  the SQL type of an R/Splus object according to the SQL 92
  specification, which may serve as a starting point for
  driver implementations.
}
\section{Implementation notes}{
  Implementations should provide methods (if different from
  the default) for: logical, integer, numeric, character,
  factor, Date, and POSIXct.
}
\examples{
\dontrun{
ora <- dbDriver("Oracle")
sql.type <- dbDataType(ora, x)
}
}
\seealso{
  \code{\link{isSQLKeyword}} \code{\link{make.db.names}}
}

