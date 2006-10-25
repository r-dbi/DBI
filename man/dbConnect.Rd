% $Id$
\name{dbConnect}
\alias{dbDisconnect}
\alias{dbConnect}
\title{
  Create a connection to a DBMS
}
\description{
  Connect to a DBMS going through the appropriate authorization
  procedure.
}
\usage{
  dbConnect(drv, ...)
  dbDisconnect(conn, ...)
}
\arguments{
\item{drv}{
  an object that inherits from \code{DBIDriver},
  a character string specifying the DBMS driver, e.g., "RPgSQL", 
  "ROracle", "Informix", or possibly another \code{dbConnect} object.
  }
\item{conn}{
  a  connection object as produced by \code{dbConnect}.
  }
\item{\dots }{
  authorization arguments needed by the DBMS instance; these
  typically include \code{user}, \code{password}, \code{dbname},
  \code{host}, \code{port}, etc.  For details see the appropriate
  \code{DBIDriver}.
  }
}
\value{
  An object that extends \code{DBIConnection} in a database-specific
  manner.  For instance \code{dbConnect("MySQL")} produces an object
  of class \code{MySQLConnection}.
  This object is used to direct commands to the database engine.

  \code{dbDisconnect} returns a logical value indicating whether
  the operation succeeded or not.
}
\section{Side Effects}{
  A connection between R/Splus and the database server is established,
  and the R/Splus program becomes a client of the database engine.
  Typically the connections is through the TCP/IP protocol, 
  but this will depend on vendor-specific details.
}
\details{
  Some implementations  may allow you to have multiple connections 
  open, so you may invoke this function repeatedly assigning its 
  output to different objects.
  
  The authorization mechanism is left unspecified, so check the 
  documentation of individual drivers for details.
}
\section{notes}{
  Make sure you close the connection using \code{dbDisconnect(conn)}
  when it is not longer needed.
}
\references{
  See the Database Interface definition document
  \code{DBI.pdf} in the base directory of this package
  or \url{http://developer.r-project.org/db}.
}
\seealso{
  \code{\link{dbConnect}}
  \code{\link{dbSendQuery}}
  \code{\link{dbGetQuery}}
  \code{\link{fetch}}
  \code{\link{dbCommit}}
  \code{\link{dbGetInfo}}
  \code{\link{dbReadTable}}
}
\examples{\dontrun{
# create an RODBC instance and create one connection.
m <- dbDriver("RODBC")

# open the connection using user, passsword, etc., as
# specified in the file \file{\$HOME/.my.cnf}
con <- dbConnect(m, dsn="data.source", uid="user", pwd="password"))    

# Run an SQL statement by creating first a resultSet object
rs <- dbSendQuery(con, statement = paste(
                      "SELECT w.laser_id, w.wavelength, p.cut_off",
                      "FROM WL w, PURGE P", 
                      "WHERE w.laser_id = p.laser_id", 
                      "SORT BY w.laser_id")
# we now fetch records from the resultSet into a data.frame
data <- fetch(rs, n = -1)   # extract all rows
dim(data)
}
}
\keyword{interface}
\keyword{database}
% vim: syntax=tex
