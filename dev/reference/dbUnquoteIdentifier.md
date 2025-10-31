# Unquote identifiers

Call this method to convert a
[SQL](https://dbi.r-dbi.org/dev/reference/SQL.md) object created by
[`dbQuoteIdentifier()`](https://dbi.r-dbi.org/dev/reference/dbQuoteIdentifier.md)
back to a list of [Id](https://dbi.r-dbi.org/dev/reference/Id.md)
objects.

### Methods in other packages

This documentation page describes the generics. Refer to the
documentation pages linked below for the documentation for the methods
that are implemented in various backend packages.

- `adbi::dbUnquoteIdentifier("AdbiConnection", "ANY")`

- [`odbc::dbUnquoteIdentifier("Microsoft SQL Server", "SQL")`](https://odbc.r-dbi.org/reference/SQLServer.html)

- `pool::dbUnquoteIdentifier("Pool", "ANY")`

- [`RMariaDB::dbUnquoteIdentifier("MariaDBConnection", "SQL")`](https://rmariadb.r-dbi.org/reference/mariadb-quoting.html)

- [`RPostgres::dbUnquoteIdentifier("PqConnection", "SQL")`](https://rpostgres.r-dbi.org/reference/quote.html)

- [`RSQLite::dbUnquoteIdentifier("SQLiteConnection", "SQL")`](https://rsqlite.r-dbi.org/reference/SQLiteConnection-class.html)

## Usage

``` r
dbUnquoteIdentifier(conn, x, ...)
```

## Arguments

- conn:

  A
  [DBI::DBIConnection](https://dbi.r-dbi.org/dev/reference/DBIConnection-class.md)
  object, as returned by
  [`dbConnect()`](https://dbi.r-dbi.org/dev/reference/dbConnect.md).

- x:

  An [SQL](https://dbi.r-dbi.org/dev/reference/SQL.md) or
  [Id](https://dbi.r-dbi.org/dev/reference/Id.md) object.

- ...:

  Other arguments passed on to methods.

## Value

`dbUnquoteIdentifier()` returns a list of objects of the same length as
the input. For an empty vector, this function returns a length-0 object.
The names of the input argument are preserved in the output. If `x` is a
value returned by `dbUnquoteIdentifier()`, calling
`dbUnquoteIdentifier(..., dbQuoteIdentifier(..., x))` returns `list(x)`.
If `x` is an object of class
[DBI::Id](https://dbi.r-dbi.org/dev/reference/Id.md), calling
`dbUnquoteIdentifier(..., x)` returns `list(x)`. (For backends it may be
most convenient to return
[DBI::Id](https://dbi.r-dbi.org/dev/reference/Id.md) objects to achieve
this behavior, but this is not required.)

Plain character vectors can also be passed to `dbUnquoteIdentifier()`.

## Failure modes

An error is raised if a character vectors with a missing value is passed
as the `x` argument.

## Specification

For any character vector of length one, quoting (with
[`DBI::dbQuoteIdentifier()`](https://dbi.r-dbi.org/dev/reference/dbQuoteIdentifier.md))
then unquoting then quoting the first element is identical to just
quoting. This is also true for strings that contain special characters
such as a space, a dot, a comma, or quotes used to mark strings or
identifiers, if the database supports this.

Unquoting simple strings (consisting of only letters) wrapped with
[`DBI::SQL()`](https://dbi.r-dbi.org/dev/reference/SQL.md) and then
quoting via
[`DBI::dbQuoteIdentifier()`](https://dbi.r-dbi.org/dev/reference/dbQuoteIdentifier.md)
gives the same result as just quoting the string. Similarly, unquoting
expressions of the form `SQL("schema.table")` and then quoting gives the
same result as quoting the identifier constructed by
`Id("schema", "table")`.

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
[`dbRemoveTable()`](https://dbi.r-dbi.org/dev/reference/dbRemoveTable.md),
[`dbSendQuery()`](https://dbi.r-dbi.org/dev/reference/dbSendQuery.md),
[`dbSendQueryArrow()`](https://dbi.r-dbi.org/dev/reference/dbSendQueryArrow.md),
[`dbSendStatement()`](https://dbi.r-dbi.org/dev/reference/dbSendStatement.md),
[`dbWriteTable()`](https://dbi.r-dbi.org/dev/reference/dbWriteTable.md),
[`dbWriteTableArrow()`](https://dbi.r-dbi.org/dev/reference/dbWriteTableArrow.md)

## Examples

``` r
# Unquoting allows to understand the structure of a
# possibly complex quoted identifier
dbUnquoteIdentifier(
  ANSI(),
  SQL(c('"Catalog"."Schema"."Table"', '"Schema"."Table"', '"UnqualifiedTable"'))
)
#> [[1]]
#> <Id> "Catalog"."Schema"."Table"
#> 
#> [[2]]
#> <Id> "Schema"."Table"
#> 
#> [[3]]
#> <Id> "UnqualifiedTable"
#> 

# The returned object is always a list,
# also for Id objects
dbUnquoteIdentifier(ANSI(), Id("Catalog", "Schema", "Table"))
#> [[1]]
#> <Id> "Catalog"."Schema"."Table"
#> 

# Quoting and unquoting are inverses
dbQuoteIdentifier(
  ANSI(),
  dbUnquoteIdentifier(ANSI(), SQL("UnqualifiedTable"))[[1]]
)
#> <SQL> "UnqualifiedTable"

dbQuoteIdentifier(
  ANSI(),
  dbUnquoteIdentifier(ANSI(), Id("Schema", "Table"))[[1]]
)
#> <SQL> "Schema"."Table"
```
