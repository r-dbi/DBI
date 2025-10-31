# Completion status

This method returns if the operation has completed. A `SELECT` query is
completed if all rows have been fetched. A data manipulation statement
is always completed.

### Methods in other packages

This documentation page describes the generics. Refer to the
documentation pages linked below for the documentation for the methods
that are implemented in various backend packages.

- [`adbi::dbHasCompleted("AdbiResult")`](https://adbi.r-dbi.org/reference/AdbiResult-class.html)

- [`adbi::dbHasCompleted("AdbiResultArrow")`](https://adbi.r-dbi.org/reference/AdbiResultArrow-class.html)

- [`bigrquery::dbHasCompleted("BigQueryResult")`](https://bigrquery.r-dbi.org/reference/DBI.html)

- [`DatabaseConnector::dbHasCompleted("DatabaseConnectorDbiResult")`](https://ohdsi.github.io/DatabaseConnector/reference/dbHasCompleted-DatabaseConnectorDbiResult-method.html)

- [`DatabaseConnector::dbHasCompleted("DatabaseConnectorJdbcResult")`](https://ohdsi.github.io/DatabaseConnector/reference/dbHasCompleted-DatabaseConnectorJdbcResult-method.html)

- [`dittodb::dbHasCompleted("DBIMockResult")`](https://dittodb.jonkeane.com/reference/mock-db-methods.html)

- [`duckdb::dbHasCompleted("duckdb_result")`](https://r.duckdb.org/reference/duckdb_result-class.html)

- [`lazysf::dbHasCompleted("SFSQLResult")`](https://hypertidy.github.io/lazysf/reference/SFSQLResult-class.html)

- [`odbc::dbHasCompleted("OdbcResult")`](https://odbc.r-dbi.org/reference/OdbcResult.html)

- [`RAthena::dbHasCompleted("AthenaResult")`](https://dyfanjones.github.io/RAthena/reference/AthenaResult.html)

- `RJDBC::dbHasCompleted("JDBCResult")`

- [`RMariaDB::dbHasCompleted("MariaDBResult")`](https://rmariadb.r-dbi.org/reference/result-meta.html)

- [`RMySQL::dbHasCompleted("MySQLResult")`](https://r-dbi.r-universe.dev/RMySQL/reference/result-meta.html)

- [`RPostgres::dbHasCompleted("PqResult")`](https://rpostgres.r-dbi.org/reference/postgres-query.html)

- [`RPostgreSQL::dbHasCompleted("PostgreSQLResult")`](https://rdrr.io/pkg/RPostgreSQL/man/dbGetInfo-methods.html)

- [`RPresto::dbHasCompleted("PrestoResult")`](https://rdrr.io/pkg/RPresto/man/PrestoResult-class.html)

- [`RSQLite::dbHasCompleted("SQLiteResult")`](https://rsqlite.r-dbi.org/reference/SQLiteResult-class.html)

- [`sergeant::dbHasCompleted("DrillResult")`](https://rdrr.io/pkg/sergeant/man/DrillResult-class.html)

- `sparklyr::dbHasCompleted("DBISparkResult")`

## Usage

``` r
dbHasCompleted(res, ...)
```

## Arguments

- res:

  An object inheriting from
  [DBI::DBIResult](https://dbi.r-dbi.org/dev/reference/DBIResult-class.md).

- ...:

  Other arguments passed on to methods.

## Value

`dbHasCompleted()` returns a logical scalar. For a query initiated by
[`DBI::dbSendQuery()`](https://dbi.r-dbi.org/dev/reference/dbSendQuery.md)
with non-empty result set, `dbHasCompleted()` returns `FALSE` initially
and `TRUE` after calling
[`DBI::dbFetch()`](https://dbi.r-dbi.org/dev/reference/dbFetch.md)
without limit. For a query initiated by
[`DBI::dbSendStatement()`](https://dbi.r-dbi.org/dev/reference/dbSendStatement.md),
`dbHasCompleted()` always returns `TRUE`.

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

4.  Use [`dbFetch()`](https://dbi.r-dbi.org/dev/reference/dbFetch.md) to
    get the entire result set, a page of results, or the remaining rows.
    Fetching zero rows is also possible to retrieve the structure of the
    result set as a data frame. This step can be called multiple times.
    Only forward paging is supported, you need to cache previous pages
    if you need to navigate backwards.

5.  Use `dbHasCompleted()` to tell when you're done. This method returns
    `TRUE` if no more rows are available for fetching.

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

Attempting to query completion status for a result set cleared with
[`DBI::dbClearResult()`](https://dbi.r-dbi.org/dev/reference/dbClearResult.md)
gives an error.

## Specification

The completion status for a query is only guaranteed to be set to
`FALSE` after attempting to fetch past the end of the entire result.
Therefore, for a query with an empty result set, the initial return
value is unspecified, but the result value is `TRUE` after trying to
fetch only one row.

Similarly, for a query with a result set of length n, the return value
is unspecified after fetching n rows, but the result value is `TRUE`
after trying to fetch only one more row.

## See also

Other DBIResult generics:
[`DBIResult-class`](https://dbi.r-dbi.org/dev/reference/DBIResult-class.md),
[`dbBind()`](https://dbi.r-dbi.org/dev/reference/dbBind.md),
[`dbClearResult()`](https://dbi.r-dbi.org/dev/reference/dbClearResult.md),
[`dbColumnInfo()`](https://dbi.r-dbi.org/dev/reference/dbColumnInfo.md),
[`dbFetch()`](https://dbi.r-dbi.org/dev/reference/dbFetch.md),
[`dbGetInfo()`](https://dbi.r-dbi.org/dev/reference/dbGetInfo.md),
[`dbGetRowCount()`](https://dbi.r-dbi.org/dev/reference/dbGetRowCount.md),
[`dbGetRowsAffected()`](https://dbi.r-dbi.org/dev/reference/dbGetRowsAffected.md),
[`dbGetStatement()`](https://dbi.r-dbi.org/dev/reference/dbGetStatement.md),
[`dbIsReadOnly()`](https://dbi.r-dbi.org/dev/reference/dbIsReadOnly.md),
[`dbIsValid()`](https://dbi.r-dbi.org/dev/reference/dbIsValid.md),
[`dbQuoteLiteral()`](https://dbi.r-dbi.org/dev/reference/dbQuoteLiteral.md),
[`dbQuoteString()`](https://dbi.r-dbi.org/dev/reference/dbQuoteString.md)

Other DBIResultArrow generics:
[`DBIResultArrow-class`](https://dbi.r-dbi.org/dev/reference/DBIResultArrow-class.md),
[`dbBind()`](https://dbi.r-dbi.org/dev/reference/dbBind.md),
[`dbClearResult()`](https://dbi.r-dbi.org/dev/reference/dbClearResult.md),
[`dbFetchArrow()`](https://dbi.r-dbi.org/dev/reference/dbFetchArrow.md),
[`dbFetchArrowChunk()`](https://dbi.r-dbi.org/dev/reference/dbFetchArrowChunk.md),
[`dbIsValid()`](https://dbi.r-dbi.org/dev/reference/dbIsValid.md)

Other data retrieval generics:
[`dbBind()`](https://dbi.r-dbi.org/dev/reference/dbBind.md),
[`dbClearResult()`](https://dbi.r-dbi.org/dev/reference/dbClearResult.md),
[`dbFetch()`](https://dbi.r-dbi.org/dev/reference/dbFetch.md),
[`dbFetchArrow()`](https://dbi.r-dbi.org/dev/reference/dbFetchArrow.md),
[`dbFetchArrowChunk()`](https://dbi.r-dbi.org/dev/reference/dbFetchArrowChunk.md),
[`dbGetQuery()`](https://dbi.r-dbi.org/dev/reference/dbGetQuery.md),
[`dbGetQueryArrow()`](https://dbi.r-dbi.org/dev/reference/dbGetQueryArrow.md),
[`dbSendQuery()`](https://dbi.r-dbi.org/dev/reference/dbSendQuery.md),
[`dbSendQueryArrow()`](https://dbi.r-dbi.org/dev/reference/dbSendQueryArrow.md)

## Examples

``` r
con <- dbConnect(RSQLite::SQLite(), ":memory:")

dbWriteTable(con, "mtcars", mtcars)
rs <- dbSendQuery(con, "SELECT * FROM mtcars")

dbHasCompleted(rs)
#> [1] FALSE
ret1 <- dbFetch(rs, 10)
dbHasCompleted(rs)
#> [1] FALSE
ret2 <- dbFetch(rs)
dbHasCompleted(rs)
#> [1] TRUE

dbClearResult(rs)
dbDisconnect(con)
```
