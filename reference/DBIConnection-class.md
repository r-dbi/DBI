# DBIConnection class

This virtual class encapsulates the connection to a DBMS, and it
provides access to dynamic queries, result sets, DBMS session management
(transactions), etc.

## Implementation note

Individual drivers are free to implement single or multiple simultaneous
connections.

## See also

Other DBI classes:
[`DBIConnector-class`](https://dbi.r-dbi.org/reference/DBIConnector-class.md),
[`DBIDriver-class`](https://dbi.r-dbi.org/reference/DBIDriver-class.md),
[`DBIObject-class`](https://dbi.r-dbi.org/reference/DBIObject-class.md),
[`DBIResult-class`](https://dbi.r-dbi.org/reference/DBIResult-class.md),
[`DBIResultArrow-class`](https://dbi.r-dbi.org/reference/DBIResultArrow-class.md)

Other DBIConnection generics:
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

## Examples

``` r
con <- dbConnect(RSQLite::SQLite(), ":memory:")
con
#> <SQLiteConnection>
#>   Path: :memory:
#>   Extensions: TRUE
dbDisconnect(con)
if (FALSE) { # \dontrun{
con <- dbConnect(RPostgreSQL::PostgreSQL(), "username", "password")
con
dbDisconnect(con)
} # }
```
