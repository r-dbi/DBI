\name{dbDataType}
\alias{dbDataType}
\alias{dbDataType,DBIObject-method}
\title{Determine the SQL data type of an object.}
\arguments{
  \item{obj}{R/Splus object whose SQL type we want to
  determine.}
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
\examples{
\dontrun{
ora <- dbDriver("Oracle")
sql.type <- dbDataType(ora, x)
}
}
\seealso{
  \code{\link{isSQLKeyword}} \code{\link{make.db.names}}
}

