# Execute a query on a given database connection for retrieval via Arrow

**\[experimental\]**

The `dbSendQueryArrow()` method only submits and synchronously executes
the SQL query to the database engine. It does *not* extract any records
— for that you need to use the
[`dbFetchArrow()`](https://dbi.r-dbi.org/dev/reference/dbFetchArrow.md)
method, and then you must call
[`dbClearResult()`](https://dbi.r-dbi.org/dev/reference/dbClearResult.md)
when you finish fetching the records you need. For interactive use, you
should almost always prefer
[`dbGetQueryArrow()`](https://dbi.r-dbi.org/dev/reference/dbGetQueryArrow.md).
Use
[`dbSendQuery()`](https://dbi.r-dbi.org/dev/reference/dbSendQuery.md) or
[`dbGetQuery()`](https://dbi.r-dbi.org/dev/reference/dbGetQuery.md)
instead to retrieve the results as a data frame.

### Methods in other packages

This documentation page describes the generics. Refer to the
documentation pages linked below for the documentation for the methods
that are implemented in various backend packages.

- [`adbi::dbSendQueryArrow("AdbiConnection")`](https://adbi.r-dbi.org/reference/dbSendQuery.html)

- [`pool::dbSendQueryArrow("Pool")`](http://rstudio.github.io/pool/reference/DBI-wrap.md)

## Usage

``` r
dbSendQueryArrow(conn, statement, ...)
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

`dbSendQueryArrow()` returns an S4 object that inherits from
[DBI::DBIResultArrow](https://dbi.r-dbi.org/dev/reference/DBIResultArrow-class.md).
The result set can be used with
[`DBI::dbFetchArrow()`](https://dbi.r-dbi.org/dev/reference/dbFetchArrow.md)
to extract records. Once you have finished using a result, make sure to
clear it with
[`DBI::dbClearResult()`](https://dbi.r-dbi.org/dev/reference/dbClearResult.md).

## Details

This method is for `SELECT` queries only. Some backends may support data
manipulation queries through this method for compatibility reasons.
However, callers are strongly encouraged to use
[`dbSendStatement()`](https://dbi.r-dbi.org/dev/reference/dbSendStatement.md)
for data manipulation statements.

## The data retrieval flow for Arrow streams

This section gives a complete overview over the flow for the execution
of queries that return tabular data as an Arrow stream.

Most of this flow, except repeated calling of
[`dbBindArrow()`](https://dbi.r-dbi.org/dev/reference/dbBind.md) or
[`dbBind()`](https://dbi.r-dbi.org/dev/reference/dbBind.md), is
implemented by
[`dbGetQueryArrow()`](https://dbi.r-dbi.org/dev/reference/dbGetQueryArrow.md),
which should be sufficient unless you have a parameterized query that
you want to reuse. This flow requires an active connection established
by [`dbConnect()`](https://dbi.r-dbi.org/dev/reference/dbConnect.md).
See also `vignette("dbi-advanced")` for a walkthrough.

1.  Use `dbSendQueryArrow()` to create a result set object of class
    [DBIResultArrow](https://dbi.r-dbi.org/dev/reference/DBIResultArrow-class.md).

2.  Optionally, bind query parameters with
    [`dbBindArrow()`](https://dbi.r-dbi.org/dev/reference/dbBind.md) or
    [`dbBind()`](https://dbi.r-dbi.org/dev/reference/dbBind.md). This is
    required only if the query contains placeholders such as `?` or
    `$1`, depending on the database backend.

3.  Use
    [`dbFetchArrow()`](https://dbi.r-dbi.org/dev/reference/dbFetchArrow.md)
    to get a data stream.

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

An error is raised when issuing a query over a closed or invalid
connection, or if the query is not a non-`NA` string. An error is also
raised if the syntax of the query is invalid and all query parameters
are given (by passing the `params` argument) or the `immediate` argument
is set to `TRUE`.

## Additional arguments

The following arguments are not part of the `dbSendQueryArrow()` generic
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
is closed.

If the backend supports only one open result set per connection, issuing
a second query invalidates an already open result set and raises a
warning. The newly opened result set is valid and must be cleared with
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

For updates:
[`dbSendStatement()`](https://dbi.r-dbi.org/dev/reference/dbSendStatement.md)
and [`dbExecute()`](https://dbi.r-dbi.org/dev/reference/dbExecute.md).

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
[`dbSendStatement()`](https://dbi.r-dbi.org/dev/reference/dbSendStatement.md),
[`dbUnquoteIdentifier()`](https://dbi.r-dbi.org/dev/reference/dbUnquoteIdentifier.md),
[`dbWriteTable()`](https://dbi.r-dbi.org/dev/reference/dbWriteTable.md),
[`dbWriteTableArrow()`](https://dbi.r-dbi.org/dev/reference/dbWriteTableArrow.md)

Other data retrieval generics:
[`dbBind()`](https://dbi.r-dbi.org/dev/reference/dbBind.md),
[`dbClearResult()`](https://dbi.r-dbi.org/dev/reference/dbClearResult.md),
[`dbFetch()`](https://dbi.r-dbi.org/dev/reference/dbFetch.md),
[`dbFetchArrow()`](https://dbi.r-dbi.org/dev/reference/dbFetchArrow.md),
[`dbFetchArrowChunk()`](https://dbi.r-dbi.org/dev/reference/dbFetchArrowChunk.md),
[`dbGetQuery()`](https://dbi.r-dbi.org/dev/reference/dbGetQuery.md),
[`dbGetQueryArrow()`](https://dbi.r-dbi.org/dev/reference/dbGetQueryArrow.md),
[`dbHasCompleted()`](https://dbi.r-dbi.org/dev/reference/dbHasCompleted.md),
[`dbSendQuery()`](https://dbi.r-dbi.org/dev/reference/dbSendQuery.md)

## Examples

``` r
# Retrieve data as arrow table
con <- dbConnect(RSQLite::SQLite(), ":memory:")

dbWriteTable(con, "mtcars", mtcars)
rs <- dbSendQueryArrow(con, "SELECT * FROM mtcars WHERE cyl = 4")
dbFetchArrow(rs)
#> <nanoarrow_array_stream struct<mpg: double, cyl: double, disp: double, hp: double, drat: double, wt: double, qsec: double, vs: double, am: double, gear: double, carb: double>>
#>  $ get_schema:function ()  
#>  $ get_next  :function (schema = x$get_schema(), validate = TRUE)  
#>  $ release   :function ()  
dbClearResult(rs)

dbDisconnect(con)
```
