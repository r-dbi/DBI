\name{dbSetDataMappings}
\alias{dbSetDataMappings}
\title{Set data mappings between an DBMS and R/Splus.}
\arguments{
  \item{flds}{a field description object as returned by
  \code{dbColumnInfo}.}
}
\description{
  NOT YET IMPLEMENTED.
}
\details{
  Sets one or more conversion functions to handle the
  translation of DBMS data types to R/Splus objects.  This
  is only needed for non-primitive data, since all DBI
  drivers handle the common base types (integers, numeric,
  strings, etc.)

  The details on conversion functions (e.g., arguments,
  whether they can invoke initializers and/or destructors)
  have not been specified.
}
\examples{
\dontrun{
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
\keyword{internal}

