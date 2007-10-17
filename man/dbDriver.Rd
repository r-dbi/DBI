% $Id$
\name{dbDriver}
\alias{dbDriver}
\alias{dbDriver,character-method}
\alias{dbUnloadDriver}
\title{
  Database Interface (DBI) Classes and drivers
}
\description{
  These \emph{virtual} classes and their methods define the interface to
  database management systems (DBMS).  They are extended by packages
  or drivers that implement the methods in the context of specific
  DBMS (e.g., Berkeley DB, MySQL, Oracle, ODBC, PostgreSQL, SQLite).
}
\usage{
  dbDriver(drvName, ...)
  dbUnloadDriver(drv, ...)     ## free up all resources
}
\arguments{
\item{drvName}{
  character name of the driver to instantiate.
  }
\item{drv}{
  an object that inherits from \code{DBIDriver} as created by
  \code{dbDriver}.
}
\item{...}{
  any other arguments are passed to the driver \code{drvName}.
  }
}
\value{
  In the case of \code{dbDriver}, an driver object whose class 
  extends \code{DBIDriver}.  This object may be used to create connections 
  to the actual DBMS engine.
  
  In the case of \code{dbUnloadDriver}, a logical indicating whether
  the operation succeeded or not.
}
\section{Side Effects}{
  The client part of the database communication is initialized (typically
  dynamically loading C code, etc.) but note that connecting to the 
  database engine itself needs to be done through calls to \code{dbConnect}.

}
\details{
  The virtual class \code{DBIDriver} defines the operations 
  for creating connections and defining data type mappings.
  Actual driver classes, for instance \code{RPgSQL}, \code{RMySQL}, etc.
  implement these operations in a DBMS-specific manner.

  More generally, the DBI defines a very small set of classes and
  methods that allows users and applications access DBMS with a common
  interface.  The virtual classes are \code{DBIDriver} that individual
  drivers extend, \code{DBIConnection} that represent instances of
  DBMS connections, and \code{DBIResult} that represent the result
  of a DBMS statement.  These three classes extend the basic class
  of \code{DBIObject}, which serves as the root or parent of the
  class hierarchy.
}

\references{
  See the Database Interface definition document
  \code{DBI.pdf} in the base directory of this package
  or
  \url{http://developer.r-project.org/db}.
}
\seealso{
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
# create a MySQL instance for capacity of up to 25 simultaneous
# connections.
m <- dbDriver("MySQL", max.con = 25)
p <- dbDriver("PgSQL")

# open the connection using user, password, etc., as
con <- dbConnect(m, user="ip", password = "traffic", dbname="iptraffic")
rs <- dbSubmitQuery(con, 
         "select * from HTTP_ACCESS where IP_ADDRESS = '127.0.0.1'")
df <- fetch(rs, n = 50)
df2 <- fetch(rs, n = -1)
dbClearResult(rs)

pcon <- dbConnect(p, "user", "password", "dbname")
dbListTables(pcon)
}
}
\keyword{interface}
\keyword{database}
% vim: syntax=tex
