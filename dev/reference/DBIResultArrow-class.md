# DBIResultArrow class

**\[experimental\]**

This virtual class describes the result and state of execution of a DBMS
statement (any statement, query or non-query) for returning data as an
Arrow object.

## Implementation notes

Individual drivers are free to allow single or multiple active results
per connection.

The default show method displays a summary of the query using other DBI
generics.

## See also

Other DBI classes:
[`DBIConnection-class`](https://dbi.r-dbi.org/dev/reference/DBIConnection-class.md),
[`DBIConnector-class`](https://dbi.r-dbi.org/dev/reference/DBIConnector-class.md),
[`DBIDriver-class`](https://dbi.r-dbi.org/dev/reference/DBIDriver-class.md),
[`DBIObject-class`](https://dbi.r-dbi.org/dev/reference/DBIObject-class.md),
[`DBIResult-class`](https://dbi.r-dbi.org/dev/reference/DBIResult-class.md)

Other DBIResultArrow generics:
[`dbBind()`](https://dbi.r-dbi.org/dev/reference/dbBind.md),
[`dbClearResult()`](https://dbi.r-dbi.org/dev/reference/dbClearResult.md),
[`dbFetchArrow()`](https://dbi.r-dbi.org/dev/reference/dbFetchArrow.md),
[`dbFetchArrowChunk()`](https://dbi.r-dbi.org/dev/reference/dbFetchArrowChunk.md),
[`dbHasCompleted()`](https://dbi.r-dbi.org/dev/reference/dbHasCompleted.md),
[`dbIsValid()`](https://dbi.r-dbi.org/dev/reference/dbIsValid.md)
