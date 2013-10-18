\name{dbConnect}
\alias{dbConnect}
\title{Create a connection to a DBMS.}
\usage{
  dbConnect(drv, ...)
}
\arguments{
  \item{drv}{an object that inherits from
  \code{\linkS4class{DBIDriver}}, or a character string
  specifying the name of DBMS driver, e.g., "RSQLite",
  "RMySQL", "RPostgreSQL", or an existing
  \code{\linkS4class{DBIConnection}} object (in order to
  clone an existing connection).}

  \item{...}{authorization arguments needed by the DBMS
  instance; these typically include \code{user},
  \code{password}, \code{dbname}, \code{host}, \code{port},
  etc.  For details see the appropriate \code{DBIDriver}.}
}
\value{
  An object that extends \code{\linkS4class{DBIConnection}}
  in a database-specific manner. For instance
  \code{dbConnect("MySQL")} produces an object of class
  \code{MySQLConnection}. This object is used to direct
  commands to the database engine.
}
\description{
  Connect to a DBMS going through the appropriate
  authorization procedure. Some implementations may allow
  you to have multiple connections open, so you may invoke
  this function repeatedly assigning its output to
  different objects. The authorization mechanism is left
  unspecified, so check the documentation of individual
  drivers for details.
}
\section{Side Effects}{
  A connection between R/Splus and the database server is
  established, and the R/Splus program becomes a client of
  the database engine.  Typically the connections is
  through the TCP/IP protocol, but this will depend on
  vendor-specific details.
}
\examples{
\dontrun{
# create an RODBC instance and create one connection.
m <- dbDriver("RODBC")

# open the connection using user, passsword, etc., as
# specified in the file \\file{\\$HOME/.my.cnf}
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
\seealso{
  \code{\link{dbDisconnect}} to disconnect from a database.
}

