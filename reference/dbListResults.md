# A list of all pending results

DEPRECATED. DBI currenty supports only one open result set per
connection, you need to keep track of the result sets you open if you
need this functionality.

## Usage

``` r
dbListResults(conn, ...)
```

## Arguments

- conn:

  A
  [DBI::DBIConnection](https://dbi.r-dbi.org/reference/DBIConnection-class.md)
  object, as returned by
  [`dbConnect()`](https://dbi.r-dbi.org/reference/dbConnect.md).

- ...:

  Other parameters passed on to methods.

## Value

a list. If no results are active, an empty list. If only a single result
is active, a list with one element.

## See also

Other DBIConnection generics:
[`DBIConnection-class`](https://dbi.r-dbi.org/reference/DBIConnection-class.md),
[`dbAppendTable()`](https://dbi.r-dbi.org/reference/dbAppendTable.md),
[`dbAppendTableArrow()`](https://dbi.r-dbi.org/reference/dbAppendTableArrow.md),
[`dbCreateTable()`](https://dbi.r-dbi.org/reference/dbCreateTable.md),
[`dbCreateTableArrow()`](https://dbi.r-dbi.org/reference/dbCreateTableArrow.md),
[`dbDataType()`](https://dbi.r-dbi.org/reference/dbDataType.md),
[`dbDisconnect()`](https://dbi.r-dbi.org/reference/dbDisconnect.md),
[`dbExecute()`](https://dbi.r-dbi.org/reference/dbExecute.md),
[`dbExistsTable()`](https://dbi.r-dbi.org/reference/dbExistsTable.md),
[`dbGetException()`](https://dbi.r-dbi.org/reference/dbGetException.md),
[`dbGetInfo()`](https://dbi.r-dbi.org/reference/dbGetInfo.md),
[`dbGetQuery()`](https://dbi.r-dbi.org/reference/dbGetQuery.md),
[`dbGetQueryArrow()`](https://dbi.r-dbi.org/reference/dbGetQueryArrow.md),
[`dbIsReadOnly()`](https://dbi.r-dbi.org/reference/dbIsReadOnly.md),
[`dbIsValid()`](https://dbi.r-dbi.org/reference/dbIsValid.md),
[`dbListFields()`](https://dbi.r-dbi.org/reference/dbListFields.md),
[`dbListObjects()`](https://dbi.r-dbi.org/reference/dbListObjects.md),
[`dbListTables()`](https://dbi.r-dbi.org/reference/dbListTables.md),
[`dbQuoteIdentifier()`](https://dbi.r-dbi.org/reference/dbQuoteIdentifier.md),
[`dbReadTable()`](https://dbi.r-dbi.org/reference/dbReadTable.md),
[`dbReadTableArrow()`](https://dbi.r-dbi.org/reference/dbReadTableArrow.md),
[`dbRemoveTable()`](https://dbi.r-dbi.org/reference/dbRemoveTable.md),
[`dbSendQuery()`](https://dbi.r-dbi.org/reference/dbSendQuery.md),
[`dbSendQueryArrow()`](https://dbi.r-dbi.org/reference/dbSendQueryArrow.md),
[`dbSendStatement()`](https://dbi.r-dbi.org/reference/dbSendStatement.md),
[`dbUnquoteIdentifier()`](https://dbi.r-dbi.org/reference/dbUnquoteIdentifier.md),
[`dbWriteTable()`](https://dbi.r-dbi.org/reference/dbWriteTable.md),
[`dbWriteTableArrow()`](https://dbi.r-dbi.org/reference/dbWriteTableArrow.md)
