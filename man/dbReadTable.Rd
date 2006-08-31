% $Id$
\name{dbReadTable}
\alias{dbReadTable}
\alias{dbWriteTable}
\alias{dbExistsTable}
\alias{dbRemoveTable}
\title{
  Convenience functions for Importing/Exporting DBMS tables
}
\description{
  These functions mimic their R/Splus counterpart 
  \code{get},
  \code{assign},
  \code{exists}, 
  \code{remove}, and
  \code{objects},
  except that they generate code that gets remotely executed
  in a database engine.
}
\synopsis{
  dbReadTable(conn, name, ...)
  dbWriteTable(conn, name, value, ...)
  dbExistsTable(conn, name, ...)
  dbRemoveTable(conn, name, ...)
}
\usage{
  dbReadTable(conn, name, row.names = "row_names", ...)
  dbWriteTable(conn, name, value, row.names = T, ...,
              overwrite = F, append = F)
  dbExistsTable(conn, name, ...)
  dbRemoveTable(conn, name, ...)
}
\arguments{

\item{conn}{
  a database connection object.
  }
\item{name}{
  a character string specifying a DBMS table name.
  }
\item{value}{
  a data.frame (or coercible to data.frame).
  }
\item{row.names}{
  in the case of \code{dbReadTable}, this argument can be a string or
  an index specifying the column in the DBMS table to be used as 
  \code{row.names} in the output data.frame (a \code{NULL}, \code{""}, or 0 
  specifies that no column should be used as \code{row.names} in the output).

  In the case of \code{dbWriteTable}, this argument should be a logical
  specifying whether the \code{row.names} should be output to the
  output DBMS table; if \code{TRUE}, the extra field name will be whatever
  the S identifier \code{"row.names"} maps to the DBMS
  (see \code{\link{make.db.names}}).
  }
\item{overwrite}{
  a logical specifying whether to overwrite an existing table
  or not.  Its default is \code{FALSE}.
  }
\item{append}{
  a logical specifying whether to append to an existing table
  in the DBMS.
  Its default is \code{FALSE}.
  }
\item{\dots }{
  any optional arguments that the underlying database driver
  supports. 
  }

}

\value{
  \code{dbReadTable} returns a data.frame; all other functions
  return \code{TRUE} or \code{FALSE} denoting whether the operation
  was successful or not.
}

\section{Side Effects}{
A DBMS statement is generated and remotely executed on a database
engine; the result set it produces is fetched in its entirety.
These operations may failed if the underlying database driver runs
out of available connections and/or result sets, or the operation
violates DBMS integrity constraints (e.g., attempting to write
duplicate values on a field that's defined as a primary key).

The semantics of \code{assign} are slightly extended to allow
overwriting or appending to an existing table.  
}
\note{The translation of identifiers between R/Splus and SQL is done through
  calls to \code{\link{make.names}} and \code{\link{make.db.names}}, 
  but we cannot guarantee that the conversion is reversible.  For
  details see \code{\link{make.db.names}}.
}
\references{
  See the Database Interface definition document
  \code{DBI.pdf} in the base directory of this package
  or \url{http://developer.r-project.org/db}.
}
\seealso{
  \code{\link{dbDriver}},
  \code{\link{dbConnect}},
  \code{\link{dbSendQuery}},
  \code{\link{dbGetQuery}},
  \code{\link{fetch}},
  \code{\link{dbCommit}},
  \code{\link{dbGetInfo}},
  \code{\link{dbListTables}},
  \code{\link{dbReadTable}}.
}
\examples{\dontrun{
conn <- dbConnect("MySQL", group = "vitalAnalysis")
con2 <- dbConnect("ODBC", "dsn", "user", "pwd")
if(dbExistsTable(con2, "fuel_frame")){
   fuel.frame <- dbReadTable(con2, "fuel_frame")
   dbRemoveTable(conn, "fuel_frame")
   dbWriteTable(conn, "fuel_frame", fuel.frame)
}
if(dbExistsTable(conn, "RESULTS")){
   dbWriteTable(conn, "RESULTS", results2000, append = T)
else
   dbWriteTable(conn, "RESULTS", results2000)
}
}
}
\keyword{interface}
\keyword{database}
% vim: syntax=tex
