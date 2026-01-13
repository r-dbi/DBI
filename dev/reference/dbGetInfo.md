# Get DBMS metadata

Retrieves information on objects of class
[DBIDriver](https://dbi.r-dbi.org/dev/reference/DBIDriver-class.md),
[DBIConnection](https://dbi.r-dbi.org/dev/reference/DBIConnection-class.md)
or [DBIResult](https://dbi.r-dbi.org/dev/reference/DBIResult-class.md).

### Methods in other packages

This documentation page describes the generics. Refer to the
documentation pages linked below for the documentation for the methods
that are implemented in various backend packages.

- [`adbi::dbGetInfo("AdbiConnection")`](https://adbi.r-dbi.org/reference/AdbiConnection-class.html)

- [`adbi::dbGetInfo("AdbiDriver")`](https://adbi.r-dbi.org/reference/AdbiDriver-class.html)

- [`bigrquery::dbGetInfo("BigQueryConnection")`](https://bigrquery.r-dbi.org/reference/DBI.html)

- [`bigrquery::dbGetInfo("BigQueryDriver")`](https://bigrquery.r-dbi.org/reference/DBI.html)

- [`DatabaseConnector::dbGetInfo("DatabaseConnectorConnection")`](https://ohdsi.github.io/DatabaseConnector/reference/dbGetInfo-DatabaseConnectorConnection-method.html)

- [`DatabaseConnector::dbGetInfo("DatabaseConnectorDriver")`](https://ohdsi.github.io/DatabaseConnector/reference/dbGetInfo-DatabaseConnectorDriver-method.html)

- [`dittodb::dbGetInfo("DBIMockConnection")`](https://dittodb.jonkeane.com/reference/mock-db-methods.html)

- [`dittodb::dbGetInfo("DBIMockResult")`](https://dittodb.jonkeane.com/reference/mock-db-methods.html)

- [`duckdb::dbGetInfo("duckdb_connection")`](https://r.duckdb.org/reference/duckdb_connection-class.html)

- [`duckdb::dbGetInfo("duckdb_driver")`](https://r.duckdb.org/reference/duckdb_driver-class.html)

- [`duckdb::dbGetInfo("duckdb_result")`](https://r.duckdb.org/reference/duckdb_result-class.html)

- [`lazysf::dbGetInfo("SFSQLDriver")`](https://hypertidy.github.io/lazysf/reference/SFSQLDriver-class.html)

- [`odbc::dbGetInfo("OdbcConnection")`](https://odbc.r-dbi.org/reference/OdbcConnection.html)

- [`odbc::dbGetInfo("OdbcDriver")`](https://odbc.r-dbi.org/reference/OdbcDriver.html)

- [`pool::dbGetInfo("Pool")`](http://rstudio.github.io/pool/reference/DBI-custom.md)

- [`RAthena::dbGetInfo("AthenaConnection")`](https://dyfanjones.github.io/RAthena/reference/AthenaConnection.html)

- [`RAthena::dbGetInfo("AthenaResult")`](https://dyfanjones.github.io/RAthena/reference/AthenaResult.html)

- [`RJDBC::dbGetInfo("JDBCConnection")`](https://rdrr.io/pkg/RJDBC/man/JDBCConnection-methods.html)

- [`RJDBC::dbGetInfo("JDBCDriver")`](https://rdrr.io/pkg/RJDBC/man/JDBCDriver-methods.html)

- [`RJDBC::dbGetInfo("JDBCResult")`](https://rdrr.io/pkg/RJDBC/man/JDBCResult-methods.html)

- [`RMariaDB::dbGetInfo("MariaDBConnection")`](https://rmariadb.r-dbi.org/reference/MariaDBConnection-class.html)

- [`RMariaDB::dbGetInfo("MariaDBDriver")`](https://rmariadb.r-dbi.org/reference/MariaDBDriver-class.html)

- [`RMySQL::dbGetInfo("MySQLConnection")`](https://r-dbi.r-universe.dev/RMySQL/reference/db-meta.html)

- [`RMySQL::dbGetInfo("MySQLDriver")`](https://r-dbi.r-universe.dev/RMySQL/reference/dbGetInfo-MySQLDriver-method.html)

- [`RMySQL::dbGetInfo("MySQLResult")`](https://r-dbi.r-universe.dev/RMySQL/reference/query.html)

- [`RPostgres::dbGetInfo("PqConnection")`](https://rpostgres.r-dbi.org/reference/PqConnection-class.html)

- [`RPostgres::dbGetInfo("PqDriver")`](https://rpostgres.r-dbi.org/reference/PqDriver-class.html)

- [`RPostgreSQL::dbGetInfo("PostgreSQLConnection")`](https://rdrr.io/pkg/RPostgreSQL/man/dbGetInfo-methods.html)

- [`RPostgreSQL::dbGetInfo("PostgreSQLDriver")`](https://rdrr.io/pkg/RPostgreSQL/man/dbGetInfo-methods.html)

- [`RPostgreSQL::dbGetInfo("PostgreSQLResult")`](https://rdrr.io/pkg/RPostgreSQL/man/dbGetInfo-methods.html)

- [`RPresto::dbGetInfo("PrestoConnection")`](https://rdrr.io/pkg/RPresto/man/dbGetInfo.html)

- [`RPresto::dbGetInfo("PrestoDriver")`](https://rdrr.io/pkg/RPresto/man/dbGetInfo.html)

- [`RPresto::dbGetInfo("PrestoResult")`](https://rdrr.io/pkg/RPresto/man/dbGetInfo.html)

- [`RSQLite::dbGetInfo("SQLiteConnection")`](https://rsqlite.r-dbi.org/reference/SQLiteConnection-class.html)

- [`RSQLite::dbGetInfo("SQLiteDriver")`](https://rsqlite.r-dbi.org/reference/SQLiteDriver-class.html)

- [`sergeant::dbGetInfo("DrillConnection")`](https://rdrr.io/pkg/sergeant/man/dbGetInfo.html)

- [`sergeant::dbGetInfo("DrillDriver")`](https://rdrr.io/pkg/sergeant/man/dbGetInfo.html)

- `sparklyr::dbGetInfo("spark_connection")`

## Usage

``` r
dbGetInfo(dbObj, ...)
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

For objects of class
[DBI::DBIDriver](https://dbi.r-dbi.org/dev/reference/DBIDriver-class.md),
`dbGetInfo()` returns a named list that contains at least the following
components:

- `driver.version`: the package version of the DBI backend,

- `client.version`: the version of the DBMS client library.

For objects of class
[DBI::DBIConnection](https://dbi.r-dbi.org/dev/reference/DBIConnection-class.md),
`dbGetInfo()` returns a named list that contains at least the following
components:

- `db.version`: version of the database server,

- `dbname`: database name,

- `username`: username to connect to the database,

- `host`: hostname of the database server,

- `port`: port on the database server. It must not contain a `password`
  component. Components that are not applicable should be set to `NA`.

For objects of class
[DBI::DBIResult](https://dbi.r-dbi.org/dev/reference/DBIResult-class.md),
`dbGetInfo()` returns a named list that contains at least the following
components:

- `statatment`: the statement used with
  [`DBI::dbSendQuery()`](https://dbi.r-dbi.org/dev/reference/dbSendQuery.md)
  or
  [`DBI::dbExecute()`](https://dbi.r-dbi.org/dev/reference/dbExecute.md),
  as returned by
  [`DBI::dbGetStatement()`](https://dbi.r-dbi.org/dev/reference/dbGetStatement.md),

- `row.count`: the number of rows fetched so far (for queries), as
  returned by
  [`DBI::dbGetRowCount()`](https://dbi.r-dbi.org/dev/reference/dbGetRowCount.md),

- `rows.affected`: the number of rows affected (for statements), as
  returned by
  [`DBI::dbGetRowsAffected()`](https://dbi.r-dbi.org/dev/reference/dbGetRowsAffected.md)

- `has.completed`: a logical that indicates if the query or statement
  has completed, as returned by
  [`DBI::dbHasCompleted()`](https://dbi.r-dbi.org/dev/reference/dbHasCompleted.md).

## Implementation notes

The default implementation for `DBIResult objects` constructs such a
list from the return values of the corresponding methods,
[`dbGetStatement()`](https://dbi.r-dbi.org/dev/reference/dbGetStatement.md),
[`dbGetRowCount()`](https://dbi.r-dbi.org/dev/reference/dbGetRowCount.md),
[`dbGetRowsAffected()`](https://dbi.r-dbi.org/dev/reference/dbGetRowsAffected.md),
and
[`dbHasCompleted()`](https://dbi.r-dbi.org/dev/reference/dbHasCompleted.md).

## See also

Other DBIDriver generics:
[`DBIDriver-class`](https://dbi.r-dbi.org/dev/reference/DBIDriver-class.md),
[`dbCanConnect()`](https://dbi.r-dbi.org/dev/reference/dbCanConnect.md),
[`dbConnect()`](https://dbi.r-dbi.org/dev/reference/dbConnect.md),
[`dbDataType()`](https://dbi.r-dbi.org/dev/reference/dbDataType.md),
[`dbDriver()`](https://dbi.r-dbi.org/dev/reference/dbDriver.md),
[`dbIsReadOnly()`](https://dbi.r-dbi.org/dev/reference/dbIsReadOnly.md),
[`dbIsValid()`](https://dbi.r-dbi.org/dev/reference/dbIsValid.md),
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

Other DBIResult generics:
[`DBIResult-class`](https://dbi.r-dbi.org/dev/reference/DBIResult-class.md),
[`dbBind()`](https://dbi.r-dbi.org/dev/reference/dbBind.md),
[`dbClearResult()`](https://dbi.r-dbi.org/dev/reference/dbClearResult.md),
[`dbColumnInfo()`](https://dbi.r-dbi.org/dev/reference/dbColumnInfo.md),
[`dbFetch()`](https://dbi.r-dbi.org/dev/reference/dbFetch.md),
[`dbGetRowCount()`](https://dbi.r-dbi.org/dev/reference/dbGetRowCount.md),
[`dbGetRowsAffected()`](https://dbi.r-dbi.org/dev/reference/dbGetRowsAffected.md),
[`dbGetStatement()`](https://dbi.r-dbi.org/dev/reference/dbGetStatement.md),
[`dbHasCompleted()`](https://dbi.r-dbi.org/dev/reference/dbHasCompleted.md),
[`dbIsReadOnly()`](https://dbi.r-dbi.org/dev/reference/dbIsReadOnly.md),
[`dbIsValid()`](https://dbi.r-dbi.org/dev/reference/dbIsValid.md),
[`dbQuoteLiteral()`](https://dbi.r-dbi.org/dev/reference/dbQuoteLiteral.md),
[`dbQuoteString()`](https://dbi.r-dbi.org/dev/reference/dbQuoteString.md)

## Examples

``` r
dbGetInfo(RSQLite::SQLite())
#> $driver.version
#> [1] ‘2.4.5’
#> 
#> $client.version
#> [1] ‘3.51.1’
#> 
```
