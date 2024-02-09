## DBI: R Database Interface

DBI defines an interface for communication between R and relational
database management systems. All classes in this package are virtual and
need to be extended by the various R/DBMS implementations (so-called
*DBI backends*).

### Definition

A DBI backend is an R package which imports the
<span class="pkg">DBI</span> and <span class="pkg">methods</span>
packages. For better or worse, the names of many existing backends start
with ‘R’, e.g., <span class="pkg">RSQLite</span>,
<span class="pkg">RMySQL</span>, <span class="pkg">RSQLServer</span>; it
is up to the backend author to adopt this convention or not.

### DBI classes and methods

A backend defines three classes, which are subclasses of DBIDriver,
DBIConnection, and DBIResult. The backend provides implementation for
all methods of these base classes that are defined but not implemented
by DBI. All methods defined in <span class="pkg">DBI</span> are
reexported (so that the package can be used without having to attach
<span class="pkg">DBI</span>), and have an ellipsis `...` in their
formals for extensibility.

### Construction of the DBIDriver object

The backend must support creation of an instance of its DBIDriver
subclass with a <span class="dfn">constructor function</span>. By
default, its name is the package name without the leading ‘R’ (if it
exists), e.g., `SQLite` for the <span class="pkg">RSQLite</span>
package. However, backend authors may choose a different name. The
constructor must be exported, and it must be a function that is callable
without arguments. DBI recommends to define a constructor with an empty
argument list.

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

`dbDataType()` returns the SQL type that corresponds to the `obj`
argument as a non-empty character string. For data frames, a character
vector with one element per column is returned.

### Failure modes

An error is raised for invalid values for the `obj` argument such as a
`NULL` value.

### Specification

The backend can override the `dbDataType()` generic for its driver
class.

This generic expects an arbitrary object as second argument. To query
the values returned by the default implementation, run
`example(dbDataType, package = "DBI")`. If the backend needs to override
this generic, it must accept all basic R data types as its second
argument, namely logical, integer, numeric, character, dates (see
Dates), date-time (see DateTimeClasses), and difftime. If the database
supports blobs, this method also must accept lists of raw vectors, and
blob::blob objects. As-is objects (i.e., wrapped by `I()`) must be
supported and return the same results as their unwrapped counterparts.
The SQL data type for factor and ordered is the same as for character.
The behavior for other object types is not specified.

All data types returned by `dbDataType()` are usable in an SQL statement
of the form `"CREATE TABLE test (a ...)"`.

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
details. Use `dbCanConnect()` to check if a connection can be
established.

### Arguments

|       |                                                                                                                                                                               |
|-------|-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
| `drv` | an object that inherits from DBIDriver, or an existing DBIConnection object (in order to clone an existing connection).                                                       |
| `...` | authentication arguments needed by the DBMS instance; these typically include `user`, `password`, `host`, `port`, `dbname`, etc. For details see the appropriate `DBIDriver`. |

### Value

`dbConnect()` returns an S4 object that inherits from DBIConnection.
This object is used to communicate with the database engine.

A `format()` method is defined for the connection object. It returns a
string that consists of a single line of text.

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
  `as.integer()` (with warning on overflow), `as.numeric()` and
  `as.character()`

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

|        |                                                       |
|--------|-------------------------------------------------------|
| `conn` | A DBIConnection object, as returned by `dbConnect()`. |
| `...`  | Other parameters passed on to methods.                |

### Value

`dbDisconnect()` returns `TRUE`, invisibly.

### Failure modes

A warning is issued on garbage collection when a connection has been
released without calling `dbDisconnect()`, but this cannot be tested
automatically. A warning is issued immediately when calling
`dbDisconnect()` on an already disconnected or invalid connection.

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

The `dbSendQuery()` method only submits and synchronously executes the
SQL query to the database engine. It does *not* extract any records —
for that you need to use the `dbFetch()` method, and then you must call
`dbClearResult()` when you finish fetching the records you need. For
interactive use, you should almost always prefer `dbGetQuery()`. Use
`dbSendQueryArrow()` or `dbGetQueryArrow()` instead to retrieve the
results as an Arrow object.

### Arguments

|             |                                                       |
|-------------|-------------------------------------------------------|
| `conn`      | A DBIConnection object, as returned by `dbConnect()`. |
| `statement` | a character string containing SQL.                    |
| `...`       | Other parameters passed on to methods.                |

### Additional arguments

The following arguments are not part of the `dbSendQuery()` generic (to
improve compatibility across backends) but are part of the DBI
specification:

- `params` (default: `NULL`)

- `immediate` (default: `NULL`)

They must be provided as named arguments. See the "Specification"
sections for details on their usage.

### Specification

No warnings occur under normal conditions. When done, the DBIResult
object must be cleared with a call to `dbClearResult()`. Failure to
clear the result set leads to a warning when the connection is closed.

If the backend supports only one open result set per connection, issuing
a second query invalidates an already open result set and raises a
warning. The newly opened result set is valid and must be cleared with
`dbClearResult()`.

The `param` argument allows passing query parameters, see `dbBind()` for
details.

### Specification for the `immediate` argument

The `immediate` argument supports distinguishing between "direct" and
"prepared" APIs offered by many database drivers. Passing
`immediate = TRUE` leads to immediate execution of the query or
statement, via the "direct" API (if supported by the driver). The
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

        2.  "special" query (such as setting a config options): fails,
            the backend tries `immediate = TRUE` (and gives a message)

    2.  A query with parameters is passed:

        1.  `params` not given: waiting for parameters via `dbBind()`

        2.  `params` given: query is executed

### Details

This method is for `SELECT` queries only. Some backends may support data
manipulation queries through this method for compatibility reasons.
However, callers are strongly encouraged to use `dbSendStatement()` for
data manipulation statements.

The query is submitted to the database server and the DBMS executes it,
possibly generating vast amounts of data. Where these data live is
driver-specific: some drivers may choose to leave the output on the
server and transfer them piecemeal to R, others may transfer all the
data to the client – but not necessarily to the memory that R manages.
See individual drivers' `dbSendQuery()` documentation for details.

### Value

`dbSendQuery()` returns an S4 object that inherits from DBIResult. The
result set can be used with `dbFetch()` to extract records. Once you
have finished using a result, make sure to clear it with
`dbClearResult()`.

### The data retrieval flow

This section gives a complete overview over the flow for the execution
of queries that return tabular data as data frames.

Most of this flow, except repeated calling of `dbBind()` or
`dbBindArrow()`, is implemented by `dbGetQuery()`, which should be
sufficient unless you want to access the results in a paged way or you
have a parameterized query that you want to reuse. This flow requires an
active connection established by `dbConnect()`. See also
`vignette("dbi-advanced")` for a walkthrough.

1.  Use `dbSendQuery()` to create a result set object of class
    DBIResult.

2.  Optionally, bind query parameters with `dbBind()` or
    `dbBindArrow()`. This is required only if the query contains
    placeholders such as `⁠?⁠` or `⁠\$1⁠`, depending on the database
    backend.

3.  Optionally, use `dbColumnInfo()` to retrieve the structure of the
    result set without retrieving actual data.

4.  Use `dbFetch()` to get the entire result set, a page of results, or
    the remaining rows. Fetching zero rows is also possible to retrieeve
    the structure of the result set as a data frame. This step can be
    called multiple times. Only forward paging is supported, you need to
    cache previous pages if you need to navigate backwards.

5.  Use `dbHasCompleted()` to tell when you're done. This method returns
    `TRUE` if no more rows are available for fetching.

6.  Repeat the last four steps as necessary.

7.  Use `dbClearResult()` to clean up the result set object. This step
    is mandatory even if no rows have been fetched or if an error has
    occurred during the processing. It is good practice to use
    `on.exit()` or `withr::defer()` to ensure that this step is always
    executed.

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
| `res` | An object inheriting from DBIResult, created by `dbSendQuery()`.                                                                                                     |
| `n`   | maximum number of records to retrieve per fetch. Use `n = -1` or `n = Inf` to retrieve all pending records. Some implementations may recognize other special values. |
| `...` | Other arguments passed on to methods.                                                                                                                                |

### Details

`fetch()` is provided for compatibility with older DBI clients - for all
new code you are strongly encouraged to use `dbFetch()`. The default
implementation for `dbFetch()` calls `fetch()` so that it is compatible
with existing code. Modern backends should implement for `dbFetch()`
only.

### Value

`dbFetch()` always returns a data.frame with as many rows as records
were fetched and as many columns as fields in the result set, even if
the result is a single value or has one or zero rows. Passing `n = NA`
is supported and returns an arbitrary number of rows (at least one) as
specified by the driver, but at most the remaining rows in the result
set.

### The data retrieval flow

This section gives a complete overview over the flow for the execution
of queries that return tabular data as data frames.

Most of this flow, except repeated calling of `dbBind()` or
`dbBindArrow()`, is implemented by `dbGetQuery()`, which should be
sufficient unless you want to access the results in a paged way or you
have a parameterized query that you want to reuse. This flow requires an
active connection established by `dbConnect()`. See also
`vignette("dbi-advanced")` for a walkthrough.

1.  Use `dbSendQuery()` to create a result set object of class
    DBIResult.

2.  Optionally, bind query parameters with `dbBind()` or
    `dbBindArrow()`. This is required only if the query contains
    placeholders such as `⁠?⁠` or `⁠\$1⁠`, depending on the database
    backend.

3.  Optionally, use `dbColumnInfo()` to retrieve the structure of the
    result set without retrieving actual data.

4.  Use `dbFetch()` to get the entire result set, a page of results, or
    the remaining rows. Fetching zero rows is also possible to retrieeve
    the structure of the result set as a data frame. This step can be
    called multiple times. Only forward paging is supported, you need to
    cache previous pages if you need to navigate backwards.

5.  Use `dbHasCompleted()` to tell when you're done. This method returns
    `TRUE` if no more rows are available for fetching.

6.  Repeat the last four steps as necessary.

7.  Use `dbClearResult()` to clean up the result set object. This step
    is mandatory even if no rows have been fetched or if an error has
    occurred during the processing. It is good practice to use
    `on.exit()` or `withr::defer()` to ensure that this step is always
    executed.

### Failure modes

An attempt to fetch from a closed result set raises an error. If the `n`
argument is not an atomic whole number greater or equal to -1 or Inf, an
error is raised, but a subsequent call to `dbFetch()` with proper `n`
argument succeeds.

Calling `dbFetch()` on a result set from a data manipulation query
created by `dbSendStatement()` can be fetched and return an empty data
frame, with a warning.

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

- coercible using `as.Date()` for dates, with NA for SQL `NULL` values
  (also applies to the return value of the SQL function `current_date`)

- coercible using `hms::as_hms()` for times, with NA for SQL `NULL`
  values (also applies to the return value of the SQL function
  `current_time`)

- coercible using `as.POSIXct()` for timestamps, with NA for SQL `NULL`
  values (also applies to the return value of the SQL function
  `current_timestamp`)

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
  valid 64-bit values (such as the `integer64` class of the
  <span class="pkg">bit64</span> package)

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
`dbSendQuery()` or `dbSendStatement()`.

### Arguments

|       |                                       |
|-------|---------------------------------------|
| `res` | An object inheriting from DBIResult.  |
| `...` | Other arguments passed on to methods. |

### Value

`dbClearResult()` returns `TRUE`, invisibly, for result sets obtained
from `dbSendQuery()`, `dbSendStatement()`, or `dbSendQueryArrow()`,

### The data retrieval flow

This section gives a complete overview over the flow for the execution
of queries that return tabular data as data frames.

Most of this flow, except repeated calling of `dbBind()` or
`dbBindArrow()`, is implemented by `dbGetQuery()`, which should be
sufficient unless you want to access the results in a paged way or you
have a parameterized query that you want to reuse. This flow requires an
active connection established by `dbConnect()`. See also
`vignette("dbi-advanced")` for a walkthrough.

1.  Use `dbSendQuery()` to create a result set object of class
    DBIResult.

2.  Optionally, bind query parameters with `dbBind()` or
    `dbBindArrow()`. This is required only if the query contains
    placeholders such as `⁠?⁠` or `⁠\$1⁠`, depending on the database
    backend.

3.  Optionally, use `dbColumnInfo()` to retrieve the structure of the
    result set without retrieving actual data.

4.  Use `dbFetch()` to get the entire result set, a page of results, or
    the remaining rows. Fetching zero rows is also possible to retrieeve
    the structure of the result set as a data frame. This step can be
    called multiple times. Only forward paging is supported, you need to
    cache previous pages if you need to navigate backwards.

5.  Use `dbHasCompleted()` to tell when you're done. This method returns
    `TRUE` if no more rows are available for fetching.

6.  Repeat the last four steps as necessary.

7.  Use `dbClearResult()` to clean up the result set object. This step
    is mandatory even if no rows have been fetched or if an error has
    occurred during the processing. It is good practice to use
    `on.exit()` or `withr::defer()` to ensure that this step is always
    executed.

### The command execution flow

This section gives a complete overview over the flow for the execution
of SQL statements that have side effects such as stored procedures,
inserting or deleting data, or setting database or connection options.
Most of this flow, except repeated calling of `dbBindArrow()`, is
implemented by `dbExecute()`, which should be sufficient for
non-parameterized queries. This flow requires an active connection
established by `dbConnect()`. See also `vignette("dbi-advanced")` for a
walkthrough.

1.  Use `dbSendStatement()` to create a result set object of class
    DBIResult. For some queries you need to pass `immediate = TRUE`.

2.  Optionally, bind query parameters with`dbBind()` or `dbBindArrow()`.
    This is required only if the query contains placeholders such as `⁠?⁠`
    or `⁠\$1⁠`, depending on the database backend.

3.  Optionally, use `dbGetRowsAffected()` to retrieve the number of rows
    affected by the query.

4.  Repeat the last two steps as necessary.

5.  Use `dbClearResult()` to clean up the result set object. This step
    is mandatory even if no rows have been fetched or if an error has
    occurred during the processing. It is good practice to use
    `on.exit()` or `withr::defer()` to ensure that this step is always
    executed.

### Failure modes

An attempt to close an already closed result set issues a warning for
`dbSendQuery()`, `dbSendStatement()`, and `dbSendQueryArrow()`,

### Specification

`dbClearResult()` frees all resources associated with retrieving the
result of a query or update operation. The DBI backend can expect a call
to `dbClearResult()` for each `dbSendQuery()` or `dbSendStatement()`
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

For parametrized or prepared statements, the `dbSendQuery()`,
`dbSendQueryArrow()`, and `dbSendStatement()` functions can be called
with statements that contain placeholders for values. The `dbBind()` and
`dbBindArrow()` functions bind these placeholders to actual values, and
are intended to be called on the result set before calling `dbFetch()`
or `dbFetchArrow()`. The values are passed to `dbBind()` as lists or
data frames, and to `dbBindArrow()` as a stream created by
`nanoarrow::as_nanoarrow_array_stream()`.

[![\[Experimental\]](https://dbi.r-dbi.org/reference/figures/lifecycle-experimental.svg)](https://lifecycle.r-lib.org/articles/stages.html#experimental)

`dbBindArrow()` is experimental, as are the other `⁠*Arrow⁠` functions.
`dbSendQuery()` is compatible with `dbBindArrow()`, and
`dbSendQueryArrow()` is compatible with `dbBind()`.

### Arguments

|          |                                                                                                                                                                                                           |
|----------|-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
| `res`    | An object inheriting from DBIResult.                                                                                                                                                                      |
| `params` | For `dbBind()`, a list of values, named or unnamed, or a data frame, with one element/column per query parameter. For `dbBindArrow()`, values as a nanoarrow stream, with one column per query parameter. |
| `...`    | Other arguments passed on to methods.                                                                                                                                                                     |

### Details

<span class="pkg">DBI</span> supports parametrized (or prepared) queries
and statements via the `dbBind()` and `dbBindArrow()` generics.
Parametrized queries are different from normal queries in that they
allow an arbitrary number of placeholders, which are later substituted
by actual values. Parametrized queries (and statements) serve two
purposes:

- The same query can be executed more than once with different values.
  The DBMS may cache intermediate information for the query, such as the
  execution plan, and execute it faster.

- Separation of query syntax and parameters protects against SQL
  injection.

The placeholder format is currently not specified by
<span class="pkg">DBI</span>; in the future, a uniform placeholder
syntax may be supported. Consult the backend documentation for the
supported formats. For automated testing, backend authors specify the
placeholder syntax with the `placeholder_pattern` tweak. Known examples
are:

- `⁠?⁠` (positional matching in order of appearance) in
  <span class="pkg">RMariaDB</span> and <span class="pkg">RSQLite</span>

- `⁠\$1⁠` (positional matching by index) in
  <span class="pkg">RPostgres</span> and
  <span class="pkg">RSQLite</span>

- `⁠:name⁠` and `⁠\$name⁠` (named matching) in
  <span class="pkg">RSQLite</span>

### Value

`dbBind()` returns the result set, invisibly, for queries issued by
`dbSendQuery()` or `dbSendQueryArrow()` and also for data manipulation
statements issued by `dbSendStatement()`.

### The data retrieval flow

This section gives a complete overview over the flow for the execution
of queries that return tabular data as data frames.

Most of this flow, except repeated calling of `dbBind()` or
`dbBindArrow()`, is implemented by `dbGetQuery()`, which should be
sufficient unless you want to access the results in a paged way or you
have a parameterized query that you want to reuse. This flow requires an
active connection established by `dbConnect()`. See also
`vignette("dbi-advanced")` for a walkthrough.

1.  Use `dbSendQuery()` to create a result set object of class
    DBIResult.

2.  Optionally, bind query parameters with `dbBind()` or
    `dbBindArrow()`. This is required only if the query contains
    placeholders such as `⁠?⁠` or `⁠\$1⁠`, depending on the database
    backend.

3.  Optionally, use `dbColumnInfo()` to retrieve the structure of the
    result set without retrieving actual data.

4.  Use `dbFetch()` to get the entire result set, a page of results, or
    the remaining rows. Fetching zero rows is also possible to retrieeve
    the structure of the result set as a data frame. This step can be
    called multiple times. Only forward paging is supported, you need to
    cache previous pages if you need to navigate backwards.

5.  Use `dbHasCompleted()` to tell when you're done. This method returns
    `TRUE` if no more rows are available for fetching.

6.  Repeat the last four steps as necessary.

7.  Use `dbClearResult()` to clean up the result set object. This step
    is mandatory even if no rows have been fetched or if an error has
    occurred during the processing. It is good practice to use
    `on.exit()` or `withr::defer()` to ensure that this step is always
    executed.

### The data retrieval flow for Arrow streams

This section gives a complete overview over the flow for the execution
of queries that return tabular data as an Arrow stream.

Most of this flow, except repeated calling of `dbBindArrow()` or
`dbBind()`, is implemented by `dbGetQueryArrow()`, which should be
sufficient unless you have a parameterized query that you want to reuse.
This flow requires an active connection established by `dbConnect()`.
See also `vignette("dbi-advanced")` for a walkthrough.

1.  Use `dbSendQueryArrow()` to create a result set object of class
    DBIResultArrow.

2.  Optionally, bind query parameters with `dbBindArrow()` or
    `dbBind()`. This is required only if the query contains placeholders
    such as `⁠?⁠` or `⁠\$1⁠`, depending on the database backend.

3.  Use `dbFetchArrow()` to get a data stream.

4.  Repeat the last two steps as necessary.

5.  Use `dbClearResult()` to clean up the result set object. This step
    is mandatory even if no rows have been fetched or if an error has
    occurred during the processing. It is good practice to use
    `on.exit()` or `withr::defer()` to ensure that this step is always
    executed.

### The command execution flow

This section gives a complete overview over the flow for the execution
of SQL statements that have side effects such as stored procedures,
inserting or deleting data, or setting database or connection options.
Most of this flow, except repeated calling of `dbBindArrow()`, is
implemented by `dbExecute()`, which should be sufficient for
non-parameterized queries. This flow requires an active connection
established by `dbConnect()`. See also `vignette("dbi-advanced")` for a
walkthrough.

1.  Use `dbSendStatement()` to create a result set object of class
    DBIResult. For some queries you need to pass `immediate = TRUE`.

2.  Optionally, bind query parameters with`dbBind()` or `dbBindArrow()`.
    This is required only if the query contains placeholders such as `⁠?⁠`
    or `⁠\$1⁠`, depending on the database backend.

3.  Optionally, use `dbGetRowsAffected()` to retrieve the number of rows
    affected by the query.

4.  Repeat the last two steps as necessary.

5.  Use `dbClearResult()` to clean up the result set object. This step
    is mandatory even if no rows have been fetched or if an error has
    occurred during the processing. It is good practice to use
    `on.exit()` or `withr::defer()` to ensure that this step is always
    executed.

### Failure modes

Calling `dbBind()` for a query without parameters raises an error.

Binding too many or not enough values, or parameters with wrong names or
unequal length, also raises an error. If the placeholders in the query
are named, all parameter values must have names (which must not be empty
or `NA`), and vice versa, otherwise an error is raised. The behavior for
mixing placeholders of different types (in particular mixing positional
and named placeholders) is not specified.

Calling `dbBind()` on a result set already cleared by `dbClearResult()`
also raises an error.

### Specification

<span class="pkg">DBI</span> clients execute parametrized statements as
follows:

1.  Call `dbSendQuery()`, `dbSendQueryArrow()` or `dbSendStatement()`
    with a query or statement that contains placeholders, store the
    returned DBIResult object in a variable. Mixing placeholders (in
    particular, named and unnamed ones) is not recommended. It is good
    practice to register a call to `dbClearResult()` via `on.exit()`
    right after calling `dbSendQuery()` or `dbSendStatement()` (see the
    last enumeration item). Until `dbBind()` or `dbBindArrow()` have
    been called, the returned result set object has the following
    behavior:

    - `dbFetch()` raises an error (for `dbSendQuery()` and
      `dbSendQueryArrow()`)

    - `dbGetRowCount()` returns zero (for `dbSendQuery()` and
      `dbSendQueryArrow()`)

    - `dbGetRowsAffected()` returns an integer `NA` (for
      `dbSendStatement()`)

    - `dbIsValid()` returns `TRUE`

    - `dbHasCompleted()` returns `FALSE`

2.  Call `dbBind()` or `dbBindArrow()`:

    - For `dbBind()`, the `params` argument must be a list where all
      elements have the same lengths and contain values supported by the
      backend. A data.frame is internally stored as such a list.

    - For `dbBindArrow()`, the `params` argument must be a nanoarrow
      array stream, with one column per query parameter.

3.  Retrieve the data or the number of affected rows from the
    `DBIResult` object.

    - For queries issued by `dbSendQuery()` or `dbSendQueryArrow()`,
      call `dbFetch()`.

    - For statements issued by `dbSendStatements()`, call
      `dbGetRowsAffected()`. (Execution begins immediately after the
      `dbBind()` call, the statement is processed entirely before the
      function returns.)

4.  Repeat 2. and 3. as necessary.

5.  Close the result set via `dbClearResult()`.

The elements of the `params` argument do not need to be scalars, vectors
of arbitrary length (including length 0) are supported. For queries,
calling `dbFetch()` binding such parameters returns concatenated
results, equivalent to binding and fetching for each set of values and
connecting via `rbind()`. For data manipulation statements,
`dbGetRowsAffected()` returns the total number of rows affected if
binding non-scalar parameters. `dbBind()` also accepts repeated calls on
the same result set for both queries and data manipulation statements,
even if no results are fetched between calls to `dbBind()`, for both
queries and data manipulation statements.

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

- objects of type blob::blob

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

Returns the result of a query as a data frame. `dbGetQuery()` comes with
a default implementation (which should work with most backends) that
calls `dbSendQuery()`, then `dbFetch()`, ensuring that the result is
always freed by `dbClearResult()`. For retrieving chunked/paged results
or for passing query parameters, see `dbSendQuery()`, in particular the
"The data retrieval flow" section. For retrieving results as an Arrow
object, see `dbGetQueryArrow()`.

### Arguments

|             |                                                       |
|-------------|-------------------------------------------------------|
| `conn`      | A DBIConnection object, as returned by `dbConnect()`. |
| `statement` | a character string containing SQL.                    |
| `...`       | Other parameters passed on to methods.                |

### Additional arguments

The following arguments are not part of the `dbGetQuery()` generic (to
improve compatibility across backends) but are part of the DBI
specification:

- `n` (default: -1)

- `params` (default: `NULL`)

- `immediate` (default: `NULL`)

They must be provided as named arguments. See the "Specification" and
"Value" sections for details on their usage.

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

The `param` argument allows passing query parameters, see `dbBind()` for
details.

### Specification for the `immediate` argument

The `immediate` argument supports distinguishing between "direct" and
"prepared" APIs offered by many database drivers. Passing
`immediate = TRUE` leads to immediate execution of the query or
statement, via the "direct" API (if supported by the driver). The
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

        2.  "special" query (such as setting a config options): fails,
            the backend tries `immediate = TRUE` (and gives a message)

    2.  A query with parameters is passed:

        1.  `params` not given: waiting for parameters via `dbBind()`

        2.  `params` given: query is executed

### Details

This method is for `SELECT` queries only (incl. other SQL statements
that return a `SELECT`-alike result, e.g., execution of a stored
procedure or data manipulation queries like
`⁠INSERT INTO ... RETURNING ...⁠`). To execute a stored procedure that
does not return a result set, use `dbExecute()`.

Some backends may support data manipulation statements through this
method for compatibility reasons. However, callers are strongly advised
to use `dbExecute()` for data manipulation statements.

### Value

`dbGetQuery()` always returns a data.frame, with as many rows as records
were fetched and as many columns as fields in the result set, even if
the result is a single value or has one or zero rows.

### Implementation notes

Subclasses should override this method only if they provide some sort of
performance optimization.

### Failure modes

An error is raised when issuing a query over a closed or invalid
connection, if the syntax of the query is invalid, or if the query is
not a non-`NA` string. If the `n` argument is not an atomic whole number
greater or equal to -1 or Inf, an error is raised, but a subsequent call
to `dbGetQuery()` with proper `n` argument succeeds.

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

The `dbSendStatement()` method only submits and synchronously executes
the SQL data manipulation statement (e.g., `UPDATE`, `DELETE`,
`⁠INSERT INTO⁠`, `⁠DROP TABLE⁠`, ...) to the database engine. To query the
number of affected rows, call `dbGetRowsAffected()` on the returned
result object. You must also call `dbClearResult()` after that. For
interactive use, you should almost always prefer `dbExecute()`.

### Arguments

|             |                                                       |
|-------------|-------------------------------------------------------|
| `conn`      | A DBIConnection object, as returned by `dbConnect()`. |
| `statement` | a character string containing SQL.                    |
| `...`       | Other parameters passed on to methods.                |

### Additional arguments

The following arguments are not part of the `dbSendStatement()` generic
(to improve compatibility across backends) but are part of the DBI
specification:

- `params` (default: `NULL`)

- `immediate` (default: `NULL`)

They must be provided as named arguments. See the "Specification"
sections for details on their usage.

### Specification

No warnings occur under normal conditions. When done, the DBIResult
object must be cleared with a call to `dbClearResult()`. Failure to
clear the result set leads to a warning when the connection is closed.
If the backend supports only one open result set per connection, issuing
a second query invalidates an already open result set and raises a
warning. The newly opened result set is valid and must be cleared with
`dbClearResult()`.

The `param` argument allows passing query parameters, see `dbBind()` for
details.

### Specification for the `immediate` argument

The `immediate` argument supports distinguishing between "direct" and
"prepared" APIs offered by many database drivers. Passing
`immediate = TRUE` leads to immediate execution of the query or
statement, via the "direct" API (if supported by the driver). The
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

        2.  "special" query (such as setting a config options): fails,
            the backend tries `immediate = TRUE` (and gives a message)

    2.  A query with parameters is passed:

        1.  `params` not given: waiting for parameters via `dbBind()`

        2.  `params` given: query is executed

### Details

`dbSendStatement()` comes with a default implementation that simply
forwards to `dbSendQuery()`, to support backends that only implement the
latter.

### Value

`dbSendStatement()` returns an S4 object that inherits from DBIResult.
The result set can be used with `dbGetRowsAffected()` to determine the
number of rows affected by the query. Once you have finished using a
result, make sure to clear it with `dbClearResult()`.

### The command execution flow

This section gives a complete overview over the flow for the execution
of SQL statements that have side effects such as stored procedures,
inserting or deleting data, or setting database or connection options.
Most of this flow, except repeated calling of `dbBindArrow()`, is
implemented by `dbExecute()`, which should be sufficient for
non-parameterized queries. This flow requires an active connection
established by `dbConnect()`. See also `vignette("dbi-advanced")` for a
walkthrough.

1.  Use `dbSendStatement()` to create a result set object of class
    DBIResult. For some queries you need to pass `immediate = TRUE`.

2.  Optionally, bind query parameters with`dbBind()` or `dbBindArrow()`.
    This is required only if the query contains placeholders such as `⁠?⁠`
    or `⁠\$1⁠`, depending on the database backend.

3.  Optionally, use `dbGetRowsAffected()` to retrieve the number of rows
    affected by the query.

4.  Repeat the last two steps as necessary.

5.  Use `dbClearResult()` to clean up the result set object. This step
    is mandatory even if no rows have been fetched or if an error has
    occurred during the processing. It is good practice to use
    `on.exit()` or `withr::defer()` to ensure that this step is always
    executed.

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
`dbExecute()` comes with a default implementation (which should work
with most backends) that calls `dbSendStatement()`, then
`dbGetRowsAffected()`, ensuring that the result is always freed by
`dbClearResult()`. For passing query parameters, see `dbBind()`, in
particular the "The command execution flow" section.

### Arguments

|             |                                                       |
|-------------|-------------------------------------------------------|
| `conn`      | A DBIConnection object, as returned by `dbConnect()`. |
| `statement` | a character string containing SQL.                    |
| `...`       | Other parameters passed on to methods.                |

### Additional arguments

The following arguments are not part of the `dbExecute()` generic (to
improve compatibility across backends) but are part of the DBI
specification:

- `params` (default: `NULL`)

- `immediate` (default: `NULL`)

They must be provided as named arguments. See the "Specification"
sections for details on their usage.

### Specification

The `param` argument allows passing query parameters, see `dbBind()` for
details.

### Specification for the `immediate` argument

The `immediate` argument supports distinguishing between "direct" and
"prepared" APIs offered by many database drivers. Passing
`immediate = TRUE` leads to immediate execution of the query or
statement, via the "direct" API (if supported by the driver). The
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

        2.  "special" query (such as setting a config options): fails,
            the backend tries `immediate = TRUE` (and gives a message)

    2.  A query with parameters is passed:

        1.  `params` not given: waiting for parameters via `dbBind()`

        2.  `params` given: query is executed

### Details

You can also use `dbExecute()` to call a stored procedure that performs
data manipulation or other actions that do not return a result set. To
execute a stored procedure that returns a result set, or a data
manipulation query that also returns a result set such as
`⁠INSERT INTO ... RETURNING ...⁠`, use `dbGetQuery()` instead.

### Value

`dbExecute()` always returns a scalar numeric that specifies the number
of rows affected by the statement.

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

|        |                                                       |
|--------|-------------------------------------------------------|
| `conn` | A DBIConnection object, as returned by `dbConnect()`. |
| `x`    | A character vector to quote as string.                |
| `...`  | Other arguments passed on to methods.                 |

### Value

`dbQuoteString()` returns an object that can be coerced to character, of
the same length as the input. For an empty character vector this
function returns a length-0 object.

When passing the returned object again to `dbQuoteString()` as `x`
argument, it is returned unchanged. Passing objects of class SQL should
also return them unchanged. (For backends it may be most convenient to
return SQL objects to achieve this behavior, but this is not required.)

### Failure modes

Passing a numeric, integer, logical, or raw vector, or a list for the
`x` argument raises an error.

### Specification

The returned expression can be used in a `⁠SELECT ...⁠` query, and for any
scalar character `x` the value of
`dbGetQuery(paste0("SELECT ", dbQuoteString(x)))[[1]]` must be identical
to `x`, even if `x` contains spaces, tabs, quotes (single or double),
backticks, or newlines (in any combination) or is itself the result of a
`dbQuoteString()` call coerced back to character (even repeatedly). If
`x` is `NA`, the result must merely satisfy `is.na()`. The strings
`"NA"` or `"NULL"` are not treated specially.

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

## Quote identifiers

This section describes the behavior of the following method:

``` r
dbQuoteIdentifier(conn, x, ...)
```

### Description

Call this method to generate a string that is suitable for use in a
query as a column or table name, to make sure that you generate valid
SQL and protect against SQL injection attacks. The inverse operation is
`dbUnquoteIdentifier()`.

### Arguments

|        |                                                              |
|--------|--------------------------------------------------------------|
| `conn` | A DBIConnection object, as returned by `dbConnect()`.        |
| `x`    | A character vector, SQL or Id object to quote as identifier. |
| `...`  | Other arguments passed on to methods.                        |

### Value

`dbQuoteIdentifier()` returns an object that can be coerced to
character, of the same length as the input. For an empty character
vector this function returns a length-0 object. The names of the input
argument are preserved in the output. When passing the returned object
again to `dbQuoteIdentifier()` as `x` argument, it is returned
unchanged. Passing objects of class SQL should also return them
unchanged. (For backends it may be most convenient to return SQL objects
to achieve this behavior, but this is not required.)

### Failure modes

An error is raised if the input contains `NA`, but not for an empty
string.

### Specification

Calling `dbGetQuery()` for a query of the format `⁠SELECT 1 AS ...⁠`
returns a data frame with the identifier, unquoted, as column name.
Quoted identifiers can be used as table and column names in SQL queries,
in particular in queries like `⁠SELECT 1 AS ...⁠` and
`⁠SELECT * FROM (SELECT 1) ...⁠`. The method must use a quoting mechanism
that is unambiguously different from the quoting mechanism used for
strings, so that a query like `⁠SELECT ... FROM (SELECT 1 AS ...)⁠` throws
an error if the column names do not match.

The method can quote column names that contain special characters such
as a space, a dot, a comma, or quotes used to mark strings or
identifiers, if the database supports this. In any case, checking the
validity of the identifier should be performed only when executing a
query, and not by `dbQuoteIdentifier()`.

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

## Read database tables as data frames

This section describes the behavior of the following method:

``` r
dbReadTable(conn, name, ...)
```

### Description

Reads a database table to a data frame, optionally converting a column
to row names and converting the column names to valid R identifiers. Use
`dbReadTableArrow()` instead to obtain an Arrow object.

### Arguments

<table>
<colgroup>
<col style="width: 50%" />
<col style="width: 50%" />
</colgroup>
<tbody>
<tr class="odd">
<td><code id="dbReadTable_:_conn">conn</code></td>
<td><p>A DBIConnection object, as returned by
<code>dbConnect()</code>.</p></td>
</tr>
<tr class="even">
<td><code id="dbReadTable_:_name">name</code></td>
<td><p>The table name, passed on to <code>dbQuoteIdentifier()</code>.
Options are:</p>
<ul>
<li><p>a character string with the unquoted DBMS table name, e.g.
<code>"table_name"</code>,</p></li>
<li><p>a call to <code>Id()</code> with components to the fully
qualified table name, e.g.
<code>Id(schema = "my_schema", table = "table_name")</code></p></li>
<li><p>a call to <code>SQL()</code> with the quoted and fully qualified
table name given verbatim, e.g.
<code>SQL('"my_schema"."table_name"')</code></p></li>
</ul></td>
</tr>
<tr class="odd">
<td><code id="dbReadTable_:_...">...</code></td>
<td><p>Other parameters passed on to methods.</p></td>
</tr>
</tbody>
</table>

### Additional arguments

The following arguments are not part of the `dbReadTable()` generic (to
improve compatibility across backends) but are part of the DBI
specification:

- `row.names` (default: `FALSE`)

- `check.names`

They must be provided as named arguments. See the "Value" section for
details on their usage.

### Specification

The `name` argument is processed as follows, to support databases that
allow non-syntactic names for their objects:

- If an unquoted table name as string: `dbReadTable()` will do the
  quoting, perhaps by calling `dbQuoteIdentifier(conn, x = name)`

- If the result of a call to `dbQuoteIdentifier()`: no more quoting is
  done

### Details

This function returns a data frame. Use `dbReadTableArrow()` to obtain
an Arrow object.

### Value

`dbReadTable()` returns a data frame that contains the complete data
from the remote table, effectively the result of calling `dbGetQuery()`
with `⁠SELECT * FROM <name>⁠`.

An empty table is returned as a data frame with zero rows.

The presence of rownames depends on the `row.names` argument, see
`sqlColumnToRownames()` for details:

- If `FALSE` or `NULL`, the returned data frame doesn't have row names.

- If `TRUE`, a column named "row_names" is converted to row names.

<!-- -->

- If `NA`, a column named "row_names" is converted to row names if it
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

An error is raised if `row.names` is `TRUE` and no "row_names" column
exists,

An error is raised if `row.names` is set to a string and no
corresponding column exists.

An error is raised when calling this method for a closed or invalid
connection. An error is raised if `name` cannot be processed with
`dbQuoteIdentifier()` or if this results in a non-scalar. Unsupported
values for `row.names` and `check.names` (non-scalars, unsupported data
types, `NA` for `check.names`) also raise an error.

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

<table>
<colgroup>
<col style="width: 50%" />
<col style="width: 50%" />
</colgroup>
<tbody>
<tr class="odd">
<td><code id="dbWriteTable_:_conn">conn</code></td>
<td><p>A DBIConnection object, as returned by
<code>dbConnect()</code>.</p></td>
</tr>
<tr class="even">
<td><code id="dbWriteTable_:_name">name</code></td>
<td><p>The table name, passed on to <code>dbQuoteIdentifier()</code>.
Options are:</p>
<ul>
<li><p>a character string with the unquoted DBMS table name, e.g.
<code>"table_name"</code>,</p></li>
<li><p>a call to <code>Id()</code> with components to the fully
qualified table name, e.g.
<code>Id(schema = "my_schema", table = "table_name")</code></p></li>
<li><p>a call to <code>SQL()</code> with the quoted and fully qualified
table name given verbatim, e.g.
<code>SQL('"my_schema"."table_name"')</code></p></li>
</ul></td>
</tr>
<tr class="odd">
<td><code id="dbWriteTable_:_value">value</code></td>
<td><p>A data.frame (or coercible to data.frame).</p></td>
</tr>
<tr class="even">
<td><code id="dbWriteTable_:_...">...</code></td>
<td><p>Other parameters passed on to methods.</p></td>
</tr>
</tbody>
</table>

### Additional arguments

The following arguments are not part of the `dbWriteTable()` generic (to
improve compatibility across backends) but are part of the DBI
specification:

- `row.names` (default: `FALSE`)

- `overwrite` (default: `FALSE`)

- `append` (default: `FALSE`)

- `field.types` (default: `NULL`)

- `temporary` (default: `FALSE`)

They must be provided as named arguments. See the "Specification" and
"Value" sections for details on their usage.

### Specification

The `name` argument is processed as follows, to support databases that
allow non-syntactic names for their objects:

- If an unquoted table name as string: `dbWriteTable()` will do the
  quoting, perhaps by calling `dbQuoteIdentifier(conn, x = name)`

- If the result of a call to `dbQuoteIdentifier()`: no more quoting is
  done

The `value` argument must be a data frame with a subset of the columns
of the existing table if `append = TRUE`. The order of the columns does
not matter with `append = TRUE`.

If the `overwrite` argument is `TRUE`, an existing table of the same
name will be overwritten. This argument doesn't change behavior if the
table does not exist yet.

If the `append` argument is `TRUE`, the rows in an existing table are
preserved, and the new data are appended. If the table doesn't exist
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
identically with `dbReadTable()`:

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

- objects of type blob::blob (if supported by the database)

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
inferred from the input data with `dbDataType()`.

The interpretation of rownames depends on the `row.names` argument, see
`sqlRownamesToColumn()` for details:

- If `FALSE` or `NULL`, row names are ignored.

- If `TRUE`, row names are converted to a column named "row_names", even
  if the input data frame only has natural row names from 1 to
  `nrow(...)`.

- If `NA`, a column named "row_names" is created if the data has custom
  row names, no extra column is created in the case of natural row
  names.

- If a string, this specifies the name of the column in the remote table
  that contains the row names, even if the input data frame only has
  natural row names.

The default is `row.names = FALSE`.

### Details

This function expects a data frame. Use `dbWriteTableArrow()` to write
an Arrow object.

This function is useful if you want to create and load a table at the
same time. Use `dbAppendTable()` or `dbAppendTableArrow()` for appending
data to an existing table, `dbCreateTable()` or `dbCreateTableArrow()`
for creating a table, and `dbExistsTable()` and `dbRemoveTable()` for
overwriting tables.

DBI only standardizes writing data frames with `dbWriteTable()`. Some
backends might implement methods that can consume CSV files or other
data formats. For details, see the documentation for the individual
methods.

### Value

`dbWriteTable()` returns `TRUE`, invisibly.

### Failure modes

If the table exists, and both `append` and `overwrite` arguments are
unset, or `append = TRUE` and the data frame with the new data has
different column names, an error is raised; the remote table remains
unchanged.

An error is raised when calling this method for a closed or invalid
connection. An error is also raised if `name` cannot be processed with
`dbQuoteIdentifier()` or if this results in a non-scalar. Invalid values
for the additional arguments `row.names`, `overwrite`, `append`,
`field.types`, and `temporary` (non-scalars, unsupported data types,
`NA`, incompatible values, duplicate or missing names, incompatible
columns) also raise an error.

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

## List remote tables

This section describes the behavior of the following method:

``` r
dbListTables(conn, ...)
```

### Description

Returns the unquoted names of remote tables accessible through this
connection. This should include views and temporary objects, but not all
database backends (in particular <span class="pkg">RMariaDB</span> and
<span class="pkg">RMySQL</span>) support this.

### Arguments

|        |                                                       |
|--------|-------------------------------------------------------|
| `conn` | A DBIConnection object, as returned by `dbConnect()`. |
| `...`  | Other parameters passed on to methods.                |

### Value

`dbListTables()` returns a character vector that enumerates all tables
and views in the database. Tables added with `dbWriteTable()` are part
of the list. As soon a table is removed from the database, it is also
removed from the list of database tables.

The same applies to temporary tables if supported by the database.

The returned names are suitable for quoting with `dbQuoteIdentifier()`.

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

## Does a table exist?

This section describes the behavior of the following method:

``` r
dbExistsTable(conn, name, ...)
```

### Description

Returns if a table given by name exists in the database.

### Arguments

<table>
<colgroup>
<col style="width: 50%" />
<col style="width: 50%" />
</colgroup>
<tbody>
<tr class="odd">
<td><code id="dbExistsTable_:_conn">conn</code></td>
<td><p>A DBIConnection object, as returned by
<code>dbConnect()</code>.</p></td>
</tr>
<tr class="even">
<td><code id="dbExistsTable_:_name">name</code></td>
<td><p>The table name, passed on to <code>dbQuoteIdentifier()</code>.
Options are:</p>
<ul>
<li><p>a character string with the unquoted DBMS table name, e.g.
<code>"table_name"</code>,</p></li>
<li><p>a call to <code>Id()</code> with components to the fully
qualified table name, e.g.
<code>Id(schema = "my_schema", table = "table_name")</code></p></li>
<li><p>a call to <code>SQL()</code> with the quoted and fully qualified
table name given verbatim, e.g.
<code>SQL('"my_schema"."table_name"')</code></p></li>
</ul></td>
</tr>
<tr class="odd">
<td><code id="dbExistsTable_:_...">...</code></td>
<td><p>Other parameters passed on to methods.</p></td>
</tr>
</tbody>
</table>

### Value

`dbExistsTable()` returns a logical scalar, `TRUE` if the table or view
specified by the `name` argument exists, `FALSE` otherwise.

This includes temporary tables if supported by the database.

### Failure modes

An error is raised when calling this method for a closed or invalid
connection. An error is also raised if `name` cannot be processed with
`dbQuoteIdentifier()` or if this results in a non-scalar.

### Specification

The `name` argument is processed as follows, to support databases that
allow non-syntactic names for their objects:

- If an unquoted table name as string: `dbExistsTable()` will do the
  quoting, perhaps by calling `dbQuoteIdentifier(conn, x = name)`

- If the result of a call to `dbQuoteIdentifier()`: no more quoting is
  done

For all tables listed by `dbListTables()`, `dbExistsTable()` returns
`TRUE`.

### Examples

``` r
con <- dbConnect(RSQLite::SQLite(), ":memory:")

dbExistsTable(con, "iris")
dbWriteTable(con, "iris", iris)
dbExistsTable(con, "iris")

dbDisconnect(con)
```

## Remove a table from the database

This section describes the behavior of the following method:

``` r
dbRemoveTable(conn, name, ...)
```

### Description

Remove a remote table (e.g., created by `dbWriteTable()`) from the
database.

### Arguments

<table>
<colgroup>
<col style="width: 50%" />
<col style="width: 50%" />
</colgroup>
<tbody>
<tr class="odd">
<td><code id="dbRemoveTable_:_conn">conn</code></td>
<td><p>A DBIConnection object, as returned by
<code>dbConnect()</code>.</p></td>
</tr>
<tr class="even">
<td><code id="dbRemoveTable_:_name">name</code></td>
<td><p>The table name, passed on to <code>dbQuoteIdentifier()</code>.
Options are:</p>
<ul>
<li><p>a character string with the unquoted DBMS table name, e.g.
<code>"table_name"</code>,</p></li>
<li><p>a call to <code>Id()</code> with components to the fully
qualified table name, e.g.
<code>Id(schema = "my_schema", table = "table_name")</code></p></li>
<li><p>a call to <code>SQL()</code> with the quoted and fully qualified
table name given verbatim, e.g.
<code>SQL('"my_schema"."table_name"')</code></p></li>
</ul></td>
</tr>
<tr class="odd">
<td><code id="dbRemoveTable_:_...">...</code></td>
<td><p>Other parameters passed on to methods.</p></td>
</tr>
</tbody>
</table>

### Additional arguments

The following arguments are not part of the `dbRemoveTable()` generic
(to improve compatibility across backends) but are part of the DBI
specification:

- `temporary` (default: `FALSE`)

- `fail_if_missing` (default: `TRUE`)

These arguments must be provided as named arguments.

If `temporary` is `TRUE`, the call to `dbRemoveTable()` will consider
only temporary tables. Not all backends support this argument. In
particular, permanent tables of the same name are left untouched.

If `fail_if_missing` is `FALSE`, the call to `dbRemoveTable()` succeeds
if the table does not exist.

### Specification

A table removed by `dbRemoveTable()` doesn't appear in the list of
tables returned by `dbListTables()`, and `dbExistsTable()` returns
`FALSE`. The removal propagates immediately to other connections to the
same database. This function can also be used to remove a temporary
table.

The `name` argument is processed as follows, to support databases that
allow non-syntactic names for their objects:

- If an unquoted table name as string: `dbRemoveTable()` will do the
  quoting, perhaps by calling `dbQuoteIdentifier(conn, x = name)`

- If the result of a call to `dbQuoteIdentifier()`: no more quoting is
  done

### Value

`dbRemoveTable()` returns `TRUE`, invisibly.

### Failure modes

If the table does not exist, an error is raised. An attempt to remove a
view with this function may result in an error.

An error is raised when calling this method for a closed or invalid
connection. An error is also raised if `name` cannot be processed with
`dbQuoteIdentifier()` or if this results in a non-scalar.

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

## List field names of a remote table

This section describes the behavior of the following method:

``` r
dbListFields(conn, name, ...)
```

### Description

Returns the field names of a remote table as a character vector.

### Arguments

<table>
<colgroup>
<col style="width: 50%" />
<col style="width: 50%" />
</colgroup>
<tbody>
<tr class="odd">
<td><code id="dbListFields_:_conn">conn</code></td>
<td><p>A DBIConnection object, as returned by
<code>dbConnect()</code>.</p></td>
</tr>
<tr class="even">
<td><code id="dbListFields_:_name">name</code></td>
<td><p>The table name, passed on to <code>dbQuoteIdentifier()</code>.
Options are:</p>
<ul>
<li><p>a character string with the unquoted DBMS table name, e.g.
<code>"table_name"</code>,</p></li>
<li><p>a call to <code>Id()</code> with components to the fully
qualified table name, e.g.
<code>Id(schema = "my_schema", table = "table_name")</code></p></li>
<li><p>a call to <code>SQL()</code> with the quoted and fully qualified
table name given verbatim, e.g.
<code>SQL('"my_schema"."table_name"')</code></p></li>
</ul></td>
</tr>
<tr class="odd">
<td><code id="dbListFields_:_...">...</code></td>
<td><p>Other parameters passed on to methods.</p></td>
</tr>
</tbody>
</table>

### Value

`dbListFields()` returns a character vector that enumerates all fields
in the table in the correct order. This also works for temporary tables
if supported by the database. The returned names are suitable for
quoting with `dbQuoteIdentifier()`.

### Failure modes

If the table does not exist, an error is raised. Invalid types for the
`name` argument (e.g., `character` of length not equal to one, or
numeric) lead to an error. An error is also raised when calling this
method for a closed or invalid connection.

### Specification

The `name` argument can be

- a string

- the return value of `dbQuoteIdentifier()`

- a value from the `table` column from the return value of
  `dbListObjects()` where `is_prefix` is `FALSE`

A column named `row_names` is treated like any other column.

### Examples

``` r
con <- dbConnect(RSQLite::SQLite(), ":memory:")

dbWriteTable(con, "mtcars", mtcars)
dbListFields(con, "mtcars")

dbDisconnect(con)
```

## Is this DBMS object still valid?

This section describes the behavior of the following method:

``` r
dbIsValid(dbObj, ...)
```

### Description

This generic tests whether a database object is still valid (i.e. it
hasn't been disconnected or cleared).

### Arguments

|         |                                                                                    |
|---------|------------------------------------------------------------------------------------|
| `dbObj` | An object inheriting from DBIObject, i.e. DBIDriver, DBIConnection, or a DBIResult |
| `...`   | Other arguments to methods.                                                        |

### Value

`dbIsValid()` returns a logical scalar, `TRUE` if the object specified
by `dbObj` is valid, `FALSE` otherwise. A DBIConnection object is
initially valid, and becomes invalid after disconnecting with
`dbDisconnect()`. For an invalid connection object (e.g., for some
drivers if the object is saved to a file and then restored), the method
also returns `FALSE`. A DBIResult object is valid after a call to
`dbSendQuery()`, and stays valid even after all rows have been fetched;
only clearing it with `dbClearResult()` invalidates it. A DBIResult
object is also valid after a call to `dbSendStatement()`, and stays
valid after querying the number of rows affected; only clearing it with
`dbClearResult()` invalidates it. If the connection to the database
system is dropped (e.g., due to connectivity problems, server failure,
etc.), `dbIsValid()` should return `FALSE`. This is not tested
automatically.

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

`dbHasCompleted()` returns a logical scalar. For a query initiated by
`dbSendQuery()` with non-empty result set, `dbHasCompleted()` returns
`FALSE` initially and `TRUE` after calling `dbFetch()` without limit.
For a query initiated by `dbSendStatement()`, `dbHasCompleted()` always
returns `TRUE`.

### The data retrieval flow

This section gives a complete overview over the flow for the execution
of queries that return tabular data as data frames.

Most of this flow, except repeated calling of `dbBind()` or
`dbBindArrow()`, is implemented by `dbGetQuery()`, which should be
sufficient unless you want to access the results in a paged way or you
have a parameterized query that you want to reuse. This flow requires an
active connection established by `dbConnect()`. See also
`vignette("dbi-advanced")` for a walkthrough.

1.  Use `dbSendQuery()` to create a result set object of class
    DBIResult.

2.  Optionally, bind query parameters with `dbBind()` or
    `dbBindArrow()`. This is required only if the query contains
    placeholders such as `⁠?⁠` or `⁠\$1⁠`, depending on the database
    backend.

3.  Optionally, use `dbColumnInfo()` to retrieve the structure of the
    result set without retrieving actual data.

4.  Use `dbFetch()` to get the entire result set, a page of results, or
    the remaining rows. Fetching zero rows is also possible to retrieeve
    the structure of the result set as a data frame. This step can be
    called multiple times. Only forward paging is supported, you need to
    cache previous pages if you need to navigate backwards.

5.  Use `dbHasCompleted()` to tell when you're done. This method returns
    `TRUE` if no more rows are available for fetching.

6.  Repeat the last four steps as necessary.

7.  Use `dbClearResult()` to clean up the result set object. This step
    is mandatory even if no rows have been fetched or if an error has
    occurred during the processing. It is good practice to use
    `on.exit()` or `withr::defer()` to ensure that this step is always
    executed.

### Failure modes

Attempting to query completion status for a result set cleared with
`dbClearResult()` gives an error.

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

Returns the statement that was passed to `dbSendQuery()` or
`dbSendStatement()`.

### Arguments

|       |                                       |
|-------|---------------------------------------|
| `res` | An object inheriting from DBIResult.  |
| `...` | Other arguments passed on to methods. |

### Value

`dbGetStatement()` returns a string, the query used in either
`dbSendQuery()` or `dbSendStatement()`.

### Failure modes

Attempting to query the statement for a result set cleared with
`dbClearResult()` gives an error.

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
`dbFetch()` for this result set.

### Arguments

|       |                                       |
|-------|---------------------------------------|
| `res` | An object inheriting from DBIResult.  |
| `...` | Other arguments passed on to methods. |

### Value

`dbGetRowCount()` returns a scalar number (integer or numeric), the
number of rows fetched so far. After calling `dbSendQuery()`, the row
count is initially zero. After a call to `dbFetch()` without limit, the
row count matches the total number of rows returned. Fetching a limited
number of rows increases the number of rows by the number of rows
returned, even if fetching past the end of the result set. For queries
with an empty result set, zero is returned even after fetching. For data
manipulation statements issued with `dbSendStatement()`, zero is
returned before and after calling `dbFetch()`.

### Failure modes

Attempting to get the row count for a result set cleared with
`dbClearResult()` gives an error.

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

`dbGetRowsAffected()` returns a scalar number (integer or numeric), the
number of rows affected by a data manipulation statement issued with
`dbSendStatement()`. The value is available directly after the call and
does not change after calling `dbFetch()`. `NA_integer_` or
`NA_numeric_` are allowed if the number of rows affected is not known.

For queries issued with `dbSendQuery()`, zero is returned before and
after the call to `dbFetch()`. `NA` values are not allowed.

### The command execution flow

This section gives a complete overview over the flow for the execution
of SQL statements that have side effects such as stored procedures,
inserting or deleting data, or setting database or connection options.
Most of this flow, except repeated calling of `dbBindArrow()`, is
implemented by `dbExecute()`, which should be sufficient for
non-parameterized queries. This flow requires an active connection
established by `dbConnect()`. See also `vignette("dbi-advanced")` for a
walkthrough.

1.  Use `dbSendStatement()` to create a result set object of class
    DBIResult. For some queries you need to pass `immediate = TRUE`.

2.  Optionally, bind query parameters with`dbBind()` or `dbBindArrow()`.
    This is required only if the query contains placeholders such as `⁠?⁠`
    or `⁠\$1⁠`, depending on the database backend.

3.  Optionally, use `dbGetRowsAffected()` to retrieve the number of rows
    affected by the query.

4.  Repeat the last two steps as necessary.

5.  Use `dbClearResult()` to clean up the result set object. This step
    is mandatory even if no rows have been fetched or if an error has
    occurred during the processing. It is good practice to use
    `on.exit()` or `withr::defer()` to ensure that this step is always
    executed.

### Failure modes

Attempting to get the rows affected for a result set cleared with
`dbClearResult()` gives an error.

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

`dbColumnInfo()` returns a data frame with at least two columns `"name"`
and `"type"` (in that order) (and optional columns that start with a
dot). The `"name"` and `"type"` columns contain the names and types of
the R columns of the data frame that is returned from `dbFetch()`. The
`"type"` column is of type `character` and only for information. Do not
compute on the `"type"` column, instead use `dbFetch(res, n = 0)` to
create a zero-row data frame initialized with the correct data types.

### The data retrieval flow

This section gives a complete overview over the flow for the execution
of queries that return tabular data as data frames.

Most of this flow, except repeated calling of `dbBind()` or
`dbBindArrow()`, is implemented by `dbGetQuery()`, which should be
sufficient unless you want to access the results in a paged way or you
have a parameterized query that you want to reuse. This flow requires an
active connection established by `dbConnect()`. See also
`vignette("dbi-advanced")` for a walkthrough.

1.  Use `dbSendQuery()` to create a result set object of class
    DBIResult.

2.  Optionally, bind query parameters with `dbBind()` or
    `dbBindArrow()`. This is required only if the query contains
    placeholders such as `⁠?⁠` or `⁠\$1⁠`, depending on the database
    backend.

3.  Optionally, use `dbColumnInfo()` to retrieve the structure of the
    result set without retrieving actual data.

4.  Use `dbFetch()` to get the entire result set, a page of results, or
    the remaining rows. Fetching zero rows is also possible to retrieeve
    the structure of the result set as a data frame. This step can be
    called multiple times. Only forward paging is supported, you need to
    cache previous pages if you need to navigate backwards.

5.  Use `dbHasCompleted()` to tell when you're done. This method returns
    `TRUE` if no more rows are available for fetching.

6.  Repeat the last four steps as necessary.

7.  Use `dbClearResult()` to clean up the result set object. This step
    is mandatory even if no rows have been fetched or if an error has
    occurred during the processing. It is good practice to use
    `on.exit()` or `withr::defer()` to ensure that this step is always
    executed.

### Failure modes

An attempt to query columns for a closed result set raises an error.

### Specification

A column named `row_names` is treated like any other column.

The column names are always consistent with the data returned by
`dbFetch()`.

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
is initiated with `dbBegin()` and either made persistent with
`dbCommit()` or undone with `dbRollback()`. In any case, the DBMS
guarantees that either all or none of the statements have a permanent
effect. This helps ensuring consistency of write operations to multiple
tables.

### Arguments

|        |                                                       |
|--------|-------------------------------------------------------|
| `conn` | A DBIConnection object, as returned by `dbConnect()`. |
| `...`  | Other parameters passed on to methods.                |

### Details

Not all database engines implement transaction management, in which case
these methods should not be implemented for the specific DBIConnection
subclass.

### Value

`dbBegin()`, `dbCommit()` and `dbRollback()` return `TRUE`, invisibly.

### Failure modes

The implementations are expected to raise an error in case of failure,
but this is not tested. In any way, all generics throw an error with a
closed or invalid connection. In addition, a call to `dbCommit()` or
`dbRollback()` without a prior call to `dbBegin()` raises an error.
Nested transactions are not supported by DBI, an attempt to call
`dbBegin()` twice yields an error.

### Specification

Actual support for transactions may vary between backends. A transaction
is initiated by a call to `dbBegin()` and committed by a call to
`dbCommit()`. Data written in a transaction must persist after the
transaction is committed. For example, a record that is missing when the
transaction is started but is created during the transaction must exist
both during and after the transaction, and also in a new connection.

A transaction can also be aborted with `dbRollback()`. All data written
in such a transaction must be removed after the transaction is rolled
back. For example, a record that is missing when the transaction is
started but is created during the transaction must not exist anymore
after the rollback.

Disconnection from a connection with an open transaction effectively
rolls back the transaction. All data written in such a transaction must
be removed after the transaction is rolled back.

The behavior is not specified if other arguments are passed to these
functions. In particular, <span class="pkg">RSQLite</span> issues named
transactions with support for nesting if the `name` argument is set.

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
`dbWithTransaction()` calls `dbBegin()` before executing the code, and
`dbCommit()` after successful completion, or `dbRollback()` in case of
an error. The advantage is that you don't have to remember to do
`dbBegin()` and `dbCommit()` or `dbRollback()` – that is all taken care
of. The special function `dbBreak()` allows an early exit with rollback,
it can be called only inside `dbWithTransaction()`.

### Arguments

|        |                                                       |
|--------|-------------------------------------------------------|
| `conn` | A DBIConnection object, as returned by `dbConnect()`. |
| `code` | An arbitrary block of R code.                         |
| `...`  | Other parameters passed on to methods.                |

### Details

DBI implements `dbWithTransaction()`, backends should need to override
this generic only if they implement specialized handling.

### Value

`dbWithTransaction()` returns the value of the executed code.

### Failure modes

Failure to initiate the transaction (e.g., if the connection is closed
or invalid of if `dbBegin()` has been called already) gives an error.

### Specification

`dbWithTransaction()` initiates a transaction with `dbBegin()`, executes
the code given in the `code` argument, and commits the transaction with
`dbCommit()`. If the code raises an error, the transaction is instead
aborted with `dbRollback()`, and the error is propagated. If the code
calls `dbBreak()`, execution of the code stops and the transaction is
silently aborted. All side effects caused by the code (such as the
creation of new variables) propagate to the calling environment.

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

# The code is executed as if in the curent environment:
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
