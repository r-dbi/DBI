%   R/spec-driver-class.R, R/spec-driver-constructor.R,
%   R/spec-driver-data-type.R, R/spec-driver.R, R/spec-connection.R,
%   R/spec-result.R, R/spec-sql.R, R/spec-meta-bind.R, R/spec-meta.R,
%   R/spec-transaction-begin-commit.R, R/spec-transaction.R,
%   R/spec-compliance.R, R/spec-stress.R
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
The backend can override the \code{\link[DBI:dbDataType]{DBI::dbDataType()}} generic
for its driver class.
This generic expects an arbitrary object as second argument
and returns a corresponding SQL type
as atomic
character value
with at least one character.
As-is objects (i.e., wrapped by \code{\link[base:I]{base::I()}}) must be
supported and return the same results as their unwrapped counterparts.

To query the values returned by the default implementation,
run \code{example(dbDataType, package = "DBI")}.
If the backend needs to override this generic,
it must accept all basic R data types as its second argument, namely
\code{\link[base:logical]{base::logical()}},
\code{\link[base:integer]{base::integer()}},
\code{\link[base:numeric]{base::numeric()}},
\code{\link[base:character]{base::character()}},
dates (see \code{\link[base:Dates]{base::Dates()}}),
date-time (see \code{\link[base:DateTimeClasses]{base::DateTimeClasses()}}),
and \code{\link[base:difftime]{base::difftime()}}.
It also must accept lists of \code{raw} vectors
and map them to the BLOB (binary large object) data type.
The behavior for other object types is not specified.
}
}

\section{Parametrized queries and statements}{

\pkg{DBI} supports parametrized (or prepared) queries and statements
via the \code{\link[DBI:dbBind]{DBI::dbBind()}} generic.
Parametrized queries are different from normal queries
in that they allow an arbitrary number of placeholders,
which are later substituted by actual values.
Parametrized queries (and statements) serve two purposes:
\itemize{
\item The same query can be executed more than once with different values.
The DBMS may cache intermediate information for the query,
such as the execution plan,
and execute it faster.
\item Separation of query syntax and parameters protects against SQL injection.
}

The placeholder format is currently not specified by \pkg{DBI};
in the future, a uniform placeholder syntax may be supported.
Consult the backend documentation for the supported formats.
For automated testing, backend authors specify the placeholder syntax with
the \code{placeholder_pattern} tweak.
Known examples are:
\itemize{
\item \code{?} (positional matching in order of appearance) in \pkg{RMySQL} and \pkg{RSQLite}
\item \code{$1} (positional matching by index) in \pkg{RPostgres} and \pkg{RSQLite}
\item \code{:name} and \code{$name} (named matching) in \pkg{RSQLite}
}

\pkg{DBI} clients execute parametrized statements as follows:
\enumerate{
\item Call \code{\link[DBI:dbSendQuery]{DBI::dbSendQuery()}} or \code{\link[DBI:dbSendStatement]{DBI::dbSendStatement()}} with a query or statement
that contains placeholders,
store the returned \code{\linkS4class{DBIResult}} object in a variable.
Mixing placeholders (in particular, named and unnamed ones) is not
recommended.
It is good practice to register a call to \code{\link[DBI:dbClearResult]{DBI::dbClearResult()}} via
\code{\link[=on.exit]{on.exit()}} right after calling \code{dbSendQuery()}, see the last
enumeration item.
\item Construct a list with parameters
that specify actual values for the placeholders.
The list must be named or unnamed,
depending on the kind of placeholders used.
Named values are matched to named parameters, unnamed values
are matched by position.
All elements in this list must have the same lengths and contain values
supported by the backend; a \code{\link[=data.frame]{data.frame()}} is internally stored as such
a list.
The parameter list is passed a call to \code{\link[=dbBind]{dbBind()}} on the \code{DBIResult}
object.
\item Retrieve the data or the number of affected rows from the  \code{DBIResult} object.
\itemize{
\item For queries issued by \code{dbSendQuery()},
call \code{\link[DBI:dbFetch]{DBI::dbFetch()}}.
\item For statements issued by \code{dbSendStatements()},
call \code{\link[DBI:dbGetRowsAffected]{DBI::dbGetRowsAffected()}}.
(Execution begins immediately after the \code{dbBind()} call,
the statement is processed entirely before the function returns.
Calls to \code{dbFetch()} are ignored.)
}
\item Repeat 2. and 3. as necessary.
\item Close the result set via \code{\link[DBI:dbClearResult]{DBI::dbClearResult()}}.
}
}

\section{Transactions}{

\subsection{\code{dbBegin("DBIConnection")} and \code{dbCommit("DBIConnection")}}{
Transactions are available in DBI, but actual support may vary between backends.
A transaction is initiated by a call to \code{\link[DBI:dbBegin]{DBI::dbBegin()}}
and committed by a call to \code{\link[DBI:dbCommit]{DBI::dbCommit()}}.
Both generics expect an object of class \code{\linkS4class{DBIConnection}}
and return \code{TRUE} (invisibly) upon success.

The implementations are expected to raise an error in case of failure,
but this is difficult to test in an automated way.
In any way, both generics should throw an error with a closed connection.
In addition, a call to \code{\link[DBI:dbCommit]{DBI::dbCommit()}} without
a call to \code{\link[DBI:dbBegin]{DBI::dbBegin()}} should raise an error.
Nested transactions are not supported by DBI,
an attempt to call \code{\link[DBI:dbBegin]{DBI::dbBegin()}} twice
should yield an error.

Data written in a transaction must persist after the transaction is committed.
For example, a table that is missing when the transaction is started
but is created
and populated during the transaction
must exist and contain the data added there
both during
and after the transaction.

The behavior is not specified if other arguments are passed to these
functions. In particular, \pkg{RSQLite} issues named transactions
if the \code{name} argument is set.

The transaction isolation level is not specified by DBI.

}
}
\keyword{datasets}

