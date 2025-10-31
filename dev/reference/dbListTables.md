# List remote tables

Returns the unquoted names of remote tables accessible through this
connection. This should include views and temporary objects, but not all
database backends (in particular RMariaDB and RMySQL) support this.

### Methods in other packages

This documentation page describes the generics. Refer to the
documentation pages linked below for the documentation for the methods
that are implemented in various backend packages.

- [`adbi::dbListTables("AdbiConnection")`](https://adbi.r-dbi.org/reference/AdbiConnection-class.html)

- [`AzureKusto::dbListTables("AzureKustoConnection")`](https://rdrr.io/pkg/AzureKusto/man/DBI_table.html)

- [`bigrquery::dbListTables("BigQueryConnection")`](https://bigrquery.r-dbi.org/reference/DBI.html)

- [`DatabaseConnector::dbListTables("DatabaseConnectorConnection")`](https://ohdsi.github.io/DatabaseConnector/reference/dbListTables-DatabaseConnectorConnection-method.html)

- [`dittodb::dbListTables("DBIMockConnection")`](https://dittodb.jonkeane.com/reference/mock-db-methods.html)

- [`duckdb::dbListTables("duckdb_connection")`](https://r.duckdb.org/reference/duckdb_connection-class.html)

- [`lazysf::dbListTables("SFSQLConnection")`](https://hypertidy.github.io/lazysf/reference/SFSQLConnection-class.html)

- [`odbc::dbListTables("Microsoft SQL Server")`](https://odbc.r-dbi.org/reference/SQLServer.html)

- [`odbc::dbListTables("OdbcConnection")`](https://odbc.r-dbi.org/reference/dbListTables-OdbcConnection-method.html)

- [`pool::dbListTables("Pool")`](http://rstudio.github.io/pool/reference/DBI-wrap.md)

- [`RAthena::dbListTables("AthenaConnection")`](https://dyfanjones.github.io/RAthena/reference/dbListTables.html)

- [`RJDBC::dbListTables("JDBCConnection")`](https://rdrr.io/pkg/RJDBC/man/JDBCConnection-methods.html)

- [`RMariaDB::dbListTables("MariaDBConnection")`](https://rmariadb.r-dbi.org/reference/mariadb-tables.html)

- [`RMySQL::dbListTables("MySQLConnection")`](https://r-dbi.r-universe.dev/RMySQL/reference/dbReadTable.html)

- [`RPostgres::dbListTables("PqConnection")`](https://rpostgres.r-dbi.org/reference/postgres-tables.html)

- [`RPostgreSQL::dbListTables("PostgreSQLConnection")`](https://rdrr.io/pkg/RPostgreSQL/man/dbListTables-methods.html)

- [`RPresto::dbListTables("PrestoConnection")`](https://rdrr.io/pkg/RPresto/man/PrestoConnection-class.html)

- [`RSQLite::dbListTables("SQLiteConnection")`](https://rsqlite.r-dbi.org/reference/SQLiteConnection-class.html)

- `sparklyr::dbListTables("spark_connection")`

## Usage

``` r
dbListTables(conn, ...)
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

`dbListTables()` returns a character vector that enumerates all tables
and views in the database. Tables added with
[`DBI::dbWriteTable()`](https://dbi.r-dbi.org/dev/reference/dbWriteTable.md)
are part of the list. As soon a table is removed from the database, it
is also removed from the list of database tables.

The same applies to temporary tables if supported by the database.

The returned names are suitable for quoting with
[`dbQuoteIdentifier()`](https://dbi.r-dbi.org/dev/reference/dbQuoteIdentifier.md).

## Failure modes

An error is raised when calling this method for a closed or invalid
connection.

## See also

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
[`dbIsValid()`](https://dbi.r-dbi.org/dev/reference/dbIsValid.md),
[`dbListFields()`](https://dbi.r-dbi.org/dev/reference/dbListFields.md),
[`dbListObjects()`](https://dbi.r-dbi.org/dev/reference/dbListObjects.md),
[`dbListResults()`](https://dbi.r-dbi.org/dev/reference/dbListResults.md),
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

dbListTables(con)
#> character(0)
dbWriteTable(con, "mtcars", mtcars)
dbListTables(con)
#> [1] "mtcars"

dbDisconnect(con)
```
