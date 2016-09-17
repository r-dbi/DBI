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
}

\section{Transactions}{

\subsection{\code{dbBegin("DBIConnection")} and \code{dbCommit("DBIConnection")}}{
Transactions are available in DBI, but actual support may vary between backends.
A transaction is initiated by a call to \code{\link[DBI]{dbBegin}}
and committed by a call to \code{\link[DBI]{dbCommit}}.
Both generics expect an object of class \code{\linkS4class{DBIConnection}}
and return \code{TRUE} (invisibly) upon success.

The implementations are expected to raise an error in case of failure,
but this is difficult to test in an automated way.
In any way, both generics should throw an error with a closed connection.
In addition, a call to \code{\link[DBI]{dbCommit}} without
a call to \code{\link[DBI]{dbBegin}} should raise an error.
Nested transactions are not supported by DBI,
an attempt to call \code{\link[DBI]{dbBegin}} twice
should yield an error.

Data written in a transaction must persist after the transaction is committed.
For example, a table that is missing when the transaction is started
but is created
and populated during the transaction
must exist and contain the data added there
both during
and after the transaction.

The transaction isolation level is not specified by DBI.

}
}
\keyword{datasets}

