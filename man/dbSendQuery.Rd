% $Id$
\name{dbSendQuery}
\alias{dbSendQuery}
\alias{dbGetQuery}
\alias{dbClearResult}
\alias{dbGetException}
\title{
  Execute a statement on a given database connection
}
\description{
  Submits and executes an arbitrary SQL statement on a
  specific connection.  Also, clears (closes) a result set.
}
\usage{
  dbSendQuery(conn, statement, ...)
  dbGetQuery(conn, statement, ...)
  dbClearResult(res, ...)
  dbGetException(conn, ...) 
}
\arguments{
\item{conn}{
  a connection object.
}
\item{statement}{
  a character vector of length 1 with the SQL statement.
}
\item{res}{
  a result set object (i.e., the value of \code{dbSendQuery}).
}
\item{\dots }{
  database-specific parameters may be specified.
}
}
\value{
  \code{dbSendQuery} returns a result set object, i.e., an object
  that inherits from \code{DBIResult};  if the statement generates
  output (e.g., a \code{SELECT} statement) the result set can be
  used with \code{\link{fetch}} to extract records.

  \code{dbGetQuery} returns a data.frame with the output (if any)
  of the query.  

  \code{dbClearResult} returns a logical indicating whether clearing
  the result set was successful or not.
  
  \code{dbGetException} returns a list with elements \code{errNum} 
  (an integer error number) and \code{errMsg} (a character string)
  describing the last error in the connection \code{conn}.
}
\section{Side Effects}{
  The statement is submitted for synchronous execution to the server 
  connected through the \code{conn} object.  The DBMS executes the
  statement, possibly generating vast amounts of data.  Where these
  data reside is driver-specific:  some drivers may choose to leave the
  output on the server and transfer them piecemeal to R/Splus, others may
  transfer all the data to the client -- but not necessarily to the 
  memory that R/Splus manages.  See the individual drivers' 
  \code{\link{dbSendQuery}} method for implementation details.
}
\details{
  The function \code{dbSendQuery} only submits and synchronously executes 
  the SQL statement to the database engine.  It does \emph{not} extracts any
  records ---  for that you need to use the function 
  \code{\link{fetch}} (make sure you invoke \code{dbClearResult} when you 
  finish fetching the records you need).

  The function \code{dbGetQuery} does all these in one operation (submits
  the statement, fetches all output records, and clears the result set).

  \code{dbClearResult} frees all resources (local and remote) associated
  with a result set.  It some cases (e.g., very large result sets) this can 
  be a critical step to avoid exhausting resources (memory, file descriptors, 
  etc.)
}
\references{
  See the Database Interface definition document
  \code{DBI.pdf} in the base directory of this package
  or \url{http://developer.r-project.org/db}.
}
\seealso{
  \code{\link{dbDriver}}
  \code{\link{dbConnect}}
  \code{\link{fetch}}
  \code{\link{dbCommit}}
  \code{\link{dbGetInfo}}
  \code{\link{dbReadTable}}
}
\examples{\dontrun{
drv <- dbDriver("MySQL")
con <- dbConnect(drv)
res <- dbSendQuery(con, "SELECT * from liv25")
data <- fetch(res, n = -1)
}
}
\keyword{interface}
\keyword{database}
% vim: syntax=tex
