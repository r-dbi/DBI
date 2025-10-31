# Change database state

Executes a statement and returns the number of rows affected.
`dbExecute()` comes with a default implementation (which should work
with most backends) that calls
[`dbSendStatement()`](https://dbi.r-dbi.org/dev/reference/dbSendStatement.md),
then
[`dbGetRowsAffected()`](https://dbi.r-dbi.org/dev/reference/dbGetRowsAffected.md),
ensuring that the result is always freed by
[`dbClearResult()`](https://dbi.r-dbi.org/dev/reference/dbClearResult.md).
For passing query parameters, see
[`dbBind()`](https://dbi.r-dbi.org/dev/reference/dbBind.md), in
particular the "The command execution flow" section.

### Methods in other packages

This documentation page describes the generics. Refer to the
documentation pages linked below for the documentation for the methods
that are implemented in various backend packages.

- [`AzureKusto::dbExecute("AzureKustoConnection", "character")`](https://rdrr.io/pkg/AzureKusto/man/DBI_query.html)

- [`bigrquery::dbExecute("BigQueryConnection", "character")`](https://bigrquery.r-dbi.org/reference/DBI.html)

- [`DatabaseConnector::dbExecute("DatabaseConnectorDbiConnection", "character")`](https://ohdsi.github.io/DatabaseConnector/reference/dbExecute-DatabaseConnectorDbiConnection-character-method.html)

- [`DatabaseConnector::dbExecute("DatabaseConnectorJdbcConnection", "character")`](https://ohdsi.github.io/DatabaseConnector/reference/dbExecute-DatabaseConnectorJdbcConnection-character-method.html)

- [`implyr::dbExecute("src_impala", "character")`](https://rdrr.io/pkg/implyr/man/dbExecute-src_impala-character-method.html)

- [`odbc::dbExecute("OdbcConnection", "character")`](https://odbc.r-dbi.org/reference/OdbcConnection.html)

- [`pool::dbExecute("Pool", "ANY")`](http://rstudio.github.io/pool/reference/DBI-wrap.md)

- [`RAthena::dbExecute("AthenaConnection", "character")`](https://dyfanjones.github.io/RAthena/reference/AthenaConnection.html)

- `sparklyr::dbExecute("spark_connection", "ANY")`

## Usage

``` r
dbExecute(conn, statement, ...)
```

## Arguments

- conn:

  A
  [DBI::DBIConnection](https://dbi.r-dbi.org/dev/reference/DBIConnection-class.md)
  object, as returned by
  [`dbConnect()`](https://dbi.r-dbi.org/dev/reference/dbConnect.md).

- statement:

  a character string containing SQL.

- ...:

  Other parameters passed on to methods.

## Value

`dbExecute()` always returns a scalar numeric that specifies the number
of rows affected by the statement.

## Details

You can also use `dbExecute()` to call a stored procedure that performs
data manipulation or other actions that do not return a result set. To
execute a stored procedure that returns a result set, or a data
manipulation query that also returns a result set such as
`INSERT INTO ... RETURNING ...`, use
[`dbGetQuery()`](https://dbi.r-dbi.org/dev/reference/dbGetQuery.md)
instead.

## Implementation notes

Subclasses should override this method only if they provide some sort of
performance optimization.

## Failure modes

An error is raised when issuing a statement over a closed or invalid
connection, if the syntax of the statement is invalid, or if the
statement is not a non-`NA` string.

## Additional arguments

The following arguments are not part of the `dbExecute()` generic (to
improve compatibility across backends) but are part of the DBI
specification:

- `params` (default: `NULL`)

- `immediate` (default: `NULL`)

They must be provided as named arguments. See the "Specification"
sections for details on their usage.

## Specification

The `param` argument allows passing query parameters, see
[`DBI::dbBind()`](https://dbi.r-dbi.org/dev/reference/dbBind.md) for
details.

## Specification for the `immediate` argument

The `immediate` argument supports distinguishing between "direct" and
"prepared" APIs offered by many database drivers. Passing
`immediate = TRUE` leads to immediate execution of the query or
statement, via the "direct" API (if supported by the driver). The
default `NULL` means that the backend should choose whatever API makes
the most sense for the database, and (if relevant) tries the other API
if the first attempt fails. A successful second attempt should result in
a message that suggests passing the correct `immediate` argument.
Examples for possible behaviors:

1.  DBI backend defaults to `immediate = TRUE` internally

    1.  A query without parameters is passed: query is executed

    2.  A query with parameters is passed:

        1.  `params` not given: rejected immediately by the database
            because of a syntax error in the query, the backend tries
            `immediate = FALSE` (and gives a message)

        2.  `params` given: query is executed using `immediate = FALSE`

2.  DBI backend defaults to `immediate = FALSE` internally

    1.  A query without parameters is passed:

        1.  simple query: query is executed

        2.  "special" query (such as setting a config options): fails,
            the backend tries `immediate = TRUE` (and gives a message)

    2.  A query with parameters is passed:

        1.  `params` not given: waiting for parameters via
            [`DBI::dbBind()`](https://dbi.r-dbi.org/dev/reference/dbBind.md)

        2.  `params` given: query is executed

## See also

For queries:
[`dbSendQuery()`](https://dbi.r-dbi.org/dev/reference/dbSendQuery.md)
and [`dbGetQuery()`](https://dbi.r-dbi.org/dev/reference/dbGetQuery.md).

Other DBIConnection generics:
[`DBIConnection-class`](https://dbi.r-dbi.org/dev/reference/DBIConnection-class.md),
[`dbAppendTable()`](https://dbi.r-dbi.org/dev/reference/dbAppendTable.md),
[`dbAppendTableArrow()`](https://dbi.r-dbi.org/dev/reference/dbAppendTableArrow.md),
[`dbCreateTable()`](https://dbi.r-dbi.org/dev/reference/dbCreateTable.md),
[`dbCreateTableArrow()`](https://dbi.r-dbi.org/dev/reference/dbCreateTableArrow.md),
[`dbDataType()`](https://dbi.r-dbi.org/dev/reference/dbDataType.md),
[`dbDisconnect()`](https://dbi.r-dbi.org/dev/reference/dbDisconnect.md),
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
[`dbUnquoteIdentifier()`](https://dbi.r-dbi.org/dev/reference/dbUnquoteIdentifier.md),
[`dbWriteTable()`](https://dbi.r-dbi.org/dev/reference/dbWriteTable.md),
[`dbWriteTableArrow()`](https://dbi.r-dbi.org/dev/reference/dbWriteTableArrow.md)

Other command execution generics:
[`dbBind()`](https://dbi.r-dbi.org/dev/reference/dbBind.md),
[`dbClearResult()`](https://dbi.r-dbi.org/dev/reference/dbClearResult.md),
[`dbGetRowsAffected()`](https://dbi.r-dbi.org/dev/reference/dbGetRowsAffected.md),
[`dbSendStatement()`](https://dbi.r-dbi.org/dev/reference/dbSendStatement.md)

## Examples

``` r
con <- dbConnect(RSQLite::SQLite(), ":memory:")

dbWriteTable(con, "cars", head(cars, 3))
dbReadTable(con, "cars")   # there are 3 rows
#>   speed dist
#> 1     4    2
#> 2     4   10
#> 3     7    4
dbExecute(
  con,
  "INSERT INTO cars (speed, dist) VALUES (1, 1), (2, 2), (3, 3)"
)
#> [1] 3
dbReadTable(con, "cars")   # there are now 6 rows
#>   speed dist
#> 1     4    2
#> 2     4   10
#> 3     7    4
#> 4     1    1
#> 5     2    2
#> 6     3    3

# Pass values using the param argument:
dbExecute(
  con,
  "INSERT INTO cars (speed, dist) VALUES (?, ?)",
  params = list(4:7, 5:8)
)
#> [1] 4
dbReadTable(con, "cars")   # there are now 10 rows
#>    speed dist
#> 1      4    2
#> 2      4   10
#> 3      7    4
#> 4      1    1
#> 5      2    2
#> 6      3    3
#> 7      4    5
#> 8      5    6
#> 9      6    7
#> 10     7    8

dbDisconnect(con)
```
