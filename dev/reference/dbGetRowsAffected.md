# The number of rows affected

This method returns the number of rows that were added, deleted, or
updated by a data manipulation statement.

### Methods in other packages

This documentation page describes the generics. Refer to the
documentation pages linked below for the documentation for the methods
that are implemented in various backend packages.

- [`adbi::dbGetRowsAffected("AdbiResult")`](https://adbi.r-dbi.org/reference/AdbiResult-class.html)

- [`adbi::dbGetRowsAffected("AdbiResultArrow")`](https://adbi.r-dbi.org/reference/AdbiResultArrow-class.html)

- [`bigrquery::dbGetRowsAffected("BigQueryResult")`](https://bigrquery.r-dbi.org/reference/DBI.html)

- [`DatabaseConnector::dbGetRowsAffected("DatabaseConnectorDbiResult")`](https://ohdsi.github.io/DatabaseConnector/reference/dbGetRowsAffected-DatabaseConnectorDbiResult-method.html)

- [`DatabaseConnector::dbGetRowsAffected("DatabaseConnectorJdbcResult")`](https://ohdsi.github.io/DatabaseConnector/reference/dbGetRowsAffected-DatabaseConnectorJdbcResult-method.html)

- [`dittodb::dbGetRowsAffected("DBIMockResult")`](https://dittodb.jonkeane.com/reference/mock-db-methods.html)

- [`duckdb::dbGetRowsAffected("duckdb_result")`](https://r.duckdb.org/reference/duckdb_result-class.html)

- [`odbc::dbGetRowsAffected("OdbcResult")`](https://odbc.r-dbi.org/reference/OdbcResult.html)

- [`RMariaDB::dbGetRowsAffected("MariaDBResult")`](https://rmariadb.r-dbi.org/reference/result-meta.html)

- [`RMySQL::dbGetRowsAffected("MySQLResult")`](https://r-dbi.r-universe.dev/RMySQL/reference/result-meta.html)

- [`RPostgres::dbGetRowsAffected("PqResult")`](https://rpostgres.r-dbi.org/reference/PqResult-class.html)

- [`RPostgreSQL::dbGetRowsAffected("PostgreSQLResult")`](https://rdrr.io/pkg/RPostgreSQL/man/dbGetInfo-methods.html)

- [`RPresto::dbGetRowsAffected("PrestoResult")`](https://rdrr.io/pkg/RPresto/man/PrestoResult-class.html)

- [`RSQLite::dbGetRowsAffected("SQLiteResult")`](https://rsqlite.r-dbi.org/reference/SQLiteResult-class.html)

- `sparklyr::dbGetRowsAffected("DBISparkResult")`

## Usage

``` r
dbGetRowsAffected(res, ...)
```

## Arguments

- res:

  An object inheriting from
  [DBI::DBIResult](https://dbi.r-dbi.org/dev/reference/DBIResult-class.md).

- ...:

  Other arguments passed on to methods.

## Value

`dbGetRowsAffected()` returns a scalar number (integer or numeric), the
number of rows affected by a data manipulation statement issued with
[`DBI::dbSendStatement()`](https://dbi.r-dbi.org/dev/reference/dbSendStatement.md).
The value is available directly after the call and does not change after
calling
[`DBI::dbFetch()`](https://dbi.r-dbi.org/dev/reference/dbFetch.md).
`NA_integer_` or `NA_numeric_` are allowed if the number of rows
affected is not known.

For queries issued with
[`DBI::dbSendQuery()`](https://dbi.r-dbi.org/dev/reference/dbSendQuery.md),
zero is returned before and after the call to
[`dbFetch()`](https://dbi.r-dbi.org/dev/reference/dbFetch.md). `NA`
values are not allowed.

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

3.  Optionally, use `dbGetRowsAffected()` to retrieve the number of rows
    affected by the query.

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

Attempting to get the rows affected for a result set cleared with
[`DBI::dbClearResult()`](https://dbi.r-dbi.org/dev/reference/dbClearResult.md)
gives an error.

## See also

Other DBIResult generics:
[`DBIResult-class`](https://dbi.r-dbi.org/dev/reference/DBIResult-class.md),
[`dbBind()`](https://dbi.r-dbi.org/dev/reference/dbBind.md),
[`dbClearResult()`](https://dbi.r-dbi.org/dev/reference/dbClearResult.md),
[`dbColumnInfo()`](https://dbi.r-dbi.org/dev/reference/dbColumnInfo.md),
[`dbFetch()`](https://dbi.r-dbi.org/dev/reference/dbFetch.md),
[`dbGetInfo()`](https://dbi.r-dbi.org/dev/reference/dbGetInfo.md),
[`dbGetRowCount()`](https://dbi.r-dbi.org/dev/reference/dbGetRowCount.md),
[`dbGetStatement()`](https://dbi.r-dbi.org/dev/reference/dbGetStatement.md),
[`dbHasCompleted()`](https://dbi.r-dbi.org/dev/reference/dbHasCompleted.md),
[`dbIsReadOnly()`](https://dbi.r-dbi.org/dev/reference/dbIsReadOnly.md),
[`dbIsValid()`](https://dbi.r-dbi.org/dev/reference/dbIsValid.md),
[`dbQuoteLiteral()`](https://dbi.r-dbi.org/dev/reference/dbQuoteLiteral.md),
[`dbQuoteString()`](https://dbi.r-dbi.org/dev/reference/dbQuoteString.md)

Other command execution generics:
[`dbBind()`](https://dbi.r-dbi.org/dev/reference/dbBind.md),
[`dbClearResult()`](https://dbi.r-dbi.org/dev/reference/dbClearResult.md),
[`dbExecute()`](https://dbi.r-dbi.org/dev/reference/dbExecute.md),
[`dbSendStatement()`](https://dbi.r-dbi.org/dev/reference/dbSendStatement.md)

## Examples

``` r
con <- dbConnect(RSQLite::SQLite(), ":memory:")

dbWriteTable(con, "mtcars", mtcars)
rs <- dbSendStatement(con, "DELETE FROM mtcars")
dbGetRowsAffected(rs)
#> [1] 32
nrow(mtcars)
#> [1] 32

dbClearResult(rs)
dbDisconnect(con)
```
