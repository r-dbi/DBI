\name{dbGetInfo}
\alias{dbGetInfo}
\title{Get DBMS metadata.}
\usage{
  dbGetInfo(dbObj, ...)
}
\arguments{
  \item{dbObj}{An object inheriting from
  \code{\linkS4class{DBIObject}}, i.e.
  \code{\linkS4class{DBIDriver}},
  \code{\linkS4class{DBIConnection}}, or a
  \code{\linkS4class{DBIResult}}}

  \item{...}{Other arguments to methods.}
}
\value{
  a list
}
\description{
  Get DBMS metadata.
}
\section{Implementation notes}{
  For \code{DBIDriver} subclasses, this should include the
  version of the package, and the version of the underlying
  client library.

  For \code{DBIConnection} objects this should report the
  version of the DBMS engine, database name, username,
  host, port, etc. It MUST NOT include the password.

  For \code{DBIResult} objects, this should include the
  statement being executed, how many rows have been fetched
  so far (in the case of queries), how many rows were
  affected (deleted, inserted, changed, or total number of
  records to be fetched).
}
\seealso{
  Other DBObject methods: \code{\link{dbIsValid}}
}

