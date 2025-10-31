# Quote identifiers

Call this method to generate a string that is suitable for use in a
query as a column or table name, to make sure that you generate valid
SQL and protect against SQL injection attacks. The inverse operation is
[`dbUnquoteIdentifier()`](https://dbi.r-dbi.org/dev/reference/dbUnquoteIdentifier.md).

### Methods in other packages

This documentation page describes the generics. Refer to the
documentation pages linked below for the documentation for the methods
that are implemented in various backend packages.

- [`adbi::dbQuoteIdentifier("AdbiConnection", "character")`](https://adbi.r-dbi.org/reference/AdbiConnection-class.html)

- [`adbi::dbQuoteIdentifier("AdbiConnection", "SQL")`](https://adbi.r-dbi.org/reference/AdbiConnection-class.html)

- [`bigrquery::dbQuoteIdentifier("BigQueryConnection", "character")`](https://bigrquery.r-dbi.org/reference/DBI.html)

- [`bigrquery::dbQuoteIdentifier("BigQueryConnection", "SQL")`](https://bigrquery.r-dbi.org/reference/DBI.html)

- `DatabaseConnector::dbQuoteIdentifier("DatabaseConnectorConnection", "character")`

- [`dittodb::dbQuoteIdentifier("DBIMockRPostgresConnection", "character")`](https://dittodb.jonkeane.com/reference/mock-db-methods.html)

- [`dittodb::dbQuoteIdentifier("DBIMockRPostgresConnection", "SQL")`](https://dittodb.jonkeane.com/reference/mock-db-methods.html)

- [`duckdb::dbQuoteIdentifier("duckdb_connection", "ANY")`](https://r.duckdb.org/reference/duckdb_connection-class.html)

- [`duckdb::dbQuoteIdentifier("duckdb_connection", "character")`](https://r.duckdb.org/reference/duckdb_connection-class.html)

- [`duckdb::dbQuoteIdentifier("duckdb_connection", "Id")`](https://r.duckdb.org/reference/duckdb_connection-class.html)

- [`duckdb::dbQuoteIdentifier("duckdb_connection", "SQL")`](https://r.duckdb.org/reference/duckdb_connection-class.html)

- `implyr::dbQuoteIdentifier("impala_connection", "character")`

- `implyr::dbQuoteIdentifier("impala_connection", "dbplyr_table_ident")`

- [`odbc::dbQuoteIdentifier("OdbcConnection", "character")`](https://odbc.r-dbi.org/reference/OdbcConnection.html)

- [`pool::dbQuoteIdentifier("Pool", "ANY")`](http://rstudio.github.io/pool/reference/DBI-wrap.md)

- [`RMariaDB::dbQuoteIdentifier("MariaDBConnection", "character")`](https://rmariadb.r-dbi.org/reference/mariadb-quoting.html)

- [`RMariaDB::dbQuoteIdentifier("MariaDBConnection", "Id")`](https://rmariadb.r-dbi.org/reference/mariadb-quoting.html)

- [`RMariaDB::dbQuoteIdentifier("MariaDBConnection", "SQL")`](https://rmariadb.r-dbi.org/reference/mariadb-quoting.html)

- [`RMySQL::dbQuoteIdentifier("MySQLConnection", "character")`](https://r-dbi.r-universe.dev/RMySQL/reference/dbQuoteIdentifier-MySQLConnection-character-method.html)

- [`RPostgres::dbQuoteIdentifier("PqConnection", "character")`](https://rpostgres.r-dbi.org/reference/quote.html)

- [`RPostgres::dbQuoteIdentifier("PqConnection", "Id")`](https://rpostgres.r-dbi.org/reference/quote.html)

- [`RPostgres::dbQuoteIdentifier("PqConnection", "SQL")`](https://rpostgres.r-dbi.org/reference/quote.html)

- [`RPresto::dbQuoteIdentifier("PrestoConnection", "AsIs")`](https://rdrr.io/pkg/RPresto/man/PrestoConnection-class.html)

- [`RPresto::dbQuoteIdentifier("PrestoConnection", "dbplyr_schema")`](https://rdrr.io/pkg/RPresto/man/PrestoConnection-class.html)

- [`RPresto::dbQuoteIdentifier("PrestoConnection", "dbplyr_table_path")`](https://rdrr.io/pkg/RPresto/man/PrestoConnection-class.html)

- [`RSQLite::dbQuoteIdentifier("SQLiteConnection", "character")`](https://rsqlite.r-dbi.org/reference/SQLiteConnection-class.html)

- [`RSQLite::dbQuoteIdentifier("SQLiteConnection", "SQL")`](https://rsqlite.r-dbi.org/reference/SQLiteConnection-class.html)

- `sparklyr::dbQuoteIdentifier("spark_connection", "character")`

## Usage

``` r
dbQuoteIdentifier(conn, x, ...)
```

## Arguments

- conn:

  A
  [DBI::DBIConnection](https://dbi.r-dbi.org/dev/reference/DBIConnection-class.md)
  object, as returned by
  [`dbConnect()`](https://dbi.r-dbi.org/dev/reference/dbConnect.md).

- x:

  A character vector, [SQL](https://dbi.r-dbi.org/dev/reference/SQL.md)
  or [Id](https://dbi.r-dbi.org/dev/reference/Id.md) object to quote as
  identifier.

- ...:

  Other arguments passed on to methods.

## Value

`dbQuoteIdentifier()` returns an object that can be coerced to
[character](https://rdrr.io/r/base/character.html), of the same length
as the input. For an empty character vector this function returns a
length-0 object. The names of the input argument are preserved in the
output. When passing the returned object again to `dbQuoteIdentifier()`
as `x` argument, it is returned unchanged. Passing objects of class
[DBI::SQL](https://dbi.r-dbi.org/dev/reference/SQL.md) should also
return them unchanged. (For backends it may be most convenient to return
[DBI::SQL](https://dbi.r-dbi.org/dev/reference/SQL.md) objects to
achieve this behavior, but this is not required.)

## Failure modes

An error is raised if the input contains `NA`, but not for an empty
string.

## Specification

Calling
[`DBI::dbGetQuery()`](https://dbi.r-dbi.org/dev/reference/dbGetQuery.md)
for a query of the format `SELECT 1 AS ...` returns a data frame with
the identifier, unquoted, as column name. Quoted identifiers can be used
as table and column names in SQL queries, in particular in queries like
`SELECT 1 AS ...` and `SELECT * FROM (SELECT 1) ...`. The method must
use a quoting mechanism that is unambiguously different from the quoting
mechanism used for strings, so that a query like
`SELECT ... FROM (SELECT 1 AS ...)` throws an error if the column names
do not match.

The method can quote column names that contain special characters such
as a space, a dot, a comma, or quotes used to mark strings or
identifiers, if the database supports this. In any case, checking the
validity of the identifier should be performed only when executing a
query, and not by `dbQuoteIdentifier()`.

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
# Quoting ensures that arbitrary input is safe for use in a query
name <- "Robert'); DROP TABLE Students;--"
dbQuoteIdentifier(ANSI(), name)
#> <SQL> "Robert'); DROP TABLE Students;--"

# Use Id() to specify other components such as the schema
id_name <- Id(schema = "schema_name", table = "table_name")
id_name
#> <Id> "schema_name"."table_name"
dbQuoteIdentifier(ANSI(), id_name)
#> <SQL> "schema_name"."table_name"

# SQL vectors are always passed through as is
var_name <- SQL("select")
var_name
#> <SQL> select
dbQuoteIdentifier(ANSI(), var_name)
#> <SQL> select

# This mechanism is used to prevent double escaping
dbQuoteIdentifier(ANSI(), dbQuoteIdentifier(ANSI(), name))
#> <SQL> "Robert'); DROP TABLE Students;--"
```
