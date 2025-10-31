# Does a table exist?

Returns if a table given by name exists in the database.

### Methods in other packages

This documentation page describes the generics. Refer to the
documentation pages linked below for the documentation for the methods
that are implemented in various backend packages.

- [`adbi::dbExistsTable("AdbiConnection", "character")`](https://adbi.r-dbi.org/reference/AdbiConnection-class.html)

- [`adbi::dbExistsTable("AdbiConnection", "Id")`](https://adbi.r-dbi.org/reference/AdbiConnection-class.html)

- [`adbi::dbExistsTable("AdbiConnection", "SQL")`](https://adbi.r-dbi.org/reference/AdbiConnection-class.html)

- [`AzureKusto::dbExistsTable("AzureKustoConnection", "ANY")`](https://rdrr.io/pkg/AzureKusto/man/DBI_table.html)

- [`bigrquery::dbExistsTable("BigQueryConnection", "AsIs")`](https://bigrquery.r-dbi.org/reference/DBI.html)

- [`bigrquery::dbExistsTable("BigQueryConnection", "character")`](https://bigrquery.r-dbi.org/reference/DBI.html)

- [`bigrquery::dbExistsTable("BigQueryConnection", "Id")`](https://bigrquery.r-dbi.org/reference/DBI.html)

- [`DatabaseConnector::dbExistsTable("DatabaseConnectorConnection", "character")`](https://ohdsi.github.io/DatabaseConnector/reference/dbExistsTable-DatabaseConnectorConnection-character-method.html)

- [`dittodb::dbExistsTable("DBIMockConnection", "character")`](https://dittodb.jonkeane.com/reference/mock-db-methods.html)

- [`dittodb::dbExistsTable("DBIMockConnection", "Id")`](https://dittodb.jonkeane.com/reference/mock-db-methods.html)

- [`duckdb::dbExistsTable("duckdb_connection", "ANY")`](https://r.duckdb.org/reference/duckdb_connection-class.html)

- [`lazysf::dbExistsTable("SFSQLConnection", "ANY")`](https://hypertidy.github.io/lazysf/reference/SFSQLConnection-class.html)

- [`odbc::dbExistsTable("Microsoft SQL Server", "character")`](https://odbc.r-dbi.org/reference/SQLServer.html)

- [`odbc::dbExistsTable("Microsoft SQL Server", "Id")`](https://odbc.r-dbi.org/reference/SQLServer.html)

- [`odbc::dbExistsTable("Microsoft SQL Server", "SQL")`](https://odbc.r-dbi.org/reference/SQLServer.html)

- [`odbc::dbExistsTable("OdbcConnection", "character")`](https://odbc.r-dbi.org/reference/OdbcConnection.html)

- [`odbc::dbExistsTable("OdbcConnection", "Id")`](https://odbc.r-dbi.org/reference/OdbcConnection.html)

- [`odbc::dbExistsTable("OdbcConnection", "SQL")`](https://odbc.r-dbi.org/reference/OdbcConnection.html)

- [`pool::dbExistsTable("Pool", "ANY")`](http://rstudio.github.io/pool/reference/DBI-wrap.md)

- [`RAthena::dbExistsTable("AthenaConnection", "character")`](https://dyfanjones.github.io/RAthena/reference/AthenaConnection.html)

- [`RAthena::dbExistsTable("AthenaConnection", "Id")`](https://dyfanjones.github.io/RAthena/reference/AthenaConnection.html)

- [`RJDBC::dbExistsTable("JDBCConnection", "ANY")`](https://rdrr.io/pkg/RJDBC/man/JDBCConnection-methods.html)

- [`RMariaDB::dbExistsTable("MariaDBConnection", "character")`](https://rmariadb.r-dbi.org/reference/mariadb-tables.html)

- [`RMySQL::dbExistsTable("MySQLConnection", "character")`](https://r-dbi.r-universe.dev/RMySQL/reference/dbReadTable.html)

- [`RPostgres::dbExistsTable("PqConnection", "character")`](https://rpostgres.r-dbi.org/reference/postgres-tables.html)

- [`RPostgres::dbExistsTable("PqConnection", "Id")`](https://rpostgres.r-dbi.org/reference/postgres-tables.html)

- [`RPostgreSQL::dbExistsTable("PostgreSQLConnection", "character")`](https://rdrr.io/pkg/RPostgreSQL/man/dbReadTable-methods.html)

- [`RPresto::dbExistsTable("PrestoConnection", "ANY")`](https://rdrr.io/pkg/RPresto/man/PrestoConnection-class.html)

- [`RSQLite::dbExistsTable("SQLiteConnection", "character")`](https://rsqlite.r-dbi.org/reference/SQLiteConnection-class.html)

- [`RSQLite::dbExistsTable("SQLiteConnection", "Id")`](https://rsqlite.r-dbi.org/reference/SQLiteConnection-class.html)

- `sparklyr::dbExistsTable("spark_connection", "character")`

## Usage

``` r
dbExistsTable(conn, name, ...)
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

`dbExistsTable()` returns a logical scalar, `TRUE` if the table or view
specified by the `name` argument exists, `FALSE` otherwise.

This includes temporary tables if supported by the database.

## Failure modes

An error is raised when calling this method for a closed or invalid
connection. An error is also raised if `name` cannot be processed with
[`DBI::dbQuoteIdentifier()`](https://dbi.r-dbi.org/dev/reference/dbQuoteIdentifier.md)
or if this results in a non-scalar.

## Specification

The `name` argument is processed as follows, to support databases that
allow non-syntactic names for their objects:

- If an unquoted table name as string: `dbExistsTable()` will do the
  quoting, perhaps by calling `dbQuoteIdentifier(conn, x = name)`

- If the result of a call to
  [`DBI::dbQuoteIdentifier()`](https://dbi.r-dbi.org/dev/reference/dbQuoteIdentifier.md):
  no more quoting is done

For all tables listed by
[`DBI::dbListTables()`](https://dbi.r-dbi.org/dev/reference/dbListTables.md),
`dbExistsTable()` returns `TRUE`.

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

dbExistsTable(con, "iris")
#> [1] FALSE
dbWriteTable(con, "iris", iris)
dbExistsTable(con, "iris")
#> [1] TRUE

dbDisconnect(con)
```
