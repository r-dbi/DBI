# Bind values to a parameterized/prepared statement

For parametrized or prepared statements, the
[`dbSendQuery()`](https://dbi.r-dbi.org/dev/reference/dbSendQuery.md),
[`dbSendQueryArrow()`](https://dbi.r-dbi.org/dev/reference/dbSendQueryArrow.md),
and
[`dbSendStatement()`](https://dbi.r-dbi.org/dev/reference/dbSendStatement.md)
functions can be called with statements that contain placeholders for
values. The `dbBind()` and `dbBindArrow()` functions bind these
placeholders to actual values, and are intended to be called on the
result set before calling
[`dbFetch()`](https://dbi.r-dbi.org/dev/reference/dbFetch.md) or
[`dbFetchArrow()`](https://dbi.r-dbi.org/dev/reference/dbFetchArrow.md).
The values are passed to `dbBind()` as lists or data frames, and to
`dbBindArrow()` as a stream created by
[`nanoarrow::as_nanoarrow_array_stream()`](https://arrow.apache.org/nanoarrow/latest/r/reference/as_nanoarrow_array_stream.html).

**\[experimental\]**

`dbBindArrow()` is experimental, as are the other `*Arrow` functions.
[`dbSendQuery()`](https://dbi.r-dbi.org/dev/reference/dbSendQuery.md) is
compatible with `dbBindArrow()`, and
[`dbSendQueryArrow()`](https://dbi.r-dbi.org/dev/reference/dbSendQueryArrow.md)
is compatible with `dbBind()`.

### Methods in other packages

This documentation page describes the generics. Refer to the
documentation pages linked below for the documentation for the methods
that are implemented in various backend packages.

- [`adbi::dbBind("AdbiResult")`](https://adbi.r-dbi.org/reference/AdbiResult-class.html)

- [`adbi::dbBind("AdbiResultArrow")`](https://adbi.r-dbi.org/reference/AdbiResultArrow-class.html)

- [`bigrquery::dbBind("BigQueryResult")`](https://bigrquery.r-dbi.org/reference/DBI.html)

- [`duckdb::dbBind("duckdb_result")`](https://r.duckdb.org/reference/duckdb_result-class.html)

- [`odbc::dbBind("OdbcResult")`](https://odbc.r-dbi.org/reference/OdbcResult.html)

- [`RMariaDB::dbBind("MariaDBResult")`](https://rmariadb.r-dbi.org/reference/query.html)

- [`RPostgres::dbBind("PqResult")`](https://rpostgres.r-dbi.org/reference/postgres-query.html)

- [`RSQLite::dbBind("SQLiteResult")`](https://rsqlite.r-dbi.org/reference/SQLiteResult-class.html)

- `sparklyr::dbBind("DBISparkResult")`

## Usage

``` r
dbBind(res, params, ...)

dbBindArrow(res, params, ...)
```

## Arguments

- res:

  An object inheriting from
  [DBI::DBIResult](https://dbi.r-dbi.org/dev/reference/DBIResult-class.md).

- params:

  For `dbBind()`, a list of values, named or unnamed, or a data frame,
  with one element/column per query parameter. For `dbBindArrow()`,
  values as a nanoarrow stream, with one column per query parameter.

- ...:

  Other arguments passed on to methods.

## Value

`dbBind()` returns the result set, invisibly, for queries issued by
[`DBI::dbSendQuery()`](https://dbi.r-dbi.org/dev/reference/dbSendQuery.md)
or
[`DBI::dbSendQueryArrow()`](https://dbi.r-dbi.org/dev/reference/dbSendQueryArrow.md)
and also for data manipulation statements issued by
[`DBI::dbSendStatement()`](https://dbi.r-dbi.org/dev/reference/dbSendStatement.md).

## Details

DBI supports parametrized (or prepared) queries and statements via the
`dbBind()` and `dbBindArrow()` generics. Parametrized queries are
different from normal queries in that they allow an arbitrary number of
placeholders, which are later substituted by actual values. Parametrized
queries (and statements) serve two purposes:

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

- `?` (positional matching in order of appearance) in RMariaDB and
  RSQLite

- `$1` (positional matching by index) in RPostgres and RSQLite

- `:name` and `$name` (named matching) in RSQLite

## The data retrieval flow

This section gives a complete overview over the flow for the execution
of queries that return tabular data as data frames.

Most of this flow, except repeated calling of `dbBind()` or
`dbBindArrow()`, is implemented by
[`dbGetQuery()`](https://dbi.r-dbi.org/dev/reference/dbGetQuery.md),
which should be sufficient unless you want to access the results in a
paged way or you have a parameterized query that you want to reuse. This
flow requires an active connection established by
[`dbConnect()`](https://dbi.r-dbi.org/dev/reference/dbConnect.md). See
also `vignette("dbi-advanced")` for a walkthrough.

1.  Use
    [`dbSendQuery()`](https://dbi.r-dbi.org/dev/reference/dbSendQuery.md)
    to create a result set object of class
    [DBIResult](https://dbi.r-dbi.org/dev/reference/DBIResult-class.md).

2.  Optionally, bind query parameters with `dbBind()` or
    `dbBindArrow()`. This is required only if the query contains
    placeholders such as `?` or `$1`, depending on the database backend.

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
    to tell when you're done. This method returns `TRUE` if no more rows
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

## The data retrieval flow for Arrow streams

This section gives a complete overview over the flow for the execution
of queries that return tabular data as an Arrow stream.

Most of this flow, except repeated calling of `dbBindArrow()` or
`dbBind()`, is implemented by
[`dbGetQueryArrow()`](https://dbi.r-dbi.org/dev/reference/dbGetQueryArrow.md),
which should be sufficient unless you have a parameterized query that
you want to reuse. This flow requires an active connection established
by [`dbConnect()`](https://dbi.r-dbi.org/dev/reference/dbConnect.md).
See also `vignette("dbi-advanced")` for a walkthrough.

1.  Use
    [`dbSendQueryArrow()`](https://dbi.r-dbi.org/dev/reference/dbSendQueryArrow.md)
    to create a result set object of class
    [DBIResultArrow](https://dbi.r-dbi.org/dev/reference/DBIResultArrow-class.md).

2.  Optionally, bind query parameters with `dbBindArrow()` or
    `dbBind()`. This is required only if the query contains placeholders
    such as `?` or `$1`, depending on the database backend.

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

## The command execution flow

This section gives a complete overview over the flow for the execution
of SQL statements that have side effects such as stored procedures,
inserting or deleting data, or setting database or connection options.
Most of this flow, except repeated calling of `dbBindArrow()`, is
implemented by
[`dbExecute()`](https://dbi.r-dbi.org/dev/reference/dbExecute.md), which
should be sufficient for non-parameterized queries. This flow requires
an active connection established by
[`dbConnect()`](https://dbi.r-dbi.org/dev/reference/dbConnect.md). See
also `vignette("dbi-advanced")` for a walkthrough.

1.  Use
    [`dbSendStatement()`](https://dbi.r-dbi.org/dev/reference/dbSendStatement.md)
    to create a result set object of class
    [DBIResult](https://dbi.r-dbi.org/dev/reference/DBIResult-class.md).
    For some queries you need to pass `immediate = TRUE`.

2.  Optionally, bind query parameters with`dbBind()` or `dbBindArrow()`.
    This is required only if the query contains placeholders such as `?`
    or `$1`, depending on the database backend.

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

## Failure modes

Calling `dbBind()` for a query without parameters raises an error.

Binding too many or not enough values, or parameters with wrong names or
unequal length, also raises an error. If the placeholders in the query
are named, all parameter values must have names (which must not be empty
or `NA`), and vice versa, otherwise an error is raised. The behavior for
mixing placeholders of different types (in particular mixing positional
and named placeholders) is not specified.

Calling `dbBind()` on a result set already cleared by
[`DBI::dbClearResult()`](https://dbi.r-dbi.org/dev/reference/dbClearResult.md)
also raises an error.

## Specification

DBI clients execute parametrized statements as follows:

1.  Call
    [`DBI::dbSendQuery()`](https://dbi.r-dbi.org/dev/reference/dbSendQuery.md),
    [`DBI::dbSendQueryArrow()`](https://dbi.r-dbi.org/dev/reference/dbSendQueryArrow.md)
    or
    [`DBI::dbSendStatement()`](https://dbi.r-dbi.org/dev/reference/dbSendStatement.md)
    with a query or statement that contains placeholders, store the
    returned
    [DBI::DBIResult](https://dbi.r-dbi.org/dev/reference/DBIResult-class.md)
    object in a variable. Mixing placeholders (in particular, named and
    unnamed ones) is not recommended. It is good practice to register a
    call to
    [`DBI::dbClearResult()`](https://dbi.r-dbi.org/dev/reference/dbClearResult.md)
    via [`on.exit()`](https://rdrr.io/r/base/on.exit.html) right after
    calling
    [`dbSendQuery()`](https://dbi.r-dbi.org/dev/reference/dbSendQuery.md)
    or
    [`dbSendStatement()`](https://dbi.r-dbi.org/dev/reference/dbSendStatement.md)
    (see the last enumeration item). Until `DBI::dbBind()` or
    `DBI::dbBindArrow()` have been called, the returned result set
    object has the following behavior:

    - [`DBI::dbFetch()`](https://dbi.r-dbi.org/dev/reference/dbFetch.md)
      raises an error (for
      [`dbSendQuery()`](https://dbi.r-dbi.org/dev/reference/dbSendQuery.md)
      and
      [`dbSendQueryArrow()`](https://dbi.r-dbi.org/dev/reference/dbSendQueryArrow.md))

    - [`DBI::dbGetRowCount()`](https://dbi.r-dbi.org/dev/reference/dbGetRowCount.md)
      returns zero (for
      [`dbSendQuery()`](https://dbi.r-dbi.org/dev/reference/dbSendQuery.md)
      and
      [`dbSendQueryArrow()`](https://dbi.r-dbi.org/dev/reference/dbSendQueryArrow.md))

    - [`DBI::dbGetRowsAffected()`](https://dbi.r-dbi.org/dev/reference/dbGetRowsAffected.md)
      returns an integer `NA` (for
      [`dbSendStatement()`](https://dbi.r-dbi.org/dev/reference/dbSendStatement.md))

    - [`DBI::dbIsValid()`](https://dbi.r-dbi.org/dev/reference/dbIsValid.md)
      returns `TRUE`

    - [`DBI::dbHasCompleted()`](https://dbi.r-dbi.org/dev/reference/dbHasCompleted.md)
      returns `FALSE`

2.  Call `DBI::dbBind()` or `DBI::dbBindArrow()`:

    - For `DBI::dbBind()`, the `params` argument must be a list where
      all elements have the same lengths and contain values supported by
      the backend. A
      [data.frame](https://rdrr.io/r/base/data.frame.html) is internally
      stored as such a list.

    - For `DBI::dbBindArrow()`, the `params` argument must be a
      nanoarrow array stream, with one column per query parameter.

3.  Retrieve the data or the number of affected rows from the
    `DBIResult` object.

    - For queries issued by
      [`dbSendQuery()`](https://dbi.r-dbi.org/dev/reference/dbSendQuery.md)
      or
      [`dbSendQueryArrow()`](https://dbi.r-dbi.org/dev/reference/dbSendQueryArrow.md),
      call
      [`DBI::dbFetch()`](https://dbi.r-dbi.org/dev/reference/dbFetch.md).

    - For statements issued by `dbSendStatements()`, call
      [`DBI::dbGetRowsAffected()`](https://dbi.r-dbi.org/dev/reference/dbGetRowsAffected.md).
      (Execution begins immediately after the `DBI::dbBind()` call, the
      statement is processed entirely before the function returns.)

4.  Repeat 2. and 3. as necessary.

5.  Close the result set via
    [`DBI::dbClearResult()`](https://dbi.r-dbi.org/dev/reference/dbClearResult.md).

The elements of the `params` argument do not need to be scalars, vectors
of arbitrary length (including length 0) are supported. For queries,
calling [`dbFetch()`](https://dbi.r-dbi.org/dev/reference/dbFetch.md)
binding such parameters returns concatenated results, equivalent to
binding and fetching for each set of values and connecting via
[`rbind()`](https://rdrr.io/r/base/cbind.html). For data manipulation
statements,
[`dbGetRowsAffected()`](https://dbi.r-dbi.org/dev/reference/dbGetRowsAffected.md)
returns the total number of rows affected if binding non-scalar
parameters. `dbBind()` also accepts repeated calls on the same result
set for both queries and data manipulation statements, even if no
results are fetched between calls to `dbBind()`, for both queries and
data manipulation statements.

If the placeholders in the query are named, their order in the `params`
argument is not important.

At least the following data types are accepted on input (including
[NA](https://rdrr.io/r/base/NA.html)):

- [integer](https://rdrr.io/r/base/integer.html)

- [numeric](https://rdrr.io/r/base/numeric.html)

- [logical](https://rdrr.io/r/base/logical.html) for Boolean values

- [character](https://rdrr.io/r/base/character.html) (also with special
  characters such as spaces, newlines, quotes, and backslashes)

- [factor](https://rdrr.io/r/base/factor.html) (bound as character, with
  warning)

- [Date](https://rdrr.io/r/base/Dates.html) (also when stored internally
  as integer)

- [POSIXct](https://rdrr.io/r/base/DateTimeClasses.html) timestamps

- [POSIXlt](https://rdrr.io/r/base/DateTimeClasses.html) timestamps

- [difftime](https://rdrr.io/r/base/difftime.html) values (also with
  units other than seconds and with the value stored as integer)

- lists of [raw](https://rdrr.io/r/base/raw.html) for blobs (with `NULL`
  entries for SQL NULL values)

- objects of type
  [blob::blob](https://blob.tidyverse.org/reference/blob.html)

## See also

Other DBIResult generics:
[`DBIResult-class`](https://dbi.r-dbi.org/dev/reference/DBIResult-class.md),
[`dbClearResult()`](https://dbi.r-dbi.org/dev/reference/dbClearResult.md),
[`dbColumnInfo()`](https://dbi.r-dbi.org/dev/reference/dbColumnInfo.md),
[`dbFetch()`](https://dbi.r-dbi.org/dev/reference/dbFetch.md),
[`dbGetInfo()`](https://dbi.r-dbi.org/dev/reference/dbGetInfo.md),
[`dbGetRowCount()`](https://dbi.r-dbi.org/dev/reference/dbGetRowCount.md),
[`dbGetRowsAffected()`](https://dbi.r-dbi.org/dev/reference/dbGetRowsAffected.md),
[`dbGetStatement()`](https://dbi.r-dbi.org/dev/reference/dbGetStatement.md),
[`dbHasCompleted()`](https://dbi.r-dbi.org/dev/reference/dbHasCompleted.md),
[`dbIsReadOnly()`](https://dbi.r-dbi.org/dev/reference/dbIsReadOnly.md),
[`dbIsValid()`](https://dbi.r-dbi.org/dev/reference/dbIsValid.md),
[`dbQuoteLiteral()`](https://dbi.r-dbi.org/dev/reference/dbQuoteLiteral.md),
[`dbQuoteString()`](https://dbi.r-dbi.org/dev/reference/dbQuoteString.md)

Other DBIResultArrow generics:
[`DBIResultArrow-class`](https://dbi.r-dbi.org/dev/reference/DBIResultArrow-class.md),
[`dbClearResult()`](https://dbi.r-dbi.org/dev/reference/dbClearResult.md),
[`dbFetchArrow()`](https://dbi.r-dbi.org/dev/reference/dbFetchArrow.md),
[`dbFetchArrowChunk()`](https://dbi.r-dbi.org/dev/reference/dbFetchArrowChunk.md),
[`dbHasCompleted()`](https://dbi.r-dbi.org/dev/reference/dbHasCompleted.md),
[`dbIsValid()`](https://dbi.r-dbi.org/dev/reference/dbIsValid.md)

Other data retrieval generics:
[`dbClearResult()`](https://dbi.r-dbi.org/dev/reference/dbClearResult.md),
[`dbFetch()`](https://dbi.r-dbi.org/dev/reference/dbFetch.md),
[`dbFetchArrow()`](https://dbi.r-dbi.org/dev/reference/dbFetchArrow.md),
[`dbFetchArrowChunk()`](https://dbi.r-dbi.org/dev/reference/dbFetchArrowChunk.md),
[`dbGetQuery()`](https://dbi.r-dbi.org/dev/reference/dbGetQuery.md),
[`dbGetQueryArrow()`](https://dbi.r-dbi.org/dev/reference/dbGetQueryArrow.md),
[`dbHasCompleted()`](https://dbi.r-dbi.org/dev/reference/dbHasCompleted.md),
[`dbSendQuery()`](https://dbi.r-dbi.org/dev/reference/dbSendQuery.md),
[`dbSendQueryArrow()`](https://dbi.r-dbi.org/dev/reference/dbSendQueryArrow.md)

Other command execution generics:
[`dbClearResult()`](https://dbi.r-dbi.org/dev/reference/dbClearResult.md),
[`dbExecute()`](https://dbi.r-dbi.org/dev/reference/dbExecute.md),
[`dbGetRowsAffected()`](https://dbi.r-dbi.org/dev/reference/dbGetRowsAffected.md),
[`dbSendStatement()`](https://dbi.r-dbi.org/dev/reference/dbSendStatement.md)

## Examples

``` r
# Data frame flow:
con <- dbConnect(RSQLite::SQLite(), ":memory:")

dbWriteTable(con, "iris", iris)

# Using the same query for different values
iris_result <- dbSendQuery(con, "SELECT * FROM iris WHERE [Petal.Width] > ?")
dbBind(iris_result, list(2.3))
dbFetch(iris_result)
#>   Sepal.Length Sepal.Width Petal.Length Petal.Width   Species
#> 1          6.3         3.3          6.0         2.5 virginica
#> 2          7.2         3.6          6.1         2.5 virginica
#> 3          5.8         2.8          5.1         2.4 virginica
#> 4          6.3         3.4          5.6         2.4 virginica
#> 5          6.7         3.1          5.6         2.4 virginica
#> 6          6.7         3.3          5.7         2.5 virginica
dbBind(iris_result, list(3))
dbFetch(iris_result)
#> [1] Sepal.Length Sepal.Width  Petal.Length Petal.Width  Species     
#> <0 rows> (or 0-length row.names)
dbClearResult(iris_result)

# Executing the same statement with different values at once
iris_result <- dbSendStatement(con, "DELETE FROM iris WHERE [Species] = $species")
dbBind(iris_result, list(species = c("setosa", "versicolor", "unknown")))
dbGetRowsAffected(iris_result)
#> [1] 100
dbClearResult(iris_result)

nrow(dbReadTable(con, "iris"))
#> [1] 50

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
#>   Sepal.Length Sepal.Width Petal.Length Petal.Width   Species
#> 1          6.3         3.3          6.0         2.5 virginica
#> 2          7.2         3.6          6.1         2.5 virginica
#> 3          5.8         2.8          5.1         2.4 virginica
#> 4          6.3         3.4          5.6         2.4 virginica
#> 5          6.7         3.1          5.6         2.4 virginica
#> 6          6.7         3.3          5.7         2.5 virginica
dbBindArrow(
  iris_result,
  nanoarrow::as_nanoarrow_array_stream(data.frame(3, fix.empty.names = FALSE))
)
as.data.frame(dbFetchArrow(iris_result))
#> [1] Sepal.Length Sepal.Width  Petal.Length Petal.Width  Species     
#> <0 rows> (or 0-length row.names)
dbClearResult(iris_result)

# Executing the same statement with different values at once
iris_result <- dbSendStatement(con, "DELETE FROM iris WHERE [Species] = $species")
dbBindArrow(iris_result, nanoarrow::as_nanoarrow_array_stream(data.frame(
  species = c("setosa", "versicolor", "unknown")
)))
dbGetRowsAffected(iris_result)
#> [1] 100
dbClearResult(iris_result)

nrow(dbReadTable(con, "iris"))
#> [1] 50

dbDisconnect(con)
```
