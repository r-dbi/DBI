# DBI specification

Abstract

The DBI package defines the generic DataBase Interface for R. The
connection to individual DBMS is provided by other packages that import
DBI (so-called *DBI backends*). This document formalizes the behavior
expected by the methods declared in DBI and implemented by the
individual backends. To ensure maximum portability and exchangeability,
and to reduce the effort for implementing a new DBI backend, the DBItest
package defines a comprehensive set of test cases that test conformance
to the DBI specification. This document is derived from comments in the
test definitions of the DBItest package. Any extensions or updates to
the tests will be reflected in this document.

## DBI: R Database Interface

DBI defines an interface for communication between R and relational
database management systems. All classes in this package are virtual and
need to be extended by the various R/DBMS implementations (so-called
*DBI backends*).

### Definition

A DBI backend is an R package which imports the DBI and methods
packages. For better or worse, the names of many existing backends start
with ‘R’, e.g., RSQLite, RMySQL, RSQLServer; it is up to the backend
author to adopt this convention or not.

### DBI classes and methods

A backend defines three classes, which are subclasses of DBIDriver,
DBIConnection, and DBIResult. The backend provides implementation for
all methods of these base classes that are defined but not implemented
by DBI. All methods defined in DBI are reexported (so that the package
can be used without having to attach DBI), and have an ellipsis `...` in
their formals for extensibility.

### Construction of the DBIDriver object

The backend must support creation of an instance of its DBIDriver
subclass with a constructor function. By default, its name is the
package name without the leading ‘R’ (if it exists), e.g., `SQLite` for
the RSQLite package. However, backend authors may choose a different
name. The constructor must be exported, and it must be a function that
is callable without arguments. DBI recommends to define a constructor
with an empty argument list.

### Examples

``` r
RSQLite::SQLite()
```

## Determine the SQL data type of an object

This section describes the behavior of the following method:

``` r
dbDataType(dbObj, obj, ...)
```

### Description

Returns an SQL string that describes the SQL data type to be used for an
object. The default implementation of this generic determines the SQL
type of an R object according to the SQL 92 specification, which may
serve as a starting point for driver implementations. DBI also provides
an implementation for data.frame which will return a character vector
giving the type for each column in the dataframe.

### Arguments

|         |                                                     |
|---------|-----------------------------------------------------|
| `dbObj` | A object inheriting from DBIDriver or DBIConnection |
| `obj`   | An R object whose SQL type we want to determine.    |
| `...`   | Other arguments passed on to methods.               |

### Details

The data types supported by databases are different than the data types
in R, but the mapping between the primitive types is straightforward:

- Any of the many fixed and varying length character types are mapped to
  character vectors

- Fixed-precision (non-IEEE) numbers are mapped into either numeric or
  integer vectors.

Notice that many DBMS do not follow IEEE arithmetic, so there are
potential problems with under/overflows and loss of precision.

### Value

[`dbDataType()`](https://dbi.r-dbi.org/dev/reference/dbDataType.md)
returns the SQL type that corresponds to the `obj` argument as a
non-empty character string. For data frames, a character vector with one
element per column is returned.

### Failure modes

An error is raised for invalid values for the `obj` argument such as a
`NULL` value.

### Specification

The backend can override the
[`dbDataType()`](https://dbi.r-dbi.org/dev/reference/dbDataType.md)
generic for its driver class.

This generic expects an arbitrary object as second argument. To query
the values returned by the default implementation, run
`example(dbDataType, package = "DBI")`. If the backend needs to override
this generic, it must accept all basic R data types as its second
argument, namely logical, integer, numeric, character, dates (see
Dates), date-time (see DateTimeClasses), and difftime. If the database
supports blobs, this method also must accept lists of raw vectors, and
<blob::blob> objects. As-is objects (i.e., wrapped by
[`I()`](https://rdrr.io/r/base/AsIs.html)) must be supported and return
the same results as their unwrapped counterparts. The SQL data type for
factor and ordered is the same as for character. The behavior for other
object types is not specified.

All data types returned by
[`dbDataType()`](https://dbi.r-dbi.org/dev/reference/dbDataType.md) are
usable in an SQL statement of the form `"CREATE TABLE test (a ...)"`.

### Examples

``` r
dbDataType(ANSI(), 1:5)
dbDataType(ANSI(), 1)
dbDataType(ANSI(), TRUE)
dbDataType(ANSI(), Sys.Date())
dbDataType(ANSI(), Sys.time())
dbDataType(ANSI(), Sys.time() - as.POSIXct(Sys.Date()))
dbDataType(ANSI(), c("x", "abc"))
dbDataType(ANSI(), list(raw(10), raw(20)))
dbDataType(ANSI(), I(3))

dbDataType(ANSI(), iris)


con <- dbConnect(RSQLite::SQLite(), ":memory:")

dbDataType(con, 1:5)
dbDataType(con, 1)
dbDataType(con, TRUE)
dbDataType(con, Sys.Date())
dbDataType(con, Sys.time())
dbDataType(con, Sys.time() - as.POSIXct(Sys.Date()))
dbDataType(con, c("x", "abc"))
dbDataType(con, list(raw(10), raw(20)))
dbDataType(con, I(3))

dbDataType(con, iris)

dbDisconnect(con)
```

## Create a connection to a DBMS

This section describes the behavior of the following method:

``` r
dbConnect(drv, ...)
```

### Description

Connect to a DBMS going through the appropriate authentication
procedure. Some implementations may allow you to have multiple
connections open, so you may invoke this function repeatedly assigning
its output to different objects. The authentication mechanism is left
unspecified, so check the documentation of individual drivers for
details. Use
[`dbCanConnect()`](https://dbi.r-dbi.org/dev/reference/dbCanConnect.md)
to check if a connection can be established.

### Arguments

|       |                                                                                                                                                                               |
|-------|-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
| `drv` | An object that inherits from DBIDriver, or an existing DBIConnection object (in order to clone an existing connection).                                                       |
| `...` | Authentication arguments needed by the DBMS instance; these typically include `user`, `password`, `host`, `port`, `dbname`, etc. For details see the appropriate `DBIDriver`. |

### Value

[`dbConnect()`](https://dbi.r-dbi.org/dev/reference/dbConnect.md)
returns an S4 object that inherits from DBIConnection. This object is
used to communicate with the database engine.

A [`format()`](https://rdrr.io/r/base/format.html) method is defined for
the connection object. It returns a string that consists of a single
line of text.

### Specification

DBI recommends using the following argument names for authentication
parameters, with `NULL` default:

- `user` for the user name (default: current user)

- `password` for the password

- `host` for the host name (default: local connection)

- `port` for the port number (default: local connection)

- `dbname` for the name of the database on the host, or the database
  file name

The defaults should provide reasonable behavior, in particular a local
connection for `host = NULL`. For some DBMS (e.g., PostgreSQL), this is
different to a TCP/IP connection to `localhost`.

In addition, DBI supports the `bigint` argument that governs how 64-bit
integer data is returned. The following values are supported:

- `"integer"`: always return as `integer`, silently overflow

- `"numeric"`: always return as `numeric`, silently round

- `"character"`: always return the decimal representation as `character`

- `"integer64"`: return as a data type that can be coerced using
  [`as.integer()`](https://rdrr.io/r/base/integer.html) (with warning on
  overflow), [`as.numeric()`](https://rdrr.io/r/base/numeric.html) and
  [`as.character()`](https://rdrr.io/r/base/character.html)

### Examples

``` r
# SQLite only needs a path to the database. (Here, ":memory:" is a special
# path that creates an in-memory database.) Other database drivers
# will require more details (like user, password, host, port, etc.)
con <- dbConnect(RSQLite::SQLite(), ":memory:")
con

dbListTables(con)

dbDisconnect(con)

# Bad, for subtle reasons:
# This code fails when RSQLite isn't loaded yet,
# because dbConnect() doesn't know yet about RSQLite.
dbListTables(con <- dbConnect(RSQLite::SQLite(), ":memory:"))
```

## Disconnect (close) a connection

This section describes the behavior of the following method:

``` r
dbDisconnect(conn, ...)
```

### Description

This closes the connection, discards all pending work, and frees
resources (e.g., memory, sockets).

### Arguments

|        |                                                                                                           |
|--------|-----------------------------------------------------------------------------------------------------------|
| `conn` | A DBIConnection object, as returned by [`dbConnect()`](https://dbi.r-dbi.org/dev/reference/dbConnect.md). |
| `...`  | Other parameters passed on to methods.                                                                    |

### Value

[`dbDisconnect()`](https://dbi.r-dbi.org/dev/reference/dbDisconnect.md)
returns `TRUE`, invisibly.

### Failure modes

A warning is issued on garbage collection when a connection has been
released without calling
[`dbDisconnect()`](https://dbi.r-dbi.org/dev/reference/dbDisconnect.md),
but this cannot be tested automatically. At least one warning is issued
immediately when calling
[`dbDisconnect()`](https://dbi.r-dbi.org/dev/reference/dbDisconnect.md)
on an already disconnected or invalid connection.

### Examples

``` r
con <- dbConnect(RSQLite::SQLite(), ":memory:")
dbDisconnect(con)
```

## Execute a query on a given database connection

This section describes the behavior of the following method:

``` r
dbSendQuery(conn, statement, ...)
```

### Description

The
[`dbSendQuery()`](https://dbi.r-dbi.org/dev/reference/dbSendQuery.md)
method only submits and synchronously executes the SQL query to the
database engine. It does *not* extract any records — for that you need
to use the [`dbFetch()`](https://dbi.r-dbi.org/dev/reference/dbFetch.md)
method, and then you must call
[`dbClearResult()`](https://dbi.r-dbi.org/dev/reference/dbClearResult.md)
when you finish fetching the records you need. For interactive use, you
should almost always prefer
[`dbGetQuery()`](https://dbi.r-dbi.org/dev/reference/dbGetQuery.md). Use
[`dbSendQueryArrow()`](https://dbi.r-dbi.org/dev/reference/dbSendQueryArrow.md)
or
[`dbGetQueryArrow()`](https://dbi.r-dbi.org/dev/reference/dbGetQueryArrow.md)
instead to retrieve the results as an Arrow object.

### Arguments

|             |                                                                                                           |
|-------------|-----------------------------------------------------------------------------------------------------------|
| `conn`      | A DBIConnection object, as returned by [`dbConnect()`](https://dbi.r-dbi.org/dev/reference/dbConnect.md). |
| `statement` | a character string containing SQL.                                                                        |
| `...`       | Other parameters passed on to methods.                                                                    |

### Additional arguments

The following arguments are not part of the
[`dbSendQuery()`](https://dbi.r-dbi.org/dev/reference/dbSendQuery.md)
generic (to improve compatibility across backends) but are part of the
DBI specification:

- `params` (default: `NULL`)

- `immediate` (default: `NULL`)

They must be provided as named arguments. See the “Specification”
sections for details on their usage.

### Specification

No warnings occur under normal conditions. When done, the DBIResult
object must be cleared with a call to
[`dbClearResult()`](https://dbi.r-dbi.org/dev/reference/dbClearResult.md).
Failure to clear the result set leads to a warning when the connection
is closed.

If the backend supports only one open result set per connection, issuing
a second query invalidates an already open result set and raises a
warning. The newly opened result set is valid and must be cleared with
[`dbClearResult()`](https://dbi.r-dbi.org/dev/reference/dbClearResult.md).

The `param` argument allows passing query parameters, see
[`dbBind()`](https://dbi.r-dbi.org/dev/reference/dbBind.md) for details.

### Specification for the `immediate` argument

The `immediate` argument supports distinguishing between “direct” and
“prepared” APIs offered by many database drivers. Passing
`immediate = TRUE` leads to immediate execution of the query or
statement, via the “direct” API (if supported by the driver). The
default `NULL` means that the backend should choose whatever API makes
the most sense for the database, and (if relevant) tries the other API
if the first attempt fails. A successful second attempt should result in
a message that suggests passing the correct `immediate` argument.
Examples for possible behaviors:

1.  DBI backend defaults to `immediate = TRUE` internally

    1.  A query without parameters is passed: query is executed

    2.  A query with parameters is passed:

        1.  `params` not given: rejected immediately by the database
            because of a syntax error in the query, the backend tries
            `immediate = FALSE` (and gives a message)

        2.  `params` given: query is executed using `immediate = FALSE`

2.  DBI backend defaults to `immediate = FALSE` internally

    1.  A query without parameters is passed:

        1.  simple query: query is executed

        2.  “special” query (such as setting a config options): fails,
            the backend tries `immediate = TRUE` (and gives a message)

    2.  A query with parameters is passed:

        1.  `params` not given: waiting for parameters via
            [`dbBind()`](https://dbi.r-dbi.org/dev/reference/dbBind.md)

        2.  `params` given: query is executed

### Details

This method is for `SELECT` queries only. Some backends may support data
manipulation queries through this method for compatibility reasons.
However, callers are strongly encouraged to use
[`dbSendStatement()`](https://dbi.r-dbi.org/dev/reference/dbSendStatement.md)
for data manipulation statements.

The query is submitted to the database server and the DBMS executes it,
possibly generating vast amounts of data. Where these data live is
driver-specific: some drivers may choose to leave the output on the
server and transfer them piecemeal to R, others may transfer all the
data to the client – but not necessarily to the memory that R manages.
See individual drivers’
[`dbSendQuery()`](https://dbi.r-dbi.org/dev/reference/dbSendQuery.md)
documentation for details.

### Value

[`dbSendQuery()`](https://dbi.r-dbi.org/dev/reference/dbSendQuery.md)
returns an S4 object that inherits from DBIResult. The result set can be
used with [`dbFetch()`](https://dbi.r-dbi.org/dev/reference/dbFetch.md)
to extract records. Once you have finished using a result, make sure to
clear it with
[`dbClearResult()`](https://dbi.r-dbi.org/dev/reference/dbClearResult.md).

### The data retrieval flow

This section gives a complete overview over the flow for the execution
of queries that return tabular data as data frames.

Most of this flow, except repeated calling of
[`dbBind()`](https://dbi.r-dbi.org/dev/reference/dbBind.md) or
[`dbBindArrow()`](https://dbi.r-dbi.org/dev/reference/dbBind.md), is
implemented by
[`dbGetQuery()`](https://dbi.r-dbi.org/dev/reference/dbGetQuery.md),
which should be sufficient unless you want to access the results in a
paged way or you have a parameterized query that you want to reuse. This
flow requires an active connection established by
[`dbConnect()`](https://dbi.r-dbi.org/dev/reference/dbConnect.md). See
also `vignette("dbi-advanced")` for a walkthrough.

1.  Use
    [`dbSendQuery()`](https://dbi.r-dbi.org/dev/reference/dbSendQuery.md)
    to create a result set object of class DBIResult.

2.  Optionally, bind query parameters with
    [`dbBind()`](https://dbi.r-dbi.org/dev/reference/dbBind.md) or
    [`dbBindArrow()`](https://dbi.r-dbi.org/dev/reference/dbBind.md).
    This is required only if the query contains placeholders such as `⁠?⁠`
    or `⁠\$1⁠`, depending on the database backend.

3.  Optionally, use
    [`dbColumnInfo()`](https://dbi.r-dbi.org/dev/reference/dbColumnInfo.md)
    to retrieve the structure of the result set without retrieving
    actual data.

4.  Use [`dbFetch()`](https://dbi.r-dbi.org/dev/reference/dbFetch.md) to
    get the entire result set, a page of results, or the remaining rows.
    Fetching zero rows is also possible to retrieve the structure of the
    result set as a data frame. This step can be called multiple times.
    Only forward paging is supported, you need to cache previous pages
    if you need to navigate backwards.

5.  Use
    [`dbHasCompleted()`](https://dbi.r-dbi.org/dev/reference/dbHasCompleted.md)
    to tell when you’re done. This method returns `TRUE` if no more rows
    are available for fetching.

6.  Repeat the last four steps as necessary.

7.  Use
    [`dbClearResult()`](https://dbi.r-dbi.org/dev/reference/dbClearResult.md)
    to clean up the result set object. This step is mandatory even if no
    rows have been fetched or if an error has occurred during the
    processing. It is good practice to use
    [`on.exit()`](https://rdrr.io/r/base/on.exit.html) or
    [`withr::defer()`](https://withr.r-lib.org/reference/defer.html) to
    ensure that this step is always executed.

### Failure modes

An error is raised when issuing a query over a closed or invalid
connection, or if the query is not a non-`NA` string. An error is also
raised if the syntax of the query is invalid and all query parameters
are given (by passing the `params` argument) or the `immediate` argument
is set to `TRUE`.

### Examples

``` r
con <- dbConnect(RSQLite::SQLite(), ":memory:")

dbWriteTable(con, "mtcars", mtcars)
rs <- dbSendQuery(con, "SELECT * FROM mtcars WHERE cyl = 4")
dbFetch(rs)
dbClearResult(rs)

# Pass one set of values with the param argument:
rs <- dbSendQuery(
  con,
  "SELECT * FROM mtcars WHERE cyl = ?",
  params = list(4L)
)
dbFetch(rs)
dbClearResult(rs)

# Pass multiple sets of values with dbBind():
rs <- dbSendQuery(con, "SELECT * FROM mtcars WHERE cyl = ?")
dbBind(rs, list(6L))
dbFetch(rs)
dbBind(rs, list(8L))
dbFetch(rs)
dbClearResult(rs)

dbDisconnect(con)
```

## Fetch records from a previously executed query

This section describes the behavior of the following methods:

``` r
dbFetch(res, n = -1, ...)

fetch(res, n = -1, ...)
```

### Description

Fetch the next `n` elements (rows) from the result set and return them
as a data.frame.

### Arguments

|       |                                                                                                                                                                      |
|-------|----------------------------------------------------------------------------------------------------------------------------------------------------------------------|
| `res` | An object inheriting from DBIResult, created by [`dbSendQuery()`](https://dbi.r-dbi.org/dev/reference/dbSendQuery.md).                                               |
| `n`   | maximum number of records to retrieve per fetch. Use `n = -1` or `n = Inf` to retrieve all pending records. Some implementations may recognize other special values. |
| `...` | Other arguments passed on to methods.                                                                                                                                |

### Details

[`fetch()`](https://dbi.r-dbi.org/dev/reference/dbFetch.md) is provided
for compatibility with older DBI clients - for all new code you are
strongly encouraged to use
[`dbFetch()`](https://dbi.r-dbi.org/dev/reference/dbFetch.md). The
default implementation for
[`dbFetch()`](https://dbi.r-dbi.org/dev/reference/dbFetch.md) calls
[`fetch()`](https://dbi.r-dbi.org/dev/reference/dbFetch.md) so that it
is compatible with existing code. Modern backends should implement for
[`dbFetch()`](https://dbi.r-dbi.org/dev/reference/dbFetch.md) only.

### Value

[`dbFetch()`](https://dbi.r-dbi.org/dev/reference/dbFetch.md) always
returns a data.frame with as many rows as records were fetched and as
many columns as fields in the result set, even if the result is a single
value or has one or zero rows. Passing `n = NA` is supported and returns
an arbitrary number of rows (at least one) as specified by the driver,
but at most the remaining rows in the result set.

### The data retrieval flow

This section gives a complete overview over the flow for the execution
of queries that return tabular data as data frames.

Most of this flow, except repeated calling of
[`dbBind()`](https://dbi.r-dbi.org/dev/reference/dbBind.md) or
[`dbBindArrow()`](https://dbi.r-dbi.org/dev/reference/dbBind.md), is
implemented by
[`dbGetQuery()`](https://dbi.r-dbi.org/dev/reference/dbGetQuery.md),
which should be sufficient unless you want to access the results in a
paged way or you have a parameterized query that you want to reuse. This
flow requires an active connection established by
[`dbConnect()`](https://dbi.r-dbi.org/dev/reference/dbConnect.md). See
also `vignette("dbi-advanced")` for a walkthrough.

1.  Use
    [`dbSendQuery()`](https://dbi.r-dbi.org/dev/reference/dbSendQuery.md)
    to create a result set object of class DBIResult.

2.  Optionally, bind query parameters with
    [`dbBind()`](https://dbi.r-dbi.org/dev/reference/dbBind.md) or
    [`dbBindArrow()`](https://dbi.r-dbi.org/dev/reference/dbBind.md).
    This is required only if the query contains placeholders such as `⁠?⁠`
    or `⁠\$1⁠`, depending on the database backend.

3.  Optionally, use
    [`dbColumnInfo()`](https://dbi.r-dbi.org/dev/reference/dbColumnInfo.md)
    to retrieve the structure of the result set without retrieving
    actual data.

4.  Use [`dbFetch()`](https://dbi.r-dbi.org/dev/reference/dbFetch.md) to
    get the entire result set, a page of results, or the remaining rows.
    Fetching zero rows is also possible to retrieve the structure of the
    result set as a data frame. This step can be called multiple times.
    Only forward paging is supported, you need to cache previous pages
    if you need to navigate backwards.

5.  Use
    [`dbHasCompleted()`](https://dbi.r-dbi.org/dev/reference/dbHasCompleted.md)
    to tell when you’re done. This method returns `TRUE` if no more rows
    are available for fetching.

6.  Repeat the last four steps as necessary.

7.  Use
    [`dbClearResult()`](https://dbi.r-dbi.org/dev/reference/dbClearResult.md)
    to clean up the result set object. This step is mandatory even if no
    rows have been fetched or if an error has occurred during the
    processing. It is good practice to use
    [`on.exit()`](https://rdrr.io/r/base/on.exit.html) or
    [`withr::defer()`](https://withr.r-lib.org/reference/defer.html) to
    ensure that this step is always executed.

### Failure modes

An attempt to fetch from a closed result set raises an error. If the `n`
argument is not an atomic whole number greater or equal to -1 or Inf, an
error is raised, but a subsequent call to
[`dbFetch()`](https://dbi.r-dbi.org/dev/reference/dbFetch.md) with
proper `n` argument succeeds.

Calling [`dbFetch()`](https://dbi.r-dbi.org/dev/reference/dbFetch.md) on
a result set from a data manipulation query created by
[`dbSendStatement()`](https://dbi.r-dbi.org/dev/reference/dbSendStatement.md)
can be fetched and return an empty data frame, with a warning.

### Specification

Fetching multi-row queries with one or more columns by default returns
the entire result. Multi-row queries can also be fetched progressively
by passing a whole number (integer or numeric) as the `n` argument. A
value of Inf for the `n` argument is supported and also returns the full
result. If more rows than available are fetched, the result is returned
in full without warning. If fewer rows than requested are returned,
further fetches will return a data frame with zero rows. If zero rows
are fetched, the columns of the data frame are still fully typed.
Fetching fewer rows than available is permitted, no warning is issued
when clearing the result set.

A column named `row_names` is treated like any other column.

The column types of the returned data frame depend on the data returned:

- integer (or coercible to an integer) for integer values between -2^31
  and 2^31 - 1, with NA for SQL `NULL` values

- numeric for numbers with a fractional component, with NA for SQL
  `NULL` values

- logical for Boolean values (some backends may return an integer); with
  NA for SQL `NULL` values

- character for text, with NA for SQL `NULL` values

- lists of raw for blobs with NULL entries for SQL NULL values

- coercible using [`as.Date()`](https://rdrr.io/r/base/as.Date.html) for
  dates, with NA for SQL `NULL` values (also applies to the return value
  of the SQL function `current_date`)

- coercible using
  [`hms::as_hms()`](https://hms.tidyverse.org/reference/hms.html) for
  times, with NA for SQL `NULL` values (also applies to the return value
  of the SQL function `current_time`)

- coercible using
  [`as.POSIXct()`](https://rdrr.io/r/base/as.POSIXlt.html) for
  timestamps, with NA for SQL `NULL` values (also applies to the return
  value of the SQL function `current_timestamp`)

If dates and timestamps are supported by the backend, the following R
types are used:

- Date for dates (also applies to the return value of the SQL function
  `current_date`)

- POSIXct for timestamps (also applies to the return value of the SQL
  function `current_timestamp`)

R has no built-in type with lossless support for the full range of
64-bit or larger integers. If 64-bit integers are returned from a query,
the following rules apply:

- Values are returned in a container with support for the full range of
  valid 64-bit values (such as the `integer64` class of the bit64
  package)

- Coercion to numeric always returns a number that is as close as
  possible to the true value

- Loss of precision when converting to numeric gives a warning

- Conversion to character always returns a lossless decimal
  representation of the data

### Examples

``` r
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
```

## Clear a result set

This section describes the behavior of the following method:

``` r
dbClearResult(res, ...)
```

### Description

Frees all resources (local and remote) associated with a result set.
This step is mandatory for all objects obtained by calling
[`dbSendQuery()`](https://dbi.r-dbi.org/dev/reference/dbSendQuery.md) or
[`dbSendStatement()`](https://dbi.r-dbi.org/dev/reference/dbSendStatement.md).

### Arguments

|       |                                       |
|-------|---------------------------------------|
| `res` | An object inheriting from DBIResult.  |
| `...` | Other arguments passed on to methods. |

### Value

[`dbClearResult()`](https://dbi.r-dbi.org/dev/reference/dbClearResult.md)
returns `TRUE`, invisibly, for result sets obtained from
[`dbSendQuery()`](https://dbi.r-dbi.org/dev/reference/dbSendQuery.md),
[`dbSendStatement()`](https://dbi.r-dbi.org/dev/reference/dbSendStatement.md),
or
[`dbSendQueryArrow()`](https://dbi.r-dbi.org/dev/reference/dbSendQueryArrow.md),

### The data retrieval flow

This section gives a complete overview over the flow for the execution
of queries that return tabular data as data frames.

Most of this flow, except repeated calling of
[`dbBind()`](https://dbi.r-dbi.org/dev/reference/dbBind.md) or
[`dbBindArrow()`](https://dbi.r-dbi.org/dev/reference/dbBind.md), is
implemented by
[`dbGetQuery()`](https://dbi.r-dbi.org/dev/reference/dbGetQuery.md),
which should be sufficient unless you want to access the results in a
paged way or you have a parameterized query that you want to reuse. This
flow requires an active connection established by
[`dbConnect()`](https://dbi.r-dbi.org/dev/reference/dbConnect.md). See
also `vignette("dbi-advanced")` for a walkthrough.

1.  Use
    [`dbSendQuery()`](https://dbi.r-dbi.org/dev/reference/dbSendQuery.md)
    to create a result set object of class DBIResult.

2.  Optionally, bind query parameters with
    [`dbBind()`](https://dbi.r-dbi.org/dev/reference/dbBind.md) or
    [`dbBindArrow()`](https://dbi.r-dbi.org/dev/reference/dbBind.md).
    This is required only if the query contains placeholders such as `⁠?⁠`
    or `⁠\$1⁠`, depending on the database backend.

3.  Optionally, use
    [`dbColumnInfo()`](https://dbi.r-dbi.org/dev/reference/dbColumnInfo.md)
    to retrieve the structure of the result set without retrieving
    actual data.

4.  Use [`dbFetch()`](https://dbi.r-dbi.org/dev/reference/dbFetch.md) to
    get the entire result set, a page of results, or the remaining rows.
    Fetching zero rows is also possible to retrieve the structure of the
    result set as a data frame. This step can be called multiple times.
    Only forward paging is supported, you need to cache previous pages
    if you need to navigate backwards.

5.  Use
    [`dbHasCompleted()`](https://dbi.r-dbi.org/dev/reference/dbHasCompleted.md)
    to tell when you’re done. This method returns `TRUE` if no more rows
    are available for fetching.

6.  Repeat the last four steps as necessary.

7.  Use
    [`dbClearResult()`](https://dbi.r-dbi.org/dev/reference/dbClearResult.md)
    to clean up the result set object. This step is mandatory even if no
    rows have been fetched or if an error has occurred during the
    processing. It is good practice to use
    [`on.exit()`](https://rdrr.io/r/base/on.exit.html) or
    [`withr::defer()`](https://withr.r-lib.org/reference/defer.html) to
    ensure that this step is always executed.

### The command execution flow

This section gives a complete overview over the flow for the execution
of SQL statements that have side effects such as stored procedures,
inserting or deleting data, or setting database or connection options.
Most of this flow, except repeated calling of
[`dbBindArrow()`](https://dbi.r-dbi.org/dev/reference/dbBind.md), is
implemented by
[`dbExecute()`](https://dbi.r-dbi.org/dev/reference/dbExecute.md), which
should be sufficient for non-parameterized queries. This flow requires
an active connection established by
[`dbConnect()`](https://dbi.r-dbi.org/dev/reference/dbConnect.md). See
also `vignette("dbi-advanced")` for a walkthrough.

1.  Use
    [`dbSendStatement()`](https://dbi.r-dbi.org/dev/reference/dbSendStatement.md)
    to create a result set object of class DBIResult. For some queries
    you need to pass `immediate = TRUE`.

2.  Optionally, bind query parameters
    with[`dbBind()`](https://dbi.r-dbi.org/dev/reference/dbBind.md) or
    [`dbBindArrow()`](https://dbi.r-dbi.org/dev/reference/dbBind.md).
    This is required only if the query contains placeholders such as `⁠?⁠`
    or `⁠\$1⁠`, depending on the database backend.

3.  Optionally, use
    [`dbGetRowsAffected()`](https://dbi.r-dbi.org/dev/reference/dbGetRowsAffected.md)
    to retrieve the number of rows affected by the query.

4.  Repeat the last two steps as necessary.

5.  Use
    [`dbClearResult()`](https://dbi.r-dbi.org/dev/reference/dbClearResult.md)
    to clean up the result set object. This step is mandatory even if no
    rows have been fetched or if an error has occurred during the
    processing. It is good practice to use
    [`on.exit()`](https://rdrr.io/r/base/on.exit.html) or
    [`withr::defer()`](https://withr.r-lib.org/reference/defer.html) to
    ensure that this step is always executed.

### Failure modes

An attempt to close an already closed result set issues a warning for
[`dbSendQuery()`](https://dbi.r-dbi.org/dev/reference/dbSendQuery.md),
[`dbSendStatement()`](https://dbi.r-dbi.org/dev/reference/dbSendStatement.md),
and
[`dbSendQueryArrow()`](https://dbi.r-dbi.org/dev/reference/dbSendQueryArrow.md),

### Specification

[`dbClearResult()`](https://dbi.r-dbi.org/dev/reference/dbClearResult.md)
frees all resources associated with retrieving the result of a query or
update operation. The DBI backend can expect a call to
[`dbClearResult()`](https://dbi.r-dbi.org/dev/reference/dbClearResult.md)
for each
[`dbSendQuery()`](https://dbi.r-dbi.org/dev/reference/dbSendQuery.md) or
[`dbSendStatement()`](https://dbi.r-dbi.org/dev/reference/dbSendStatement.md)
call.

### Examples

``` r
con <- dbConnect(RSQLite::SQLite(), ":memory:")

rs <- dbSendQuery(con, "SELECT 1")
print(dbFetch(rs))

dbClearResult(rs)
dbDisconnect(con)
```

## Bind values to a parameterized/prepared statement

This section describes the behavior of the following methods:

``` r
dbBind(res, params, ...)

dbBindArrow(res, params, ...)
```

### Description

For parametrized or prepared statements, the
[`dbSendQuery()`](https://dbi.r-dbi.org/dev/reference/dbSendQuery.md),
[`dbSendQueryArrow()`](https://dbi.r-dbi.org/dev/reference/dbSendQueryArrow.md),
and
[`dbSendStatement()`](https://dbi.r-dbi.org/dev/reference/dbSendStatement.md)
functions can be called with statements that contain placeholders for
values. The [`dbBind()`](https://dbi.r-dbi.org/dev/reference/dbBind.md)
and [`dbBindArrow()`](https://dbi.r-dbi.org/dev/reference/dbBind.md)
functions bind these placeholders to actual values, and are intended to
be called on the result set before calling
[`dbFetch()`](https://dbi.r-dbi.org/dev/reference/dbFetch.md) or
[`dbFetchArrow()`](https://dbi.r-dbi.org/dev/reference/dbFetchArrow.md).
The values are passed to
[`dbBind()`](https://dbi.r-dbi.org/dev/reference/dbBind.md) as lists or
data frames, and to
[`dbBindArrow()`](https://dbi.r-dbi.org/dev/reference/dbBind.md) as a
stream created by
[`nanoarrow::as_nanoarrow_array_stream()`](https://arrow.apache.org/nanoarrow/latest/r/reference/as_nanoarrow_array_stream.html).

[![Experimental](https://dbi.r-dbi.org/reference/figures/lifecycle-experimental.svg)](https://lifecycle.r-lib.org/articles/stages.html#experimental)

[`dbBindArrow()`](https://dbi.r-dbi.org/dev/reference/dbBind.md) is
experimental, as are the other `⁠*Arrow⁠` functions.
[`dbSendQuery()`](https://dbi.r-dbi.org/dev/reference/dbSendQuery.md) is
compatible with
[`dbBindArrow()`](https://dbi.r-dbi.org/dev/reference/dbBind.md), and
[`dbSendQueryArrow()`](https://dbi.r-dbi.org/dev/reference/dbSendQueryArrow.md)
is compatible with
[`dbBind()`](https://dbi.r-dbi.org/dev/reference/dbBind.md).

### Arguments

|          |                                                                                                                                                                                                                                                                                                             |
|----------|-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
| `res`    | An object inheriting from DBIResult.                                                                                                                                                                                                                                                                        |
| `params` | For [`dbBind()`](https://dbi.r-dbi.org/dev/reference/dbBind.md), a list of values, named or unnamed, or a data frame, with one element/column per query parameter. For [`dbBindArrow()`](https://dbi.r-dbi.org/dev/reference/dbBind.md), values as a nanoarrow stream, with one column per query parameter. |
| `...`    | Other arguments passed on to methods.                                                                                                                                                                                                                                                                       |

### Details

DBI supports parametrized (or prepared) queries and statements via the
[`dbBind()`](https://dbi.r-dbi.org/dev/reference/dbBind.md) and
[`dbBindArrow()`](https://dbi.r-dbi.org/dev/reference/dbBind.md)
generics. Parametrized queries are different from normal queries in that
they allow an arbitrary number of placeholders, which are later
substituted by actual values. Parametrized queries (and statements)
serve two purposes:

- The same query can be executed more than once with different values.
  The DBMS may cache intermediate information for the query, such as the
  execution plan, and execute it faster.

- Separation of query syntax and parameters protects against SQL
  injection.

The placeholder format is currently not specified by DBI; in the future,
a uniform placeholder syntax may be supported. Consult the backend
documentation for the supported formats. For automated testing, backend
authors specify the placeholder syntax with the `placeholder_pattern`
tweak. Known examples are:

- `⁠?⁠` (positional matching in order of appearance) in RMariaDB and
  RSQLite

- `⁠\$1⁠` (positional matching by index) in RPostgres and RSQLite

- `⁠:name⁠` and `⁠\$name⁠` (named matching) in RSQLite

### Value

[`dbBind()`](https://dbi.r-dbi.org/dev/reference/dbBind.md) returns the
result set, invisibly, for queries issued by
[`dbSendQuery()`](https://dbi.r-dbi.org/dev/reference/dbSendQuery.md) or
[`dbSendQueryArrow()`](https://dbi.r-dbi.org/dev/reference/dbSendQueryArrow.md)
and also for data manipulation statements issued by
[`dbSendStatement()`](https://dbi.r-dbi.org/dev/reference/dbSendStatement.md).

### The data retrieval flow

This section gives a complete overview over the flow for the execution
of queries that return tabular data as data frames.

Most of this flow, except repeated calling of
[`dbBind()`](https://dbi.r-dbi.org/dev/reference/dbBind.md) or
[`dbBindArrow()`](https://dbi.r-dbi.org/dev/reference/dbBind.md), is
implemented by
[`dbGetQuery()`](https://dbi.r-dbi.org/dev/reference/dbGetQuery.md),
which should be sufficient unless you want to access the results in a
paged way or you have a parameterized query that you want to reuse. This
flow requires an active connection established by
[`dbConnect()`](https://dbi.r-dbi.org/dev/reference/dbConnect.md). See
also `vignette("dbi-advanced")` for a walkthrough.

1.  Use
    [`dbSendQuery()`](https://dbi.r-dbi.org/dev/reference/dbSendQuery.md)
    to create a result set object of class DBIResult.

2.  Optionally, bind query parameters with
    [`dbBind()`](https://dbi.r-dbi.org/dev/reference/dbBind.md) or
    [`dbBindArrow()`](https://dbi.r-dbi.org/dev/reference/dbBind.md).
    This is required only if the query contains placeholders such as `⁠?⁠`
    or `⁠\$1⁠`, depending on the database backend.

3.  Optionally, use
    [`dbColumnInfo()`](https://dbi.r-dbi.org/dev/reference/dbColumnInfo.md)
    to retrieve the structure of the result set without retrieving
    actual data.

4.  Use [`dbFetch()`](https://dbi.r-dbi.org/dev/reference/dbFetch.md) to
    get the entire result set, a page of results, or the remaining rows.
    Fetching zero rows is also possible to retrieve the structure of the
    result set as a data frame. This step can be called multiple times.
    Only forward paging is supported, you need to cache previous pages
    if you need to navigate backwards.

5.  Use
    [`dbHasCompleted()`](https://dbi.r-dbi.org/dev/reference/dbHasCompleted.md)
    to tell when you’re done. This method returns `TRUE` if no more rows
    are available for fetching.

6.  Repeat the last four steps as necessary.

7.  Use
    [`dbClearResult()`](https://dbi.r-dbi.org/dev/reference/dbClearResult.md)
    to clean up the result set object. This step is mandatory even if no
    rows have been fetched or if an error has occurred during the
    processing. It is good practice to use
    [`on.exit()`](https://rdrr.io/r/base/on.exit.html) or
    [`withr::defer()`](https://withr.r-lib.org/reference/defer.html) to
    ensure that this step is always executed.

### The data retrieval flow for Arrow streams

This section gives a complete overview over the flow for the execution
of queries that return tabular data as an Arrow stream.

Most of this flow, except repeated calling of
[`dbBindArrow()`](https://dbi.r-dbi.org/dev/reference/dbBind.md) or
[`dbBind()`](https://dbi.r-dbi.org/dev/reference/dbBind.md), is
implemented by
[`dbGetQueryArrow()`](https://dbi.r-dbi.org/dev/reference/dbGetQueryArrow.md),
which should be sufficient unless you have a parameterized query that
you want to reuse. This flow requires an active connection established
by [`dbConnect()`](https://dbi.r-dbi.org/dev/reference/dbConnect.md).
See also `vignette("dbi-advanced")` for a walkthrough.

1.  Use
    [`dbSendQueryArrow()`](https://dbi.r-dbi.org/dev/reference/dbSendQueryArrow.md)
    to create a result set object of class DBIResultArrow.

2.  Optionally, bind query parameters with
    [`dbBindArrow()`](https://dbi.r-dbi.org/dev/reference/dbBind.md) or
    [`dbBind()`](https://dbi.r-dbi.org/dev/reference/dbBind.md). This is
    required only if the query contains placeholders such as `⁠?⁠` or
    `⁠\$1⁠`, depending on the database backend.

3.  Use
    [`dbFetchArrow()`](https://dbi.r-dbi.org/dev/reference/dbFetchArrow.md)
    to get a data stream.

4.  Repeat the last two steps as necessary.

5.  Use
    [`dbClearResult()`](https://dbi.r-dbi.org/dev/reference/dbClearResult.md)
    to clean up the result set object. This step is mandatory even if no
    rows have been fetched or if an error has occurred during the
    processing. It is good practice to use
    [`on.exit()`](https://rdrr.io/r/base/on.exit.html) or
    [`withr::defer()`](https://withr.r-lib.org/reference/defer.html) to
    ensure that this step is always executed.

### The command execution flow

This section gives a complete overview over the flow for the execution
of SQL statements that have side effects such as stored procedures,
inserting or deleting data, or setting database or connection options.
Most of this flow, except repeated calling of
[`dbBindArrow()`](https://dbi.r-dbi.org/dev/reference/dbBind.md), is
implemented by
[`dbExecute()`](https://dbi.r-dbi.org/dev/reference/dbExecute.md), which
should be sufficient for non-parameterized queries. This flow requires
an active connection established by
[`dbConnect()`](https://dbi.r-dbi.org/dev/reference/dbConnect.md). See
also `vignette("dbi-advanced")` for a walkthrough.

1.  Use
    [`dbSendStatement()`](https://dbi.r-dbi.org/dev/reference/dbSendStatement.md)
    to create a result set object of class DBIResult. For some queries
    you need to pass `immediate = TRUE`.

2.  Optionally, bind query parameters
    with[`dbBind()`](https://dbi.r-dbi.org/dev/reference/dbBind.md) or
    [`dbBindArrow()`](https://dbi.r-dbi.org/dev/reference/dbBind.md).
    This is required only if the query contains placeholders such as `⁠?⁠`
    or `⁠\$1⁠`, depending on the database backend.

3.  Optionally, use
    [`dbGetRowsAffected()`](https://dbi.r-dbi.org/dev/reference/dbGetRowsAffected.md)
    to retrieve the number of rows affected by the query.

4.  Repeat the last two steps as necessary.

5.  Use
    [`dbClearResult()`](https://dbi.r-dbi.org/dev/reference/dbClearResult.md)
    to clean up the result set object. This step is mandatory even if no
    rows have been fetched or if an error has occurred during the
    processing. It is good practice to use
    [`on.exit()`](https://rdrr.io/r/base/on.exit.html) or
    [`withr::defer()`](https://withr.r-lib.org/reference/defer.html) to
    ensure that this step is always executed.

### Failure modes

Calling [`dbBind()`](https://dbi.r-dbi.org/dev/reference/dbBind.md) for
a query without parameters raises an error.

Binding too many or not enough values, or parameters with wrong names or
unequal length, also raises an error. If the placeholders in the query
are named, all parameter values must have names (which must not be empty
or `NA`), and vice versa, otherwise an error is raised. The behavior for
mixing placeholders of different types (in particular mixing positional
and named placeholders) is not specified.

Calling [`dbBind()`](https://dbi.r-dbi.org/dev/reference/dbBind.md) on a
result set already cleared by
[`dbClearResult()`](https://dbi.r-dbi.org/dev/reference/dbClearResult.md)
also raises an error.

### Specification

DBI clients execute parametrized statements as follows:

1.  Call
    [`dbSendQuery()`](https://dbi.r-dbi.org/dev/reference/dbSendQuery.md),
    [`dbSendQueryArrow()`](https://dbi.r-dbi.org/dev/reference/dbSendQueryArrow.md)
    or
    [`dbSendStatement()`](https://dbi.r-dbi.org/dev/reference/dbSendStatement.md)
    with a query or statement that contains placeholders, store the
    returned DBIResult object in a variable. Mixing placeholders (in
    particular, named and unnamed ones) is not recommended. It is good
    practice to register a call to
    [`dbClearResult()`](https://dbi.r-dbi.org/dev/reference/dbClearResult.md)
    via [`on.exit()`](https://rdrr.io/r/base/on.exit.html) right after
    calling
    [`dbSendQuery()`](https://dbi.r-dbi.org/dev/reference/dbSendQuery.md)
    or
    [`dbSendStatement()`](https://dbi.r-dbi.org/dev/reference/dbSendStatement.md)
    (see the last enumeration item). Until
    [`dbBind()`](https://dbi.r-dbi.org/dev/reference/dbBind.md) or
    [`dbBindArrow()`](https://dbi.r-dbi.org/dev/reference/dbBind.md)
    have been called, the returned result set object has the following
    behavior:

    - [`dbFetch()`](https://dbi.r-dbi.org/dev/reference/dbFetch.md)
      raises an error (for
      [`dbSendQuery()`](https://dbi.r-dbi.org/dev/reference/dbSendQuery.md)
      and
      [`dbSendQueryArrow()`](https://dbi.r-dbi.org/dev/reference/dbSendQueryArrow.md))

    - [`dbGetRowCount()`](https://dbi.r-dbi.org/dev/reference/dbGetRowCount.md)
      returns zero (for
      [`dbSendQuery()`](https://dbi.r-dbi.org/dev/reference/dbSendQuery.md)
      and
      [`dbSendQueryArrow()`](https://dbi.r-dbi.org/dev/reference/dbSendQueryArrow.md))

    - [`dbGetRowsAffected()`](https://dbi.r-dbi.org/dev/reference/dbGetRowsAffected.md)
      returns an integer `NA` (for
      [`dbSendStatement()`](https://dbi.r-dbi.org/dev/reference/dbSendStatement.md))

    - [`dbIsValid()`](https://dbi.r-dbi.org/dev/reference/dbIsValid.md)
      returns `TRUE`

    - [`dbHasCompleted()`](https://dbi.r-dbi.org/dev/reference/dbHasCompleted.md)
      returns `FALSE`

2.  Call [`dbBind()`](https://dbi.r-dbi.org/dev/reference/dbBind.md) or
    [`dbBindArrow()`](https://dbi.r-dbi.org/dev/reference/dbBind.md):

    - For [`dbBind()`](https://dbi.r-dbi.org/dev/reference/dbBind.md),
      the `params` argument must be a list where all elements have the
      same lengths and contain values supported by the backend. A
      data.frame is internally stored as such a list.

    - For
      [`dbBindArrow()`](https://dbi.r-dbi.org/dev/reference/dbBind.md),
      the `params` argument must be a nanoarrow array stream, with one
      column per query parameter.

3.  Retrieve the data or the number of affected rows from the
    `DBIResult` object.

    - For queries issued by
      [`dbSendQuery()`](https://dbi.r-dbi.org/dev/reference/dbSendQuery.md)
      or
      [`dbSendQueryArrow()`](https://dbi.r-dbi.org/dev/reference/dbSendQueryArrow.md),
      call
      [`dbFetch()`](https://dbi.r-dbi.org/dev/reference/dbFetch.md).

    - For statements issued by `dbSendStatements()`, call
      [`dbGetRowsAffected()`](https://dbi.r-dbi.org/dev/reference/dbGetRowsAffected.md).
      (Execution begins immediately after the
      [`dbBind()`](https://dbi.r-dbi.org/dev/reference/dbBind.md) call,
      the statement is processed entirely before the function returns.)

4.  Repeat 2. and 3. as necessary.

5.  Close the result set via
    [`dbClearResult()`](https://dbi.r-dbi.org/dev/reference/dbClearResult.md).

The elements of the `params` argument do not need to be scalars, vectors
of arbitrary length (including length 0) are supported. For queries,
calling [`dbFetch()`](https://dbi.r-dbi.org/dev/reference/dbFetch.md)
binding such parameters returns concatenated results, equivalent to
binding and fetching for each set of values and connecting via
[`rbind()`](https://rdrr.io/r/base/cbind.html). For data manipulation
statements,
[`dbGetRowsAffected()`](https://dbi.r-dbi.org/dev/reference/dbGetRowsAffected.md)
returns the total number of rows affected if binding non-scalar
parameters. [`dbBind()`](https://dbi.r-dbi.org/dev/reference/dbBind.md)
also accepts repeated calls on the same result set for both queries and
data manipulation statements, even if no results are fetched between
calls to [`dbBind()`](https://dbi.r-dbi.org/dev/reference/dbBind.md),
for both queries and data manipulation statements.

If the placeholders in the query are named, their order in the `params`
argument is not important.

At least the following data types are accepted on input (including NA):

- integer

- numeric

- logical for Boolean values

- character (also with special characters such as spaces, newlines,
  quotes, and backslashes)

- factor (bound as character, with warning)

- Date (also when stored internally as integer)

- POSIXct timestamps

- POSIXlt timestamps

- difftime values (also with units other than seconds and with the value
  stored as integer)

- lists of raw for blobs (with `NULL` entries for SQL NULL values)

- objects of type <blob::blob>

### Examples

``` r
# Data frame flow:
con <- dbConnect(RSQLite::SQLite(), ":memory:")

dbWriteTable(con, "iris", iris)

# Using the same query for different values
iris_result <- dbSendQuery(con, "SELECT * FROM iris WHERE [Petal.Width] > ?")
dbBind(iris_result, list(2.3))
dbFetch(iris_result)
dbBind(iris_result, list(3))
dbFetch(iris_result)
dbClearResult(iris_result)

# Executing the same statement with different values at once
iris_result <- dbSendStatement(con, "DELETE FROM iris WHERE [Species] = \$species")
dbBind(iris_result, list(species = c("setosa", "versicolor", "unknown")))
dbGetRowsAffected(iris_result)
dbClearResult(iris_result)

nrow(dbReadTable(con, "iris"))

dbDisconnect(con)



# Arrow flow:
con <- dbConnect(RSQLite::SQLite(), ":memory:")

dbWriteTable(con, "iris", iris)

# Using the same query for different values
iris_result <- dbSendQueryArrow(con, "SELECT * FROM iris WHERE [Petal.Width] > ?")
dbBindArrow(
  iris_result,
  nanoarrow::as_nanoarrow_array_stream(data.frame(2.3, fix.empty.names = FALSE))
)
as.data.frame(dbFetchArrow(iris_result))
dbBindArrow(
  iris_result,
  nanoarrow::as_nanoarrow_array_stream(data.frame(3, fix.empty.names = FALSE))
)
as.data.frame(dbFetchArrow(iris_result))
dbClearResult(iris_result)

# Executing the same statement with different values at once
iris_result <- dbSendStatement(con, "DELETE FROM iris WHERE [Species] = \$species")
dbBindArrow(iris_result, nanoarrow::as_nanoarrow_array_stream(data.frame(
  species = c("setosa", "versicolor", "unknown")
)))
dbGetRowsAffected(iris_result)
dbClearResult(iris_result)

nrow(dbReadTable(con, "iris"))

dbDisconnect(con)
```

## Retrieve results from a query

This section describes the behavior of the following method:

``` r
dbGetQuery(conn, statement, ...)
```

### Description

Returns the result of a query as a data frame.
[`dbGetQuery()`](https://dbi.r-dbi.org/dev/reference/dbGetQuery.md)
comes with a default implementation (which should work with most
backends) that calls
[`dbSendQuery()`](https://dbi.r-dbi.org/dev/reference/dbSendQuery.md),
then [`dbFetch()`](https://dbi.r-dbi.org/dev/reference/dbFetch.md),
ensuring that the result is always freed by
[`dbClearResult()`](https://dbi.r-dbi.org/dev/reference/dbClearResult.md).
For retrieving chunked/paged results or for passing query parameters,
see
[`dbSendQuery()`](https://dbi.r-dbi.org/dev/reference/dbSendQuery.md),
in particular the “The data retrieval flow” section. For retrieving
results as an Arrow object, see
[`dbGetQueryArrow()`](https://dbi.r-dbi.org/dev/reference/dbGetQueryArrow.md).

### Arguments

|             |                                                                                                           |
|-------------|-----------------------------------------------------------------------------------------------------------|
| `conn`      | A DBIConnection object, as returned by [`dbConnect()`](https://dbi.r-dbi.org/dev/reference/dbConnect.md). |
| `statement` | a character string containing SQL.                                                                        |
| `...`       | Other parameters passed on to methods.                                                                    |

### Additional arguments

The following arguments are not part of the
[`dbGetQuery()`](https://dbi.r-dbi.org/dev/reference/dbGetQuery.md)
generic (to improve compatibility across backends) but are part of the
DBI specification:

- `n` (default: -1)

- `params` (default: `NULL`)

- `immediate` (default: `NULL`)

They must be provided as named arguments. See the “Specification” and
“Value” sections for details on their usage.

### Specification

A column named `row_names` is treated like any other column.

The `n` argument specifies the number of rows to be fetched. If omitted,
fetching multi-row queries with one or more columns returns the entire
result. A value of Inf for the `n` argument is supported and also
returns the full result. If more rows than available are fetched (by
passing a too large value for `n`), the result is returned in full
without warning. If zero rows are requested, the columns of the data
frame are still fully typed. Fetching fewer rows than available is
permitted, no warning is issued.

The `param` argument allows passing query parameters, see
[`dbBind()`](https://dbi.r-dbi.org/dev/reference/dbBind.md) for details.

### Specification for the `immediate` argument

The `immediate` argument supports distinguishing between “direct” and
“prepared” APIs offered by many database drivers. Passing
`immediate = TRUE` leads to immediate execution of the query or
statement, via the “direct” API (if supported by the driver). The
default `NULL` means that the backend should choose whatever API makes
the most sense for the database, and (if relevant) tries the other API
if the first attempt fails. A successful second attempt should result in
a message that suggests passing the correct `immediate` argument.
Examples for possible behaviors:

1.  DBI backend defaults to `immediate = TRUE` internally

    1.  A query without parameters is passed: query is executed

    2.  A query with parameters is passed:

        1.  `params` not given: rejected immediately by the database
            because of a syntax error in the query, the backend tries
            `immediate = FALSE` (and gives a message)

        2.  `params` given: query is executed using `immediate = FALSE`

2.  DBI backend defaults to `immediate = FALSE` internally

    1.  A query without parameters is passed:

        1.  simple query: query is executed

        2.  “special” query (such as setting a config options): fails,
            the backend tries `immediate = TRUE` (and gives a message)

    2.  A query with parameters is passed:

        1.  `params` not given: waiting for parameters via
            [`dbBind()`](https://dbi.r-dbi.org/dev/reference/dbBind.md)

        2.  `params` given: query is executed

### Details

This method is for `SELECT` queries only (incl. other SQL statements
that return a `SELECT`-alike result, e.g., execution of a stored
procedure or data manipulation queries like
`⁠INSERT INTO ... RETURNING ...⁠`). To execute a stored procedure that
does not return a result set, use
[`dbExecute()`](https://dbi.r-dbi.org/dev/reference/dbExecute.md).

Some backends may support data manipulation statements through this
method for compatibility reasons. However, callers are strongly advised
to use [`dbExecute()`](https://dbi.r-dbi.org/dev/reference/dbExecute.md)
for data manipulation statements.

### Value

[`dbGetQuery()`](https://dbi.r-dbi.org/dev/reference/dbGetQuery.md)
always returns a data.frame, with as many rows as records were fetched
and as many columns as fields in the result set, even if the result is a
single value or has one or zero rows.

### Implementation notes

Subclasses should override this method only if they provide some sort of
performance optimization.

### Failure modes

An error is raised when issuing a query over a closed or invalid
connection, if the syntax of the query is invalid, or if the query is
not a non-`NA` string. If the `n` argument is not an atomic whole number
greater or equal to -1 or Inf, an error is raised, but a subsequent call
to [`dbGetQuery()`](https://dbi.r-dbi.org/dev/reference/dbGetQuery.md)
with proper `n` argument succeeds.

### Examples

``` r
con <- dbConnect(RSQLite::SQLite(), ":memory:")

dbWriteTable(con, "mtcars", mtcars)
dbGetQuery(con, "SELECT * FROM mtcars")
dbGetQuery(con, "SELECT * FROM mtcars", n = 6)

# Pass values using the param argument:
# (This query runs eight times, once for each different
# parameter. The resulting rows are combined into a single
# data frame.)
dbGetQuery(
  con,
  "SELECT COUNT(*) FROM mtcars WHERE cyl = ?",
  params = list(1:8)
)

dbDisconnect(con)
```

## Execute a data manipulation statement on a given database connection

This section describes the behavior of the following method:

``` r
dbSendStatement(conn, statement, ...)
```

### Description

The
[`dbSendStatement()`](https://dbi.r-dbi.org/dev/reference/dbSendStatement.md)
method only submits and synchronously executes the SQL data manipulation
statement (e.g., `UPDATE`, `DELETE`, `⁠INSERT INTO⁠`, `⁠DROP TABLE⁠`, …) to
the database engine. To query the number of affected rows, call
[`dbGetRowsAffected()`](https://dbi.r-dbi.org/dev/reference/dbGetRowsAffected.md)
on the returned result object. You must also call
[`dbClearResult()`](https://dbi.r-dbi.org/dev/reference/dbClearResult.md)
after that. For interactive use, you should almost always prefer
[`dbExecute()`](https://dbi.r-dbi.org/dev/reference/dbExecute.md).

### Arguments

|             |                                                                                                           |
|-------------|-----------------------------------------------------------------------------------------------------------|
| `conn`      | A DBIConnection object, as returned by [`dbConnect()`](https://dbi.r-dbi.org/dev/reference/dbConnect.md). |
| `statement` | a character string containing SQL.                                                                        |
| `...`       | Other parameters passed on to methods.                                                                    |

### Additional arguments

The following arguments are not part of the
[`dbSendStatement()`](https://dbi.r-dbi.org/dev/reference/dbSendStatement.md)
generic (to improve compatibility across backends) but are part of the
DBI specification:

- `params` (default: `NULL`)

- `immediate` (default: `NULL`)

They must be provided as named arguments. See the “Specification”
sections for details on their usage.

### Specification

No warnings occur under normal conditions. When done, the DBIResult
object must be cleared with a call to
[`dbClearResult()`](https://dbi.r-dbi.org/dev/reference/dbClearResult.md).
Failure to clear the result set leads to a warning when the connection
is closed. If the backend supports only one open result set per
connection, issuing a second query invalidates an already open result
set and raises a warning. The newly opened result set is valid and must
be cleared with
[`dbClearResult()`](https://dbi.r-dbi.org/dev/reference/dbClearResult.md).

The `param` argument allows passing query parameters, see
[`dbBind()`](https://dbi.r-dbi.org/dev/reference/dbBind.md) for details.

### Specification for the `immediate` argument

The `immediate` argument supports distinguishing between “direct” and
“prepared” APIs offered by many database drivers. Passing
`immediate = TRUE` leads to immediate execution of the query or
statement, via the “direct” API (if supported by the driver). The
default `NULL` means that the backend should choose whatever API makes
the most sense for the database, and (if relevant) tries the other API
if the first attempt fails. A successful second attempt should result in
a message that suggests passing the correct `immediate` argument.
Examples for possible behaviors:

1.  DBI backend defaults to `immediate = TRUE` internally

    1.  A query without parameters is passed: query is executed

    2.  A query with parameters is passed:

        1.  `params` not given: rejected immediately by the database
            because of a syntax error in the query, the backend tries
            `immediate = FALSE` (and gives a message)

        2.  `params` given: query is executed using `immediate = FALSE`

2.  DBI backend defaults to `immediate = FALSE` internally

    1.  A query without parameters is passed:

        1.  simple query: query is executed

        2.  “special” query (such as setting a config options): fails,
            the backend tries `immediate = TRUE` (and gives a message)

    2.  A query with parameters is passed:

        1.  `params` not given: waiting for parameters via
            [`dbBind()`](https://dbi.r-dbi.org/dev/reference/dbBind.md)

        2.  `params` given: query is executed

### Details

[`dbSendStatement()`](https://dbi.r-dbi.org/dev/reference/dbSendStatement.md)
comes with a default implementation that simply forwards to
[`dbSendQuery()`](https://dbi.r-dbi.org/dev/reference/dbSendQuery.md),
to support backends that only implement the latter.

### Value

[`dbSendStatement()`](https://dbi.r-dbi.org/dev/reference/dbSendStatement.md)
returns an S4 object that inherits from DBIResult. The result set can be
used with
[`dbGetRowsAffected()`](https://dbi.r-dbi.org/dev/reference/dbGetRowsAffected.md)
to determine the number of rows affected by the query. Once you have
finished using a result, make sure to clear it with
[`dbClearResult()`](https://dbi.r-dbi.org/dev/reference/dbClearResult.md).

### The command execution flow

This section gives a complete overview over the flow for the execution
of SQL statements that have side effects such as stored procedures,
inserting or deleting data, or setting database or connection options.
Most of this flow, except repeated calling of
[`dbBindArrow()`](https://dbi.r-dbi.org/dev/reference/dbBind.md), is
implemented by
[`dbExecute()`](https://dbi.r-dbi.org/dev/reference/dbExecute.md), which
should be sufficient for non-parameterized queries. This flow requires
an active connection established by
[`dbConnect()`](https://dbi.r-dbi.org/dev/reference/dbConnect.md). See
also `vignette("dbi-advanced")` for a walkthrough.

1.  Use
    [`dbSendStatement()`](https://dbi.r-dbi.org/dev/reference/dbSendStatement.md)
    to create a result set object of class DBIResult. For some queries
    you need to pass `immediate = TRUE`.

2.  Optionally, bind query parameters
    with[`dbBind()`](https://dbi.r-dbi.org/dev/reference/dbBind.md) or
    [`dbBindArrow()`](https://dbi.r-dbi.org/dev/reference/dbBind.md).
    This is required only if the query contains placeholders such as `⁠?⁠`
    or `⁠\$1⁠`, depending on the database backend.

3.  Optionally, use
    [`dbGetRowsAffected()`](https://dbi.r-dbi.org/dev/reference/dbGetRowsAffected.md)
    to retrieve the number of rows affected by the query.

4.  Repeat the last two steps as necessary.

5.  Use
    [`dbClearResult()`](https://dbi.r-dbi.org/dev/reference/dbClearResult.md)
    to clean up the result set object. This step is mandatory even if no
    rows have been fetched or if an error has occurred during the
    processing. It is good practice to use
    [`on.exit()`](https://rdrr.io/r/base/on.exit.html) or
    [`withr::defer()`](https://withr.r-lib.org/reference/defer.html) to
    ensure that this step is always executed.

### Failure modes

An error is raised when issuing a statement over a closed or invalid
connection, or if the statement is not a non-`NA` string. An error is
also raised if the syntax of the query is invalid and all query
parameters are given (by passing the `params` argument) or the
`immediate` argument is set to `TRUE`.

### Examples

``` r
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
```

## Change database state

This section describes the behavior of the following method:

``` r
dbExecute(conn, statement, ...)
```

### Description

Executes a statement and returns the number of rows affected.
[`dbExecute()`](https://dbi.r-dbi.org/dev/reference/dbExecute.md) comes
with a default implementation (which should work with most backends)
that calls
[`dbSendStatement()`](https://dbi.r-dbi.org/dev/reference/dbSendStatement.md),
then
[`dbGetRowsAffected()`](https://dbi.r-dbi.org/dev/reference/dbGetRowsAffected.md),
ensuring that the result is always freed by
[`dbClearResult()`](https://dbi.r-dbi.org/dev/reference/dbClearResult.md).
For passing query parameters, see
[`dbBind()`](https://dbi.r-dbi.org/dev/reference/dbBind.md), in
particular the “The command execution flow” section.

### Arguments

|             |                                                                                                           |
|-------------|-----------------------------------------------------------------------------------------------------------|
| `conn`      | A DBIConnection object, as returned by [`dbConnect()`](https://dbi.r-dbi.org/dev/reference/dbConnect.md). |
| `statement` | a character string containing SQL.                                                                        |
| `...`       | Other parameters passed on to methods.                                                                    |

### Additional arguments

The following arguments are not part of the
[`dbExecute()`](https://dbi.r-dbi.org/dev/reference/dbExecute.md)
generic (to improve compatibility across backends) but are part of the
DBI specification:

- `params` (default: `NULL`)

- `immediate` (default: `NULL`)

They must be provided as named arguments. See the “Specification”
sections for details on their usage.

### Specification

The `param` argument allows passing query parameters, see
[`dbBind()`](https://dbi.r-dbi.org/dev/reference/dbBind.md) for details.

### Specification for the `immediate` argument

The `immediate` argument supports distinguishing between “direct” and
“prepared” APIs offered by many database drivers. Passing
`immediate = TRUE` leads to immediate execution of the query or
statement, via the “direct” API (if supported by the driver). The
default `NULL` means that the backend should choose whatever API makes
the most sense for the database, and (if relevant) tries the other API
if the first attempt fails. A successful second attempt should result in
a message that suggests passing the correct `immediate` argument.
Examples for possible behaviors:

1.  DBI backend defaults to `immediate = TRUE` internally

    1.  A query without parameters is passed: query is executed

    2.  A query with parameters is passed:

        1.  `params` not given: rejected immediately by the database
            because of a syntax error in the query, the backend tries
            `immediate = FALSE` (and gives a message)

        2.  `params` given: query is executed using `immediate = FALSE`

2.  DBI backend defaults to `immediate = FALSE` internally

    1.  A query without parameters is passed:

        1.  simple query: query is executed

        2.  “special” query (such as setting a config options): fails,
            the backend tries `immediate = TRUE` (and gives a message)

    2.  A query with parameters is passed:

        1.  `params` not given: waiting for parameters via
            [`dbBind()`](https://dbi.r-dbi.org/dev/reference/dbBind.md)

        2.  `params` given: query is executed

### Details

You can also use
[`dbExecute()`](https://dbi.r-dbi.org/dev/reference/dbExecute.md) to
call a stored procedure that performs data manipulation or other actions
that do not return a result set. To execute a stored procedure that
returns a result set, or a data manipulation query that also returns a
result set such as `⁠INSERT INTO ... RETURNING ...⁠`, use
[`dbGetQuery()`](https://dbi.r-dbi.org/dev/reference/dbGetQuery.md)
instead.

### Value

[`dbExecute()`](https://dbi.r-dbi.org/dev/reference/dbExecute.md) always
returns a scalar numeric that specifies the number of rows affected by
the statement.

### Implementation notes

Subclasses should override this method only if they provide some sort of
performance optimization.

### Failure modes

An error is raised when issuing a statement over a closed or invalid
connection, if the syntax of the statement is invalid, or if the
statement is not a non-`NA` string.

### Examples

``` r
con <- dbConnect(RSQLite::SQLite(), ":memory:")

dbWriteTable(con, "cars", head(cars, 3))
dbReadTable(con, "cars")   # there are 3 rows
dbExecute(
  con,
  "INSERT INTO cars (speed, dist) VALUES (1, 1), (2, 2), (3, 3)"
)
dbReadTable(con, "cars")   # there are now 6 rows

# Pass values using the param argument:
dbExecute(
  con,
  "INSERT INTO cars (speed, dist) VALUES (?, ?)",
  params = list(4:7, 5:8)
)
dbReadTable(con, "cars")   # there are now 10 rows

dbDisconnect(con)
```

## Quote literal strings

This section describes the behavior of the following method:

``` r
dbQuoteString(conn, x, ...)
```

### Description

Call this method to generate a string that is suitable for use in a
query as a string literal, to make sure that you generate valid SQL and
protect against SQL injection attacks.

### Arguments

|        |                                                                                                           |
|--------|-----------------------------------------------------------------------------------------------------------|
| `conn` | A DBIConnection object, as returned by [`dbConnect()`](https://dbi.r-dbi.org/dev/reference/dbConnect.md). |
| `x`    | A character vector to quote as string.                                                                    |
| `...`  | Other arguments passed on to methods.                                                                     |

### Value

[`dbQuoteString()`](https://dbi.r-dbi.org/dev/reference/dbQuoteString.md)
returns an object that can be coerced to character, of the same length
as the input. For an empty character vector this function returns a
length-0 object.

When passing the returned object again to
[`dbQuoteString()`](https://dbi.r-dbi.org/dev/reference/dbQuoteString.md)
as `x` argument, it is returned unchanged. Passing objects of class SQL
should also return them unchanged. (For backends it may be most
convenient to return SQL objects to achieve this behavior, but this is
not required.)

### Failure modes

Passing a numeric, integer, logical, or raw vector, or a list for the
`x` argument raises an error.

### Specification

The returned expression can be used in a `⁠SELECT ...⁠` query, and for any
scalar character `x` the value of
`dbGetQuery(paste0("SELECT ", dbQuoteString(x)))[[1]]` must be identical
to `x`, even if `x` contains spaces, tabs, quotes (single or double),
backticks, or newlines (in any combination) or is itself the result of a
[`dbQuoteString()`](https://dbi.r-dbi.org/dev/reference/dbQuoteString.md)
call coerced back to character (even repeatedly). If `x` is `NA`, the
result must merely satisfy [`is.na()`](https://rdrr.io/r/base/NA.html).
The strings `"NA"` or `"NULL"` are not treated specially.

`NA` should be translated to an unquoted SQL `NULL`, so that the query
`⁠SELECT * FROM (SELECT 1) a WHERE ... IS NULL⁠` returns one row.

### Examples

``` r
# Quoting ensures that arbitrary input is safe for use in a query
name <- "Robert'); DROP TABLE Students;--"
dbQuoteString(ANSI(), name)

# NAs become NULL
dbQuoteString(ANSI(), c("x", NA))

# SQL vectors are always passed through as is
var_name <- SQL("select")
var_name
dbQuoteString(ANSI(), var_name)

# This mechanism is used to prevent double escaping
dbQuoteString(ANSI(), dbQuoteString(ANSI(), name))
```

## Quote literal values

This section describes the behavior of the following method:

``` r
dbQuoteLiteral(conn, x, ...)
```

### Description

Call these methods to generate a string that is suitable for use in a
query as a literal value of the correct type, to make sure that you
generate valid SQL and protect against SQL injection attacks.

### Arguments

|        |                                                                                                           |
|--------|-----------------------------------------------------------------------------------------------------------|
| `conn` | A DBIConnection object, as returned by [`dbConnect()`](https://dbi.r-dbi.org/dev/reference/dbConnect.md). |
| `x`    | A vector to quote as string.                                                                              |
| `...`  | Other arguments passed on to methods.                                                                     |

### Value

[`dbQuoteLiteral()`](https://dbi.r-dbi.org/dev/reference/dbQuoteLiteral.md)
returns an object that can be coerced to character, of the same length
as the input. For an empty integer, numeric, character, logical, date,
time, or blob vector, this function returns a length-0 object.

When passing the returned object again to
[`dbQuoteLiteral()`](https://dbi.r-dbi.org/dev/reference/dbQuoteLiteral.md)
as `x` argument, it is returned unchanged. Passing objects of class SQL
should also return them unchanged. (For backends it may be most
convenient to return SQL objects to achieve this behavior, but this is
not required.)

### Failure modes

Passing a list for the `x` argument raises an error.

### Specification

The returned expression can be used in a `⁠SELECT ...⁠` query, and the
value of `dbGetQuery(paste0("SELECT ", dbQuoteLiteral(x)))[[1]]` must be
equal to `x` for any scalar integer, numeric, string, and logical. If
`x` is `NA`, the result must merely satisfy
[`is.na()`](https://rdrr.io/r/base/NA.html). The literals `"NA"` or
`"NULL"` are not treated specially.

`NA` should be translated to an unquoted SQL `NULL`, so that the query
`⁠SELECT * FROM (SELECT 1) a WHERE ... IS NULL⁠` returns one row.

### Examples

``` r
# Quoting ensures that arbitrary input is safe for use in a query
name <- "Robert'); DROP TABLE Students;--"
dbQuoteLiteral(ANSI(), name)

# NAs become NULL
dbQuoteLiteral(ANSI(), c(1:3, NA))

# Logicals become integers by default
dbQuoteLiteral(ANSI(), c(TRUE, FALSE, NA))

# Raw vectors become hex strings by default
dbQuoteLiteral(ANSI(), list(as.raw(1:3), NULL))

# SQL vectors are always passed through as is
var_name <- SQL("select")
var_name
dbQuoteLiteral(ANSI(), var_name)

# This mechanism is used to prevent double escaping
dbQuoteLiteral(ANSI(), dbQuoteLiteral(ANSI(), name))
```

## Quote identifiers

This section describes the behavior of the following method:

``` r
dbQuoteIdentifier(conn, x, ...)
```

### Description

Call this method to generate a string that is suitable for use in a
query as a column or table name, to make sure that you generate valid
SQL and protect against SQL injection attacks. The inverse operation is
[`dbUnquoteIdentifier()`](https://dbi.r-dbi.org/dev/reference/dbUnquoteIdentifier.md).

### Arguments

|        |                                                                                                           |
|--------|-----------------------------------------------------------------------------------------------------------|
| `conn` | A DBIConnection object, as returned by [`dbConnect()`](https://dbi.r-dbi.org/dev/reference/dbConnect.md). |
| `x`    | A character vector, SQL or Id object to quote as identifier.                                              |
| `...`  | Other arguments passed on to methods.                                                                     |

### Value

[`dbQuoteIdentifier()`](https://dbi.r-dbi.org/dev/reference/dbQuoteIdentifier.md)
returns an object that can be coerced to character, of the same length
as the input. For an empty character vector this function returns a
length-0 object. The names of the input argument are preserved in the
output. When passing the returned object again to
[`dbQuoteIdentifier()`](https://dbi.r-dbi.org/dev/reference/dbQuoteIdentifier.md)
as `x` argument, it is returned unchanged. Passing objects of class SQL
should also return them unchanged. (For backends it may be most
convenient to return SQL objects to achieve this behavior, but this is
not required.)

### Failure modes

An error is raised if the input contains `NA`, but not for an empty
string.

### Specification

Calling
[`dbGetQuery()`](https://dbi.r-dbi.org/dev/reference/dbGetQuery.md) for
a query of the format `⁠SELECT 1 AS ...⁠` returns a data frame with the
identifier, unquoted, as column name. Quoted identifiers can be used as
table and column names in SQL queries, in particular in queries like
`⁠SELECT 1 AS ...⁠` and `⁠SELECT * FROM (SELECT 1) ...⁠`. The method must
use a quoting mechanism that is unambiguously different from the quoting
mechanism used for strings, so that a query like
`⁠SELECT ... FROM (SELECT 1 AS ...)⁠` throws an error if the column names
do not match.

The method can quote column names that contain special characters such
as a space, a dot, a comma, or quotes used to mark strings or
identifiers, if the database supports this. In any case, checking the
validity of the identifier should be performed only when executing a
query, and not by
[`dbQuoteIdentifier()`](https://dbi.r-dbi.org/dev/reference/dbQuoteIdentifier.md).

### Examples

``` r
# Quoting ensures that arbitrary input is safe for use in a query
name <- "Robert'); DROP TABLE Students;--"
dbQuoteIdentifier(ANSI(), name)

# Use Id() to specify other components such as the schema
id_name <- Id(schema = "schema_name", table = "table_name")
id_name
dbQuoteIdentifier(ANSI(), id_name)

# SQL vectors are always passed through as is
var_name <- SQL("select")
var_name
dbQuoteIdentifier(ANSI(), var_name)

# This mechanism is used to prevent double escaping
dbQuoteIdentifier(ANSI(), dbQuoteIdentifier(ANSI(), name))
```

## Unquote identifiers

This section describes the behavior of the following method:

``` r
dbUnquoteIdentifier(conn, x, ...)
```

### Description

Call this method to convert a SQL object created by
[`dbQuoteIdentifier()`](https://dbi.r-dbi.org/dev/reference/dbQuoteIdentifier.md)
back to a list of Id objects.

### Arguments

|        |                                                                                                           |
|--------|-----------------------------------------------------------------------------------------------------------|
| `conn` | A DBIConnection object, as returned by [`dbConnect()`](https://dbi.r-dbi.org/dev/reference/dbConnect.md). |
| `x`    | An SQL or Id object.                                                                                      |
| `...`  | Other arguments passed on to methods.                                                                     |

### Value

[`dbUnquoteIdentifier()`](https://dbi.r-dbi.org/dev/reference/dbUnquoteIdentifier.md)
returns a list of objects of the same length as the input. For an empty
vector, this function returns a length-0 object. The names of the input
argument are preserved in the output. If `x` is a value returned by
[`dbUnquoteIdentifier()`](https://dbi.r-dbi.org/dev/reference/dbUnquoteIdentifier.md),
calling `dbUnquoteIdentifier(..., dbQuoteIdentifier(..., x))` returns
`list(x)`. If `x` is an object of class Id, calling
`dbUnquoteIdentifier(..., x)` returns `list(x)`. (For backends it may be
most convenient to return Id objects to achieve this behavior, but this
is not required.)

Plain character vectors can also be passed to
[`dbUnquoteIdentifier()`](https://dbi.r-dbi.org/dev/reference/dbUnquoteIdentifier.md).

### Failure modes

An error is raised if a character vectors with a missing value is passed
as the `x` argument.

### Specification

For any character vector of length one, quoting (with
[`dbQuoteIdentifier()`](https://dbi.r-dbi.org/dev/reference/dbQuoteIdentifier.md))
then unquoting then quoting the first element is identical to just
quoting. This is also true for strings that contain special characters
such as a space, a dot, a comma, or quotes used to mark strings or
identifiers, if the database supports this.

Unquoting simple strings (consisting of only letters) wrapped with
[`SQL()`](https://dbi.r-dbi.org/dev/reference/SQL.md) and then quoting
via
[`dbQuoteIdentifier()`](https://dbi.r-dbi.org/dev/reference/dbQuoteIdentifier.md)
gives the same result as just quoting the string. Similarly, unquoting
expressions of the form `SQL("schema.table")` and then quoting gives the
same result as quoting the identifier constructed by
`Id("schema", "table")`.

### Examples

``` r
# Unquoting allows to understand the structure of a
# possibly complex quoted identifier
dbUnquoteIdentifier(
  ANSI(),
  SQL(c('"Catalog"."Schema"."Table"', '"Schema"."Table"', '"UnqualifiedTable"'))
)

# The returned object is always a list,
# also for Id objects
dbUnquoteIdentifier(ANSI(), Id("Catalog", "Schema", "Table"))

# Quoting and unquoting are inverses
dbQuoteIdentifier(
  ANSI(),
  dbUnquoteIdentifier(ANSI(), SQL("UnqualifiedTable"))[[1]]
)

dbQuoteIdentifier(
  ANSI(),
  dbUnquoteIdentifier(ANSI(), Id("Schema", "Table"))[[1]]
)
```

## Read database tables as data frames

This section describes the behavior of the following method:

``` r
dbReadTable(conn, name, ...)
```

### Description

Reads a database table to a data frame, optionally converting a column
to row names and converting the column names to valid R identifiers. Use
[`dbReadTableArrow()`](https://dbi.r-dbi.org/dev/reference/dbReadTableArrow.md)
instead to obtain an Arrow object.

### Arguments

[TABLE]

### Additional arguments

The following arguments are not part of the
[`dbReadTable()`](https://dbi.r-dbi.org/dev/reference/dbReadTable.md)
generic (to improve compatibility across backends) but are part of the
DBI specification:

- `row.names` (default: `FALSE`)

- `check.names`

They must be provided as named arguments. See the “Value” section for
details on their usage.

### Specification

The `name` argument is processed as follows, to support databases that
allow non-syntactic names for their objects:

- If an unquoted table name as string:
  [`dbReadTable()`](https://dbi.r-dbi.org/dev/reference/dbReadTable.md)
  will do the quoting, perhaps by calling
  `dbQuoteIdentifier(conn, x = name)`

- If the result of a call to
  [`dbQuoteIdentifier()`](https://dbi.r-dbi.org/dev/reference/dbQuoteIdentifier.md):
  no more quoting is done

### Details

This function returns a data frame. Use
[`dbReadTableArrow()`](https://dbi.r-dbi.org/dev/reference/dbReadTableArrow.md)
to obtain an Arrow object.

### Value

[`dbReadTable()`](https://dbi.r-dbi.org/dev/reference/dbReadTable.md)
returns a data frame that contains the complete data from the remote
table, effectively the result of calling
[`dbGetQuery()`](https://dbi.r-dbi.org/dev/reference/dbGetQuery.md) with
`⁠SELECT * FROM <name>⁠`.

An empty table is returned as a data frame with zero rows.

The presence of rownames depends on the `row.names` argument, see
[`sqlColumnToRownames()`](https://dbi.r-dbi.org/dev/reference/rownames.md)
for details:

- If `FALSE` or `NULL`, the returned data frame doesn’t have row names.

- If `TRUE`, a column named “row_names” is converted to row names.

&nbsp;

- If `NA`, a column named “row_names” is converted to row names if it
  exists, otherwise no translation occurs.

- If a string, this specifies the name of the column in the remote table
  that contains the row names.

The default is `row.names = FALSE`.

If the database supports identifiers with special characters, the
columns in the returned data frame are converted to valid R identifiers
if the `check.names` argument is `TRUE`, If `check.names = FALSE`, the
returned table has non-syntactic column names without quotes.

### Failure modes

An error is raised if the table does not exist.

An error is raised if `row.names` is `TRUE` and no “row_names” column
exists,

An error is raised if `row.names` is set to a string and no
corresponding column exists.

An error is raised when calling this method for a closed or invalid
connection. An error is raised if `name` cannot be processed with
[`dbQuoteIdentifier()`](https://dbi.r-dbi.org/dev/reference/dbQuoteIdentifier.md)
or if this results in a non-scalar. Unsupported values for `row.names`
and `check.names` (non-scalars, unsupported data types, `NA` for
`check.names`) also raise an error.

### Examples

``` r
con <- dbConnect(RSQLite::SQLite(), ":memory:")

dbWriteTable(con, "mtcars", mtcars[1:10, ])
dbReadTable(con, "mtcars")

dbDisconnect(con)
```

## Copy data frames to database tables

This section describes the behavior of the following method:

``` r
dbWriteTable(conn, name, value, ...)
```

### Description

Writes, overwrites or appends a data frame to a database table,
optionally converting row names to a column and specifying SQL data
types for fields.

### Arguments

[TABLE]

### Additional arguments

The following arguments are not part of the
[`dbWriteTable()`](https://dbi.r-dbi.org/dev/reference/dbWriteTable.md)
generic (to improve compatibility across backends) but are part of the
DBI specification:

- `row.names` (default: `FALSE`)

- `overwrite` (default: `FALSE`)

- `append` (default: `FALSE`)

- `field.types` (default: `NULL`)

- `temporary` (default: `FALSE`)

They must be provided as named arguments. See the “Specification” and
“Value” sections for details on their usage.

### Specification

The `name` argument is processed as follows, to support databases that
allow non-syntactic names for their objects:

- If an unquoted table name as string:
  [`dbWriteTable()`](https://dbi.r-dbi.org/dev/reference/dbWriteTable.md)
  will do the quoting, perhaps by calling
  `dbQuoteIdentifier(conn, x = name)`

- If the result of a call to
  [`dbQuoteIdentifier()`](https://dbi.r-dbi.org/dev/reference/dbQuoteIdentifier.md):
  no more quoting is done

The `value` argument must be a data frame with a subset of the columns
of the existing table if `append = TRUE`. The order of the columns does
not matter with `append = TRUE`.

If the `overwrite` argument is `TRUE`, an existing table of the same
name will be overwritten. This argument doesn’t change behavior if the
table does not exist yet.

If the `append` argument is `TRUE`, the rows in an existing table are
preserved, and the new data are appended. If the table doesn’t exist
yet, it is created.

If the `temporary` argument is `TRUE`, the table is not available in a
second connection and is gone after reconnecting. Not all backends
support this argument. A regular, non-temporary table is visible in a
second connection, in a pre-existing connection, and after reconnecting
to the database.

SQL keywords can be used freely in table names, column names, and data.
Quotes, commas, spaces, and other special characters such as newlines
and tabs, can also be used in the data, and, if the database supports
non-syntactic identifiers, also for table names and column names.

The following data types must be supported at least, and be read
identically with
[`dbReadTable()`](https://dbi.r-dbi.org/dev/reference/dbReadTable.md):

- integer

- numeric (the behavior for `Inf` and `NaN` is not specified)

- logical

- `NA` as NULL

- 64-bit values (using `"bigint"` as field type); the result can be

  - converted to a numeric, which may lose precision,

  - converted a character vector, which gives the full decimal
    representation

  - written to another table and read again unchanged

- character (in both UTF-8 and native encodings), supporting empty
  strings before and after a non-empty string

- factor (returned as character)

- list of raw (if supported by the database)

- objects of type <blob::blob> (if supported by the database)

- date (if supported by the database; returned as `Date`), also for
  dates prior to 1970 or 1900 or after 2038

- time (if supported by the database; returned as objects that inherit
  from `difftime`)

- timestamp (if supported by the database; returned as `POSIXct`
  respecting the time zone but not necessarily preserving the input time
  zone), also for timestamps prior to 1970 or 1900 or after 2038
  respecting the time zone but not necessarily preserving the input time
  zone)

Mixing column types in the same table is supported.

The `field.types` argument must be a named character vector with at most
one entry for each column. It indicates the SQL data type to be used for
a new column. If a column is missed from `field.types`, the type is
inferred from the input data with
[`dbDataType()`](https://dbi.r-dbi.org/dev/reference/dbDataType.md).

The interpretation of rownames depends on the `row.names` argument, see
[`sqlRownamesToColumn()`](https://dbi.r-dbi.org/dev/reference/rownames.md)
for details:

- If `FALSE` or `NULL`, row names are ignored.

- If `TRUE`, row names are converted to a column named “row_names”, even
  if the input data frame only has natural row names from 1 to
  `nrow(...)`.

- If `NA`, a column named “row_names” is created if the data has custom
  row names, no extra column is created in the case of natural row
  names.

- If a string, this specifies the name of the column in the remote table
  that contains the row names, even if the input data frame only has
  natural row names.

The default is `row.names = FALSE`.

### Details

This function expects a data frame. Use
[`dbWriteTableArrow()`](https://dbi.r-dbi.org/dev/reference/dbWriteTableArrow.md)
to write an Arrow object.

This function is useful if you want to create and load a table at the
same time. Use
[`dbAppendTable()`](https://dbi.r-dbi.org/dev/reference/dbAppendTable.md)
or
[`dbAppendTableArrow()`](https://dbi.r-dbi.org/dev/reference/dbAppendTableArrow.md)
for appending data to an existing table,
[`dbCreateTable()`](https://dbi.r-dbi.org/dev/reference/dbCreateTable.md)
or
[`dbCreateTableArrow()`](https://dbi.r-dbi.org/dev/reference/dbCreateTableArrow.md)
for creating a table, and
[`dbExistsTable()`](https://dbi.r-dbi.org/dev/reference/dbExistsTable.md)
and
[`dbRemoveTable()`](https://dbi.r-dbi.org/dev/reference/dbRemoveTable.md)
for overwriting tables.

DBI only standardizes writing data frames with
[`dbWriteTable()`](https://dbi.r-dbi.org/dev/reference/dbWriteTable.md).
Some backends might implement methods that can consume CSV files or
other data formats. For details, see the documentation for the
individual methods.

### Value

[`dbWriteTable()`](https://dbi.r-dbi.org/dev/reference/dbWriteTable.md)
returns `TRUE`, invisibly.

### Failure modes

If the table exists, and both `append` and `overwrite` arguments are
unset, or `append = TRUE` and the data frame with the new data has
different column names, an error is raised; the remote table remains
unchanged.

An error is raised when calling this method for a closed or invalid
connection. An error is also raised if `name` cannot be processed with
[`dbQuoteIdentifier()`](https://dbi.r-dbi.org/dev/reference/dbQuoteIdentifier.md)
or if this results in a non-scalar. Invalid values for the additional
arguments `row.names`, `overwrite`, `append`, `field.types`, and
`temporary` (non-scalars, unsupported data types, `NA`, incompatible
values, duplicate or missing names, incompatible columns) also raise an
error.

### Examples

``` r
con <- dbConnect(RSQLite::SQLite(), ":memory:")

dbWriteTable(con, "mtcars", mtcars[1:5, ])
dbReadTable(con, "mtcars")

dbWriteTable(con, "mtcars", mtcars[6:10, ], append = TRUE)
dbReadTable(con, "mtcars")

dbWriteTable(con, "mtcars", mtcars[1:10, ], overwrite = TRUE)
dbReadTable(con, "mtcars")

# No row names
dbWriteTable(con, "mtcars", mtcars[1:10, ], overwrite = TRUE, row.names = FALSE)
dbReadTable(con, "mtcars")
```

## Create a table in the database

This section describes the behavior of the following method:

``` r
dbCreateTable(conn, name, fields, ..., row.names = NULL, temporary = FALSE)
```

### Description

The default
[`dbCreateTable()`](https://dbi.r-dbi.org/dev/reference/dbCreateTable.md)
method calls
[`sqlCreateTable()`](https://dbi.r-dbi.org/dev/reference/sqlCreateTable.md)
and [`dbExecute()`](https://dbi.r-dbi.org/dev/reference/dbExecute.md).
Use
[`dbCreateTableArrow()`](https://dbi.r-dbi.org/dev/reference/dbCreateTableArrow.md)
to create a table from an Arrow schema.

### Arguments

[TABLE]

### Additional arguments

The following arguments are not part of the
[`dbCreateTable()`](https://dbi.r-dbi.org/dev/reference/dbCreateTable.md)
generic (to improve compatibility across backends) but are part of the
DBI specification:

- `temporary` (default: `FALSE`)

They must be provided as named arguments. See the “Specification” and
“Value” sections for details on their usage.

### Specification

The `name` argument is processed as follows, to support databases that
allow non-syntactic names for their objects:

- If an unquoted table name as string:
  [`dbCreateTable()`](https://dbi.r-dbi.org/dev/reference/dbCreateTable.md)
  will do the quoting, perhaps by calling
  `dbQuoteIdentifier(conn, x = name)`

- If the result of a call to
  [`dbQuoteIdentifier()`](https://dbi.r-dbi.org/dev/reference/dbQuoteIdentifier.md):
  no more quoting is done

The `value` argument can be:

- a data frame,

- a named list of SQL types

If the `temporary` argument is `TRUE`, the table is not available in a
second connection and is gone after reconnecting. Not all backends
support this argument. A regular, non-temporary table is visible in a
second connection, in a pre-existing connection, and after reconnecting
to the database.

SQL keywords can be used freely in table names, column names, and data.
Quotes, commas, and spaces can also be used for table names and column
names, if the database supports non-syntactic identifiers.

The `row.names` argument must be missing or `NULL`, the default value.
All other values for the `row.names` argument (in particular `TRUE`,
`NA`, and a string) raise an error.

### Details

Backends compliant to ANSI SQL 99 don’t need to override it. Backends
with a different SQL syntax can override
[`sqlCreateTable()`](https://dbi.r-dbi.org/dev/reference/sqlCreateTable.md),
backends with entirely different ways to create tables need to override
this method.

The `row.names` argument is not supported by this method. Process the
values with
[`sqlRownamesToColumn()`](https://dbi.r-dbi.org/dev/reference/rownames.md)
before calling this method.

The argument order is different from the
[`sqlCreateTable()`](https://dbi.r-dbi.org/dev/reference/sqlCreateTable.md)
method, the latter will be adapted in a later release of DBI.

### Value

[`dbCreateTable()`](https://dbi.r-dbi.org/dev/reference/dbCreateTable.md)
returns `TRUE`, invisibly.

### Failure modes

If the table exists, an error is raised; the remote table remains
unchanged.

An error is raised when calling this method for a closed or invalid
connection. An error is also raised if `name` cannot be processed with
[`dbQuoteIdentifier()`](https://dbi.r-dbi.org/dev/reference/dbQuoteIdentifier.md)
or if this results in a non-scalar. Invalid values for the `row.names`
and `temporary` arguments (non-scalars, unsupported data types, `NA`,
incompatible values, duplicate names) also raise an error.

### Examples

``` r
con <- dbConnect(RSQLite::SQLite(), ":memory:")
dbCreateTable(con, "iris", iris)
dbReadTable(con, "iris")
dbDisconnect(con)
```

## Insert rows into a table

This section describes the behavior of the following method:

``` r
dbAppendTable(conn, name, value, ..., row.names = NULL)
```

### Description

The
[`dbAppendTable()`](https://dbi.r-dbi.org/dev/reference/dbAppendTable.md)
method assumes that the table has been created beforehand, e.g. with
[`dbCreateTable()`](https://dbi.r-dbi.org/dev/reference/dbCreateTable.md).
The default implementation calls
[`sqlAppendTableTemplate()`](https://dbi.r-dbi.org/dev/reference/sqlAppendTable.md)
and then
[`dbExecute()`](https://dbi.r-dbi.org/dev/reference/dbExecute.md) with
the `param` argument. Use
[`dbAppendTableArrow()`](https://dbi.r-dbi.org/dev/reference/dbAppendTableArrow.md)
to append data from an Arrow stream.

### Arguments

[TABLE]

### Details

Backends compliant to ANSI SQL 99 which use `⁠?⁠` as a placeholder for
prepared queries don’t need to override it. Backends with a different
SQL syntax which use `⁠?⁠` as a placeholder for prepared queries can
override
[`sqlAppendTable()`](https://dbi.r-dbi.org/dev/reference/sqlAppendTable.md).
Other backends (with different placeholders or with entirely different
ways to create tables) need to override the
[`dbAppendTable()`](https://dbi.r-dbi.org/dev/reference/dbAppendTable.md)
method.

The `row.names` argument is not supported by this method. Process the
values with
[`sqlRownamesToColumn()`](https://dbi.r-dbi.org/dev/reference/rownames.md)
before calling this method.

### Value

[`dbAppendTable()`](https://dbi.r-dbi.org/dev/reference/dbAppendTable.md)
returns a scalar numeric.

### Failure modes

If the table does not exist, or the new data in `values` is not a data
frame or has different column names, an error is raised; the remote
table remains unchanged.

An error is raised when calling this method for a closed or invalid
connection. An error is also raised if `name` cannot be processed with
[`dbQuoteIdentifier()`](https://dbi.r-dbi.org/dev/reference/dbQuoteIdentifier.md)
or if this results in a non-scalar. Invalid values for the `row.names`
argument (non-scalars, unsupported data types, `NA`) also raise an
error.

Passing a `value` argument different to `NULL` to the `row.names`
argument (in particular `TRUE`, `NA`, and a string) raises an error.

### Specification

SQL keywords can be used freely in table names, column names, and data.
Quotes, commas, spaces, and other special characters such as newlines
and tabs, can also be used in the data, and, if the database supports
non-syntactic identifiers, also for table names and column names.

The following data types must be supported at least, and be read
identically with
[`dbReadTable()`](https://dbi.r-dbi.org/dev/reference/dbReadTable.md):

- integer

- numeric (the behavior for `Inf` and `NaN` is not specified)

- logical

- `NA` as NULL

- 64-bit values (using `"bigint"` as field type); the result can be

  - converted to a numeric, which may lose precision,

  - converted a character vector, which gives the full decimal
    representation

  - written to another table and read again unchanged

- character (in both UTF-8 and native encodings), supporting empty
  strings (before and after non-empty strings)

- factor (returned as character, with a warning)

- list of raw (if supported by the database)

- objects of type <blob::blob> (if supported by the database)

- date (if supported by the database; returned as `Date`) also for dates
  prior to 1970 or 1900 or after 2038

- time (if supported by the database; returned as objects that inherit
  from `difftime`)

- timestamp (if supported by the database; returned as `POSIXct`
  respecting the time zone but not necessarily preserving the input time
  zone), also for timestamps prior to 1970 or 1900 or after 2038
  respecting the time zone but not necessarily preserving the input time
  zone)

Mixing column types in the same table is supported.

The `name` argument is processed as follows, to support databases that
allow non-syntactic names for their objects:

- If an unquoted table name as string:
  [`dbAppendTable()`](https://dbi.r-dbi.org/dev/reference/dbAppendTable.md)
  will do the quoting, perhaps by calling
  `dbQuoteIdentifier(conn, x = name)`

- If the result of a call to
  [`dbQuoteIdentifier()`](https://dbi.r-dbi.org/dev/reference/dbQuoteIdentifier.md):
  no more quoting is done to support databases that allow non-syntactic
  names for their objects:

The `row.names` argument must be `NULL`, the default value. Row names
are ignored.

The `value` argument must be a data frame with a subset of the columns
of the existing table. The order of the columns does not matter.

### Examples

``` r
con <- dbConnect(RSQLite::SQLite(), ":memory:")
dbCreateTable(con, "iris", iris)
dbAppendTable(con, "iris", iris)
dbReadTable(con, "iris")
dbDisconnect(con)
```

## Remove a table from the database

This section describes the behavior of the following method:

``` r
dbRemoveTable(conn, name, ...)
```

### Description

Remove a remote table (e.g., created by
[`dbWriteTable()`](https://dbi.r-dbi.org/dev/reference/dbWriteTable.md))
from the database.

### Arguments

[TABLE]

### Additional arguments

The following arguments are not part of the
[`dbRemoveTable()`](https://dbi.r-dbi.org/dev/reference/dbRemoveTable.md)
generic (to improve compatibility across backends) but are part of the
DBI specification:

- `temporary` (default: `FALSE`)

- `fail_if_missing` (default: `TRUE`)

These arguments must be provided as named arguments.

If `temporary` is `TRUE`, the call to
[`dbRemoveTable()`](https://dbi.r-dbi.org/dev/reference/dbRemoveTable.md)
will consider only temporary tables. Not all backends support this
argument. In particular, permanent tables of the same name are left
untouched.

If `fail_if_missing` is `FALSE`, the call to
[`dbRemoveTable()`](https://dbi.r-dbi.org/dev/reference/dbRemoveTable.md)
succeeds if the table does not exist.

### Specification

A table removed by
[`dbRemoveTable()`](https://dbi.r-dbi.org/dev/reference/dbRemoveTable.md)
doesn’t appear in the list of tables returned by
[`dbListTables()`](https://dbi.r-dbi.org/dev/reference/dbListTables.md),
and
[`dbExistsTable()`](https://dbi.r-dbi.org/dev/reference/dbExistsTable.md)
returns `FALSE`. The removal propagates immediately to other connections
to the same database. This function can also be used to remove a
temporary table.

The `name` argument is processed as follows, to support databases that
allow non-syntactic names for their objects:

- If an unquoted table name as string:
  [`dbRemoveTable()`](https://dbi.r-dbi.org/dev/reference/dbRemoveTable.md)
  will do the quoting, perhaps by calling
  `dbQuoteIdentifier(conn, x = name)`

- If the result of a call to
  [`dbQuoteIdentifier()`](https://dbi.r-dbi.org/dev/reference/dbQuoteIdentifier.md):
  no more quoting is done

### Value

[`dbRemoveTable()`](https://dbi.r-dbi.org/dev/reference/dbRemoveTable.md)
returns `TRUE`, invisibly.

### Failure modes

If the table does not exist, an error is raised. An attempt to remove a
view with this function may result in an error.

An error is raised when calling this method for a closed or invalid
connection. An error is also raised if `name` cannot be processed with
[`dbQuoteIdentifier()`](https://dbi.r-dbi.org/dev/reference/dbQuoteIdentifier.md)
or if this results in a non-scalar.

### Examples

``` r
con <- dbConnect(RSQLite::SQLite(), ":memory:")

dbExistsTable(con, "iris")
dbWriteTable(con, "iris", iris)
dbExistsTable(con, "iris")
dbRemoveTable(con, "iris")
dbExistsTable(con, "iris")

dbDisconnect(con)
```

## List remote tables

This section describes the behavior of the following method:

``` r
dbListTables(conn, ...)
```

### Description

Returns the unquoted names of remote tables accessible through this
connection. This should include views and temporary objects, but not all
database backends (in particular RMariaDB and RMySQL) support this.

### Arguments

|        |                                                                                                           |
|--------|-----------------------------------------------------------------------------------------------------------|
| `conn` | A DBIConnection object, as returned by [`dbConnect()`](https://dbi.r-dbi.org/dev/reference/dbConnect.md). |
| `...`  | Other parameters passed on to methods.                                                                    |

### Value

[`dbListTables()`](https://dbi.r-dbi.org/dev/reference/dbListTables.md)
returns a character vector that enumerates all tables and views in the
database. Tables added with
[`dbWriteTable()`](https://dbi.r-dbi.org/dev/reference/dbWriteTable.md)
are part of the list. As soon a table is removed from the database, it
is also removed from the list of database tables.

The same applies to temporary tables if supported by the database.

The returned names are suitable for quoting with
[`dbQuoteIdentifier()`](https://dbi.r-dbi.org/dev/reference/dbQuoteIdentifier.md).

### Failure modes

An error is raised when calling this method for a closed or invalid
connection.

### Examples

``` r
con <- dbConnect(RSQLite::SQLite(), ":memory:")

dbListTables(con)
dbWriteTable(con, "mtcars", mtcars)
dbListTables(con)

dbDisconnect(con)
```

## List field names of a remote table

This section describes the behavior of the following method:

``` r
dbListFields(conn, name, ...)
```

### Description

Returns the field names of a remote table as a character vector.

### Arguments

[TABLE]

### Value

[`dbListFields()`](https://dbi.r-dbi.org/dev/reference/dbListFields.md)
returns a character vector that enumerates all fields in the table in
the correct order. This also works for temporary tables if supported by
the database. The returned names are suitable for quoting with
[`dbQuoteIdentifier()`](https://dbi.r-dbi.org/dev/reference/dbQuoteIdentifier.md).

### Failure modes

If the table does not exist, an error is raised. Invalid types for the
`name` argument (e.g., `character` of length not equal to one, or
numeric) lead to an error. An error is also raised when calling this
method for a closed or invalid connection.

### Specification

The `name` argument can be

- a string

- the return value of
  [`dbQuoteIdentifier()`](https://dbi.r-dbi.org/dev/reference/dbQuoteIdentifier.md)

- a value from the `table` column from the return value of
  [`dbListObjects()`](https://dbi.r-dbi.org/dev/reference/dbListObjects.md)
  where `is_prefix` is `FALSE`

A column named `row_names` is treated like any other column.

### Examples

``` r
con <- dbConnect(RSQLite::SQLite(), ":memory:")

dbWriteTable(con, "mtcars", mtcars)
dbListFields(con, "mtcars")

dbDisconnect(con)
```

## Does a table exist?

This section describes the behavior of the following method:

``` r
dbExistsTable(conn, name, ...)
```

### Description

Returns if a table given by name exists in the database.

### Arguments

[TABLE]

### Value

[`dbExistsTable()`](https://dbi.r-dbi.org/dev/reference/dbExistsTable.md)
returns a logical scalar, `TRUE` if the table or view specified by the
`name` argument exists, `FALSE` otherwise.

This includes temporary tables if supported by the database.

### Failure modes

An error is raised when calling this method for a closed or invalid
connection. An error is also raised if `name` cannot be processed with
[`dbQuoteIdentifier()`](https://dbi.r-dbi.org/dev/reference/dbQuoteIdentifier.md)
or if this results in a non-scalar.

### Specification

The `name` argument is processed as follows, to support databases that
allow non-syntactic names for their objects:

- If an unquoted table name as string:
  [`dbExistsTable()`](https://dbi.r-dbi.org/dev/reference/dbExistsTable.md)
  will do the quoting, perhaps by calling
  `dbQuoteIdentifier(conn, x = name)`

- If the result of a call to
  [`dbQuoteIdentifier()`](https://dbi.r-dbi.org/dev/reference/dbQuoteIdentifier.md):
  no more quoting is done

For all tables listed by
[`dbListTables()`](https://dbi.r-dbi.org/dev/reference/dbListTables.md),
[`dbExistsTable()`](https://dbi.r-dbi.org/dev/reference/dbExistsTable.md)
returns `TRUE`.

### Examples

``` r
con <- dbConnect(RSQLite::SQLite(), ":memory:")

dbExistsTable(con, "iris")
dbWriteTable(con, "iris", iris)
dbExistsTable(con, "iris")

dbDisconnect(con)
```

## List remote objects

This section describes the behavior of the following method:

``` r
dbListObjects(conn, prefix = NULL, ...)
```

### Description

Returns the names of remote objects accessible through this connection
as a data frame. This should include temporary objects, but not all
database backends (in particular RMariaDB and RMySQL) support this.
Compared to
[`dbListTables()`](https://dbi.r-dbi.org/dev/reference/dbListTables.md),
this method also enumerates tables and views in schemas, and returns
fully qualified identifiers to access these objects. This allows
exploration of all database objects available to the current user,
including those that can only be accessed by giving the full namespace.

### Arguments

|          |                                                                                                                                                                                                                                                                        |
|----------|------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
| `conn`   | A DBIConnection object, as returned by [`dbConnect()`](https://dbi.r-dbi.org/dev/reference/dbConnect.md).                                                                                                                                                              |
| `prefix` | A fully qualified path in the database’s namespace, or `NULL`. This argument will be processed with [`dbUnquoteIdentifier()`](https://dbi.r-dbi.org/dev/reference/dbUnquoteIdentifier.md). If given the method will return all objects accessible through this prefix. |
| `...`    | Other parameters passed on to methods.                                                                                                                                                                                                                                 |

### Value

[`dbListObjects()`](https://dbi.r-dbi.org/dev/reference/dbListObjects.md)
returns a data frame with columns `table` and `is_prefix` (in that
order), optionally with other columns with a dot (`.`) prefix. The
`table` column is of type list. Each object in this list is suitable for
use as argument in
[`dbQuoteIdentifier()`](https://dbi.r-dbi.org/dev/reference/dbQuoteIdentifier.md).
The `is_prefix` column is a logical. This data frame contains one row
for each object (schema, table and view) accessible from the prefix (if
passed) or from the global namespace (if prefix is omitted). Tables
added with
[`dbWriteTable()`](https://dbi.r-dbi.org/dev/reference/dbWriteTable.md)
are part of the data frame. As soon a table is removed from the
database, it is also removed from the data frame of database objects.

The same applies to temporary objects if supported by the database.

The returned names are suitable for quoting with
[`dbQuoteIdentifier()`](https://dbi.r-dbi.org/dev/reference/dbQuoteIdentifier.md).

### Failure modes

An error is raised when calling this method for a closed or invalid
connection.

### Specification

The `prefix` column indicates if the `table` value refers to a table or
a prefix. For a call with the default `prefix = NULL`, the `table`
values that have `is_prefix == FALSE` correspond to the tables returned
from
[`dbListTables()`](https://dbi.r-dbi.org/dev/reference/dbListTables.md),

The `table` object can be quoted with
[`dbQuoteIdentifier()`](https://dbi.r-dbi.org/dev/reference/dbQuoteIdentifier.md).
The result of quoting can be passed to
[`dbUnquoteIdentifier()`](https://dbi.r-dbi.org/dev/reference/dbUnquoteIdentifier.md).
(For backends it may be convenient to use the Id class, but this is not
required.)

Values in `table` column that have `is_prefix == TRUE` can be passed as
the `prefix` argument to another call to
[`dbListObjects()`](https://dbi.r-dbi.org/dev/reference/dbListObjects.md).
For the data frame returned from a `dbListObject()` call with the
`prefix` argument set, all `table` values where `is_prefix` is `FALSE`
can be used in a call to
[`dbExistsTable()`](https://dbi.r-dbi.org/dev/reference/dbExistsTable.md)
which returns `TRUE`.

### Examples

``` r
con <- dbConnect(RSQLite::SQLite(), ":memory:")

dbListObjects(con)
dbWriteTable(con, "mtcars", mtcars)
dbListObjects(con)

dbDisconnect(con)
```

## Is this DBMS object still valid?

This section describes the behavior of the following method:

``` r
dbIsValid(dbObj, ...)
```

### Description

This generic tests whether a database object is still valid (i.e. it
hasn’t been disconnected or cleared).

### Arguments

|         |                                                                                    |
|---------|------------------------------------------------------------------------------------|
| `dbObj` | An object inheriting from DBIObject, i.e. DBIDriver, DBIConnection, or a DBIResult |
| `...`   | Other arguments to methods.                                                        |

### Value

[`dbIsValid()`](https://dbi.r-dbi.org/dev/reference/dbIsValid.md)
returns a logical scalar, `TRUE` if the object specified by `dbObj` is
valid, `FALSE` otherwise. A DBIConnection object is initially valid, and
becomes invalid after disconnecting with
[`dbDisconnect()`](https://dbi.r-dbi.org/dev/reference/dbDisconnect.md).
For an invalid connection object (e.g., for some drivers if the object
is saved to a file and then restored), the method also returns `FALSE`.
A DBIResult object is valid after a call to
[`dbSendQuery()`](https://dbi.r-dbi.org/dev/reference/dbSendQuery.md),
and stays valid even after all rows have been fetched; only clearing it
with
[`dbClearResult()`](https://dbi.r-dbi.org/dev/reference/dbClearResult.md)
invalidates it. A DBIResult object is also valid after a call to
[`dbSendStatement()`](https://dbi.r-dbi.org/dev/reference/dbSendStatement.md),
and stays valid after querying the number of rows affected; only
clearing it with
[`dbClearResult()`](https://dbi.r-dbi.org/dev/reference/dbClearResult.md)
invalidates it. If the connection to the database system is dropped
(e.g., due to connectivity problems, server failure, etc.),
[`dbIsValid()`](https://dbi.r-dbi.org/dev/reference/dbIsValid.md) should
return `FALSE`. This is not tested automatically.

### Examples

``` r
dbIsValid(RSQLite::SQLite())

con <- dbConnect(RSQLite::SQLite(), ":memory:")
dbIsValid(con)

rs <- dbSendQuery(con, "SELECT 1")
dbIsValid(rs)

dbClearResult(rs)
dbIsValid(rs)

dbDisconnect(con)
dbIsValid(con)
```

## Completion status

This section describes the behavior of the following method:

``` r
dbHasCompleted(res, ...)
```

### Description

This method returns if the operation has completed. A `SELECT` query is
completed if all rows have been fetched. A data manipulation statement
is always completed.

### Arguments

|       |                                       |
|-------|---------------------------------------|
| `res` | An object inheriting from DBIResult.  |
| `...` | Other arguments passed on to methods. |

### Value

[`dbHasCompleted()`](https://dbi.r-dbi.org/dev/reference/dbHasCompleted.md)
returns a logical scalar. For a query initiated by
[`dbSendQuery()`](https://dbi.r-dbi.org/dev/reference/dbSendQuery.md)
with non-empty result set,
[`dbHasCompleted()`](https://dbi.r-dbi.org/dev/reference/dbHasCompleted.md)
returns `FALSE` initially and `TRUE` after calling
[`dbFetch()`](https://dbi.r-dbi.org/dev/reference/dbFetch.md) without
limit. For a query initiated by
[`dbSendStatement()`](https://dbi.r-dbi.org/dev/reference/dbSendStatement.md),
[`dbHasCompleted()`](https://dbi.r-dbi.org/dev/reference/dbHasCompleted.md)
always returns `TRUE`.

### The data retrieval flow

This section gives a complete overview over the flow for the execution
of queries that return tabular data as data frames.

Most of this flow, except repeated calling of
[`dbBind()`](https://dbi.r-dbi.org/dev/reference/dbBind.md) or
[`dbBindArrow()`](https://dbi.r-dbi.org/dev/reference/dbBind.md), is
implemented by
[`dbGetQuery()`](https://dbi.r-dbi.org/dev/reference/dbGetQuery.md),
which should be sufficient unless you want to access the results in a
paged way or you have a parameterized query that you want to reuse. This
flow requires an active connection established by
[`dbConnect()`](https://dbi.r-dbi.org/dev/reference/dbConnect.md). See
also `vignette("dbi-advanced")` for a walkthrough.

1.  Use
    [`dbSendQuery()`](https://dbi.r-dbi.org/dev/reference/dbSendQuery.md)
    to create a result set object of class DBIResult.

2.  Optionally, bind query parameters with
    [`dbBind()`](https://dbi.r-dbi.org/dev/reference/dbBind.md) or
    [`dbBindArrow()`](https://dbi.r-dbi.org/dev/reference/dbBind.md).
    This is required only if the query contains placeholders such as `⁠?⁠`
    or `⁠\$1⁠`, depending on the database backend.

3.  Optionally, use
    [`dbColumnInfo()`](https://dbi.r-dbi.org/dev/reference/dbColumnInfo.md)
    to retrieve the structure of the result set without retrieving
    actual data.

4.  Use [`dbFetch()`](https://dbi.r-dbi.org/dev/reference/dbFetch.md) to
    get the entire result set, a page of results, or the remaining rows.
    Fetching zero rows is also possible to retrieve the structure of the
    result set as a data frame. This step can be called multiple times.
    Only forward paging is supported, you need to cache previous pages
    if you need to navigate backwards.

5.  Use
    [`dbHasCompleted()`](https://dbi.r-dbi.org/dev/reference/dbHasCompleted.md)
    to tell when you’re done. This method returns `TRUE` if no more rows
    are available for fetching.

6.  Repeat the last four steps as necessary.

7.  Use
    [`dbClearResult()`](https://dbi.r-dbi.org/dev/reference/dbClearResult.md)
    to clean up the result set object. This step is mandatory even if no
    rows have been fetched or if an error has occurred during the
    processing. It is good practice to use
    [`on.exit()`](https://rdrr.io/r/base/on.exit.html) or
    [`withr::defer()`](https://withr.r-lib.org/reference/defer.html) to
    ensure that this step is always executed.

### Failure modes

Attempting to query completion status for a result set cleared with
[`dbClearResult()`](https://dbi.r-dbi.org/dev/reference/dbClearResult.md)
gives an error.

### Specification

The completion status for a query is only guaranteed to be set to
`FALSE` after attempting to fetch past the end of the entire result.
Therefore, for a query with an empty result set, the initial return
value is unspecified, but the result value is `TRUE` after trying to
fetch only one row.

Similarly, for a query with a result set of length n, the return value
is unspecified after fetching n rows, but the result value is `TRUE`
after trying to fetch only one more row.

### Examples

``` r
con <- dbConnect(RSQLite::SQLite(), ":memory:")

dbWriteTable(con, "mtcars", mtcars)
rs <- dbSendQuery(con, "SELECT * FROM mtcars")

dbHasCompleted(rs)
ret1 <- dbFetch(rs, 10)
dbHasCompleted(rs)
ret2 <- dbFetch(rs)
dbHasCompleted(rs)

dbClearResult(rs)
dbDisconnect(con)
```

## Get the statement associated with a result set

This section describes the behavior of the following method:

``` r
dbGetStatement(res, ...)
```

### Description

Returns the statement that was passed to
[`dbSendQuery()`](https://dbi.r-dbi.org/dev/reference/dbSendQuery.md) or
[`dbSendStatement()`](https://dbi.r-dbi.org/dev/reference/dbSendStatement.md).

### Arguments

|       |                                       |
|-------|---------------------------------------|
| `res` | An object inheriting from DBIResult.  |
| `...` | Other arguments passed on to methods. |

### Value

[`dbGetStatement()`](https://dbi.r-dbi.org/dev/reference/dbGetStatement.md)
returns a string, the query used in either
[`dbSendQuery()`](https://dbi.r-dbi.org/dev/reference/dbSendQuery.md) or
[`dbSendStatement()`](https://dbi.r-dbi.org/dev/reference/dbSendStatement.md).

### Failure modes

Attempting to query the statement for a result set cleared with
[`dbClearResult()`](https://dbi.r-dbi.org/dev/reference/dbClearResult.md)
gives an error.

### Examples

``` r
con <- dbConnect(RSQLite::SQLite(), ":memory:")

dbWriteTable(con, "mtcars", mtcars)
rs <- dbSendQuery(con, "SELECT * FROM mtcars")
dbGetStatement(rs)

dbClearResult(rs)
dbDisconnect(con)
```

## The number of rows fetched so far

This section describes the behavior of the following method:

``` r
dbGetRowCount(res, ...)
```

### Description

Returns the total number of rows actually fetched with calls to
[`dbFetch()`](https://dbi.r-dbi.org/dev/reference/dbFetch.md) for this
result set.

### Arguments

|       |                                       |
|-------|---------------------------------------|
| `res` | An object inheriting from DBIResult.  |
| `...` | Other arguments passed on to methods. |

### Value

[`dbGetRowCount()`](https://dbi.r-dbi.org/dev/reference/dbGetRowCount.md)
returns a scalar number (integer or numeric), the number of rows fetched
so far. After calling
[`dbSendQuery()`](https://dbi.r-dbi.org/dev/reference/dbSendQuery.md),
the row count is initially zero. After a call to
[`dbFetch()`](https://dbi.r-dbi.org/dev/reference/dbFetch.md) without
limit, the row count matches the total number of rows returned. Fetching
a limited number of rows increases the number of rows by the number of
rows returned, even if fetching past the end of the result set. For
queries with an empty result set, zero is returned even after fetching.
For data manipulation statements issued with
[`dbSendStatement()`](https://dbi.r-dbi.org/dev/reference/dbSendStatement.md),
zero is returned before and after calling
[`dbFetch()`](https://dbi.r-dbi.org/dev/reference/dbFetch.md).

### Failure modes

Attempting to get the row count for a result set cleared with
[`dbClearResult()`](https://dbi.r-dbi.org/dev/reference/dbClearResult.md)
gives an error.

### Examples

``` r
con <- dbConnect(RSQLite::SQLite(), ":memory:")

dbWriteTable(con, "mtcars", mtcars)
rs <- dbSendQuery(con, "SELECT * FROM mtcars")

dbGetRowCount(rs)
ret1 <- dbFetch(rs, 10)
dbGetRowCount(rs)
ret2 <- dbFetch(rs)
dbGetRowCount(rs)
nrow(ret1) + nrow(ret2)

dbClearResult(rs)
dbDisconnect(con)
```

## The number of rows affected

This section describes the behavior of the following method:

``` r
dbGetRowsAffected(res, ...)
```

### Description

This method returns the number of rows that were added, deleted, or
updated by a data manipulation statement.

### Arguments

|       |                                       |
|-------|---------------------------------------|
| `res` | An object inheriting from DBIResult.  |
| `...` | Other arguments passed on to methods. |

### Value

[`dbGetRowsAffected()`](https://dbi.r-dbi.org/dev/reference/dbGetRowsAffected.md)
returns a scalar number (integer or numeric), the number of rows
affected by a data manipulation statement issued with
[`dbSendStatement()`](https://dbi.r-dbi.org/dev/reference/dbSendStatement.md).
The value is available directly after the call and does not change after
calling [`dbFetch()`](https://dbi.r-dbi.org/dev/reference/dbFetch.md).
`NA_integer_` or `NA_numeric_` are allowed if the number of rows
affected is not known.

For queries issued with
[`dbSendQuery()`](https://dbi.r-dbi.org/dev/reference/dbSendQuery.md),
zero is returned before and after the call to
[`dbFetch()`](https://dbi.r-dbi.org/dev/reference/dbFetch.md). `NA`
values are not allowed.

### The command execution flow

This section gives a complete overview over the flow for the execution
of SQL statements that have side effects such as stored procedures,
inserting or deleting data, or setting database or connection options.
Most of this flow, except repeated calling of
[`dbBindArrow()`](https://dbi.r-dbi.org/dev/reference/dbBind.md), is
implemented by
[`dbExecute()`](https://dbi.r-dbi.org/dev/reference/dbExecute.md), which
should be sufficient for non-parameterized queries. This flow requires
an active connection established by
[`dbConnect()`](https://dbi.r-dbi.org/dev/reference/dbConnect.md). See
also `vignette("dbi-advanced")` for a walkthrough.

1.  Use
    [`dbSendStatement()`](https://dbi.r-dbi.org/dev/reference/dbSendStatement.md)
    to create a result set object of class DBIResult. For some queries
    you need to pass `immediate = TRUE`.

2.  Optionally, bind query parameters
    with[`dbBind()`](https://dbi.r-dbi.org/dev/reference/dbBind.md) or
    [`dbBindArrow()`](https://dbi.r-dbi.org/dev/reference/dbBind.md).
    This is required only if the query contains placeholders such as `⁠?⁠`
    or `⁠\$1⁠`, depending on the database backend.

3.  Optionally, use
    [`dbGetRowsAffected()`](https://dbi.r-dbi.org/dev/reference/dbGetRowsAffected.md)
    to retrieve the number of rows affected by the query.

4.  Repeat the last two steps as necessary.

5.  Use
    [`dbClearResult()`](https://dbi.r-dbi.org/dev/reference/dbClearResult.md)
    to clean up the result set object. This step is mandatory even if no
    rows have been fetched or if an error has occurred during the
    processing. It is good practice to use
    [`on.exit()`](https://rdrr.io/r/base/on.exit.html) or
    [`withr::defer()`](https://withr.r-lib.org/reference/defer.html) to
    ensure that this step is always executed.

### Failure modes

Attempting to get the rows affected for a result set cleared with
[`dbClearResult()`](https://dbi.r-dbi.org/dev/reference/dbClearResult.md)
gives an error.

### Examples

``` r
con <- dbConnect(RSQLite::SQLite(), ":memory:")

dbWriteTable(con, "mtcars", mtcars)
rs <- dbSendStatement(con, "DELETE FROM mtcars")
dbGetRowsAffected(rs)
nrow(mtcars)

dbClearResult(rs)
dbDisconnect(con)
```

## Information about result types

This section describes the behavior of the following method:

``` r
dbColumnInfo(res, ...)
```

### Description

Produces a data.frame that describes the output of a query. The
data.frame should have as many rows as there are output fields in the
result set, and each column in the data.frame describes an aspect of the
result set field (field name, type, etc.)

### Arguments

|       |                                       |
|-------|---------------------------------------|
| `res` | An object inheriting from DBIResult.  |
| `...` | Other arguments passed on to methods. |

### Value

[`dbColumnInfo()`](https://dbi.r-dbi.org/dev/reference/dbColumnInfo.md)
returns a data frame with at least two columns `"name"` and `"type"` (in
that order) (and optional columns that start with a dot). The `"name"`
and `"type"` columns contain the names and types of the R columns of the
data frame that is returned from
[`dbFetch()`](https://dbi.r-dbi.org/dev/reference/dbFetch.md). The
`"type"` column is of type `character` and only for information. Do not
compute on the `"type"` column, instead use `dbFetch(res, n = 0)` to
create a zero-row data frame initialized with the correct data types.

### The data retrieval flow

This section gives a complete overview over the flow for the execution
of queries that return tabular data as data frames.

Most of this flow, except repeated calling of
[`dbBind()`](https://dbi.r-dbi.org/dev/reference/dbBind.md) or
[`dbBindArrow()`](https://dbi.r-dbi.org/dev/reference/dbBind.md), is
implemented by
[`dbGetQuery()`](https://dbi.r-dbi.org/dev/reference/dbGetQuery.md),
which should be sufficient unless you want to access the results in a
paged way or you have a parameterized query that you want to reuse. This
flow requires an active connection established by
[`dbConnect()`](https://dbi.r-dbi.org/dev/reference/dbConnect.md). See
also `vignette("dbi-advanced")` for a walkthrough.

1.  Use
    [`dbSendQuery()`](https://dbi.r-dbi.org/dev/reference/dbSendQuery.md)
    to create a result set object of class DBIResult.

2.  Optionally, bind query parameters with
    [`dbBind()`](https://dbi.r-dbi.org/dev/reference/dbBind.md) or
    [`dbBindArrow()`](https://dbi.r-dbi.org/dev/reference/dbBind.md).
    This is required only if the query contains placeholders such as `⁠?⁠`
    or `⁠\$1⁠`, depending on the database backend.

3.  Optionally, use
    [`dbColumnInfo()`](https://dbi.r-dbi.org/dev/reference/dbColumnInfo.md)
    to retrieve the structure of the result set without retrieving
    actual data.

4.  Use [`dbFetch()`](https://dbi.r-dbi.org/dev/reference/dbFetch.md) to
    get the entire result set, a page of results, or the remaining rows.
    Fetching zero rows is also possible to retrieve the structure of the
    result set as a data frame. This step can be called multiple times.
    Only forward paging is supported, you need to cache previous pages
    if you need to navigate backwards.

5.  Use
    [`dbHasCompleted()`](https://dbi.r-dbi.org/dev/reference/dbHasCompleted.md)
    to tell when you’re done. This method returns `TRUE` if no more rows
    are available for fetching.

6.  Repeat the last four steps as necessary.

7.  Use
    [`dbClearResult()`](https://dbi.r-dbi.org/dev/reference/dbClearResult.md)
    to clean up the result set object. This step is mandatory even if no
    rows have been fetched or if an error has occurred during the
    processing. It is good practice to use
    [`on.exit()`](https://rdrr.io/r/base/on.exit.html) or
    [`withr::defer()`](https://withr.r-lib.org/reference/defer.html) to
    ensure that this step is always executed.

### Failure modes

An attempt to query columns for a closed result set raises an error.

### Specification

A column named `row_names` is treated like any other column.

The column names are always consistent with the data returned by
[`dbFetch()`](https://dbi.r-dbi.org/dev/reference/dbFetch.md).

If the query returns unnamed columns, non-empty and non-`NA` names are
assigned.

Column names that correspond to SQL or R keywords are left unchanged.

### Examples

``` r
con <- dbConnect(RSQLite::SQLite(), ":memory:")

rs <- dbSendQuery(con, "SELECT 1 AS a, 2 AS b")
dbColumnInfo(rs)
dbFetch(rs)

dbClearResult(rs)
dbDisconnect(con)
```

## Begin/commit/rollback SQL transactions

This section describes the behavior of the following methods:

``` r
dbBegin(conn, ...)

dbCommit(conn, ...)

dbRollback(conn, ...)
```

### Description

A transaction encapsulates several SQL statements in an atomic unit. It
is initiated with
[`dbBegin()`](https://dbi.r-dbi.org/dev/reference/transactions.md) and
either made persistent with
[`dbCommit()`](https://dbi.r-dbi.org/dev/reference/transactions.md) or
undone with
[`dbRollback()`](https://dbi.r-dbi.org/dev/reference/transactions.md).
In any case, the DBMS guarantees that either all or none of the
statements have a permanent effect. This helps ensuring consistency of
write operations to multiple tables.

### Arguments

|        |                                                                                                           |
|--------|-----------------------------------------------------------------------------------------------------------|
| `conn` | A DBIConnection object, as returned by [`dbConnect()`](https://dbi.r-dbi.org/dev/reference/dbConnect.md). |
| `...`  | Other parameters passed on to methods.                                                                    |

### Details

Not all database engines implement transaction management, in which case
these methods should not be implemented for the specific DBIConnection
subclass.

### Value

[`dbBegin()`](https://dbi.r-dbi.org/dev/reference/transactions.md),
[`dbCommit()`](https://dbi.r-dbi.org/dev/reference/transactions.md) and
[`dbRollback()`](https://dbi.r-dbi.org/dev/reference/transactions.md)
return `TRUE`, invisibly.

### Failure modes

The implementations are expected to raise an error in case of failure,
but this is not tested. In any way, all generics throw an error with a
closed or invalid connection. In addition, a call to
[`dbCommit()`](https://dbi.r-dbi.org/dev/reference/transactions.md) or
[`dbRollback()`](https://dbi.r-dbi.org/dev/reference/transactions.md)
without a prior call to
[`dbBegin()`](https://dbi.r-dbi.org/dev/reference/transactions.md)
raises an error. Nested transactions are not supported by DBI, an
attempt to call
[`dbBegin()`](https://dbi.r-dbi.org/dev/reference/transactions.md) twice
yields an error.

### Specification

Actual support for transactions may vary between backends. A transaction
is initiated by a call to
[`dbBegin()`](https://dbi.r-dbi.org/dev/reference/transactions.md) and
committed by a call to
[`dbCommit()`](https://dbi.r-dbi.org/dev/reference/transactions.md).
Data written in a transaction must persist after the transaction is
committed. For example, a record that is missing when the transaction is
started but is created during the transaction must exist both during and
after the transaction, and also in a new connection.

A transaction can also be aborted with
[`dbRollback()`](https://dbi.r-dbi.org/dev/reference/transactions.md).
All data written in such a transaction must be removed after the
transaction is rolled back. For example, a record that is missing when
the transaction is started but is created during the transaction must
not exist anymore after the rollback.

Disconnection from a connection with an open transaction effectively
rolls back the transaction. All data written in such a transaction must
be removed after the transaction is rolled back.

The behavior is not specified if other arguments are passed to these
functions. In particular, RSQLite issues named transactions with support
for nesting if the `name` argument is set.

The transaction isolation level is not specified by DBI.

### Examples

``` r
con <- dbConnect(RSQLite::SQLite(), ":memory:")

dbWriteTable(con, "cash", data.frame(amount = 100))
dbWriteTable(con, "account", data.frame(amount = 2000))

# All operations are carried out as logical unit:
dbBegin(con)
withdrawal <- 300
dbExecute(con, "UPDATE cash SET amount = amount + ?", list(withdrawal))
dbExecute(con, "UPDATE account SET amount = amount - ?", list(withdrawal))
dbCommit(con)

dbReadTable(con, "cash")
dbReadTable(con, "account")

# Rolling back after detecting negative value on account:
dbBegin(con)
withdrawal <- 5000
dbExecute(con, "UPDATE cash SET amount = amount + ?", list(withdrawal))
dbExecute(con, "UPDATE account SET amount = amount - ?", list(withdrawal))
if (dbReadTable(con, "account")\$amount >= 0) {
  dbCommit(con)
} else {
  dbRollback(con)
}

dbReadTable(con, "cash")
dbReadTable(con, "account")

dbDisconnect(con)
```

## Self-contained SQL transactions

This section describes the behavior of the following methods:

``` r
dbWithTransaction(conn, code, ...)

dbBreak()
```

### Description

Given that transactions are implemented, this function allows you to
pass in code that is run in a transaction. The default method of
[`dbWithTransaction()`](https://dbi.r-dbi.org/dev/reference/dbWithTransaction.md)
calls [`dbBegin()`](https://dbi.r-dbi.org/dev/reference/transactions.md)
before executing the code, and
[`dbCommit()`](https://dbi.r-dbi.org/dev/reference/transactions.md)
after successful completion, or
[`dbRollback()`](https://dbi.r-dbi.org/dev/reference/transactions.md) in
case of an error. The advantage is that you don’t have to remember to do
[`dbBegin()`](https://dbi.r-dbi.org/dev/reference/transactions.md) and
[`dbCommit()`](https://dbi.r-dbi.org/dev/reference/transactions.md) or
[`dbRollback()`](https://dbi.r-dbi.org/dev/reference/transactions.md) –
that is all taken care of. The special function
[`dbBreak()`](https://dbi.r-dbi.org/dev/reference/dbWithTransaction.md)
allows an early exit with rollback, it can be called only inside
[`dbWithTransaction()`](https://dbi.r-dbi.org/dev/reference/dbWithTransaction.md).

### Arguments

|        |                                                                                                           |
|--------|-----------------------------------------------------------------------------------------------------------|
| `conn` | A DBIConnection object, as returned by [`dbConnect()`](https://dbi.r-dbi.org/dev/reference/dbConnect.md). |
| `code` | An arbitrary block of R code.                                                                             |
| `...`  | Other parameters passed on to methods.                                                                    |

### Details

DBI implements
[`dbWithTransaction()`](https://dbi.r-dbi.org/dev/reference/dbWithTransaction.md),
backends should need to override this generic only if they implement
specialized handling.

### Value

[`dbWithTransaction()`](https://dbi.r-dbi.org/dev/reference/dbWithTransaction.md)
returns the value of the executed code.

### Failure modes

Failure to initiate the transaction (e.g., if the connection is closed
or invalid or if
[`dbBegin()`](https://dbi.r-dbi.org/dev/reference/transactions.md) has
been called already) gives an error.

### Specification

[`dbWithTransaction()`](https://dbi.r-dbi.org/dev/reference/dbWithTransaction.md)
initiates a transaction with
[`dbBegin()`](https://dbi.r-dbi.org/dev/reference/transactions.md),
executes the code given in the `code` argument, and commits the
transaction with
[`dbCommit()`](https://dbi.r-dbi.org/dev/reference/transactions.md). If
the code raises an error, the transaction is instead aborted with
[`dbRollback()`](https://dbi.r-dbi.org/dev/reference/transactions.md),
and the error is propagated. If the code calls
[`dbBreak()`](https://dbi.r-dbi.org/dev/reference/dbWithTransaction.md),
execution of the code stops and the transaction is silently aborted. All
side effects caused by the code (such as the creation of new variables)
propagate to the calling environment.

### Examples

``` r
con <- dbConnect(RSQLite::SQLite(), ":memory:")

dbWriteTable(con, "cash", data.frame(amount = 100))
dbWriteTable(con, "account", data.frame(amount = 2000))

# All operations are carried out as logical unit:
dbWithTransaction(
  con,
  {
    withdrawal <- 300
    dbExecute(con, "UPDATE cash SET amount = amount + ?", list(withdrawal))
    dbExecute(con, "UPDATE account SET amount = amount - ?", list(withdrawal))
  }
)

# The code is executed as if in the current environment:
withdrawal

# The changes are committed to the database after successful execution:
dbReadTable(con, "cash")
dbReadTable(con, "account")

# Rolling back with dbBreak():
dbWithTransaction(
  con,
  {
    withdrawal <- 5000
    dbExecute(con, "UPDATE cash SET amount = amount + ?", list(withdrawal))
    dbExecute(con, "UPDATE account SET amount = amount - ?", list(withdrawal))
    if (dbReadTable(con, "account")\$amount < 0) {
      dbBreak()
    }
  }
)

# These changes were not committed to the database:
dbReadTable(con, "cash")
dbReadTable(con, "account")

dbDisconnect(con)
```

## Get DBMS metadata

This section describes the behavior of the following method:

``` r
dbGetInfo(dbObj, ...)
```

### Description

Retrieves information on objects of class DBIDriver, DBIConnection or
DBIResult.

### Arguments

|         |                                                                                    |
|---------|------------------------------------------------------------------------------------|
| `dbObj` | An object inheriting from DBIObject, i.e. DBIDriver, DBIConnection, or a DBIResult |
| `...`   | Other arguments to methods.                                                        |

### Value

For objects of class DBIDriver,
[`dbGetInfo()`](https://dbi.r-dbi.org/dev/reference/dbGetInfo.md)
returns a named list that contains at least the following components:

- `driver.version`: the package version of the DBI backend,

- `client.version`: the version of the DBMS client library.

For objects of class DBIConnection,
[`dbGetInfo()`](https://dbi.r-dbi.org/dev/reference/dbGetInfo.md)
returns a named list that contains at least the following components:

- `db.version`: version of the database server,

- `dbname`: database name,

- `username`: username to connect to the database,

- `host`: hostname of the database server,

- `port`: port on the database server. It must not contain a `password`
  component. Components that are not applicable should be set to `NA`.

For objects of class DBIResult,
[`dbGetInfo()`](https://dbi.r-dbi.org/dev/reference/dbGetInfo.md)
returns a named list that contains at least the following components:

- `statatment`: the statement used with
  [`dbSendQuery()`](https://dbi.r-dbi.org/dev/reference/dbSendQuery.md)
  or [`dbExecute()`](https://dbi.r-dbi.org/dev/reference/dbExecute.md),
  as returned by
  [`dbGetStatement()`](https://dbi.r-dbi.org/dev/reference/dbGetStatement.md),

- `row.count`: the number of rows fetched so far (for queries), as
  returned by
  [`dbGetRowCount()`](https://dbi.r-dbi.org/dev/reference/dbGetRowCount.md),

- `rows.affected`: the number of rows affected (for statements), as
  returned by
  [`dbGetRowsAffected()`](https://dbi.r-dbi.org/dev/reference/dbGetRowsAffected.md)

- `has.completed`: a logical that indicates if the query or statement
  has completed, as returned by
  [`dbHasCompleted()`](https://dbi.r-dbi.org/dev/reference/dbHasCompleted.md).

### Implementation notes

The default implementation for `⁠DBIResult objects⁠` constructs such a
list from the return values of the corresponding methods,
[`dbGetStatement()`](https://dbi.r-dbi.org/dev/reference/dbGetStatement.md),
[`dbGetRowCount()`](https://dbi.r-dbi.org/dev/reference/dbGetRowCount.md),
[`dbGetRowsAffected()`](https://dbi.r-dbi.org/dev/reference/dbGetRowsAffected.md),
and
[`dbHasCompleted()`](https://dbi.r-dbi.org/dev/reference/dbHasCompleted.md).

### Examples

``` r
dbGetInfo(RSQLite::SQLite())
```

## Execute a query on a given database connection for retrieval via Arrow

This section describes the behavior of the following method:

``` r
dbSendQueryArrow(conn, statement, ...)
```

### Description

[![Experimental](https://dbi.r-dbi.org/reference/figures/lifecycle-experimental.svg)](https://lifecycle.r-lib.org/articles/stages.html#experimental)

The
[`dbSendQueryArrow()`](https://dbi.r-dbi.org/dev/reference/dbSendQueryArrow.md)
method only submits and synchronously executes the SQL query to the
database engine. It does *not* extract any records — for that you need
to use the
[`dbFetchArrow()`](https://dbi.r-dbi.org/dev/reference/dbFetchArrow.md)
method, and then you must call
[`dbClearResult()`](https://dbi.r-dbi.org/dev/reference/dbClearResult.md)
when you finish fetching the records you need. For interactive use, you
should almost always prefer
[`dbGetQueryArrow()`](https://dbi.r-dbi.org/dev/reference/dbGetQueryArrow.md).
Use
[`dbSendQuery()`](https://dbi.r-dbi.org/dev/reference/dbSendQuery.md) or
[`dbGetQuery()`](https://dbi.r-dbi.org/dev/reference/dbGetQuery.md)
instead to retrieve the results as a data frame.

### Arguments

|             |                                                                                                           |
|-------------|-----------------------------------------------------------------------------------------------------------|
| `conn`      | A DBIConnection object, as returned by [`dbConnect()`](https://dbi.r-dbi.org/dev/reference/dbConnect.md). |
| `statement` | a character string containing SQL.                                                                        |
| `...`       | Other parameters passed on to methods.                                                                    |

### Additional arguments

The following arguments are not part of the
[`dbSendQueryArrow()`](https://dbi.r-dbi.org/dev/reference/dbSendQueryArrow.md)
generic (to improve compatibility across backends) but are part of the
DBI specification:

- `params` (default: `NULL`)

- `immediate` (default: `NULL`)

They must be provided as named arguments. See the “Specification”
sections for details on their usage.

### Specification

No warnings occur under normal conditions. When done, the DBIResult
object must be cleared with a call to
[`dbClearResult()`](https://dbi.r-dbi.org/dev/reference/dbClearResult.md).
Failure to clear the result set leads to a warning when the connection
is closed.

If the backend supports only one open result set per connection, issuing
a second query invalidates an already open result set and raises a
warning. The newly opened result set is valid and must be cleared with
[`dbClearResult()`](https://dbi.r-dbi.org/dev/reference/dbClearResult.md).

The `param` argument allows passing query parameters, see
[`dbBind()`](https://dbi.r-dbi.org/dev/reference/dbBind.md) for details.

### Specification for the `immediate` argument

The `immediate` argument supports distinguishing between “direct” and
“prepared” APIs offered by many database drivers. Passing
`immediate = TRUE` leads to immediate execution of the query or
statement, via the “direct” API (if supported by the driver). The
default `NULL` means that the backend should choose whatever API makes
the most sense for the database, and (if relevant) tries the other API
if the first attempt fails. A successful second attempt should result in
a message that suggests passing the correct `immediate` argument.
Examples for possible behaviors:

1.  DBI backend defaults to `immediate = TRUE` internally

    1.  A query without parameters is passed: query is executed

    2.  A query with parameters is passed:

        1.  `params` not given: rejected immediately by the database
            because of a syntax error in the query, the backend tries
            `immediate = FALSE` (and gives a message)

        2.  `params` given: query is executed using `immediate = FALSE`

2.  DBI backend defaults to `immediate = FALSE` internally

    1.  A query without parameters is passed:

        1.  simple query: query is executed

        2.  “special” query (such as setting a config options): fails,
            the backend tries `immediate = TRUE` (and gives a message)

    2.  A query with parameters is passed:

        1.  `params` not given: waiting for parameters via
            [`dbBind()`](https://dbi.r-dbi.org/dev/reference/dbBind.md)

        2.  `params` given: query is executed

### Details

This method is for `SELECT` queries only. Some backends may support data
manipulation queries through this method for compatibility reasons.
However, callers are strongly encouraged to use
[`dbSendStatement()`](https://dbi.r-dbi.org/dev/reference/dbSendStatement.md)
for data manipulation statements.

### Value

[`dbSendQueryArrow()`](https://dbi.r-dbi.org/dev/reference/dbSendQueryArrow.md)
returns an S4 object that inherits from DBIResultArrow. The result set
can be used with
[`dbFetchArrow()`](https://dbi.r-dbi.org/dev/reference/dbFetchArrow.md)
to extract records. Once you have finished using a result, make sure to
clear it with
[`dbClearResult()`](https://dbi.r-dbi.org/dev/reference/dbClearResult.md).

### The data retrieval flow for Arrow streams

This section gives a complete overview over the flow for the execution
of queries that return tabular data as an Arrow stream.

Most of this flow, except repeated calling of
[`dbBindArrow()`](https://dbi.r-dbi.org/dev/reference/dbBind.md) or
[`dbBind()`](https://dbi.r-dbi.org/dev/reference/dbBind.md), is
implemented by
[`dbGetQueryArrow()`](https://dbi.r-dbi.org/dev/reference/dbGetQueryArrow.md),
which should be sufficient unless you have a parameterized query that
you want to reuse. This flow requires an active connection established
by [`dbConnect()`](https://dbi.r-dbi.org/dev/reference/dbConnect.md).
See also `vignette("dbi-advanced")` for a walkthrough.

1.  Use
    [`dbSendQueryArrow()`](https://dbi.r-dbi.org/dev/reference/dbSendQueryArrow.md)
    to create a result set object of class DBIResultArrow.

2.  Optionally, bind query parameters with
    [`dbBindArrow()`](https://dbi.r-dbi.org/dev/reference/dbBind.md) or
    [`dbBind()`](https://dbi.r-dbi.org/dev/reference/dbBind.md). This is
    required only if the query contains placeholders such as `⁠?⁠` or
    `⁠\$1⁠`, depending on the database backend.

3.  Use
    [`dbFetchArrow()`](https://dbi.r-dbi.org/dev/reference/dbFetchArrow.md)
    to get a data stream.

4.  Repeat the last two steps as necessary.

5.  Use
    [`dbClearResult()`](https://dbi.r-dbi.org/dev/reference/dbClearResult.md)
    to clean up the result set object. This step is mandatory even if no
    rows have been fetched or if an error has occurred during the
    processing. It is good practice to use
    [`on.exit()`](https://rdrr.io/r/base/on.exit.html) or
    [`withr::defer()`](https://withr.r-lib.org/reference/defer.html) to
    ensure that this step is always executed.

### Failure modes

An error is raised when issuing a query over a closed or invalid
connection, or if the query is not a non-`NA` string. An error is also
raised if the syntax of the query is invalid and all query parameters
are given (by passing the `params` argument) or the `immediate` argument
is set to `TRUE`.

### Examples

``` r
# Retrieve data as arrow table
con <- dbConnect(RSQLite::SQLite(), ":memory:")

dbWriteTable(con, "mtcars", mtcars)
rs <- dbSendQueryArrow(con, "SELECT * FROM mtcars WHERE cyl = 4")
dbFetchArrow(rs)
dbClearResult(rs)

dbDisconnect(con)
```

## Fetch records from a previously executed query as an Arrow object

This section describes the behavior of the following method:

``` r
dbFetchArrow(res, ...)
```

### Description

[![Experimental](https://dbi.r-dbi.org/reference/figures/lifecycle-experimental.svg)](https://lifecycle.r-lib.org/articles/stages.html#experimental)

Fetch the result set and return it as an Arrow object. Use
[`dbFetchArrowChunk()`](https://dbi.r-dbi.org/dev/reference/dbFetchArrowChunk.md)
to fetch results in chunks.

### Arguments

|       |                                                                                                                                       |
|-------|---------------------------------------------------------------------------------------------------------------------------------------|
| `res` | An object inheriting from DBIResultArrow, created by [`dbSendQueryArrow()`](https://dbi.r-dbi.org/dev/reference/dbSendQueryArrow.md). |
| `...` | Other arguments passed on to methods.                                                                                                 |

### Value

[`dbFetchArrow()`](https://dbi.r-dbi.org/dev/reference/dbFetchArrow.md)
always returns an object coercible to a data.frame with as many rows as
records were fetched and as many columns as fields in the result set,
even if the result is a single value or has one or zero rows.

### The data retrieval flow for Arrow streams

This section gives a complete overview over the flow for the execution
of queries that return tabular data as an Arrow stream.

Most of this flow, except repeated calling of
[`dbBindArrow()`](https://dbi.r-dbi.org/dev/reference/dbBind.md) or
[`dbBind()`](https://dbi.r-dbi.org/dev/reference/dbBind.md), is
implemented by
[`dbGetQueryArrow()`](https://dbi.r-dbi.org/dev/reference/dbGetQueryArrow.md),
which should be sufficient unless you have a parameterized query that
you want to reuse. This flow requires an active connection established
by [`dbConnect()`](https://dbi.r-dbi.org/dev/reference/dbConnect.md).
See also `vignette("dbi-advanced")` for a walkthrough.

1.  Use
    [`dbSendQueryArrow()`](https://dbi.r-dbi.org/dev/reference/dbSendQueryArrow.md)
    to create a result set object of class DBIResultArrow.

2.  Optionally, bind query parameters with
    [`dbBindArrow()`](https://dbi.r-dbi.org/dev/reference/dbBind.md) or
    [`dbBind()`](https://dbi.r-dbi.org/dev/reference/dbBind.md). This is
    required only if the query contains placeholders such as `⁠?⁠` or
    `⁠\$1⁠`, depending on the database backend.

3.  Use
    [`dbFetchArrow()`](https://dbi.r-dbi.org/dev/reference/dbFetchArrow.md)
    to get a data stream.

4.  Repeat the last two steps as necessary.

5.  Use
    [`dbClearResult()`](https://dbi.r-dbi.org/dev/reference/dbClearResult.md)
    to clean up the result set object. This step is mandatory even if no
    rows have been fetched or if an error has occurred during the
    processing. It is good practice to use
    [`on.exit()`](https://rdrr.io/r/base/on.exit.html) or
    [`withr::defer()`](https://withr.r-lib.org/reference/defer.html) to
    ensure that this step is always executed.

### Failure modes

An attempt to fetch from a closed result set raises an error.

### Specification

Fetching multi-row queries with one or more columns by default returns
the entire result. The object returned by
[`dbFetchArrow()`](https://dbi.r-dbi.org/dev/reference/dbFetchArrow.md)
can also be passed to
[`nanoarrow::as_nanoarrow_array_stream()`](https://arrow.apache.org/nanoarrow/latest/r/reference/as_nanoarrow_array_stream.html)
to create a nanoarrow array stream object that can be used to read the
result set in batches. The chunk size is implementation-specific.

### Examples

``` r
con <- dbConnect(RSQLite::SQLite(), ":memory:")

dbWriteTable(con, "mtcars", mtcars)

# Fetch all results
rs <- dbSendQueryArrow(con, "SELECT * FROM mtcars WHERE cyl = 4")
as.data.frame(dbFetchArrow(rs))
dbClearResult(rs)

dbDisconnect(con)
```

## Fetch the next batch of records from a previously executed query as an Arrow object

This section describes the behavior of the following method:

``` r
dbFetchArrowChunk(res, ...)
```

### Description

[![Experimental](https://dbi.r-dbi.org/reference/figures/lifecycle-experimental.svg)](https://lifecycle.r-lib.org/articles/stages.html#experimental)

Fetch the next chunk of the result set and return it as an Arrow object.
The chunk size is implementation-specific. Use
[`dbFetchArrow()`](https://dbi.r-dbi.org/dev/reference/dbFetchArrow.md)
to fetch all results.

### Arguments

|       |                                                                                                                                       |
|-------|---------------------------------------------------------------------------------------------------------------------------------------|
| `res` | An object inheriting from DBIResultArrow, created by [`dbSendQueryArrow()`](https://dbi.r-dbi.org/dev/reference/dbSendQueryArrow.md). |
| `...` | Other arguments passed on to methods.                                                                                                 |

### Value

[`dbFetchArrowChunk()`](https://dbi.r-dbi.org/dev/reference/dbFetchArrowChunk.md)
always returns an object coercible to a data.frame with as many rows as
records were fetched and as many columns as fields in the result set,
even if the result is a single value or has one or zero rows.

### The data retrieval flow for Arrow streams

This section gives a complete overview over the flow for the execution
of queries that return tabular data as an Arrow stream.

Most of this flow, except repeated calling of
[`dbBindArrow()`](https://dbi.r-dbi.org/dev/reference/dbBind.md) or
[`dbBind()`](https://dbi.r-dbi.org/dev/reference/dbBind.md), is
implemented by
[`dbGetQueryArrow()`](https://dbi.r-dbi.org/dev/reference/dbGetQueryArrow.md),
which should be sufficient unless you have a parameterized query that
you want to reuse. This flow requires an active connection established
by [`dbConnect()`](https://dbi.r-dbi.org/dev/reference/dbConnect.md).
See also `vignette("dbi-advanced")` for a walkthrough.

1.  Use
    [`dbSendQueryArrow()`](https://dbi.r-dbi.org/dev/reference/dbSendQueryArrow.md)
    to create a result set object of class DBIResultArrow.

2.  Optionally, bind query parameters with
    [`dbBindArrow()`](https://dbi.r-dbi.org/dev/reference/dbBind.md) or
    [`dbBind()`](https://dbi.r-dbi.org/dev/reference/dbBind.md). This is
    required only if the query contains placeholders such as `⁠?⁠` or
    `⁠\$1⁠`, depending on the database backend.

3.  Use
    [`dbFetchArrow()`](https://dbi.r-dbi.org/dev/reference/dbFetchArrow.md)
    to get a data stream.

4.  Repeat the last two steps as necessary.

5.  Use
    [`dbClearResult()`](https://dbi.r-dbi.org/dev/reference/dbClearResult.md)
    to clean up the result set object. This step is mandatory even if no
    rows have been fetched or if an error has occurred during the
    processing. It is good practice to use
    [`on.exit()`](https://rdrr.io/r/base/on.exit.html) or
    [`withr::defer()`](https://withr.r-lib.org/reference/defer.html) to
    ensure that this step is always executed.

### Failure modes

An attempt to fetch from a closed result set raises an error.

### Specification

Fetching multi-row queries with one or more columns returns the next
chunk. The size of the chunk is implementation-specific. The object
returned by
[`dbFetchArrowChunk()`](https://dbi.r-dbi.org/dev/reference/dbFetchArrowChunk.md)
can also be passed to
[`nanoarrow::as_nanoarrow_array()`](https://arrow.apache.org/nanoarrow/latest/r/reference/as_nanoarrow_array.html)
to create a nanoarrow array object. The chunk size is
implementation-specific.

### Examples

``` r
con <- dbConnect(RSQLite::SQLite(), ":memory:")

dbWriteTable(con, "mtcars", mtcars)

# Fetch all results
rs <- dbSendQueryArrow(con, "SELECT * FROM mtcars WHERE cyl = 4")
dbHasCompleted(rs)
as.data.frame(dbFetchArrowChunk(rs))
dbHasCompleted(rs)
as.data.frame(dbFetchArrowChunk(rs))
dbClearResult(rs)

dbDisconnect(con)
```

## Retrieve results from a query as an Arrow object

This section describes the behavior of the following method:

``` r
dbGetQueryArrow(conn, statement, ...)
```

### Description

[![Experimental](https://dbi.r-dbi.org/reference/figures/lifecycle-experimental.svg)](https://lifecycle.r-lib.org/articles/stages.html#experimental)

Returns the result of a query as an Arrow object.
[`dbGetQueryArrow()`](https://dbi.r-dbi.org/dev/reference/dbGetQueryArrow.md)
comes with a default implementation (which should work with most
backends) that calls
[`dbSendQueryArrow()`](https://dbi.r-dbi.org/dev/reference/dbSendQueryArrow.md),
then
[`dbFetchArrow()`](https://dbi.r-dbi.org/dev/reference/dbFetchArrow.md),
ensuring that the result is always freed by
[`dbClearResult()`](https://dbi.r-dbi.org/dev/reference/dbClearResult.md).
For passing query parameters, see
[`dbSendQueryArrow()`](https://dbi.r-dbi.org/dev/reference/dbSendQueryArrow.md),
in particular the “The data retrieval flow for Arrow streams” section.
For retrieving results as a data frame, see
[`dbGetQuery()`](https://dbi.r-dbi.org/dev/reference/dbGetQuery.md).

### Arguments

|             |                                                                                                           |
|-------------|-----------------------------------------------------------------------------------------------------------|
| `conn`      | A DBIConnection object, as returned by [`dbConnect()`](https://dbi.r-dbi.org/dev/reference/dbConnect.md). |
| `statement` | a character string containing SQL.                                                                        |
| `...`       | Other parameters passed on to methods.                                                                    |

### Additional arguments

The following arguments are not part of the
[`dbGetQueryArrow()`](https://dbi.r-dbi.org/dev/reference/dbGetQueryArrow.md)
generic (to improve compatibility across backends) but are part of the
DBI specification:

- `params` (default: `NULL`)

- `immediate` (default: `NULL`)

They must be provided as named arguments. See the “Specification” and
“Value” sections for details on their usage.

The `param` argument allows passing query parameters, see
[`dbBind()`](https://dbi.r-dbi.org/dev/reference/dbBind.md) for details.

### Specification for the `immediate` argument

The `immediate` argument supports distinguishing between “direct” and
“prepared” APIs offered by many database drivers. Passing
`immediate = TRUE` leads to immediate execution of the query or
statement, via the “direct” API (if supported by the driver). The
default `NULL` means that the backend should choose whatever API makes
the most sense for the database, and (if relevant) tries the other API
if the first attempt fails. A successful second attempt should result in
a message that suggests passing the correct `immediate` argument.
Examples for possible behaviors:

1.  DBI backend defaults to `immediate = TRUE` internally

    1.  A query without parameters is passed: query is executed

    2.  A query with parameters is passed:

        1.  `params` not given: rejected immediately by the database
            because of a syntax error in the query, the backend tries
            `immediate = FALSE` (and gives a message)

        2.  `params` given: query is executed using `immediate = FALSE`

2.  DBI backend defaults to `immediate = FALSE` internally

    1.  A query without parameters is passed:

        1.  simple query: query is executed

        2.  “special” query (such as setting a config options): fails,
            the backend tries `immediate = TRUE` (and gives a message)

    2.  A query with parameters is passed:

        1.  `params` not given: waiting for parameters via
            [`dbBind()`](https://dbi.r-dbi.org/dev/reference/dbBind.md)

        2.  `params` given: query is executed

### Details

This method is for `SELECT` queries only (incl. other SQL statements
that return a `SELECT`-alike result, e.g., execution of a stored
procedure or data manipulation queries like
`⁠INSERT INTO ... RETURNING ...⁠`). To execute a stored procedure that
does not return a result set, use
[`dbExecute()`](https://dbi.r-dbi.org/dev/reference/dbExecute.md).

Some backends may support data manipulation statements through this
method. However, callers are strongly advised to use
[`dbExecute()`](https://dbi.r-dbi.org/dev/reference/dbExecute.md) for
data manipulation statements.

### Value

[`dbGetQueryArrow()`](https://dbi.r-dbi.org/dev/reference/dbGetQueryArrow.md)
always returns an object coercible to a data.frame, with as many rows as
records were fetched and as many columns as fields in the result set,
even if the result is a single value or has one or zero rows.

### Implementation notes

Subclasses should override this method only if they provide some sort of
performance optimization.

### Failure modes

An error is raised when issuing a query over a closed or invalid
connection, if the syntax of the query is invalid, or if the query is
not a non-`NA` string. The object returned by
[`dbGetQueryArrow()`](https://dbi.r-dbi.org/dev/reference/dbGetQueryArrow.md)
can also be passed to
[`nanoarrow::as_nanoarrow_array_stream()`](https://arrow.apache.org/nanoarrow/latest/r/reference/as_nanoarrow_array_stream.html)
to create a nanoarrow array stream object that can be used to read the
result set in batches. The chunk size is implementation-specific.

### Examples

``` r
# Retrieve data as arrow table
con <- dbConnect(RSQLite::SQLite(), ":memory:")

dbWriteTable(con, "mtcars", mtcars)
dbGetQueryArrow(con, "SELECT * FROM mtcars")

dbDisconnect(con)
```

## Read database tables as Arrow objects

This section describes the behavior of the following method:

``` r
dbReadTableArrow(conn, name, ...)
```

### Description

[![Experimental](https://dbi.r-dbi.org/reference/figures/lifecycle-experimental.svg)](https://lifecycle.r-lib.org/articles/stages.html#experimental)

Reads a database table as an Arrow object. Use
[`dbReadTable()`](https://dbi.r-dbi.org/dev/reference/dbReadTable.md)
instead to obtain a data frame.

### Arguments

[TABLE]

### Details

This function returns an Arrow object. Convert it to a data frame with
[`as.data.frame()`](https://rdrr.io/r/base/as.data.frame.html) or use
[`dbReadTable()`](https://dbi.r-dbi.org/dev/reference/dbReadTable.md) to
obtain a data frame.

### Value

[`dbReadTableArrow()`](https://dbi.r-dbi.org/dev/reference/dbReadTableArrow.md)
returns an Arrow object that contains the complete data from the remote
table, effectively the result of calling
[`dbGetQueryArrow()`](https://dbi.r-dbi.org/dev/reference/dbGetQueryArrow.md)
with `⁠SELECT * FROM <name>⁠`.

An empty table is returned as an Arrow object with zero rows.

### Failure modes

An error is raised if the table does not exist.

An error is raised when calling this method for a closed or invalid
connection. An error is raised if `name` cannot be processed with
[`dbQuoteIdentifier()`](https://dbi.r-dbi.org/dev/reference/dbQuoteIdentifier.md)
or if this results in a non-scalar.

### Specification

The `name` argument is processed as follows, to support databases that
allow non-syntactic names for their objects:

- If an unquoted table name as string:
  [`dbReadTableArrow()`](https://dbi.r-dbi.org/dev/reference/dbReadTableArrow.md)
  will do the quoting, perhaps by calling
  `dbQuoteIdentifier(conn, x = name)`

- If the result of a call to
  [`dbQuoteIdentifier()`](https://dbi.r-dbi.org/dev/reference/dbQuoteIdentifier.md):
  no more quoting is done

### Examples

``` r
# Read data as Arrow table
con <- dbConnect(RSQLite::SQLite(), ":memory:")

dbWriteTable(con, "mtcars", mtcars[1:10, ])
dbReadTableArrow(con, "mtcars")

dbDisconnect(con)
```

## Copy Arrow objects to database tables

This section describes the behavior of the following method:

``` r
dbWriteTableArrow(conn, name, value, ...)
```

### Description

[![Experimental](https://dbi.r-dbi.org/reference/figures/lifecycle-experimental.svg)](https://lifecycle.r-lib.org/articles/stages.html#experimental)

Writes, overwrites or appends an Arrow object to a database table.

### Arguments

[TABLE]

### Additional arguments

The following arguments are not part of the
[`dbWriteTableArrow()`](https://dbi.r-dbi.org/dev/reference/dbWriteTableArrow.md)
generic (to improve compatibility across backends) but are part of the
DBI specification:

- `overwrite` (default: `FALSE`)

- `append` (default: `FALSE`)

- `temporary` (default: `FALSE`)

They must be provided as named arguments. See the “Specification” and
“Value” sections for details on their usage.

### Specification

The `name` argument is processed as follows, to support databases that
allow non-syntactic names for their objects:

- If an unquoted table name as string:
  [`dbWriteTableArrow()`](https://dbi.r-dbi.org/dev/reference/dbWriteTableArrow.md)
  will do the quoting, perhaps by calling
  `dbQuoteIdentifier(conn, x = name)`

- If the result of a call to
  [`dbQuoteIdentifier()`](https://dbi.r-dbi.org/dev/reference/dbQuoteIdentifier.md):
  no more quoting is done

The `value` argument must be a data frame with a subset of the columns
of the existing table if `append = TRUE`. The order of the columns does
not matter with `append = TRUE`.

If the `overwrite` argument is `TRUE`, an existing table of the same
name will be overwritten. This argument doesn’t change behavior if the
table does not exist yet.

If the `append` argument is `TRUE`, the rows in an existing table are
preserved, and the new data are appended. If the table doesn’t exist
yet, it is created.

If the `temporary` argument is `TRUE`, the table is not available in a
second connection and is gone after reconnecting. Not all backends
support this argument. A regular, non-temporary table is visible in a
second connection, in a pre-existing connection, and after reconnecting
to the database.

SQL keywords can be used freely in table names, column names, and data.
Quotes, commas, spaces, and other special characters such as newlines
and tabs, can also be used in the data, and, if the database supports
non-syntactic identifiers, also for table names and column names.

The following data types must be supported at least, and be read
identically with
[`dbReadTable()`](https://dbi.r-dbi.org/dev/reference/dbReadTable.md):

- integer

- numeric (the behavior for `Inf` and `NaN` is not specified)

- logical

- `NA` as NULL

- 64-bit values (using `"bigint"` as field type); the result can be

  - converted to a numeric, which may lose precision,

  - converted a character vector, which gives the full decimal
    representation

  - written to another table and read again unchanged

- character (in both UTF-8 and native encodings), supporting empty
  strings before and after a non-empty string

- factor (possibly returned as character)

- objects of type <blob::blob> (if supported by the database)

- date (if supported by the database; returned as `Date`), also for
  dates prior to 1970 or 1900 or after 2038

- time (if supported by the database; returned as objects that inherit
  from `difftime`)

- timestamp (if supported by the database; returned as `POSIXct`
  respecting the time zone but not necessarily preserving the input time
  zone), also for timestamps prior to 1970 or 1900 or after 2038
  respecting the time zone but not necessarily preserving the input time
  zone)

Mixing column types in the same table is supported.

### Details

This function expects an Arrow object. Convert a data frame to an Arrow
object with
[`nanoarrow::as_nanoarrow_array_stream()`](https://arrow.apache.org/nanoarrow/latest/r/reference/as_nanoarrow_array_stream.html)
or use
[`dbWriteTable()`](https://dbi.r-dbi.org/dev/reference/dbWriteTable.md)
to write a data frame.

This function is useful if you want to create and load a table at the
same time. Use
[`dbAppendTableArrow()`](https://dbi.r-dbi.org/dev/reference/dbAppendTableArrow.md)
for appending data to an existing table,
[`dbCreateTableArrow()`](https://dbi.r-dbi.org/dev/reference/dbCreateTableArrow.md)
for creating a table and specifying field types, and
[`dbRemoveTable()`](https://dbi.r-dbi.org/dev/reference/dbRemoveTable.md)
for overwriting tables.

### Value

[`dbWriteTableArrow()`](https://dbi.r-dbi.org/dev/reference/dbWriteTableArrow.md)
returns `TRUE`, invisibly.

### Failure modes

If the table exists, and both `append` and `overwrite` arguments are
unset, or `append = TRUE` and the data frame with the new data has
different column names, an error is raised; the remote table remains
unchanged.

An error is raised when calling this method for a closed or invalid
connection. An error is also raised if `name` cannot be processed with
[`dbQuoteIdentifier()`](https://dbi.r-dbi.org/dev/reference/dbQuoteIdentifier.md)
or if this results in a non-scalar. Invalid values for the additional
arguments `overwrite`, `append`, and `temporary` (non-scalars,
unsupported data types, `NA`, incompatible values, incompatible columns)
also raise an error.

### Examples

``` r
con <- dbConnect(RSQLite::SQLite(), ":memory:")

dbWriteTableArrow(con, "mtcars", nanoarrow::as_nanoarrow_array_stream(mtcars[1:5, ]))
dbReadTable(con, "mtcars")

dbDisconnect(con)
```

## Create a table in the database based on an Arrow object

This section describes the behavior of the following method:

``` r
dbCreateTableArrow(conn, name, value, ..., temporary = FALSE)
```

### Description

[![Experimental](https://dbi.r-dbi.org/reference/figures/lifecycle-experimental.svg)](https://lifecycle.r-lib.org/articles/stages.html#experimental)

The default
[`dbCreateTableArrow()`](https://dbi.r-dbi.org/dev/reference/dbCreateTableArrow.md)
method determines the R data types of the Arrow schema associated with
the Arrow object, and calls
[`dbCreateTable()`](https://dbi.r-dbi.org/dev/reference/dbCreateTable.md).
Backends that implement
[`dbAppendTableArrow()`](https://dbi.r-dbi.org/dev/reference/dbAppendTableArrow.md)
should typically also implement this generic. Use
[`dbCreateTable()`](https://dbi.r-dbi.org/dev/reference/dbCreateTable.md)
to create a table from the column types as defined in a data frame.

### Arguments

[TABLE]

### Additional arguments

The following arguments are not part of the
[`dbCreateTableArrow()`](https://dbi.r-dbi.org/dev/reference/dbCreateTableArrow.md)
generic (to improve compatibility across backends) but are part of the
DBI specification:

- `temporary` (default: `FALSE`)

They must be provided as named arguments. See the “Specification” and
“Value” sections for details on their usage.

### Specification

The `name` argument is processed as follows, to support databases that
allow non-syntactic names for their objects:

- If an unquoted table name as string:
  [`dbCreateTableArrow()`](https://dbi.r-dbi.org/dev/reference/dbCreateTableArrow.md)
  will do the quoting, perhaps by calling
  `dbQuoteIdentifier(conn, x = name)`

- If the result of a call to
  [`dbQuoteIdentifier()`](https://dbi.r-dbi.org/dev/reference/dbQuoteIdentifier.md):
  no more quoting is done

The `value` argument can be:

- a data frame,

- a nanoarrow array

- a nanoarrow array stream (which will still contain the data after the
  call)

- a nanoarrow schema

If the `temporary` argument is `TRUE`, the table is not available in a
second connection and is gone after reconnecting. Not all backends
support this argument. A regular, non-temporary table is visible in a
second connection, in a pre-existing connection, and after reconnecting
to the database.

SQL keywords can be used freely in table names, column names, and data.
Quotes, commas, and spaces can also be used for table names and column
names, if the database supports non-syntactic identifiers.

### Value

[`dbCreateTableArrow()`](https://dbi.r-dbi.org/dev/reference/dbCreateTableArrow.md)
returns `TRUE`, invisibly.

### Failure modes

If the table exists, an error is raised; the remote table remains
unchanged.

An error is raised when calling this method for a closed or invalid
connection. An error is also raised if `name` cannot be processed with
[`dbQuoteIdentifier()`](https://dbi.r-dbi.org/dev/reference/dbQuoteIdentifier.md)
or if this results in a non-scalar. Invalid values for the `temporary`
argument (non-scalars, unsupported data types, `NA`, incompatible
values, duplicate names) also raise an error.

### Examples

``` r
con <- dbConnect(RSQLite::SQLite(), ":memory:")
ptype <- data.frame(a = numeric())
dbCreateTableArrow(con, "df", nanoarrow::infer_nanoarrow_schema(ptype))
dbReadTable(con, "df")
dbDisconnect(con)
```

## Insert rows into a table from an Arrow stream

This section describes the behavior of the following method:

``` r
dbAppendTableArrow(conn, name, value, ...)
```

### Description

[![Experimental](https://dbi.r-dbi.org/reference/figures/lifecycle-experimental.svg)](https://lifecycle.r-lib.org/articles/stages.html#experimental)

The
[`dbAppendTableArrow()`](https://dbi.r-dbi.org/dev/reference/dbAppendTableArrow.md)
method assumes that the table has been created beforehand, e.g. with
[`dbCreateTableArrow()`](https://dbi.r-dbi.org/dev/reference/dbCreateTableArrow.md).
The default implementation calls
[`dbAppendTable()`](https://dbi.r-dbi.org/dev/reference/dbAppendTable.md)
for each chunk of the stream. Use
[`dbAppendTable()`](https://dbi.r-dbi.org/dev/reference/dbAppendTable.md)
to append data from a data.frame.

### Arguments

[TABLE]

### Value

[`dbAppendTableArrow()`](https://dbi.r-dbi.org/dev/reference/dbAppendTableArrow.md)
returns a scalar numeric.

### Failure modes

If the table does not exist, or the new data in `values` is not a data
frame or has different column names, an error is raised; the remote
table remains unchanged.

An error is raised when calling this method for a closed or invalid
connection. An error is also raised if `name` cannot be processed with
[`dbQuoteIdentifier()`](https://dbi.r-dbi.org/dev/reference/dbQuoteIdentifier.md)
or if this results in a non-scalar.

### Specification

SQL keywords can be used freely in table names, column names, and data.
Quotes, commas, spaces, and other special characters such as newlines
and tabs, can also be used in the data, and, if the database supports
non-syntactic identifiers, also for table names and column names.

The following data types must be supported at least, and be read
identically with
[`dbReadTable()`](https://dbi.r-dbi.org/dev/reference/dbReadTable.md):

- integer

- numeric (the behavior for `Inf` and `NaN` is not specified)

- logical

- `NA` as NULL

- 64-bit values (using `"bigint"` as field type); the result can be

  - converted to a numeric, which may lose precision,

  - converted a character vector, which gives the full decimal
    representation

  - written to another table and read again unchanged

- character (in both UTF-8 and native encodings), supporting empty
  strings (before and after non-empty strings)

- factor (possibly returned as character)

- objects of type <blob::blob> (if supported by the database)

- date (if supported by the database; returned as `Date`) also for dates
  prior to 1970 or 1900 or after 2038

- time (if supported by the database; returned as objects that inherit
  from `difftime`)

- timestamp (if supported by the database; returned as `POSIXct`
  respecting the time zone but not necessarily preserving the input time
  zone), also for timestamps prior to 1970 or 1900 or after 2038
  respecting the time zone but not necessarily preserving the input time
  zone)

Mixing column types in the same table is supported.

The `name` argument is processed as follows, to support databases that
allow non-syntactic names for their objects:

- If an unquoted table name as string:
  [`dbAppendTableArrow()`](https://dbi.r-dbi.org/dev/reference/dbAppendTableArrow.md)
  will do the quoting, perhaps by calling
  `dbQuoteIdentifier(conn, x = name)`

- If the result of a call to
  [`dbQuoteIdentifier()`](https://dbi.r-dbi.org/dev/reference/dbQuoteIdentifier.md):
  no more quoting is done to support databases that allow non-syntactic
  names for their objects:

The `value` argument must be a data frame with a subset of the columns
of the existing table. The order of the columns does not matter.

### Examples

``` r
con <- dbConnect(RSQLite::SQLite(), ":memory:")
dbCreateTableArrow(con, "iris", iris[0, ])
dbAppendTableArrow(con, "iris", iris[1:5, ])
dbReadTable(con, "iris")
dbDisconnect(con)
```
