# Execute a data manipulation statement on a given database connection

The `dbSendStatement()` method only submits and synchronously executes
the SQL data manipulation statement (e.g., `UPDATE`, `DELETE`,
`INSERT INTO`, `DROP TABLE`, ...) to the database engine. To query the
number of affected rows, call
[`dbGetRowsAffected()`](https://dbi.r-dbi.org/dev/reference/dbGetRowsAffected.md)
on the returned result object. You must also call
[`dbClearResult()`](https://dbi.r-dbi.org/dev/reference/dbClearResult.md)
after that. For interactive use, you should almost always prefer
[`dbExecute()`](https://dbi.r-dbi.org/dev/reference/dbExecute.md).

### Methods in other packages

This documentation page describes the generics. Refer to the
documentation pages linked below for the documentation for the methods
that are implemented in various backend packages.

- [`adbi::dbSendStatement("AdbiConnection", "character")`](https://adbi.r-dbi.org/reference/dbSendQuery.html)

- [`AzureKusto::dbSendStatement("AzureKustoConnection", "character")`](https://rdrr.io/pkg/AzureKusto/man/DBI_query.html)

- [`DatabaseConnector::dbSendStatement("DatabaseConnectorConnection", "character")`](https://ohdsi.github.io/DatabaseConnector/reference/dbSendStatement-DatabaseConnectorConnection-character-method.html)

- [`dittodb::dbSendStatement("DBIMockConnection", "character")`](https://dittodb.jonkeane.com/reference/mock-db-methods.html)

- [`odbc::dbSendStatement("OdbcConnection", "character")`](https://odbc.r-dbi.org/reference/OdbcConnection.html)

- [`pool::dbSendStatement("Pool", "ANY")`](http://rstudio.github.io/pool/reference/DBI-custom.md)

- [`RAthena::dbSendStatement("AthenaConnection", "character")`](https://dyfanjones.github.io/RAthena/reference/AthenaConnection.html)

- [`RMariaDB::dbSendStatement("MariaDBConnection", "character")`](https://rmariadb.r-dbi.org/reference/query.html)

- `sparklyr::dbSendStatement("spark_connection", "ANY")`

## Usage

``` r
dbSendStatement(conn, statement, ...)
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

`dbSendStatement()` returns an S4 object that inherits from
[DBI::DBIResult](https://dbi.r-dbi.org/dev/reference/DBIResult-class.md).
The result set can be used with
[`DBI::dbGetRowsAffected()`](https://dbi.r-dbi.org/dev/reference/dbGetRowsAffected.md)
to determine the number of rows affected by the query. Once you have
finished using a result, make sure to clear it with
[`DBI::dbClearResult()`](https://dbi.r-dbi.org/dev/reference/dbClearResult.md).

## Details

`dbSendStatement()` comes with a default implementation that simply
forwards to
[`dbSendQuery()`](https://dbi.r-dbi.org/dev/reference/dbSendQuery.md),
to support backends that only implement the latter.

## The command execution flow

This section gives a complete overview over the flow for the execution
of SQL statements that have side effects such as stored procedures,
inserting or deleting data, or setting database or connection options.
Most of this flow, except repeated calling of
[`dbBindArrow()`](https://dbi.r-dbi.org/dev/reference/dbBind.md), is
implemented by
[`dbExecute()`](https://dbi.r-dbi.org/dev/reference/dbExecute.md), which
should be sufficient for non-parameterized queries. This flow requires
an active connection established by
[`dbConnect()`](https://dbi.r-dbi.org/dev/reference/dbConnect.md). See
also `vignette("dbi-advanced")` for a walkthrough.

1.  Use `dbSendStatement()` to create a result set object of class
    [DBIResult](https://dbi.r-dbi.org/dev/reference/DBIResult-class.md).
    For some queries you need to pass `immediate = TRUE`.

2.  Optionally, bind query parameters
    with[`dbBind()`](https://dbi.r-dbi.org/dev/reference/dbBind.md) or
    [`dbBindArrow()`](https://dbi.r-dbi.org/dev/reference/dbBind.md).
    This is required only if the query contains placeholders such as `?`
    or `$1`, depending on the database backend.

3.  Optionally, use
    [`dbGetRowsAffected()`](https://dbi.r-dbi.org/dev/reference/dbGetRowsAffected.md)
    to retrieve the number of rows affected by the query.

4.  Repeat the last two steps as necessary.

5.  Use
    [`dbClearResult()`](https://dbi.r-dbi.org/dev/reference/dbClearResult.md)
    to clean up the result set object. This step is mandatory even if no
    rows have been fetched or if an error has occurred during the
    processing. It is good practice to use
    [`on.exit()`](https://rdrr.io/r/base/on.exit.html) or
    [`withr::defer()`](https://withr.r-lib.org/reference/defer.html) to
    ensure that this step is always executed.

## Failure modes

An error is raised when issuing a statement over a closed or invalid
connection, or if the statement is not a non-`NA` string. An error is
also raised if the syntax of the query is invalid and all query
parameters are given (by passing the `params` argument) or the
`immediate` argument is set to `TRUE`.

## Additional arguments

The following arguments are not part of the `dbSendStatement()` generic
(to improve compatibility across backends) but are part of the DBI
specification:

- `params` (default: `NULL`)

- `immediate` (default: `NULL`)

They must be provided as named arguments. See the "Specification"
sections for details on their usage.

## Specification

No warnings occur under normal conditions. When done, the DBIResult
object must be cleared with a call to
[`DBI::dbClearResult()`](https://dbi.r-dbi.org/dev/reference/dbClearResult.md).
Failure to clear the result set leads to a warning when the connection
is closed. If the backend supports only one open result set per
connection, issuing a second query invalidates an already open result
set and raises a warning. The newly opened result set is valid and must
be cleared with
[`dbClearResult()`](https://dbi.r-dbi.org/dev/reference/dbClearResult.md).

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
[`dbUnquoteIdentifier()`](https://dbi.r-dbi.org/dev/reference/dbUnquoteIdentifier.md),
[`dbWriteTable()`](https://dbi.r-dbi.org/dev/reference/dbWriteTable.md),
[`dbWriteTableArrow()`](https://dbi.r-dbi.org/dev/reference/dbWriteTableArrow.md)

Other command execution generics:
[`dbBind()`](https://dbi.r-dbi.org/dev/reference/dbBind.md),
[`dbClearResult()`](https://dbi.r-dbi.org/dev/reference/dbClearResult.md),
[`dbExecute()`](https://dbi.r-dbi.org/dev/reference/dbExecute.md),
[`dbGetRowsAffected()`](https://dbi.r-dbi.org/dev/reference/dbGetRowsAffected.md)

## Examples

``` r
con <- dbConnect(RSQLite::SQLite(), ":memory:")

dbWriteTable(con, "cars", head(cars, 3))

rs <- dbSendStatement(
  con,
  "INSERT INTO cars (speed, dist) VALUES (1, 1), (2, 2), (3, 3)"
)
dbHasCompleted(rs)
#> [1] TRUE
dbGetRowsAffected(rs)
#> [1] 3
dbClearResult(rs)
dbReadTable(con, "cars")   # there are now 6 rows
#>   speed dist
#> 1     4    2
#> 2     4   10
#> 3     7    4
#> 4     1    1
#> 5     2    2
#> 6     3    3

# Pass one set of values directly using the param argument:
rs <- dbSendStatement(
  con,
  "INSERT INTO cars (speed, dist) VALUES (?, ?)",
  params = list(4L, 5L)
)
dbClearResult(rs)

# Pass multiple sets of values using dbBind():
rs <- dbSendStatement(
  con,
  "INSERT INTO cars (speed, dist) VALUES (?, ?)"
)
dbBind(rs, list(5:6, 6:7))
dbBind(rs, list(7L, 8L))
dbClearResult(rs)
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
