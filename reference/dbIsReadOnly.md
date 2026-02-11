# Is this DBMS object read only?

This generic tests whether a database object is read only.

### Methods in other packages

This documentation page describes the generics. Refer to the
documentation pages linked below for the documentation for the methods
that are implemented in various backend packages.

- [`pool::dbIsReadOnly("Pool")`](http://rstudio.github.io/pool/reference/DBI-wrap.md)

## Usage

``` r
dbIsReadOnly(dbObj, ...)
```

## Arguments

- dbObj:

  An object inheriting from
  [DBIObject](https://dbi.r-dbi.org/reference/DBIObject-class.md), i.e.
  [DBIDriver](https://dbi.r-dbi.org/reference/DBIDriver-class.md),
  [DBIConnection](https://dbi.r-dbi.org/reference/DBIConnection-class.md),
  or a [DBIResult](https://dbi.r-dbi.org/reference/DBIResult-class.md)

- ...:

  Other arguments to methods.

## See also

Other DBIDriver generics:
[`DBIDriver-class`](https://dbi.r-dbi.org/reference/DBIDriver-class.md),
[`dbCanConnect()`](https://dbi.r-dbi.org/reference/dbCanConnect.md),
[`dbConnect()`](https://dbi.r-dbi.org/reference/dbConnect.md),
[`dbDataType()`](https://dbi.r-dbi.org/reference/dbDataType.md),
[`dbDriver()`](https://dbi.r-dbi.org/reference/dbDriver.md),
[`dbGetInfo()`](https://dbi.r-dbi.org/reference/dbGetInfo.md),
[`dbIsValid()`](https://dbi.r-dbi.org/reference/dbIsValid.md),
[`dbListConnections()`](https://dbi.r-dbi.org/reference/dbListConnections.md)

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
[`dbIsValid()`](https://dbi.r-dbi.org/reference/dbIsValid.md),
[`dbListFields()`](https://dbi.r-dbi.org/reference/dbListFields.md),
[`dbListObjects()`](https://dbi.r-dbi.org/reference/dbListObjects.md),
[`dbListResults()`](https://dbi.r-dbi.org/reference/dbListResults.md),
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

Other DBIResult generics:
[`DBIResult-class`](https://dbi.r-dbi.org/reference/DBIResult-class.md),
[`dbBind()`](https://dbi.r-dbi.org/reference/dbBind.md),
[`dbClearResult()`](https://dbi.r-dbi.org/reference/dbClearResult.md),
[`dbColumnInfo()`](https://dbi.r-dbi.org/reference/dbColumnInfo.md),
[`dbFetch()`](https://dbi.r-dbi.org/reference/dbFetch.md),
[`dbGetInfo()`](https://dbi.r-dbi.org/reference/dbGetInfo.md),
[`dbGetRowCount()`](https://dbi.r-dbi.org/reference/dbGetRowCount.md),
[`dbGetRowsAffected()`](https://dbi.r-dbi.org/reference/dbGetRowsAffected.md),
[`dbGetStatement()`](https://dbi.r-dbi.org/reference/dbGetStatement.md),
[`dbHasCompleted()`](https://dbi.r-dbi.org/reference/dbHasCompleted.md),
[`dbIsValid()`](https://dbi.r-dbi.org/reference/dbIsValid.md),
[`dbQuoteLiteral()`](https://dbi.r-dbi.org/reference/dbQuoteLiteral.md),
[`dbQuoteString()`](https://dbi.r-dbi.org/reference/dbQuoteString.md)

Other DBIConnector generics:
[`DBIConnector-class`](https://dbi.r-dbi.org/reference/DBIConnector-class.md),
[`dbConnect()`](https://dbi.r-dbi.org/reference/dbConnect.md),
[`dbDataType()`](https://dbi.r-dbi.org/reference/dbDataType.md),
[`dbGetConnectArgs()`](https://dbi.r-dbi.org/reference/dbGetConnectArgs.md)

## Examples

``` r
dbIsReadOnly(ANSI())
#> [1] FALSE
```
