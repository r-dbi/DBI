# DBIResult class

This virtual class describes the result and state of execution of a DBMS
statement (any statement, query or non-query). The result set keeps
track of whether the statement produces output how many rows were
affected by the operation, how many rows have been fetched (if statement
is a query), whether there are more rows to fetch, etc.

## Implementation notes

Individual drivers are free to allow single or multiple active results
per connection.

The default show method displays a summary of the query using other DBI
generics.

## See also

Other DBI classes:
[`DBIConnection-class`](https://dbi.r-dbi.org/reference/DBIConnection-class.md),
[`DBIConnector-class`](https://dbi.r-dbi.org/reference/DBIConnector-class.md),
[`DBIDriver-class`](https://dbi.r-dbi.org/reference/DBIDriver-class.md),
[`DBIObject-class`](https://dbi.r-dbi.org/reference/DBIObject-class.md),
[`DBIResultArrow-class`](https://dbi.r-dbi.org/reference/DBIResultArrow-class.md)

Other DBIResult generics:
[`dbBind()`](https://dbi.r-dbi.org/reference/dbBind.md),
[`dbClearResult()`](https://dbi.r-dbi.org/reference/dbClearResult.md),
[`dbColumnInfo()`](https://dbi.r-dbi.org/reference/dbColumnInfo.md),
[`dbFetch()`](https://dbi.r-dbi.org/reference/dbFetch.md),
[`dbGetInfo()`](https://dbi.r-dbi.org/reference/dbGetInfo.md),
[`dbGetRowCount()`](https://dbi.r-dbi.org/reference/dbGetRowCount.md),
[`dbGetRowsAffected()`](https://dbi.r-dbi.org/reference/dbGetRowsAffected.md),
[`dbGetStatement()`](https://dbi.r-dbi.org/reference/dbGetStatement.md),
[`dbHasCompleted()`](https://dbi.r-dbi.org/reference/dbHasCompleted.md),
[`dbIsReadOnly()`](https://dbi.r-dbi.org/reference/dbIsReadOnly.md),
[`dbIsValid()`](https://dbi.r-dbi.org/reference/dbIsValid.md),
[`dbQuoteLiteral()`](https://dbi.r-dbi.org/reference/dbQuoteLiteral.md),
[`dbQuoteString()`](https://dbi.r-dbi.org/reference/dbQuoteString.md)
