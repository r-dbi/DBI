# Get the statement associated with a result set

Returns the statement that was passed to
[`dbSendQuery()`](https://dbi.r-dbi.org/dev/reference/dbSendQuery.md) or
[`dbSendStatement()`](https://dbi.r-dbi.org/dev/reference/dbSendStatement.md).

### Methods in other packages

This documentation page describes the generics. Refer to the
documentation pages linked below for the documentation for the methods
that are implemented in various backend packages.

- [`adbi::dbGetStatement("AdbiResult")`](https://adbi.r-dbi.org/reference/AdbiResult-class.html)

- [`adbi::dbGetStatement("AdbiResultArrow")`](https://adbi.r-dbi.org/reference/AdbiResultArrow-class.html)

- [`bigrquery::dbGetStatement("BigQueryResult")`](https://bigrquery.r-dbi.org/reference/DBI.html)

- [`DatabaseConnector::dbGetStatement("DatabaseConnectorDbiResult")`](https://ohdsi.github.io/DatabaseConnector/reference/dbGetStatement-DatabaseConnectorDbiResult-method.html)

- [`DatabaseConnector::dbGetStatement("DatabaseConnectorJdbcResult")`](https://ohdsi.github.io/DatabaseConnector/reference/dbGetStatement-DatabaseConnectorJdbcResult-method.html)

- [`duckdb::dbGetStatement("duckdb_result")`](https://r.duckdb.org/reference/duckdb_result-class.html)

- [`odbc::dbGetStatement("OdbcResult")`](https://odbc.r-dbi.org/reference/OdbcResult.html)

- [`RAthena::dbGetStatement("AthenaResult")`](https://dyfanjones.github.io/RAthena/reference/AthenaResult.html)

- [`RMariaDB::dbGetStatement("MariaDBResult")`](https://rmariadb.r-dbi.org/reference/query.html)

- [`RMySQL::dbGetStatement("MySQLResult")`](https://r-dbi.r-universe.dev/RMySQL/reference/query.html)

- [`RPostgres::dbGetStatement("PqResult")`](https://rpostgres.r-dbi.org/reference/PqResult-class.html)

- [`RPostgreSQL::dbGetStatement("PostgreSQLResult")`](https://rdrr.io/pkg/RPostgreSQL/man/dbGetInfo-methods.html)

- [`RPresto::dbGetStatement("PrestoResult")`](https://rdrr.io/pkg/RPresto/man/PrestoResult-class.html)

- [`RSQLite::dbGetStatement("SQLiteResult")`](https://rsqlite.r-dbi.org/reference/SQLiteResult-class.html)

- [`sergeant::dbGetStatement("DrillResult")`](https://rdrr.io/pkg/sergeant/man/DrillResult-class.html)

- `sparklyr::dbGetStatement("DBISparkResult")`

## Usage

``` r
dbGetStatement(res, ...)
```

## Arguments

- res:

  An object inheriting from
  [DBI::DBIResult](https://dbi.r-dbi.org/dev/reference/DBIResult-class.md).

- ...:

  Other arguments passed on to methods.

## Value

`dbGetStatement()` returns a string, the query used in either
[`DBI::dbSendQuery()`](https://dbi.r-dbi.org/dev/reference/dbSendQuery.md)
or
[`DBI::dbSendStatement()`](https://dbi.r-dbi.org/dev/reference/dbSendStatement.md).

## Failure modes

Attempting to query the statement for a result set cleared with
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
[`dbGetRowsAffected()`](https://dbi.r-dbi.org/dev/reference/dbGetRowsAffected.md),
[`dbHasCompleted()`](https://dbi.r-dbi.org/dev/reference/dbHasCompleted.md),
[`dbIsReadOnly()`](https://dbi.r-dbi.org/dev/reference/dbIsReadOnly.md),
[`dbIsValid()`](https://dbi.r-dbi.org/dev/reference/dbIsValid.md),
[`dbQuoteLiteral()`](https://dbi.r-dbi.org/dev/reference/dbQuoteLiteral.md),
[`dbQuoteString()`](https://dbi.r-dbi.org/dev/reference/dbQuoteString.md)

## Examples

``` r
con <- dbConnect(RSQLite::SQLite(), ":memory:")

dbWriteTable(con, "mtcars", mtcars)
rs <- dbSendQuery(con, "SELECT * FROM mtcars")
dbGetStatement(rs)
#> [1] "SELECT * FROM mtcars"

dbClearResult(rs)
dbDisconnect(con)
```
