# List remote objects

Returns the names of remote objects accessible through this connection
as a data frame. This should include temporary objects, but not all
database backends (in particular RMariaDB and RMySQL) support this.
Compared to
[`dbListTables()`](https://dbi.r-dbi.org/dev/reference/dbListTables.md),
this method also enumerates tables and views in schemas, and returns
fully qualified identifiers to access these objects. This allows
exploration of all database objects available to the current user,
including those that can only be accessed by giving the full namespace.

### Methods in other packages

This documentation page describes the generics. Refer to the
documentation pages linked below for the documentation for the methods
that are implemented in various backend packages.

- [`pool::dbListObjects("Pool")`](http://rstudio.github.io/pool/reference/DBI-wrap.md)

- [`RMariaDB::dbListObjects("MariaDBConnection")`](https://rmariadb.r-dbi.org/reference/mariadb-tables.html)

- [`RPostgres::dbListObjects("PqConnection")`](https://rpostgres.r-dbi.org/reference/postgres-tables.html)

## Usage

``` r
dbListObjects(conn, prefix = NULL, ...)
```

## Arguments

- conn:

  A
  [DBI::DBIConnection](https://dbi.r-dbi.org/dev/reference/DBIConnection-class.md)
  object, as returned by
  [`dbConnect()`](https://dbi.r-dbi.org/dev/reference/dbConnect.md).

- prefix:

  A fully qualified path in the database's namespace, or `NULL`. This
  argument will be processed with
  [`dbUnquoteIdentifier()`](https://dbi.r-dbi.org/dev/reference/dbUnquoteIdentifier.md).
  If given the method will return all objects accessible through this
  prefix.

- ...:

  Other parameters passed on to methods.

## Value

`dbListObjects()` returns a data frame with columns `table` and
`is_prefix` (in that order), optionally with other columns with a dot
(`.`) prefix. The `table` column is of type list. Each object in this
list is suitable for use as argument in
[`DBI::dbQuoteIdentifier()`](https://dbi.r-dbi.org/dev/reference/dbQuoteIdentifier.md).
The `is_prefix` column is a logical. This data frame contains one row
for each object (schema, table and view) accessible from the prefix (if
passed) or from the global namespace (if prefix is omitted). Tables
added with
[`DBI::dbWriteTable()`](https://dbi.r-dbi.org/dev/reference/dbWriteTable.md)
are part of the data frame. As soon a table is removed from the
database, it is also removed from the data frame of database objects.

The same applies to temporary objects if supported by the database.

The returned names are suitable for quoting with
[`dbQuoteIdentifier()`](https://dbi.r-dbi.org/dev/reference/dbQuoteIdentifier.md).

## Failure modes

An error is raised when calling this method for a closed or invalid
connection.

## Specification

The `prefix` column indicates if the `table` value refers to a table or
a prefix. For a call with the default `prefix = NULL`, the `table`
values that have `is_prefix == FALSE` correspond to the tables returned
from
[`DBI::dbListTables()`](https://dbi.r-dbi.org/dev/reference/dbListTables.md),

The `table` object can be quoted with
[`DBI::dbQuoteIdentifier()`](https://dbi.r-dbi.org/dev/reference/dbQuoteIdentifier.md).
The result of quoting can be passed to
[`DBI::dbUnquoteIdentifier()`](https://dbi.r-dbi.org/dev/reference/dbUnquoteIdentifier.md).
(For backends it may be convenient to use the
[DBI::Id](https://dbi.r-dbi.org/dev/reference/Id.md) class, but this is
not required.)

Values in `table` column that have `is_prefix == TRUE` can be passed as
the `prefix` argument to another call to `dbListObjects()`. For the data
frame returned from a `dbListObject()` call with the `prefix` argument
set, all `table` values where `is_prefix` is `FALSE` can be used in a
call to
[`DBI::dbExistsTable()`](https://dbi.r-dbi.org/dev/reference/dbExistsTable.md)
which returns `TRUE`.

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

dbListObjects(con)
#> [1] table     is_prefix
#> <0 rows> (or 0-length row.names)
dbWriteTable(con, "mtcars", mtcars)
dbListObjects(con)
#>           table is_prefix
#> 1 <Id> "mtcars"     FALSE

dbDisconnect(con)
```
