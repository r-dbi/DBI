\docType{data}
\name{DBIspec}
\alias{DBIspec}
\title{DBI specification}
\description{
The \pkg{DBI} package defines the generic DataBase Interface for R.
The connection to individual DBMS is made by packages that import \pkg{DBI}
(so-called \emph{DBI backends}).
This document formalizes the behavior expected by the functions declared in
\pkg{DBI} and implemented by the individal backends.

To ensure maximum portability and exchangeability, and to reduce the effort
for implementing a new DBI backend, the \pkg{DBItest} package defines
a comprehensive set of test cases that test conformance to the DBI
specification.
In fact, this document is derived from comments in the test definitions of
the \pkg{DBItest} package.
This ensures that an extension or update to the tests will be reflected in
this document.
}
\section{Getting started}{

A DBI backend is an R package,
which should import the \pkg{DBI}
and \pkg{methods}
packages.
For better or worse, the names of many existing backends start with
\sQuote{R}, e.g., \pkg{RSQLite}, \pkg{RMySQL}, \pkg{RSQLServer}; it is up
to the package author to adopt this convention or not.
}

\section{Driver}{

Each DBI backend implements a \dfn{driver class},
which must be an S4 class and inherit from the \code{DBIDriver} class.
This section describes the construction of, and the methods defined for,
this driver class.


\subsection{Construction}{
The backend must support creation of an instance of this driver class
with a \dfn{constructor function}.
By default, its name is the package name without the leading \sQuote{R}
(if it exists), e.g., \code{SQLite} for the \pkg{RSQLite} package.
For the automated tests, the constructor name can be tweaked using the
\code{constructor_name} tweak.

The constructor must be exported, and
it must be a function
that is callable without arguments.
For the automated tests, unless the
\code{constructor_relax_args} tweak is set to \code{TRUE},
an empty argument list is expected.
Otherwise, an argument list where all arguments have default values
is also accepted.

}


\subsection{\code{dbDataType("DBIDriver", "ANY")}}{
The backend can override the \code{\link[DBI]{dbDataType}} generic
for its driver class.
This generic expects an arbitrary object as second argument
and returns a corresponding SQL type
as atomic
character value
with at least one character.
As-is objects (i.e., wrapped by \code{\link[base]{I}}) must be
supported and return the same results as their unwrapped counterparts.

To query the values returned by the default implementation,
run \code{example(dbDataType, package = "DBI")}.
If the backend needs to override this generic,
it must accept all basic R data types as its second argument, namely
\code{\link[base]{logical}},
\code{\link[base]{integer}},
\code{\link[base]{numeric}},
\code{\link[base]{character}},
dates (see \code{\link[base]{Dates}}),
date-time (see \code{\link[base]{DateTimeClasses}}),
and \code{\link[base]{difftime}}.
It also must accept lists of \code{raw} vectors
and map them to the BLOB (binary large object) data type.
The behavior for other object types is not specified.
}


\subsection{\code{dbGetInfo("DBIDriver")} (deprecated)}{
Return value of dbGetInfo has necessary elements.
}


\subsection{Repeated loading, instantiation, and unloading}{
Repeated load, instantiation, and unload of package in a new R session.
}
}

\section{Connection}{

\subsection{Construction: \code{dbConnect("DBIDriver")} and \code{dbDisconnect("DBIConnection", "ANY")}}{
Can connect and disconnect, connection object inherits from
  "DBIConnection".
Repeated disconnect throws warning.
}


\subsection{\code{dbDataType("DBIConnection", "ANY")}}{
SQL Data types exist for all basic R data types. dbDataType() does not
throw an error and returns a nonempty atomic character
}


\subsection{\code{dbGetInfo("DBIConnection")} (deprecated)}{
Return value of dbGetInfo has necessary elements
}


\subsection{Stress tests}{
Open 50 simultaneous connections
Open and close 50 connections
Repeated load, instantiation, connection, disconnection, and unload of
package in a new R session.
}
}

\section{Result}{

\subsection{Construction: \code{dbSendQuery("DBIConnection")} and \code{dbClearResult("DBIResult")}}{
Can issue trivial query, result object inherits from "DBIResult".
Return value, currently tests that the return value is always
\code{TRUE}, and that an attempt to close a closed result set issues a
warning.
Leaving a result open when closing a connection gives a warning.
Can issue a command query that creates a table, inserts a row, and
deletes it; the result sets for these query always have "completed"
status.
Issuing an invalid query throws error (but no warnings, e.g. related to
  pending results, are thrown).
}


\subsection{\code{dbFetch("DBIResult")} and \code{dbHasCompleted("DBIResult")}}{
Single-value queries can be fetched.
Multi-row single-column queries can be fetched.
Multi-row queries can be fetched progressively.
If more rows than available are fetched, the result is returned in full
  but no warning is issued.
If less rows than available are fetched, the result is returned in full
  but no warning is issued; also tests the corner case of fetching zero
  rows.
Side-effect-only queries (without return value) can be fetched.
Fetching from a closed result set raises an error.
Querying a disconnected connection throws error.
}


\subsection{\code{dbGetQuery("DBIConnection", "ANY")}}{
Single-value queries can be read with dbGetQuery
Multi-row single-column queries can be read with dbGetQuery.
Empty single-column queries can be read with
\code{\link[DBI]{dbGetQuery}}. Not all SQL dialects support the query
used here.
Single-row multi-column queries can be read with dbGetQuery.
Multi-row multi-column queries can be read with dbGetQuery.
Empty multi-column queries can be read with
\code{\link[DBI]{dbGetQuery}}. Not all SQL dialects support the query
used here.
}


\subsection{Create table with data type}{
SQL Data types exist for all basic R data types, and the engine can
process them.
SQL data type for factor is the same as for character.
}


\subsection{Data roundtrip}{
Data conversion from SQL to R: integer
Data conversion from SQL to R: integer with typed NULL values.
Data conversion from SQL to R: integer with typed NULL values
in the first row.
Data conversion from SQL to R: numeric.
Data conversion from SQL to R: numeric with typed NULL values.
Data conversion from SQL to R: numeric with typed NULL values
in the first row.
Data conversion from SQL to R: logical. Optional, conflict with the
\code{data_logical_int} test.
Data conversion from SQL to R: logical with typed NULL values.
Data conversion from SQL to R: logical with typed NULL values
in the first row
Data conversion from SQL to R: logical (as integers). Optional,
conflict with the \code{data_logical} test.
Data conversion from SQL to R: logical (as integers) with typed NULL
values.
Data conversion from SQL to R: logical (as integers) with typed NULL
values
in the first row.
Data conversion from SQL to R: A NULL value is returned as NA.
Data conversion from SQL to R: 64-bit integers.
Data conversion from SQL to R: 64-bit integers with typed NULL values.
Data conversion from SQL to R: 64-bit integers with typed NULL values
in the first row.
Data conversion from SQL to R: character.
Data conversion from SQL to R: character with typed NULL values.
Data conversion from SQL to R: character with typed NULL values
in the first row.
Data conversion from SQL to R: raw. Not all SQL dialects support the
syntax of the query used here.
Data conversion from SQL to R: raw with typed NULL values.
Data conversion from SQL to R: raw with typed NULL values
in the first row.
Data conversion from SQL to R: date, returned as integer with class.
Data conversion from SQL to R: date with typed NULL values.
Data conversion from SQL to R: date with typed NULL values
in the first row.
Data conversion from SQL to R: time.
Data conversion from SQL to R: time with typed NULL values.
Data conversion from SQL to R: time with typed NULL values
in the first row.
Data conversion from SQL to R: time (using alternative syntax with
parentheses for specifying time literals).
Data conversion from SQL to R: time (using alternative syntax with
parentheses for specifying time literals) with typed NULL values.
Data conversion from SQL to R: time (using alternative syntax with
parentheses for specifying time literals) with typed NULL values
in the first row.
Data conversion from SQL to R: timestamp.
Data conversion from SQL to R: timestamp with typed NULL values.
Data conversion from SQL to R: timestamp with typed NULL values
in the first row.
Data conversion from SQL to R: timestamp with time zone.
Data conversion from SQL to R: timestamp with time zone with typed NULL
values.
Data conversion from SQL to R: timestamp with time zone with typed NULL
values
in the first row.
Data conversion: timestamp (alternative syntax with parentheses
for specifying timestamp literals).
Data conversion: timestamp (alternative syntax with parentheses
for specifying timestamp literals) with typed NULL values.
Data conversion: timestamp (alternative syntax with parentheses
for specifying timestamp literals) with typed NULL values
in the first row.
}
}

\section{SQL}{

\subsection{\code{dbQuoteString("DBIConnection")}}{
Can quote strings, and create strings that contain quotes and spaces.
Can quote more than one string at once by passing a character vector.
}


\subsection{\code{dbQuoteIdentifier("DBIConnection")}}{
Can quote identifiers that consist of letters only.
Can quote identifiers with special characters, and create identifiers
that contain quotes and spaces.
Character vectors are treated as a single qualified identifier.
}


\subsection{\code{dbReadTable("DBIConnection")} and \code{dbWriteTable("DBIConnection")}}{
Can write the \code{\link[datasets]{iris}} data as a table to the
database, but won't overwrite by default.
Can read the \code{\link[datasets]{iris}} data from a database table.
Can write the \code{\link[datasets]{iris}} data as a table to the
database, will overwrite if asked.
Can write the \code{\link[datasets]{iris}} data as a table to the
database, will append if asked.
Cannot append to nonexisting table.
Can write the \code{\link[datasets]{iris}} data as a temporary table to
the database, the table is not available in a second connection and is
gone after reconnecting.
A new table is visible in a second connection.
}


\subsection{Roundtrip tests}{
Can create tables with keywords as table and column names.
Can create tables with quotes, commas, and spaces in column names and
data.
Can create tables with integer columns.
Can create tables with numeric columns.
Can create tables with numeric columns that contain special values such
as \code{Inf} and \code{NaN}.
Can create tables with logical columns.
Can create tables with logical columns, returned as integer.
Can create tables with NULL values.
Can create tables with 64-bit columns.
Can create tables with character columns.
Can create tables with factor columns.
Can create tables with raw columns.
Can create tables with date columns.
Can create tables with timestamp columns.
Can create tables with row names.
}


\subsection{\code{dbListTables("DBIConnection")}}{
Can list the tables in the database, adding and removing tables affects
the list. Can also check existence of a table.
}


\subsection{\code{dbListFields("DBIConnection")}}{
Can list the fields for a table in the database.
}
}

\section{Meta}{

\subsection{\code{dbIsValid("DBIConnection")}}{
Only an open connection is valid.
}


\subsection{\code{dbIsValid("DBIResult")}}{
Only an open result set is valid.
}


\subsection{\code{dbGetStatement("DBIResult")}}{
SQL query can be retrieved from the result.
}


\subsection{\code{dbColumnInfo("DBIResult")}}{
Column information is correct.
}


\subsection{\code{dbGetRowCount("DBIResult")}}{
Row count information is correct.
}


\subsection{\code{dbGetRowsAffected("DBIResult")}}{
Information on affected rows is correct.
}


\subsection{\code{dbGetInfo("DBIResult")} (deprecated)}{
Return value of dbGetInfo has necessary elements
}


\subsection{\code{dbBind("DBIResult")}}{
Empty positional binding (question mark syntax) with check of
return value.
Positional binding of integer values (question mark syntax) raises an
error if connection is closed.
Positional binding of integer values (question mark syntax) with check of
return value.
Positional binding of integer values (question mark syntax) with too many
values.
Positional binding of integer values (question mark syntax) with too few
values.
Positional binding of integer values (question mark syntax), repeated.
Positional binding of integer values (question mark syntax).
Positional binding of numeric values (question mark syntax).
Positional binding of logical values (question mark syntax).
Positional binding of logical values (coerced to integer, question mark
syntax).
Positional binding of \code{NULL} values (question mark syntax).
Positional binding of character values (question mark syntax).
Positional binding of date values (question mark syntax).
Positional binding of timestamp values (question mark syntax).
Positional binding of \code{\link{POSIXlt}} timestamp values (question
mark syntax).
Positional binding of raw values (question mark syntax).
}


\subsection{\code{dbBind("DBIResult")}}{
Empty positional binding (dollar syntax) with check of
return value.
Positional binding of integer values (dollar syntax) raises an
error if connection is closed.
Positional binding of integer values (dollar syntax) with check of
return value.
Positional binding of integer values (dollar syntax) with too many
values.
Positional binding of integer values (dollar syntax) with too few
values.
Positional binding of integer values (dollar syntax), repeated.
Positional binding of integer values (dollar syntax).
Positional binding of numeric values (dollar syntax).
Positional binding of logical values (dollar syntax).
Positional binding of logical values (coerced to integer, dollar
syntax).
Positional binding of \code{NULL} values (dollar syntax).
Positional binding of character values (dollar syntax).
Positional binding of date values (dollar syntax).
Positional binding of timestamp values (dollar syntax).
Positional binding of \code{\link{POSIXlt}} timestamp values (dollar
syntax).
Positional binding of raw values (dollar syntax).
}


\subsection{\code{dbBind("DBIResult")}}{
Empty named binding (colon syntax) with check of
return value.
Named binding of integer values (colon syntax) raises an
error if connection is closed.
Named binding of integer values (colon syntax) with check of
return value.
Named binding of integer values (colon syntax) with too many
values.
Named binding of integer values (colon syntax) with too few
values.
Named binding of integer values (colon syntax) with wrong names.
Named binding of integer values (colon syntax), repeated.
Named binding of integer values (colon syntax).
Named binding of numeric values (colon syntax).
Named binding of logical values (colon syntax).
Named binding of logical values (coerced to integer, colon
syntax).
Named binding of \code{NULL} values (colon syntax).
Named binding of character values (colon syntax).
Named binding of date values (colon syntax).
Named binding of timestamp values (colon syntax).
Named binding of \code{\link{POSIXlt}} timestamp values (colon
syntax).
Named binding of raw values (colon syntax).
}


\subsection{\code{dbBind("DBIResult")}}{
Empty named binding (dollar syntax) with check of
return value.
Named binding of integer values (dollar syntax) raises an
error if connection is closed.
Named binding of integer values (dollar syntax) with check of
return value.
Named binding of integer values (dollar syntax) with too many
values.
Named binding of integer values (dollar syntax) with too few
values.
Named binding of integer values (dollar syntax) with wrong names.
Named binding of integer values (dollar syntax), repeated.
Named binding of integer values (dollar syntax).
Named binding of numeric values (dollar syntax).
Named binding of logical values (dollar syntax).
Named binding of logical values (coerced to integer, dollar
syntax).
Named binding of \code{NULL} values (dollar syntax).
Named binding of character values (dollar syntax).
Named binding of date values (dollar syntax).
Named binding of timestamp values (dollar syntax).
Named binding of \code{\link{POSIXlt}} timestamp values (dollar
syntax).
Named binding of raw values (dollar syntax).
}
}

\section{Full compliance}{

\subsection{All of DBI}{
The package defines three classes that implement the required methods.
}


\subsection{Read-only access}{
Writing to the database fails.  (You might need to set up a separate
test context just for this test.)
}
}
\keyword{datasets}

