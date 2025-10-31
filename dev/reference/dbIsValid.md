# Is this DBMS object still valid?

This generic tests whether a database object is still valid (i.e. it
hasn't been disconnected or cleared).

### Methods in other packages

This documentation page describes the generics. Refer to the
documentation pages linked below for the documentation for the methods
that are implemented in various backend packages.

- [`adbi::dbIsValid("AdbiConnection")`](https://adbi.r-dbi.org/reference/AdbiConnection-class.html)

- [`adbi::dbIsValid("AdbiDriver")`](https://adbi.r-dbi.org/reference/AdbiDriver-class.html)

- [`adbi::dbIsValid("AdbiResult")`](https://adbi.r-dbi.org/reference/AdbiResult-class.html)

- [`adbi::dbIsValid("AdbiResultArrow")`](https://adbi.r-dbi.org/reference/AdbiResultArrow-class.html)

- [`bigrquery::dbIsValid("BigQueryConnection")`](https://bigrquery.r-dbi.org/reference/DBI.html)

- [`bigrquery::dbIsValid("BigQueryDriver")`](https://bigrquery.r-dbi.org/reference/DBI.html)

- [`bigrquery::dbIsValid("BigQueryResult")`](https://bigrquery.r-dbi.org/reference/DBI.html)

- [`DatabaseConnector::dbIsValid("DatabaseConnectorDbiConnection")`](https://ohdsi.github.io/DatabaseConnector/reference/dbIsValid-DatabaseConnectorDbiConnection-method.html)

- [`DatabaseConnector::dbIsValid("DatabaseConnectorJdbcConnection")`](https://ohdsi.github.io/DatabaseConnector/reference/dbIsValid-DatabaseConnectorJdbcConnection-method.html)

- [`duckdb::dbIsValid("duckdb_connection")`](https://r.duckdb.org/reference/duckdb_connection-class.html)

- [`duckdb::dbIsValid("duckdb_driver")`](https://r.duckdb.org/reference/duckdb_driver-class.html)

- [`duckdb::dbIsValid("duckdb_result")`](https://r.duckdb.org/reference/duckdb_result-class.html)

- [`lazysf::dbIsValid("SFSQLDriver")`](https://hypertidy.github.io/lazysf/reference/SFSQLDriver-class.html)

- [`odbc::dbIsValid("OdbcConnection")`](https://odbc.r-dbi.org/reference/OdbcConnection.html)

- [`odbc::dbIsValid("OdbcDriver")`](https://odbc.r-dbi.org/reference/OdbcDriver.html)

- [`odbc::dbIsValid("OdbcResult")`](https://odbc.r-dbi.org/reference/OdbcResult.html)

- [`pool::dbIsValid("Pool")`](http://rstudio.github.io/pool/reference/DBI-custom.md)

- [`RAthena::dbIsValid("AthenaConnection")`](https://dyfanjones.github.io/RAthena/reference/AthenaConnection.html)

- [`RAthena::dbIsValid("AthenaResult")`](https://dyfanjones.github.io/RAthena/reference/AthenaResult.html)

- `RJDBC::dbIsValid("JDBCConnection")`

- `RJDBC::dbIsValid("JDBCResult")`

- [`RMariaDB::dbIsValid("MariaDBConnection")`](https://rmariadb.r-dbi.org/reference/MariaDBConnection-class.html)

- [`RMariaDB::dbIsValid("MariaDBDriver")`](https://rmariadb.r-dbi.org/reference/MariaDBDriver-class.html)

- [`RMariaDB::dbIsValid("MariaDBResult")`](https://rmariadb.r-dbi.org/reference/MariaDBResult-class.html)

- [`RMySQL::dbIsValid("MySQLConnection")`](https://r-dbi.r-universe.dev/RMySQL/reference/isIdCurrent.html)

- [`RMySQL::dbIsValid("MySQLDriver")`](https://r-dbi.r-universe.dev/RMySQL/reference/isIdCurrent.html)

- [`RMySQL::dbIsValid("MySQLResult")`](https://r-dbi.r-universe.dev/RMySQL/reference/isIdCurrent.html)

- [`RPostgres::dbIsValid("PqConnection")`](https://rpostgres.r-dbi.org/reference/PqConnection-class.html)

- [`RPostgres::dbIsValid("PqDriver")`](https://rpostgres.r-dbi.org/reference/PqResult-class.html)

- [`RPostgres::dbIsValid("PqResult")`](https://rpostgres.r-dbi.org/reference/PqResult-class.html)

- [`RPresto::dbIsValid("PrestoResult")`](https://rdrr.io/pkg/RPresto/man/PrestoResult-class.html)

- [`RSQLite::dbIsValid("SQLiteConnection")`](https://rsqlite.r-dbi.org/reference/SQLiteConnection-class.html)

- [`RSQLite::dbIsValid("SQLiteDriver")`](https://rsqlite.r-dbi.org/reference/SQLiteDriver-class.html)

- [`RSQLite::dbIsValid("SQLiteResult")`](https://rsqlite.r-dbi.org/reference/SQLiteResult-class.html)

- [`sergeant::dbIsValid("DrillConnection")`](https://rdrr.io/pkg/sergeant/man/DrillConnection-class.html)

- `sparklyr::dbIsValid("DBISparkResult")`

- `sparklyr::dbIsValid("spark_connection")`

## Usage

``` r
dbIsValid(dbObj, ...)
```

## Arguments

- dbObj:

  An object inheriting from
  [DBIObject](https://dbi.r-dbi.org/dev/reference/DBIObject-class.md),
  i.e.
  [DBIDriver](https://dbi.r-dbi.org/dev/reference/DBIDriver-class.md),
  [DBIConnection](https://dbi.r-dbi.org/dev/reference/DBIConnection-class.md),
  or a
  [DBIResult](https://dbi.r-dbi.org/dev/reference/DBIResult-class.md)

- ...:

  Other arguments to methods.

## Value

`dbIsValid()` returns a logical scalar, `TRUE` if the object specified
by `dbObj` is valid, `FALSE` otherwise. A
[DBI::DBIConnection](https://dbi.r-dbi.org/dev/reference/DBIConnection-class.md)
object is initially valid, and becomes invalid after disconnecting with
[`DBI::dbDisconnect()`](https://dbi.r-dbi.org/dev/reference/dbDisconnect.md).
For an invalid connection object (e.g., for some drivers if the object
is saved to a file and then restored), the method also returns `FALSE`.
A
[DBI::DBIResult](https://dbi.r-dbi.org/dev/reference/DBIResult-class.md)
object is valid after a call to
[`DBI::dbSendQuery()`](https://dbi.r-dbi.org/dev/reference/dbSendQuery.md),
and stays valid even after all rows have been fetched; only clearing it
with
[`DBI::dbClearResult()`](https://dbi.r-dbi.org/dev/reference/dbClearResult.md)
invalidates it. A
[DBI::DBIResult](https://dbi.r-dbi.org/dev/reference/DBIResult-class.md)
object is also valid after a call to
[`DBI::dbSendStatement()`](https://dbi.r-dbi.org/dev/reference/dbSendStatement.md),
and stays valid after querying the number of rows affected; only
clearing it with
[`DBI::dbClearResult()`](https://dbi.r-dbi.org/dev/reference/dbClearResult.md)
invalidates it. If the connection to the database system is dropped
(e.g., due to connectivity problems, server failure, etc.),
`dbIsValid()` should return `FALSE`. This is not tested automatically.

## See also

Other DBIDriver generics:
[`DBIDriver-class`](https://dbi.r-dbi.org/dev/reference/DBIDriver-class.md),
[`dbCanConnect()`](https://dbi.r-dbi.org/dev/reference/dbCanConnect.md),
[`dbConnect()`](https://dbi.r-dbi.org/dev/reference/dbConnect.md),
[`dbDataType()`](https://dbi.r-dbi.org/dev/reference/dbDataType.md),
[`dbDriver()`](https://dbi.r-dbi.org/dev/reference/dbDriver.md),
[`dbGetInfo()`](https://dbi.r-dbi.org/dev/reference/dbGetInfo.md),
[`dbIsReadOnly()`](https://dbi.r-dbi.org/dev/reference/dbIsReadOnly.md),
[`dbListConnections()`](https://dbi.r-dbi.org/dev/reference/dbListConnections.md)

Other DBIConnection generics:
[`DBIConnection-class`](https://dbi.r-dbi.org/dev/reference/DBIConnection-class.md),
[`dbAppendTable()`](https://dbi.r-dbi.org/dev/reference/dbAppendTable.md),
[`dbAppendTableArrow()`](https://dbi.r-dbi.org/dev/reference/dbAppendTableArrow.md),
[`dbCreateTable()`](https://dbi.r-dbi.org/dev/reference/dbCreateTable.md),
[`dbCreateTableArrow()`](https://dbi.r-dbi.org/dev/reference/dbCreateTableArrow.md),
[`dbDataType()`](https://dbi.r-dbi.org/dev/reference/dbDataType.md),
[`dbDisconnect()`](https://dbi.r-dbi.org/dev/reference/dbDisconnect.md),
[`dbExecute()`](https://dbi.r-dbi.org/dev/reference/dbExecute.md),
[`dbExistsTable()`](https://dbi.r-dbi.org/dev/reference/dbExistsTable.md),
[`dbGetException()`](https://dbi.r-dbi.org/dev/reference/dbGetException.md),
[`dbGetInfo()`](https://dbi.r-dbi.org/dev/reference/dbGetInfo.md),
[`dbGetQuery()`](https://dbi.r-dbi.org/dev/reference/dbGetQuery.md),
[`dbGetQueryArrow()`](https://dbi.r-dbi.org/dev/reference/dbGetQueryArrow.md),
[`dbIsReadOnly()`](https://dbi.r-dbi.org/dev/reference/dbIsReadOnly.md),
[`dbListFields()`](https://dbi.r-dbi.org/dev/reference/dbListFields.md),
[`dbListObjects()`](https://dbi.r-dbi.org/dev/reference/dbListObjects.md),
[`dbListResults()`](https://dbi.r-dbi.org/dev/reference/dbListResults.md),
[`dbListTables()`](https://dbi.r-dbi.org/dev/reference/dbListTables.md),
[`dbQuoteIdentifier()`](https://dbi.r-dbi.org/dev/reference/dbQuoteIdentifier.md),
[`dbReadTable()`](https://dbi.r-dbi.org/dev/reference/dbReadTable.md),
[`dbReadTableArrow()`](https://dbi.r-dbi.org/dev/reference/dbReadTableArrow.md),
[`dbRemoveTable()`](https://dbi.r-dbi.org/dev/reference/dbRemoveTable.md),
[`dbSendQuery()`](https://dbi.r-dbi.org/dev/reference/dbSendQuery.md),
[`dbSendQueryArrow()`](https://dbi.r-dbi.org/dev/reference/dbSendQueryArrow.md),
[`dbSendStatement()`](https://dbi.r-dbi.org/dev/reference/dbSendStatement.md),
[`dbUnquoteIdentifier()`](https://dbi.r-dbi.org/dev/reference/dbUnquoteIdentifier.md),
[`dbWriteTable()`](https://dbi.r-dbi.org/dev/reference/dbWriteTable.md),
[`dbWriteTableArrow()`](https://dbi.r-dbi.org/dev/reference/dbWriteTableArrow.md)

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
[`dbHasCompleted()`](https://dbi.r-dbi.org/dev/reference/dbHasCompleted.md),
[`dbIsReadOnly()`](https://dbi.r-dbi.org/dev/reference/dbIsReadOnly.md),
[`dbQuoteLiteral()`](https://dbi.r-dbi.org/dev/reference/dbQuoteLiteral.md),
[`dbQuoteString()`](https://dbi.r-dbi.org/dev/reference/dbQuoteString.md)

Other DBIResultArrow generics:
[`DBIResultArrow-class`](https://dbi.r-dbi.org/dev/reference/DBIResultArrow-class.md),
[`dbBind()`](https://dbi.r-dbi.org/dev/reference/dbBind.md),
[`dbClearResult()`](https://dbi.r-dbi.org/dev/reference/dbClearResult.md),
[`dbFetchArrow()`](https://dbi.r-dbi.org/dev/reference/dbFetchArrow.md),
[`dbFetchArrowChunk()`](https://dbi.r-dbi.org/dev/reference/dbFetchArrowChunk.md),
[`dbHasCompleted()`](https://dbi.r-dbi.org/dev/reference/dbHasCompleted.md)

## Examples

``` r
dbIsValid(RSQLite::SQLite())
#> [1] TRUE

con <- dbConnect(RSQLite::SQLite(), ":memory:")
dbIsValid(con)
#> [1] TRUE

rs <- dbSendQuery(con, "SELECT 1")
dbIsValid(rs)
#> [1] TRUE

dbClearResult(rs)
dbIsValid(rs)
#> [1] FALSE

dbDisconnect(con)
dbIsValid(con)
#> [1] FALSE
```
