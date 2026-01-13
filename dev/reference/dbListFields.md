# List field names of a remote table

Returns the field names of a remote table as a character vector.

### Methods in other packages

This documentation page describes the generics. Refer to the
documentation pages linked below for the documentation for the methods
that are implemented in various backend packages.

- [`adbi::dbListFields("AdbiConnection", "character")`](https://adbi.r-dbi.org/reference/AdbiConnection-class.html)

- [`adbi::dbListFields("AdbiConnection", "Id")`](https://adbi.r-dbi.org/reference/AdbiConnection-class.html)

- [`adbi::dbListFields("AdbiConnection", "SQL")`](https://adbi.r-dbi.org/reference/AdbiConnection-class.html)

- [`AzureKusto::dbListFields("AzureKustoConnection", "character")`](https://rdrr.io/pkg/AzureKusto/man/DBI_query.html)

- [`bigrquery::dbListFields("BigQueryConnection", "AsIs")`](https://bigrquery.r-dbi.org/reference/DBI.html)

- [`bigrquery::dbListFields("BigQueryConnection", "character")`](https://bigrquery.r-dbi.org/reference/DBI.html)

- [`bigrquery::dbListFields("BigQueryConnection", "Id")`](https://bigrquery.r-dbi.org/reference/DBI.html)

- [`DatabaseConnector::dbListFields("DatabaseConnectorConnection", "character")`](https://ohdsi.github.io/DatabaseConnector/reference/dbListFields-DatabaseConnectorConnection-character-method.html)

- [`dittodb::dbListFields("DBIMockConnection", "ANY")`](https://dittodb.jonkeane.com/reference/mock-db-methods.html)

- [`dittodb::dbListFields("DBIMockConnection", "character")`](https://dittodb.jonkeane.com/reference/mock-db-methods.html)

- [`dittodb::dbListFields("DBIMockConnection", "Id")`](https://dittodb.jonkeane.com/reference/mock-db-methods.html)

- [`duckdb::dbListFields("duckdb_connection", "character")`](https://r.duckdb.org/reference/duckdb_connection-class.html)

- [`odbc::dbListFields("OdbcConnection", "character")`](https://odbc.r-dbi.org/reference/OdbcConnection.html)

- [`odbc::dbListFields("OdbcConnection", "Id")`](https://odbc.r-dbi.org/reference/OdbcConnection.html)

- [`odbc::dbListFields("OdbcConnection", "SQL")`](https://odbc.r-dbi.org/reference/OdbcConnection.html)

- [`pool::dbListFields("Pool", "ANY")`](http://rstudio.github.io/pool/reference/DBI-wrap.md)

- [`RAthena::dbListFields("AthenaConnection", "character")`](https://dyfanjones.github.io/RAthena/reference/AthenaConnection.html)

- [`RJDBC::dbListFields("JDBCConnection", "ANY")`](https://rdrr.io/pkg/RJDBC/man/JDBCConnection-methods.html)

- [`RMySQL::dbListFields("MySQLConnection", "character")`](https://r-dbi.r-universe.dev/RMySQL/reference/dbReadTable.html)

- [`RMySQL::dbListFields("MySQLResult", "missing")`](https://r-dbi.r-universe.dev/RMySQL/reference/query.html)

- [`RPostgres::dbListFields("PqConnection", "character")`](https://rpostgres.r-dbi.org/reference/postgres-tables.html)

- [`RPostgres::dbListFields("PqConnection", "Id")`](https://rpostgres.r-dbi.org/reference/postgres-tables.html)

- [`RPostgreSQL::dbListFields("PostgreSQLConnection", "character")`](https://rdrr.io/pkg/RPostgreSQL/man/dbListTables-methods.html)

- [`RPostgreSQL::dbListFields("PostgreSQLResult", "missing")`](https://rdrr.io/pkg/RPostgreSQL/man/dbListTables-methods.html)

- [`RPresto::dbListFields("PrestoConnection", "character")`](https://rdrr.io/pkg/RPresto/man/PrestoConnection-class.html)

- [`RPresto::dbListFields("PrestoConnection", "dbplyr_schema")`](https://rdrr.io/pkg/RPresto/man/PrestoConnection-class.html)

- [`RPresto::dbListFields("PrestoConnection", "Id")`](https://rdrr.io/pkg/RPresto/man/PrestoConnection-class.html)

- [`RPresto::dbListFields("PrestoConnection", "SQL")`](https://rdrr.io/pkg/RPresto/man/PrestoConnection-class.html)

- [`RPresto::dbListFields("PrestoResult", "missing")`](https://rdrr.io/pkg/RPresto/man/PrestoResult-class.html)

- [`sergeant::dbListFields("DrillConnection", "character")`](https://rdrr.io/pkg/sergeant/man/DrillConnection-class.html)

- [`sergeant::dbListFields("DrillResult", "missing")`](https://rdrr.io/pkg/sergeant/man/DrillResult-class.html)

## Usage

``` r
dbListFields(conn, name, ...)
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

`dbListFields()` returns a character vector that enumerates all fields
in the table in the correct order. This also works for temporary tables
if supported by the database. The returned names are suitable for
quoting with
[`dbQuoteIdentifier()`](https://dbi.r-dbi.org/dev/reference/dbQuoteIdentifier.md).

## Failure modes

If the table does not exist, an error is raised. Invalid types for the
`name` argument (e.g., `character` of length not equal to one, or
numeric) lead to an error. An error is also raised when calling this
method for a closed or invalid connection.

## Specification

The `name` argument can be

- a string

- the return value of
  [`DBI::dbQuoteIdentifier()`](https://dbi.r-dbi.org/dev/reference/dbQuoteIdentifier.md)

- a value from the `table` column from the return value of
  [`DBI::dbListObjects()`](https://dbi.r-dbi.org/dev/reference/dbListObjects.md)
  where `is_prefix` is `FALSE`

A column named `row_names` is treated like any other column.

## See also

[`dbColumnInfo()`](https://dbi.r-dbi.org/dev/reference/dbColumnInfo.md)
to get the type of the fields.

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

dbWriteTable(con, "mtcars", mtcars)
dbListFields(con, "mtcars")
#>  [1] "mpg"  "cyl"  "disp" "hp"   "drat" "wt"   "qsec" "vs"   "am"   "gear"
#> [11] "carb"

dbDisconnect(con)
```
