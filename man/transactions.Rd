\name{transactions}
\alias{dbCommit}
\alias{dbRollback}
\alias{transactions}
\title{Commit/rollback SQL transactions}
\arguments{
  \item{}{}
}
\value{
  a logical indicating whether the operation succeeded or
  not.
}
\description{
  Not all database engines implement transaction
  management, in which case these methods should not be
  implemented for the specific \linkS4clas{DBIConnection}
  subclass.
}
\section{Side Effects}{
  The current transaction on the connections \code{con} is
  committed or rolled back.
}
\examples{
\dontrun{
ora <- dbDriver("Oracle")
con <- dbConnect(ora)
rs <- dbSendQuery(con,
      "delete * from PURGE as p where p.wavelength<0.03")
if(dbGetInfo(rs, what = "rowsAffected") > 250){
  warning("dubious deletion -- rolling back transaction")
  dbRollback(con)
}
}
}

