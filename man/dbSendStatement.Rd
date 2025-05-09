% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/dbSendStatement.R
\name{dbSendStatement}
\alias{dbSendStatement}
\title{Execute a data manipulation statement on a given database connection}
\usage{
dbSendStatement(conn, statement, ...)
}
\arguments{
\item{conn}{A \link[=DBIConnection-class]{DBI::DBIConnection} object,
as returned by \code{\link[=dbConnect]{dbConnect()}}.}

\item{statement}{a character string containing SQL.}

\item{...}{Other parameters passed on to methods.}
}
\value{
\code{dbSendStatement()} returns
an S4 object that inherits from \link[DBI:DBIResult-class]{DBI::DBIResult}.
The result set can be used with \code{\link[DBI:dbGetRowsAffected]{DBI::dbGetRowsAffected()}} to
determine the number of rows affected by the query.
Once you have finished using a result, make sure to clear it
with \code{\link[DBI:dbClearResult]{DBI::dbClearResult()}}.
}
\description{
The \code{dbSendStatement()} method only submits and synchronously executes the
SQL data manipulation statement (e.g., \code{UPDATE}, \code{DELETE},
\verb{INSERT INTO}, \verb{DROP TABLE}, ...) to the database engine.  To query
the number of affected rows, call \code{\link[=dbGetRowsAffected]{dbGetRowsAffected()}} on the
returned result object.  You must also call \code{\link[=dbClearResult]{dbClearResult()}} after
that. For interactive use, you should almost always prefer
\code{\link[=dbExecute]{dbExecute()}}.

\Sexpr[results=rd,stage=render]{DBI:::methods_as_rd("dbSendStatement")}
}
\details{
\code{\link[=dbSendStatement]{dbSendStatement()}} comes with a default implementation that simply
forwards to \code{\link[=dbSendQuery]{dbSendQuery()}}, to support backends that only
implement the latter.
}
\section{The command execution flow}{


This section gives a complete overview over the flow
for the execution of SQL statements that have side effects
such as stored procedures, inserting or deleting data,
or setting database or connection options.
Most of this flow, except repeated calling of \code{\link[=dbBindArrow]{dbBindArrow()}},
is implemented by \code{\link[=dbExecute]{dbExecute()}}, which should be sufficient
for non-parameterized queries.
This flow requires an active connection established by \code{\link[=dbConnect]{dbConnect()}}.
See also \code{vignette("dbi-advanced")} for a walkthrough.
\enumerate{
\item Use \code{\link[=dbSendStatement]{dbSendStatement()}} to create a result set object of class
\linkS4class{DBIResult}.
For some queries you need to pass \code{immediate = TRUE}.
\item Optionally, bind query parameters with\code{\link[=dbBind]{dbBind()}} or \code{\link[=dbBindArrow]{dbBindArrow()}}.
This is required only if the query contains placeholders
such as \verb{?} or \verb{$1}, depending on the database backend.
\item Optionally, use \code{\link[=dbGetRowsAffected]{dbGetRowsAffected()}} to retrieve the number
of rows affected by the query.
\item Repeat the last two steps as necessary.
\item Use \code{\link[=dbClearResult]{dbClearResult()}} to clean up the result set object.
This step is mandatory even if no rows have been fetched
or if an error has occurred during the processing.
It is good practice to use \code{\link[=on.exit]{on.exit()}} or \code{\link[withr:defer]{withr::defer()}}
to ensure that this step is always executed.
}
}

\section{Failure modes}{


An error is raised when issuing a statement over a closed
or invalid connection,
or if the statement is not a non-\code{NA} string.
An error is also raised if the syntax of the query is invalid
and all query parameters are given (by passing the \code{params} argument)
or the \code{immediate} argument is set to \code{TRUE}.



}

\section{Additional arguments}{


The following arguments are not part of the \code{dbSendStatement()} generic
(to improve compatibility across backends)
but are part of the DBI specification:
\itemize{
\item \code{params} (default: \code{NULL})
\item \code{immediate} (default: \code{NULL})
}

They must be provided as named arguments.
See the "Specification" sections for details on their usage.

}

\section{Specification}{


No warnings occur under normal conditions.
When done, the DBIResult object must be cleared with a call to
\code{\link[DBI:dbClearResult]{DBI::dbClearResult()}}.
Failure to clear the result set leads to a warning
when the connection is closed.
If the backend supports only one open result set per connection,
issuing a second query invalidates an already open result set
and raises a warning.
The newly opened result set is valid
and must be cleared with \code{dbClearResult()}.



The \code{param} argument allows passing query parameters, see \code{\link[DBI:dbBind]{DBI::dbBind()}} for details.

}

\section{Specification for the \code{immediate} argument}{



The \code{immediate} argument supports distinguishing between "direct"
and "prepared" APIs offered by many database drivers.
Passing \code{immediate = TRUE} leads to immediate execution of the
query or statement, via the "direct" API (if supported by the driver).
The default \code{NULL} means that the backend should choose whatever API
makes the most sense for the database, and (if relevant) tries the
other API if the first attempt fails. A successful second attempt
should result in a message that suggests passing the correct
\code{immediate} argument.
Examples for possible behaviors:
\enumerate{
\item DBI backend defaults to \code{immediate = TRUE} internally
\enumerate{
\item A query without parameters is passed: query is executed
\item A query with parameters is passed:
\enumerate{
\item \code{params} not given: rejected immediately by the database
because of a syntax error in the query, the backend tries
\code{immediate = FALSE} (and gives a message)
\item \code{params} given: query is executed using \code{immediate = FALSE}
}
}
\item DBI backend defaults to \code{immediate = FALSE} internally
\enumerate{
\item A query without parameters is passed:
\enumerate{
\item simple query: query is executed
\item "special" query (such as setting a config options): fails,
the backend tries \code{immediate = TRUE} (and gives a message)
}
\item A query with parameters is passed:
\enumerate{
\item \code{params} not given: waiting for parameters via \code{\link[DBI:dbBind]{DBI::dbBind()}}
\item \code{params} given: query is executed
}
}
}

}

\examples{
\dontshow{if (requireNamespace("RSQLite", quietly = TRUE)) withAutoprint(\{ # examplesIf}
con <- dbConnect(RSQLite::SQLite(), ":memory:")

dbWriteTable(con, "cars", head(cars, 3))

rs <- dbSendStatement(
  con,
  "INSERT INTO cars (speed, dist) VALUES (1, 1), (2, 2), (3, 3)"
)
dbHasCompleted(rs)
dbGetRowsAffected(rs)
dbClearResult(rs)
dbReadTable(con, "cars")   # there are now 6 rows

# Pass one set of values directly using the param argument:
rs <- dbSendStatement(
  con,
  "INSERT INTO cars (speed, dist) VALUES (?, ?)",
  params = list(4L, 5L)
)
dbClearResult(rs)

# Pass multiple sets of values using dbBind():
rs <- dbSendStatement(
  con,
  "INSERT INTO cars (speed, dist) VALUES (?, ?)"
)
dbBind(rs, list(5:6, 6:7))
dbBind(rs, list(7L, 8L))
dbClearResult(rs)
dbReadTable(con, "cars")   # there are now 10 rows

dbDisconnect(con)
\dontshow{\}) # examplesIf}
}
\seealso{
For queries: \code{\link[=dbSendQuery]{dbSendQuery()}} and \code{\link[=dbGetQuery]{dbGetQuery()}}.

Other DBIConnection generics: 
\code{\link{DBIConnection-class}},
\code{\link{dbAppendTable}()},
\code{\link{dbAppendTableArrow}()},
\code{\link{dbCreateTable}()},
\code{\link{dbCreateTableArrow}()},
\code{\link{dbDataType}()},
\code{\link{dbDisconnect}()},
\code{\link{dbExecute}()},
\code{\link{dbExistsTable}()},
\code{\link{dbGetException}()},
\code{\link{dbGetInfo}()},
\code{\link{dbGetQuery}()},
\code{\link{dbGetQueryArrow}()},
\code{\link{dbIsReadOnly}()},
\code{\link{dbIsValid}()},
\code{\link{dbListFields}()},
\code{\link{dbListObjects}()},
\code{\link{dbListResults}()},
\code{\link{dbListTables}()},
\code{\link{dbQuoteIdentifier}()},
\code{\link{dbReadTable}()},
\code{\link{dbReadTableArrow}()},
\code{\link{dbRemoveTable}()},
\code{\link{dbSendQuery}()},
\code{\link{dbSendQueryArrow}()},
\code{\link{dbUnquoteIdentifier}()},
\code{\link{dbWriteTable}()},
\code{\link{dbWriteTableArrow}()}

Other command execution generics: 
\code{\link{dbBind}()},
\code{\link{dbClearResult}()},
\code{\link{dbExecute}()},
\code{\link{dbGetRowsAffected}()}
}
\concept{DBIConnection generics}
\concept{command execution generics}
