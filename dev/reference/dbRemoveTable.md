# Remove a table from the database

Remove a remote table (e.g., created by
[`dbWriteTable()`](https://dbi.r-dbi.org/dev/reference/dbWriteTable.md))
from the database.

### Methods in other packages

This documentation page describes the generics. Refer to the
documentation pages linked below for the documentation for the methods
that are implemented in various backend packages.

- [`adbi::dbRemoveTable("AdbiConnection", "character")`](https://adbi.r-dbi.org/reference/AdbiConnection-class.html)

- [`adbi::dbRemoveTable("AdbiConnection", "Id")`](https://adbi.r-dbi.org/reference/AdbiConnection-class.html)

- [`AzureKusto::dbRemoveTable("AzureKustoConnection", "ANY")`](https://rdrr.io/pkg/AzureKusto/man/DBI_table.html)

- [`bigrquery::dbRemoveTable("BigQueryConnection", "AsIs")`](https://bigrquery.r-dbi.org/reference/DBI.html)

- [`bigrquery::dbRemoveTable("BigQueryConnection", "character")`](https://bigrquery.r-dbi.org/reference/DBI.html)

- [`bigrquery::dbRemoveTable("BigQueryConnection", "Id")`](https://bigrquery.r-dbi.org/reference/DBI.html)

- [`DatabaseConnector::dbRemoveTable("DatabaseConnectorConnection", "ANY")`](https://ohdsi.github.io/DatabaseConnector/reference/dbRemoveTable-DatabaseConnectorConnection-ANY-method.html)

- [`dittodb::dbRemoveTable("DBIMockConnection", "character")`](https://dittodb.jonkeane.com/reference/mock-db-methods.html)

- [`duckdb::dbRemoveTable("duckdb_connection", "character")`](https://r.duckdb.org/reference/duckdb_connection-class.html)

- [`odbc::dbRemoveTable("OdbcConnection", "character")`](https://odbc.r-dbi.org/reference/OdbcConnection.html)

- [`pool::dbRemoveTable("Pool", "ANY")`](http://rstudio.github.io/pool/reference/DBI-wrap.md)

- [`RAthena::dbRemoveTable("AthenaConnection", "character")`](https://dyfanjones.github.io/RAthena/reference/AthenaConnection.html)

- [`RAthena::dbRemoveTable("AthenaConnection", "Id")`](https://dyfanjones.github.io/RAthena/reference/AthenaConnection.html)

- [`RJDBC::dbRemoveTable("JDBCConnection", "ANY")`](https://rdrr.io/pkg/RJDBC/man/JDBCConnection-methods.html)

- [`RMariaDB::dbRemoveTable("MariaDBConnection", "character")`](https://rmariadb.r-dbi.org/reference/mariadb-tables.html)

- [`RMySQL::dbRemoveTable("MySQLConnection", "character")`](https://r-dbi.r-universe.dev/RMySQL/reference/dbReadTable.html)

- [`RPostgres::dbRemoveTable("PqConnection", "character")`](https://rpostgres.r-dbi.org/reference/postgres-tables.html)

- [`RPostgreSQL::dbRemoveTable("PostgreSQLConnection", "character")`](https://rdrr.io/pkg/RPostgreSQL/man/dbReadTable-methods.html)

- [`RPresto::dbRemoveTable("PrestoConnection", "ANY")`](https://rdrr.io/pkg/RPresto/man/PrestoConnection-class.html)

- [`RSQLite::dbRemoveTable("SQLiteConnection", "character")`](https://rsqlite.r-dbi.org/reference/SQLiteConnection-class.html)

- `sparklyr::dbRemoveTable("spark_connection", "character")`

## Usage

``` r
dbRemoveTable(conn, name, ...)
```

## Arguments

- conn:

  A
  [DBI::DBIConnection](https://dbi.r-dbi.org/dev/reference/DBIConnection-class.md)
  object, as returned by
  [`dbConnect()`](https://dbi.r-dbi.org/dev/reference/dbConnect.md).

- name:

  The table name, passed on to
  [`dbQuoteIdentifier()`](https://dbi.r-dbi.org/dev/reference/dbQuoteIdentifier.md).
  Options are:

  - a character string with the unquoted DBMS table name, e.g.
    `"table_name"`,

  - a call to [`Id()`](https://dbi.r-dbi.org/dev/reference/Id.md) with
    components to the fully qualified table name, e.g.
    `Id(schema = "my_schema", table = "table_name")`

  - a call to [`SQL()`](https://dbi.r-dbi.org/dev/reference/SQL.md) with
    the quoted and fully qualified table name given verbatim, e.g.
    `SQL('"my_schema"."table_name"')`

- ...:

  Other parameters passed on to methods.

## Value

`dbRemoveTable()` returns `TRUE`, invisibly.

## Failure modes

If the table does not exist, an error is raised. An attempt to remove a
view with this function may result in an error.

An error is raised when calling this method for a closed or invalid
connection. An error is also raised if `name` cannot be processed with
[`DBI::dbQuoteIdentifier()`](https://dbi.r-dbi.org/dev/reference/dbQuoteIdentifier.md)
or if this results in a non-scalar.

## Additional arguments

The following arguments are not part of the `dbRemoveTable()` generic
(to improve compatibility across backends) but are part of the DBI
specification:

- `temporary` (default: `FALSE`)

- `fail_if_missing` (default: `TRUE`)

These arguments must be provided as named arguments.

If `temporary` is `TRUE`, the call to `dbRemoveTable()` will consider
only temporary tables. Not all backends support this argument. In
particular, permanent tables of the same name are left untouched.

If `fail_if_missing` is `FALSE`, the call to `dbRemoveTable()` succeeds
if the table does not exist.

## Specification

A table removed by `dbRemoveTable()` doesn't appear in the list of
tables returned by
[`DBI::dbListTables()`](https://dbi.r-dbi.org/dev/reference/dbListTables.md),
and
[`DBI::dbExistsTable()`](https://dbi.r-dbi.org/dev/reference/dbExistsTable.md)
returns `FALSE`. The removal propagates immediately to other connections
to the same database. This function can also be used to remove a
temporary table.

The `name` argument is processed as follows, to support databases that
allow non-syntactic names for their objects:

- If an unquoted table name as string: `dbRemoveTable()` will do the
  quoting, perhaps by calling `dbQuoteIdentifier(conn, x = name)`

- If the result of a call to
  [`DBI::dbQuoteIdentifier()`](https://dbi.r-dbi.org/dev/reference/dbQuoteIdentifier.md):
  no more quoting is done

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
[`dbListTables()`](https://dbi.r-dbi.org/dev/reference/dbListTables.md),
[`dbQuoteIdentifier()`](https://dbi.r-dbi.org/dev/reference/dbQuoteIdentifier.md),
[`dbReadTable()`](https://dbi.r-dbi.org/dev/reference/dbReadTable.md),
[`dbReadTableArrow()`](https://dbi.r-dbi.org/dev/reference/dbReadTableArrow.md),
[`dbSendQuery()`](https://dbi.r-dbi.org/dev/reference/dbSendQuery.md),
[`dbSendQueryArrow()`](https://dbi.r-dbi.org/dev/reference/dbSendQueryArrow.md),
[`dbSendStatement()`](https://dbi.r-dbi.org/dev/reference/dbSendStatement.md),
[`dbUnquoteIdentifier()`](https://dbi.r-dbi.org/dev/reference/dbUnquoteIdentifier.md),
[`dbWriteTable()`](https://dbi.r-dbi.org/dev/reference/dbWriteTable.md),
[`dbWriteTableArrow()`](https://dbi.r-dbi.org/dev/reference/dbWriteTableArrow.md)

## Examples

``` r
con <- dbConnect(RSQLite::SQLite(), ":memory:")

dbExistsTable(con, "iris")
#> [1] FALSE
dbWriteTable(con, "iris", iris)
dbExistsTable(con, "iris")
#> [1] TRUE
dbRemoveTable(con, "iris")
dbExistsTable(con, "iris")
#> [1] FALSE

dbDisconnect(con)
```
