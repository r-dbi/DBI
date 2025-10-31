# Fetch records from a previously executed query

Fetch the next `n` elements (rows) from the result set and return them
as a data.frame.

### Methods in other packages

This documentation page describes the generics. Refer to the
documentation pages linked below for the documentation for the methods
that are implemented in various backend packages.

- `adbi::dbFetch("AdbiResult", "ANY")`

- `AzureKusto::dbFetch("AzureKustoResult", "ANY")`

- `bigrquery::dbFetch("BigQueryResult", "ANY")`

- `DatabaseConnector::dbFetch("DatabaseConnectorDbiResult", "ANY")`

- `DatabaseConnector::dbFetch("DatabaseConnectorJdbcResult", "ANY")`

- `dittodb::dbFetch("DBIMockResult", "ANY")`

- `duckdb::dbFetch("duckdb_result", "ANY")`

- `lazysf::dbFetch("SFSQLResult", "ANY")`

- `odbc::dbFetch("OdbcResult", "ANY")`

- `RAthena::dbFetch("AthenaResult", "ANY")`

- `RMariaDB::dbFetch("MariaDBResult", "ANY")`

- [`RMySQL::dbFetch("MySQLResult", "missing")`](https://r-dbi.r-universe.dev/RMySQL/reference/query.html)

- [`RMySQL::dbFetch("MySQLResult", "numeric")`](https://r-dbi.r-universe.dev/RMySQL/reference/query.html)

- `RPostgres::dbFetch("PqResult", "ANY")`

- [`RPresto::dbFetch("PrestoResult", "missing")`](https://rdrr.io/pkg/RPresto/man/PrestoResult-class.html)

- [`RPresto::dbFetch("PrestoResult", "numeric")`](https://rdrr.io/pkg/RPresto/man/PrestoResult-class.html)

- `RSQLite::dbFetch("SQLiteResult", "ANY")`

- `sergeant::dbFetch("DrillResult", "ANY")`

- `sparklyr::dbFetch("DBISparkResult", "ANY")`

## Usage

``` r
dbFetch(res, n = -1, ...)

fetch(res, n = -1, ...)
```

## Arguments

- res:

  An object inheriting from
  [DBI::DBIResult](https://dbi.r-dbi.org/dev/reference/DBIResult-class.md),
  created by
  [`dbSendQuery()`](https://dbi.r-dbi.org/dev/reference/dbSendQuery.md).

- n:

  maximum number of records to retrieve per fetch. Use `n = -1` or
  `n = Inf` to retrieve all pending records. Some implementations may
  recognize other special values.

- ...:

  Other arguments passed on to methods.

## Value

`dbFetch()` always returns a
[data.frame](https://rdrr.io/r/base/data.frame.html) with as many rows
as records were fetched and as many columns as fields in the result set,
even if the result is a single value or has one or zero rows. Passing
`n = NA` is supported and returns an arbitrary number of rows (at least
one) as specified by the driver, but at most the remaining rows in the
result set.

## Details

`fetch()` is provided for compatibility with older DBI clients - for all
new code you are strongly encouraged to use `dbFetch()`. The default
implementation for `dbFetch()` calls `fetch()` so that it is compatible
with existing code. Modern backends should implement for `dbFetch()`
only.

## The data retrieval flow

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
    to create a result set object of class
    [DBIResult](https://dbi.r-dbi.org/dev/reference/DBIResult-class.md).

2.  Optionally, bind query parameters with
    [`dbBind()`](https://dbi.r-dbi.org/dev/reference/dbBind.md) or
    [`dbBindArrow()`](https://dbi.r-dbi.org/dev/reference/dbBind.md).
    This is required only if the query contains placeholders such as `?`
    or `$1`, depending on the database backend.

3.  Optionally, use
    [`dbColumnInfo()`](https://dbi.r-dbi.org/dev/reference/dbColumnInfo.md)
    to retrieve the structure of the result set without retrieving
    actual data.

4.  Use `dbFetch()` to get the entire result set, a page of results, or
    the remaining rows. Fetching zero rows is also possible to retrieve
    the structure of the result set as a data frame. This step can be
    called multiple times. Only forward paging is supported, you need to
    cache previous pages if you need to navigate backwards.

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

## Failure modes

An attempt to fetch from a closed result set raises an error. If the `n`
argument is not an atomic whole number greater or equal to -1 or Inf, an
error is raised, but a subsequent call to `dbFetch()` with proper `n`
argument succeeds.

Calling `dbFetch()` on a result set from a data manipulation query
created by
[`DBI::dbSendStatement()`](https://dbi.r-dbi.org/dev/reference/dbSendStatement.md)
can be fetched and return an empty data frame, with a warning.

## Specification

Fetching multi-row queries with one or more columns by default returns
the entire result. Multi-row queries can also be fetched progressively
by passing a whole number
([integer](https://rdrr.io/r/base/integer.html) or
[numeric](https://rdrr.io/r/base/numeric.html)) as the `n` argument. A
value of [Inf](https://rdrr.io/r/base/is.finite.html) for the `n`
argument is supported and also returns the full result. If more rows
than available are fetched, the result is returned in full without
warning. If fewer rows than requested are returned, further fetches will
return a data frame with zero rows. If zero rows are fetched, the
columns of the data frame are still fully typed. Fetching fewer rows
than available is permitted, no warning is issued when clearing the
result set.

A column named `row_names` is treated like any other column.

The column types of the returned data frame depend on the data returned:

- [integer](https://rdrr.io/r/base/integer.html) (or coercible to an
  integer) for integer values between -2^31 and 2^31 - 1, with
  [NA](https://rdrr.io/r/base/NA.html) for SQL `NULL` values

- [numeric](https://rdrr.io/r/base/numeric.html) for numbers with a
  fractional component, with NA for SQL `NULL` values

- [logical](https://rdrr.io/r/base/logical.html) for Boolean values
  (some backends may return an integer); with NA for SQL `NULL` values

- [character](https://rdrr.io/r/base/character.html) for text, with NA
  for SQL `NULL` values

- lists of [raw](https://rdrr.io/r/base/raw.html) for blobs with
  [NULL](https://rdrr.io/r/base/NULL.html) entries for SQL NULL values

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

- [Date](https://rdrr.io/r/base/Dates.html) for dates (also applies to
  the return value of the SQL function `current_date`)

- [POSIXct](https://rdrr.io/r/base/DateTimeClasses.html) for timestamps
  (also applies to the return value of the SQL function
  `current_timestamp`)

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

## See also

Close the result set with
[`dbClearResult()`](https://dbi.r-dbi.org/dev/reference/dbClearResult.md)
as soon as you finish retrieving the records you want.

Other DBIResult generics:
[`DBIResult-class`](https://dbi.r-dbi.org/dev/reference/DBIResult-class.md),
[`dbBind()`](https://dbi.r-dbi.org/dev/reference/dbBind.md),
[`dbClearResult()`](https://dbi.r-dbi.org/dev/reference/dbClearResult.md),
[`dbColumnInfo()`](https://dbi.r-dbi.org/dev/reference/dbColumnInfo.md),
[`dbGetInfo()`](https://dbi.r-dbi.org/dev/reference/dbGetInfo.md),
[`dbGetRowCount()`](https://dbi.r-dbi.org/dev/reference/dbGetRowCount.md),
[`dbGetRowsAffected()`](https://dbi.r-dbi.org/dev/reference/dbGetRowsAffected.md),
[`dbGetStatement()`](https://dbi.r-dbi.org/dev/reference/dbGetStatement.md),
[`dbHasCompleted()`](https://dbi.r-dbi.org/dev/reference/dbHasCompleted.md),
[`dbIsReadOnly()`](https://dbi.r-dbi.org/dev/reference/dbIsReadOnly.md),
[`dbIsValid()`](https://dbi.r-dbi.org/dev/reference/dbIsValid.md),
[`dbQuoteLiteral()`](https://dbi.r-dbi.org/dev/reference/dbQuoteLiteral.md),
[`dbQuoteString()`](https://dbi.r-dbi.org/dev/reference/dbQuoteString.md)

Other data retrieval generics:
[`dbBind()`](https://dbi.r-dbi.org/dev/reference/dbBind.md),
[`dbClearResult()`](https://dbi.r-dbi.org/dev/reference/dbClearResult.md),
[`dbFetchArrow()`](https://dbi.r-dbi.org/dev/reference/dbFetchArrow.md),
[`dbFetchArrowChunk()`](https://dbi.r-dbi.org/dev/reference/dbFetchArrowChunk.md),
[`dbGetQuery()`](https://dbi.r-dbi.org/dev/reference/dbGetQuery.md),
[`dbGetQueryArrow()`](https://dbi.r-dbi.org/dev/reference/dbGetQueryArrow.md),
[`dbHasCompleted()`](https://dbi.r-dbi.org/dev/reference/dbHasCompleted.md),
[`dbSendQuery()`](https://dbi.r-dbi.org/dev/reference/dbSendQuery.md),
[`dbSendQueryArrow()`](https://dbi.r-dbi.org/dev/reference/dbSendQueryArrow.md)

## Examples

``` r
con <- dbConnect(RSQLite::SQLite(), ":memory:")

dbWriteTable(con, "mtcars", mtcars)

# Fetch all results
rs <- dbSendQuery(con, "SELECT * FROM mtcars WHERE cyl = 4")
dbFetch(rs)
#>     mpg cyl  disp  hp drat    wt  qsec vs am gear carb
#> 1  22.8   4 108.0  93 3.85 2.320 18.61  1  1    4    1
#> 2  24.4   4 146.7  62 3.69 3.190 20.00  1  0    4    2
#> 3  22.8   4 140.8  95 3.92 3.150 22.90  1  0    4    2
#> 4  32.4   4  78.7  66 4.08 2.200 19.47  1  1    4    1
#> 5  30.4   4  75.7  52 4.93 1.615 18.52  1  1    4    2
#> 6  33.9   4  71.1  65 4.22 1.835 19.90  1  1    4    1
#> 7  21.5   4 120.1  97 3.70 2.465 20.01  1  0    3    1
#> 8  27.3   4  79.0  66 4.08 1.935 18.90  1  1    4    1
#> 9  26.0   4 120.3  91 4.43 2.140 16.70  0  1    5    2
#> 10 30.4   4  95.1 113 3.77 1.513 16.90  1  1    5    2
#> 11 21.4   4 121.0 109 4.11 2.780 18.60  1  1    4    2
dbClearResult(rs)

# Fetch in chunks
rs <- dbSendQuery(con, "SELECT * FROM mtcars")
while (!dbHasCompleted(rs)) {
  chunk <- dbFetch(rs, 10)
  print(nrow(chunk))
}
#> [1] 10
#> [1] 10
#> [1] 10
#> [1] 2

dbClearResult(rs)
dbDisconnect(con)
```
