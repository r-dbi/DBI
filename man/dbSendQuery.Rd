\name{dbSendQuery}
\alias{dbSendQuery}
\title{Execute a statement on a given database connection.}
\arguments{
  \item{statement}{a character vector of length 1
  containing SQL.}
}
\value{
  An object that inherits from
  \code{\linkS4class{DBIResult}}.  If the statement
  generates output (e.g., a \code{SELECT} statement) the
  result set can be used with \code{\link{fetch}} to
  extract records.
}
\description{
  The function \code{dbSendQuery} only submits and
  synchronously executes the SQL statement to the database
  engine.  It does \emph{not} extracts any records --- for
  that you need to use the function \code{\link{fetch}},
  and then you must call \code{\link{dbClearResult}} when
  you finish fetching the records you need.
}
\section{Side Effects}{
  The statement is submitted for synchronous execution to
  the server connected through the \code{conn} object.  The
  DBMS executes the statement, possibly generating vast
  amounts of data.  Where these data reside is
  driver-specific: some drivers may choose to leave the
  output on the server and transfer them piecemeal to
  R/Splus, others may transfer all the data to the client
  -- but not necessarily to the memory that R/Splus
  manages.  See the individual drivers'
  \code{\link{dbSendQuery}} method for implementation
  details.
}
\examples{
\dontrun{
drv <- dbDriver("MySQL")
con <- dbConnect(drv)
res <- dbSendQuery(con, "SELECT * from liv25")
data <- fetch(res, n = -1)
}
}
\seealso{
  Other connection methods: \code{\link{dbDisconnect}},
  \code{\link{dbExistsTable}},
  \code{\link{dbGetException}}, \code{\link{dbGetQuery}},
  \code{\link{dbListFields}}, \code{\link{dbListResults}},
  \code{\link{dbListTables}}, \code{\link{dbReadTable}},
  \code{\link{dbRemoveTable}}, \code{\link{dbWriteTable}}
}

