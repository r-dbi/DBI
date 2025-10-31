# Clear a result set

Frees all resources (local and remote) associated with a result set.
This step is mandatory for all objects obtained by calling
[`dbSendQuery()`](https://dbi.r-dbi.org/dev/reference/dbSendQuery.md) or
[`dbSendStatement()`](https://dbi.r-dbi.org/dev/reference/dbSendStatement.md).

### Methods in other packages

This documentation page describes the generics. Refer to the
documentation pages linked below for the documentation for the methods
that are implemented in various backend packages.

- [`adbi::dbClearResult("AdbiResult")`](https://adbi.r-dbi.org/reference/AdbiResult-class.html)

- [`adbi::dbClearResult("AdbiResultArrow")`](https://adbi.r-dbi.org/reference/AdbiResultArrow-class.html)

- [`bigrquery::dbClearResult("BigQueryResult")`](https://bigrquery.r-dbi.org/reference/DBI.html)

- [`DatabaseConnector::dbClearResult("DatabaseConnectorDbiResult")`](https://ohdsi.github.io/DatabaseConnector/reference/dbClearResult-DatabaseConnectorDbiResult-method.html)

- [`DatabaseConnector::dbClearResult("DatabaseConnectorJdbcResult")`](https://ohdsi.github.io/DatabaseConnector/reference/dbClearResult-DatabaseConnectorJdbcResult-method.html)

- [`dittodb::dbClearResult("DBIMockResult")`](https://dittodb.jonkeane.com/reference/mock-db-methods.html)

- [`duckdb::dbClearResult("duckdb_result")`](https://r.duckdb.org/reference/duckdb_result-class.html)

- [`lazysf::dbClearResult("SFSQLResult")`](https://hypertidy.github.io/lazysf/reference/SFSQLResult-class.html)

- [`odbc::dbClearResult("OdbcResult")`](https://odbc.r-dbi.org/reference/OdbcResult.html)

- [`RAthena::dbClearResult("AthenaResult")`](https://dyfanjones.github.io/RAthena/reference/AthenaResult.html)

- [`RJDBC::dbClearResult("JDBCResult")`](https://rdrr.io/pkg/RJDBC/man/JDBCResult-methods.html)

- [`RMariaDB::dbClearResult("MariaDBResult")`](https://rmariadb.r-dbi.org/reference/query.html)

- [`RMySQL::dbClearResult("MySQLResult")`](https://r-dbi.r-universe.dev/RMySQL/reference/query.html)

- [`RPostgres::dbClearResult("PqResult")`](https://rpostgres.r-dbi.org/reference/postgres-query.html)

- [`RPostgreSQL::dbClearResult("PostgreSQLResult")`](https://rdrr.io/pkg/RPostgreSQL/man/dbSendQuery-methods.html)

- [`RPresto::dbClearResult("PrestoResult")`](https://rdrr.io/pkg/RPresto/man/PrestoResult-class.html)

- [`RSQLite::dbClearResult("SQLiteResult")`](https://rsqlite.r-dbi.org/reference/SQLiteResult-class.html)

- [`sergeant::dbClearResult("DrillResult")`](https://rdrr.io/pkg/sergeant/man/DrillResult-class.html)

- `sparklyr::dbClearResult("DBISparkResult")`

## Usage

``` r
dbClearResult(res, ...)
```

## Arguments

- res:

  An object inheriting from
  [DBI::DBIResult](https://dbi.r-dbi.org/dev/reference/DBIResult-class.md).

- ...:

  Other arguments passed on to methods.

## Value

`dbClearResult()` returns `TRUE`, invisibly, for result sets obtained
from
[`dbSendQuery()`](https://dbi.r-dbi.org/dev/reference/dbSendQuery.md),
[`dbSendStatement()`](https://dbi.r-dbi.org/dev/reference/dbSendStatement.md),
or
[`dbSendQueryArrow()`](https://dbi.r-dbi.org/dev/reference/dbSendQueryArrow.md),

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

5.  Use
    [`dbHasCompleted()`](https://dbi.r-dbi.org/dev/reference/dbHasCompleted.md)
    to tell when you're done. This method returns `TRUE` if no more rows
    are available for fetching.

6.  Repeat the last four steps as necessary.

7.  Use `dbClearResult()` to clean up the result set object. This step
    is mandatory even if no rows have been fetched or if an error has
    occurred during the processing. It is good practice to use
    [`on.exit()`](https://rdrr.io/r/base/on.exit.html) or
    [`withr::defer()`](https://withr.r-lib.org/reference/defer.html) to
    ensure that this step is always executed.

## The command execution flow

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
    to create a result set object of class
    [DBIResult](https://dbi.r-dbi.org/dev/reference/DBIResult-class.md).
    For some queries you need to pass `immediate = TRUE`.

2.  Optionally, bind query parameters
    with[`dbBind()`](https://dbi.r-dbi.org/dev/reference/dbBind.md) or
    [`dbBindArrow()`](https://dbi.r-dbi.org/dev/reference/dbBind.md).
    This is required only if the query contains placeholders such as `?`
    or `$1`, depending on the database backend.

3.  Optionally, use
    [`dbGetRowsAffected()`](https://dbi.r-dbi.org/dev/reference/dbGetRowsAffected.md)
    to retrieve the number of rows affected by the query.

4.  Repeat the last two steps as necessary.

5.  Use `dbClearResult()` to clean up the result set object. This step
    is mandatory even if no rows have been fetched or if an error has
    occurred during the processing. It is good practice to use
    [`on.exit()`](https://rdrr.io/r/base/on.exit.html) or
    [`withr::defer()`](https://withr.r-lib.org/reference/defer.html) to
    ensure that this step is always executed.

## Failure modes

An attempt to close an already closed result set issues a warning for
[`dbSendQuery()`](https://dbi.r-dbi.org/dev/reference/dbSendQuery.md),
[`dbSendStatement()`](https://dbi.r-dbi.org/dev/reference/dbSendStatement.md),
and
[`dbSendQueryArrow()`](https://dbi.r-dbi.org/dev/reference/dbSendQueryArrow.md),

## Specification

`dbClearResult()` frees all resources associated with retrieving the
result of a query or update operation. The DBI backend can expect a call
to `dbClearResult()` for each
[`DBI::dbSendQuery()`](https://dbi.r-dbi.org/dev/reference/dbSendQuery.md)
or
[`DBI::dbSendStatement()`](https://dbi.r-dbi.org/dev/reference/dbSendStatement.md)
call.

## See also

Other DBIResult generics:
[`DBIResult-class`](https://dbi.r-dbi.org/dev/reference/DBIResult-class.md),
[`dbBind()`](https://dbi.r-dbi.org/dev/reference/dbBind.md),
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
[`dbBind()`](https://dbi.r-dbi.org/dev/reference/dbBind.md),
[`dbFetchArrow()`](https://dbi.r-dbi.org/dev/reference/dbFetchArrow.md),
[`dbFetchArrowChunk()`](https://dbi.r-dbi.org/dev/reference/dbFetchArrowChunk.md),
[`dbHasCompleted()`](https://dbi.r-dbi.org/dev/reference/dbHasCompleted.md),
[`dbIsValid()`](https://dbi.r-dbi.org/dev/reference/dbIsValid.md)

Other data retrieval generics:
[`dbBind()`](https://dbi.r-dbi.org/dev/reference/dbBind.md),
[`dbFetch()`](https://dbi.r-dbi.org/dev/reference/dbFetch.md),
[`dbFetchArrow()`](https://dbi.r-dbi.org/dev/reference/dbFetchArrow.md),
[`dbFetchArrowChunk()`](https://dbi.r-dbi.org/dev/reference/dbFetchArrowChunk.md),
[`dbGetQuery()`](https://dbi.r-dbi.org/dev/reference/dbGetQuery.md),
[`dbGetQueryArrow()`](https://dbi.r-dbi.org/dev/reference/dbGetQueryArrow.md),
[`dbHasCompleted()`](https://dbi.r-dbi.org/dev/reference/dbHasCompleted.md),
[`dbSendQuery()`](https://dbi.r-dbi.org/dev/reference/dbSendQuery.md),
[`dbSendQueryArrow()`](https://dbi.r-dbi.org/dev/reference/dbSendQueryArrow.md)

Other command execution generics:
[`dbBind()`](https://dbi.r-dbi.org/dev/reference/dbBind.md),
[`dbExecute()`](https://dbi.r-dbi.org/dev/reference/dbExecute.md),
[`dbGetRowsAffected()`](https://dbi.r-dbi.org/dev/reference/dbGetRowsAffected.md),
[`dbSendStatement()`](https://dbi.r-dbi.org/dev/reference/dbSendStatement.md)

## Examples

``` r
con <- dbConnect(RSQLite::SQLite(), ":memory:")

rs <- dbSendQuery(con, "SELECT 1")
print(dbFetch(rs))
#>   1
#> 1 1

dbClearResult(rs)
dbDisconnect(con)
```
