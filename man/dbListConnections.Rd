\name{dbListConnections}
\alias{dbListConnections}
\title{List currently open connections.}
\usage{
  dbListConnections(drv, ...)
}
\arguments{
  \item{drv}{A object inheriting from
  \code{\linkS4class{DBIDriver}}}

  \item{...}{Other arguments passed on to methods.}
}
\value{
  a list
}
\description{
  Drivers that implement single connections should return a
  list containing a single element.
}

