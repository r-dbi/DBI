\name{print.list.pairs}
\alias{print.list.pairs}
\alias{print}
\alias{summary}
\alias{format}
\title{Support functions}
\description{
  Some of these functions are conditionally elevated to 
  generic functions (e.g., \code{print}, \code{summary}).
  Others are low-level support functions.
}
\usage{
\method{print}{list.pairs}(x, ...)
}
\arguments{
  \item{x}{a list of key, value pairs}
  \item{\dots}{additional arguments to be passed to \code{cat}}
}
\value{
  the (invisible) value of x.
}
\references{
  See the Database Interface definition document
  \code{DBI.pdf} in the base directory of this package
  or \url{http://developer.r-project.org/db}.
}
\seealso{ 
  \code{\link{print.default}},
  \code{\link{summary.default}},
  \code{\link{cat}}.
}
\examples{\dontrun{
print.list.pairs(list(a = 1, b = 2))
}
}
\keyword{interface}
\keyword{database}
% vim: syntax=tex
