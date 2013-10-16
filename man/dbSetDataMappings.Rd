\name{dbSetDataMappings}
\alias{dbSetDataMappings}
\title{
  Set data mappings between an DBMS and R/Splus
}
\description{
  Sets one or more conversion functions to handle the translation 
  of DBMS data types to R/Splus objects.  
  This is only needed for non-primitive data, since all DBI drivers 
  handle the common base types (integers, numeric, strings, etc.)
}
\usage{
  dbSetDataMappings(res, flds, ...)
}
\arguments{
\item{res}{
  a \code{DBIResult} object as returned by \code{dbSendQuery}.
  }
\item{flds}{
  a field description object as returned by \code{dbColumnInfo}.
  }
\item{\dots }{
  any additional arguments are passed to the implementing method.
  }
}
\value{
  a logical specifying whether the conversion functions were
  successfully installed or not.
}
\section{Side Effects}{
  Conversion functions are set up to be invoked for each element of
  the corresponding fields in the result set.
}
\details{
  The details on conversion functions (e.g., arguments,
  whether they can invoke initializers and/or destructors)
  have not been specified.
}
\note{
  No driver has yet implemented this functionality.
}
\references{
  See the Database Interface definition document
  \code{DBI.pdf} in the base directory of this package
  or \url{http://developer.r-project.org/db}.
}
\seealso{
  \code{\link{dbSendQuery}},
  \code{\link{fetch}},
  \code{\link{dbColumnInfo}}.
}
\examples{\dontrun{
makeImage <- function(x) {
  .C("make_Image", as.integer(x), length(x))
}

res <- dbSendQuery(con, statement)
flds <- dbColumnInfo(res)
flds[3, "Sclass"] <- makeImage

dbSetDataMappings(rs, flds)

im <- fetch(rs, n = -1)
}
}
\keyword{interface}
\keyword{database}
% vim: syntax=tex
