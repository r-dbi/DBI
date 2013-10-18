\name{dbWriteTable}
\alias{dbWriteTable}
\title{Create a database table from data frame.}
\usage{
  dbWriteTable(conn, name, value, ...)
}
\arguments{
  \item{conn}{A \code{\linkS4class{DBIConnection}} object,
  as produced by \code{\link{dbConnect}}.}

  \item{name}{A character string specifying a DBMS table
  name.}

  \item{...}{Other parameters passed on to methods.}

  \item{value}{a data.frame (or coercible to data.frame).}
}
\value{
  a logical vector of length 1 indicating success or
  failure.
}
\description{
  Create a database table from data frame.
}
\section{Implementation notes}{
  Method should also accept:

  \itemize{ \item \code{row.names}: A logical specifying
  whether the \code{row.names} should be output to the
  output DBMS table; if \code{TRUE}, the extra field name
  will be whatever the S identifier \code{"row.names"} maps
  to the DBMS (see \code{\link{make.db.names}}).  \item
  \code{overwrite}: a logical specifying whether to
  overwrite an existing table or not. Its default is
  \code{FALSE} \item \code{append}: a logical specifying
  whether to append to an existing table in the DBMS.  Its
  default is \code{FALSE}. }
}
\seealso{
  Other connection methods: \code{\link{dbDisconnect}},
  \code{\link{dbExistsTable}},
  \code{\link{dbGetException}}, \code{\link{dbGetQuery}},
  \code{\link{dbListFields}}, \code{\link{dbListResults}},
  \code{\link{dbListTables}}, \code{\link{dbReadTable}},
  \code{\link{dbRemoveTable}}, \code{\link{dbSendQuery}}
}

