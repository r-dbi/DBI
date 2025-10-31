# The number of rows fetched so far

Returns the total number of rows actually fetched with calls to
[`dbFetch()`](https://dbi.r-dbi.org/dev/reference/dbFetch.md) for this
result set.

### Methods in other packages

This documentation page describes the generics. Refer to the
documentation pages linked below for the documentation for the methods
that are implemented in various backend packages.

- [`adbi::dbGetRowCount("AdbiResult")`](https://adbi.r-dbi.org/reference/AdbiResult-class.html)

- [`adbi::dbGetRowCount("AdbiResultArrow")`](https://adbi.r-dbi.org/reference/AdbiResultArrow-class.html)

- [`bigrquery::dbGetRowCount("BigQueryResult")`](https://bigrquery.r-dbi.org/reference/DBI.html)

- [`DatabaseConnector::dbGetRowCount("DatabaseConnectorDbiResult")`](https://ohdsi.github.io/DatabaseConnector/reference/dbGetRowCount-DatabaseConnectorDbiResult-method.html)

- [`DatabaseConnector::dbGetRowCount("DatabaseConnectorJdbcResult")`](https://ohdsi.github.io/DatabaseConnector/reference/dbGetRowCount-DatabaseConnectorJdbcResult-method.html)

- [`duckdb::dbGetRowCount("duckdb_result")`](https://r.duckdb.org/reference/duckdb_result-class.html)

- [`odbc::dbGetRowCount("OdbcResult")`](https://odbc.r-dbi.org/reference/OdbcResult.html)

- [`RMariaDB::dbGetRowCount("MariaDBResult")`](https://rmariadb.r-dbi.org/reference/result-meta.html)

- [`RMySQL::dbGetRowCount("MySQLResult")`](https://r-dbi.r-universe.dev/RMySQL/reference/result-meta.html)

- [`RPostgres::dbGetRowCount("PqResult")`](https://rpostgres.r-dbi.org/reference/PqResult-class.html)

- [`RPostgreSQL::dbGetRowCount("PostgreSQLResult")`](https://rdrr.io/pkg/RPostgreSQL/man/dbGetInfo-methods.html)

- [`RPresto::dbGetRowCount("PrestoResult")`](https://rdrr.io/pkg/RPresto/man/PrestoResult-class.html)

- [`RSQLite::dbGetRowCount("SQLiteResult")`](https://rsqlite.r-dbi.org/reference/SQLiteResult-class.html)

- `sparklyr::dbGetRowCount("DBISparkResult")`

## Usage

``` r
dbGetRowCount(res, ...)
```

## Arguments

- res:

  An object inheriting from
  [DBI::DBIResult](https://dbi.r-dbi.org/dev/reference/DBIResult-class.md).

- ...:

  Other arguments passed on to methods.

## Value

`dbGetRowCount()` returns a scalar number (integer or numeric), the
number of rows fetched so far. After calling
[`DBI::dbSendQuery()`](https://dbi.r-dbi.org/dev/reference/dbSendQuery.md),
the row count is initially zero. After a call to
[`DBI::dbFetch()`](https://dbi.r-dbi.org/dev/reference/dbFetch.md)
without limit, the row count matches the total number of rows returned.
Fetching a limited number of rows increases the number of rows by the
number of rows returned, even if fetching past the end of the result
set. For queries with an empty result set, zero is returned even after
fetching. For data manipulation statements issued with
[`DBI::dbSendStatement()`](https://dbi.r-dbi.org/dev/reference/dbSendStatement.md),
zero is returned before and after calling
[`dbFetch()`](https://dbi.r-dbi.org/dev/reference/dbFetch.md).

## Failure modes

Attempting to get the row count for a result set cleared with
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
[`dbGetRowsAffected()`](https://dbi.r-dbi.org/dev/reference/dbGetRowsAffected.md),
[`dbGetStatement()`](https://dbi.r-dbi.org/dev/reference/dbGetStatement.md),
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

dbGetRowCount(rs)
#> [1] 0
ret1 <- dbFetch(rs, 10)
dbGetRowCount(rs)
#> [1] 10
ret2 <- dbFetch(rs)
dbGetRowCount(rs)
#> [1] 32
nrow(ret1) + nrow(ret2)
#> [1] 32

dbClearResult(rs)
dbDisconnect(con)
```
