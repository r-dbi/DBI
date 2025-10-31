# Disconnect (close) a connection

This closes the connection, discards all pending work, and frees
resources (e.g., memory, sockets).

### Methods in other packages

This documentation page describes the generics. Refer to the
documentation pages linked below for the documentation for the methods
that are implemented in various backend packages.

- [`adbi::dbDisconnect("AdbiConnection")`](https://adbi.r-dbi.org/reference/dbConnect.html)

- [`AzureKusto::dbDisconnect("AzureKustoDriver")`](https://rdrr.io/pkg/AzureKusto/man/AzureKusto.html)

- [`bigrquery::dbDisconnect("BigQueryConnection")`](https://bigrquery.r-dbi.org/reference/DBI.html)

- [`DatabaseConnector::dbDisconnect("DatabaseConnectorConnection")`](https://ohdsi.github.io/DatabaseConnector/reference/dbDisconnect-DatabaseConnectorConnection-method.html)

- [`dittodb::dbDisconnect("DBIMockConnection")`](https://dittodb.jonkeane.com/reference/mock-db-methods.html)

- [`duckdb::dbDisconnect("duckdb_connection")`](https://r.duckdb.org/reference/duckdb.html)

- [`implyr::dbDisconnect("src_impala")`](https://rdrr.io/pkg/implyr/man/dbDisconnect-src_impala-method.html)

- [`lazysf::dbDisconnect("SFSQLConnection")`](https://hypertidy.github.io/lazysf/reference/SFSQLConnection-class.html)

- [`odbc::dbDisconnect("OdbcConnection")`](https://odbc.r-dbi.org/reference/OdbcConnection.html)

- [`pool::dbDisconnect("Pool")`](http://rstudio.github.io/pool/reference/DBI-custom.md)

- [`RAthena::dbDisconnect("AthenaConnection")`](https://dyfanjones.github.io/RAthena/reference/AthenaConnection.html)

- [`RJDBC::dbDisconnect("JDBCConnection")`](https://rdrr.io/pkg/RJDBC/man/JDBCConnection-methods.html)

- [`RMariaDB::dbDisconnect("MariaDBConnection")`](https://rmariadb.r-dbi.org/reference/MariaDBConnection-class.html)

- [`RMySQL::dbDisconnect("MySQLConnection")`](https://r-dbi.r-universe.dev/RMySQL/reference/dbConnect-MySQLDriver-method.html)

- [`RPostgres::dbDisconnect("PqConnection")`](https://rpostgres.r-dbi.org/reference/Postgres.html)

- [`RPostgreSQL::dbDisconnect("PostgreSQLConnection")`](https://rdrr.io/pkg/RPostgreSQL/man/dbConnect-methods.html)

- [`RPresto::dbDisconnect("PrestoConnection")`](https://rdrr.io/pkg/RPresto/man/Presto.html)

- [`RSQLite::dbDisconnect("SQLiteConnection")`](https://rsqlite.r-dbi.org/reference/SQLite.html)

- [`sergeant::dbDisconnect("DrillConnection")`](https://rdrr.io/pkg/sergeant/man/dbDisconnect-DrillConnection-method.html)

- `sparklyr::dbDisconnect("spark_connection")`

## Usage

``` r
dbDisconnect(conn, ...)
```

## Arguments

- conn:

  A
  [DBI::DBIConnection](https://dbi.r-dbi.org/dev/reference/DBIConnection-class.md)
  object, as returned by
  [`dbConnect()`](https://dbi.r-dbi.org/dev/reference/dbConnect.md).

- ...:

  Other parameters passed on to methods.

## Value

`dbDisconnect()` returns `TRUE`, invisibly.

## Failure modes

A warning is issued on garbage collection when a connection has been
released without calling `dbDisconnect()`, but this cannot be tested
automatically. At least one warning is issued immediately when calling
`dbDisconnect()` on an already disconnected or invalid connection.

## See also

Other DBIConnection generics:
[`DBIConnection-class`](https://dbi.r-dbi.org/dev/reference/DBIConnection-class.md),
[`dbAppendTable()`](https://dbi.r-dbi.org/dev/reference/dbAppendTable.md),
[`dbAppendTableArrow()`](https://dbi.r-dbi.org/dev/reference/dbAppendTableArrow.md),
[`dbCreateTable()`](https://dbi.r-dbi.org/dev/reference/dbCreateTable.md),
[`dbCreateTableArrow()`](https://dbi.r-dbi.org/dev/reference/dbCreateTableArrow.md),
[`dbDataType()`](https://dbi.r-dbi.org/dev/reference/dbDataType.md),
[`dbExecute()`](https://dbi.r-dbi.org/dev/reference/dbExecute.md),
[`dbExistsTable()`](https://dbi.r-dbi.org/dev/reference/dbExistsTable.md),
[`dbGetException()`](https://dbi.r-dbi.org/dev/reference/dbGetException.md),
[`dbGetInfo()`](https://dbi.r-dbi.org/dev/reference/dbGetInfo.md),
[`dbGetQuery()`](https://dbi.r-dbi.org/dev/reference/dbGetQuery.md),
[`dbGetQueryArrow()`](https://dbi.r-dbi.org/dev/reference/dbGetQueryArrow.md),
[`dbIsReadOnly()`](https://dbi.r-dbi.org/dev/reference/dbIsReadOnly.md),
[`dbIsValid()`](https://dbi.r-dbi.org/dev/reference/dbIsValid.md),
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

## Examples

``` r
con <- dbConnect(RSQLite::SQLite(), ":memory:")
dbDisconnect(con)
```
