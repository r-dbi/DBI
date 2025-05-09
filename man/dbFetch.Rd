% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/dbFetch.R, R/fetch.R
\name{dbFetch}
\alias{dbFetch}
\alias{fetch}
\title{Fetch records from a previously executed query}
\usage{
dbFetch(res, n = -1, ...)

fetch(res, n = -1, ...)
}
\arguments{
\item{res}{An object inheriting from \link[=DBIResult-class]{DBI::DBIResult},
created by \code{\link[=dbSendQuery]{dbSendQuery()}}.}

\item{n}{maximum number of records to retrieve per fetch. Use \code{n = -1}
or \code{n = Inf}
to retrieve all pending records.  Some implementations may recognize other
special values.}

\item{...}{Other arguments passed on to methods.}
}
\value{
\code{dbFetch()} always returns a \link{data.frame} with
as many rows as records were fetched and as many
columns as fields in the result set,
even if the result is a single value
or has one
or zero rows.
Passing \code{n = NA} is supported and returns an arbitrary number of rows (at least one)
as specified by the driver, but at most the remaining rows in the result set.
}
\description{
Fetch the next \code{n} elements (rows) from the result set and return them
as a data.frame.

\Sexpr[results=rd,stage=render]{DBI:::methods_as_rd("dbFetch")}
}
\details{
\code{fetch()} is provided for compatibility with older DBI clients - for all
new code you are strongly encouraged to use \code{dbFetch()}. The default
implementation for \code{dbFetch()} calls \code{fetch()} so that it is compatible with
existing code. Modern backends should implement for \code{dbFetch()} only.
}
\section{The data retrieval flow}{


This section gives a complete overview over the flow
for the execution of queries that return tabular data as data frames.

Most of this flow, except repeated calling of \code{\link[=dbBind]{dbBind()}} or \code{\link[=dbBindArrow]{dbBindArrow()}},
is implemented by \code{\link[=dbGetQuery]{dbGetQuery()}}, which should be sufficient
unless you want to access the results in a paged way
or you have a parameterized query that you want to reuse.
This flow requires an active connection established by \code{\link[=dbConnect]{dbConnect()}}.
See also \code{vignette("dbi-advanced")} for a walkthrough.
\enumerate{
\item Use \code{\link[=dbSendQuery]{dbSendQuery()}} to create a result set object of class
\linkS4class{DBIResult}.
\item Optionally, bind query parameters with \code{\link[=dbBind]{dbBind()}} or \code{\link[=dbBindArrow]{dbBindArrow()}}.
This is required only if the query contains placeholders
such as \verb{?} or \verb{$1}, depending on the database backend.
\item Optionally, use \code{\link[=dbColumnInfo]{dbColumnInfo()}} to retrieve the structure of the result set
without retrieving actual data.
\item Use \code{\link[=dbFetch]{dbFetch()}} to get the entire result set, a page of results,
or the remaining rows.
Fetching zero rows is also possible to retrieve the structure of the result set
as a data frame.
This step can be called multiple times.
Only forward paging is supported, you need to cache previous pages
if you need to navigate backwards.
\item Use \code{\link[=dbHasCompleted]{dbHasCompleted()}} to tell when you're done.
This method returns \code{TRUE} if no more rows are available for fetching.
\item Repeat the last four steps as necessary.
\item Use \code{\link[=dbClearResult]{dbClearResult()}} to clean up the result set object.
This step is mandatory even if no rows have been fetched
or if an error has occurred during the processing.
It is good practice to use \code{\link[=on.exit]{on.exit()}} or \code{\link[withr:defer]{withr::defer()}}
to ensure that this step is always executed.
}
}

\section{Failure modes}{


An attempt to fetch from a closed result set raises an error.
If the \code{n} argument is not an atomic whole number
greater or equal to -1 or Inf, an error is raised,
but a subsequent call to \code{dbFetch()} with proper \code{n} argument succeeds.

Calling \code{dbFetch()} on a result set from a data manipulation query
created by \code{\link[DBI:dbSendStatement]{DBI::dbSendStatement()}} can
be fetched and return an empty data frame, with a warning.

}

\section{Specification}{


Fetching multi-row queries with one
or more columns by default returns the entire result.
Multi-row queries can also be fetched progressively
by passing a whole number (\link{integer} or
\link{numeric})
as the \code{n} argument.
A value of \link{Inf} for the \code{n} argument is supported
and also returns the full result.
If more rows than available are fetched, the result is returned in full
without warning.
If fewer rows than requested are returned, further fetches will
return a data frame with zero rows.
If zero rows are fetched, the columns of the data frame are still fully
typed.
Fetching fewer rows than available is permitted,
no warning is issued when clearing the result set.

A column named \code{row_names} is treated like any other column.




The column types of the returned data frame depend on the data returned:
\itemize{
\item \link{integer} (or coercible to an integer) for integer values between -2^31 and 2^31 - 1,
with \link{NA} for SQL \code{NULL} values
\item \link{numeric} for numbers with a fractional component,
with NA for SQL \code{NULL} values
\item \link{logical} for Boolean values (some backends may return an integer);
with NA for SQL \code{NULL} values
\item \link{character} for text,
with NA for SQL \code{NULL} values
\item lists of \link{raw} for blobs
with \link{NULL} entries for SQL NULL values
\item coercible using \code{\link[=as.Date]{as.Date()}} for dates,
with NA for SQL \code{NULL} values
(also applies to the return value of the SQL function \code{current_date})
\item coercible using \code{\link[hms:hms]{hms::as_hms()}} for times,
with NA for SQL \code{NULL} values
(also applies to the return value of the SQL function \code{current_time})
\item coercible using \code{\link[=as.POSIXct]{as.POSIXct()}} for timestamps,
with NA for SQL \code{NULL} values
(also applies to the return value of the SQL function \code{current_timestamp})
}

If dates and timestamps are supported by the backend, the following R types are
used:
\itemize{
\item \link[=Dates]{Date} for dates
(also applies to the return value of the SQL function \code{current_date})
\item \link[=DateTimeClasses]{POSIXct} for timestamps
(also applies to the return value of the SQL function \code{current_timestamp})
}

R has no built-in type with lossless support for the full range of 64-bit
or larger integers. If 64-bit integers are returned from a query,
the following rules apply:
\itemize{
\item Values are returned in a container with support for the full range of
valid 64-bit values (such as the \code{integer64} class of the \pkg{bit64}
package)
\item Coercion to numeric always returns a number that is as close as possible
to the true value
\item Loss of precision when converting to numeric gives a warning
\item Conversion to character always returns a lossless decimal representation
of the data
}

}

\examples{
\dontshow{if (requireNamespace("RSQLite", quietly = TRUE)) withAutoprint(\{ # examplesIf}
con <- dbConnect(RSQLite::SQLite(), ":memory:")

dbWriteTable(con, "mtcars", mtcars)

# Fetch all results
rs <- dbSendQuery(con, "SELECT * FROM mtcars WHERE cyl = 4")
dbFetch(rs)
dbClearResult(rs)

# Fetch in chunks
rs <- dbSendQuery(con, "SELECT * FROM mtcars")
while (!dbHasCompleted(rs)) {
  chunk <- dbFetch(rs, 10)
  print(nrow(chunk))
}

dbClearResult(rs)
dbDisconnect(con)
\dontshow{\}) # examplesIf}
}
\seealso{
Close the result set with \code{\link[=dbClearResult]{dbClearResult()}} as soon as you
finish retrieving the records you want.

Other DBIResult generics: 
\code{\link{DBIResult-class}},
\code{\link{dbBind}()},
\code{\link{dbClearResult}()},
\code{\link{dbColumnInfo}()},
\code{\link{dbGetInfo}()},
\code{\link{dbGetRowCount}()},
\code{\link{dbGetRowsAffected}()},
\code{\link{dbGetStatement}()},
\code{\link{dbHasCompleted}()},
\code{\link{dbIsReadOnly}()},
\code{\link{dbIsValid}()},
\code{\link{dbQuoteLiteral}()},
\code{\link{dbQuoteString}()}

Other data retrieval generics: 
\code{\link{dbBind}()},
\code{\link{dbClearResult}()},
\code{\link{dbFetchArrow}()},
\code{\link{dbFetchArrowChunk}()},
\code{\link{dbGetQuery}()},
\code{\link{dbGetQueryArrow}()},
\code{\link{dbHasCompleted}()},
\code{\link{dbSendQuery}()},
\code{\link{dbSendQueryArrow}()}
}
\concept{DBIResult generics}
\concept{data retrieval generics}
