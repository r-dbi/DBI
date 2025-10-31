# Execute a query on a given database connection

The `dbSendQuery()` method only submits and synchronously executes the
SQL query to the database engine. It does *not* extract any records —
for that you need to use the
[`dbFetch()`](https://dbi.r-dbi.org/dev/reference/dbFetch.md) method,
and then you must call
[`dbClearResult()`](https://dbi.r-dbi.org/dev/reference/dbClearResult.md)
when you finish fetching the records you need. For interactive use, you
should almost always prefer
[`dbGetQuery()`](https://dbi.r-dbi.org/dev/reference/dbGetQuery.md). Use
[`dbSendQueryArrow()`](https://dbi.r-dbi.org/dev/reference/dbSendQueryArrow.md)
or
[`dbGetQueryArrow()`](https://dbi.r-dbi.org/dev/reference/dbGetQueryArrow.md)
instead to retrieve the results as an Arrow object.

### Methods in other packages

This documentation page describes the generics. Refer to the
documentation pages linked below for the documentation for the methods
that are implemented in various backend packages.

- [`adbi::dbSendQuery("AdbiConnection", "character")`](https://adbi.r-dbi.org/reference/dbSendQuery.html)

- `AzureKusto::dbSendQuery("AzureKustoConnection", "ANY")`

- [`bigrquery::dbSendQuery("BigQueryConnection", "character")`](https://bigrquery.r-dbi.org/reference/DBI.html)

- [`DatabaseConnector::dbSendQuery("DatabaseConnectorDbiConnection", "character")`](https://ohdsi.github.io/DatabaseConnector/reference/dbSendQuery-DatabaseConnectorDbiConnection-character-method.html)

- [`DatabaseConnector::dbSendQuery("DatabaseConnectorJdbcConnection", "character")`](https://ohdsi.github.io/DatabaseConnector/reference/dbSendQuery-DatabaseConnectorJdbcConnection-character-method.html)

- [`dittodb::dbSendQuery("DBIMockConnection", "character")`](https://dittodb.jonkeane.com/reference/mock-db-methods.html)

- [`dittodb::dbSendQuery("DBIMockConnection", "SQL")`](https://dittodb.jonkeane.com/reference/mock-db-methods.html)

- [`duckdb::dbSendQuery("duckdb_connection", "character")`](https://r.duckdb.org/reference/duckdb_connection-class.html)

- `lazysf::dbSendQuery("SFSQLConnection", "ANY")`

- [`odbc::dbSendQuery("OdbcConnection", "character")`](https://odbc.r-dbi.org/reference/OdbcConnection.html)

- `pool::dbSendQuery("Pool", "ANY")`

- [`RAthena::dbSendQuery("AthenaConnection", "character")`](https://dyfanjones.github.io/RAthena/reference/AthenaConnection.html)

- [`RH2::dbSendQuery("H2Connection", "character")`](https://rdrr.io/pkg/RH2/man/H2Connection-methods.html)

- [`RJDBC::dbSendQuery("JDBCConnection", "character")`](https://rdrr.io/pkg/RJDBC/man/JDBCConnection-methods.html)

- [`RMariaDB::dbSendQuery("MariaDBConnection", "character")`](https://rmariadb.r-dbi.org/reference/query.html)

- [`RMySQL::dbSendQuery("MySQLConnection", "character")`](https://r-dbi.r-universe.dev/RMySQL/reference/query.html)

- `RPostgres::dbSendQuery("PqConnection", "ANY")`

- [`RPostgreSQL::dbSendQuery("PostgreSQLConnection", "character")`](https://rdrr.io/pkg/RPostgreSQL/man/dbSendQuery-methods.html)

- [`RPresto::dbSendQuery("PrestoConnection", "character")`](https://rdrr.io/pkg/RPresto/man/PrestoConnection-class.html)

- [`RSQLite::dbSendQuery("SQLiteConnection", "character")`](https://rsqlite.r-dbi.org/reference/SQLiteConnection-class.html)

- `sergeant::dbSendQuery("DrillConnection", "ANY")`

- `sparklyr::dbSendQuery("spark_connection", "ANY")`

## Usage

``` r
dbSendQuery(conn, statement, ...)
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

`dbSendQuery()` returns an S4 object that inherits from
[DBI::DBIResult](https://dbi.r-dbi.org/dev/reference/DBIResult-class.md).
The result set can be used with
[`DBI::dbFetch()`](https://dbi.r-dbi.org/dev/reference/dbFetch.md) to
extract records. Once you have finished using a result, make sure to
clear it with
[`DBI::dbClearResult()`](https://dbi.r-dbi.org/dev/reference/dbClearResult.md).

## Details

This method is for `SELECT` queries only. Some backends may support data
manipulation queries through this method for compatibility reasons.
However, callers are strongly encouraged to use
[`dbSendStatement()`](https://dbi.r-dbi.org/dev/reference/dbSendStatement.md)
for data manipulation statements.

The query is submitted to the database server and the DBMS executes it,
possibly generating vast amounts of data. Where these data live is
driver-specific: some drivers may choose to leave the output on the
server and transfer them piecemeal to R, others may transfer all the
data to the client – but not necessarily to the memory that R manages.
See individual drivers' `dbSendQuery()` documentation for details.

## The data retrieval flow

This section gives a complete overview over the flow for the execution
of queries that return tabular data as data frames.

Most of this flow, except repeated calling of
[`dbBind()`](https://dbi.r-dbi.org/dev/reference/dbBind.md) or
[`dbBindArrow()`](https://dbi.r-dbi.org/dev/reference/dbBind.md), is
implemented by
[`dbGetQuery()`](https://dbi.r-dbi.org/dev/reference/dbGetQuery.md),
which should be sufficient unless you want to access the results in a
paged way or you have a parameterized query that you want to reuse. This
flow requires an active connection established by
[`dbConnect()`](https://dbi.r-dbi.org/dev/reference/dbConnect.md). See
also `vignette("dbi-advanced")` for a walkthrough.

1.  Use `dbSendQuery()` to create a result set object of class
    [DBIResult](https://dbi.r-dbi.org/dev/reference/DBIResult-class.md).

2.  Optionally, bind query parameters with
    [`dbBind()`](https://dbi.r-dbi.org/dev/reference/dbBind.md) or
    [`dbBindArrow()`](https://dbi.r-dbi.org/dev/reference/dbBind.md).
    This is required only if the query contains placeholders such as `?`
    or `$1`, depending on the database backend.

3.  Optionally, use
    [`dbColumnInfo()`](https://dbi.r-dbi.org/dev/reference/dbColumnInfo.md)
    to retrieve the structure of the result set without retrieving
    actual data.

4.  Use [`dbFetch()`](https://dbi.r-dbi.org/dev/reference/dbFetch.md) to
    get the entire result set, a page of results, or the remaining rows.
    Fetching zero rows is also possible to retrieve the structure of the
    result set as a data frame. This step can be called multiple times.
    Only forward paging is supported, you need to cache previous pages
    if you need to navigate backwards.

5.  Use
    [`dbHasCompleted()`](https://dbi.r-dbi.org/dev/reference/dbHasCompleted.md)
    to tell when you're done. This method returns `TRUE` if no more rows
    are available for fetching.

6.  Repeat the last four steps as necessary.

7.  Use
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

The following arguments are not part of the `dbSendQuery()` generic (to
improve compatibility across backends) but are part of the DBI
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
[`dbSendQueryArrow()`](https://dbi.r-dbi.org/dev/reference/dbSendQueryArrow.md),
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
[`dbSendQueryArrow()`](https://dbi.r-dbi.org/dev/reference/dbSendQueryArrow.md)

## Examples

``` r
con <- dbConnect(RSQLite::SQLite(), ":memory:")

dbWriteTable(con, "mtcars", mtcars)
rs <- dbSendQuery(con, "SELECT * FROM mtcars WHERE cyl = 4")
dbFetch(rs)
#>     mpg cyl  disp  hp drat    wt  qsec vs am gear carb
#> 1  22.8   4 108.0  93 3.85 2.320 18.61  1  1    4    1
#> 2  24.4   4 146.7  62 3.69 3.190 20.00  1  0    4    2
#> 3  22.8   4 140.8  95 3.92 3.150 22.90  1  0    4    2
#> 4  32.4   4  78.7  66 4.08 2.200 19.47  1  1    4    1
#> 5  30.4   4  75.7  52 4.93 1.615 18.52  1  1    4    2
#> 6  33.9   4  71.1  65 4.22 1.835 19.90  1  1    4    1
#> 7  21.5   4 120.1  97 3.70 2.465 20.01  1  0    3    1
#> 8  27.3   4  79.0  66 4.08 1.935 18.90  1  1    4    1
#> 9  26.0   4 120.3  91 4.43 2.140 16.70  0  1    5    2
#> 10 30.4   4  95.1 113 3.77 1.513 16.90  1  1    5    2
#> 11 21.4   4 121.0 109 4.11 2.780 18.60  1  1    4    2
dbClearResult(rs)

# Pass one set of values with the param argument:
rs <- dbSendQuery(
  con,
  "SELECT * FROM mtcars WHERE cyl = ?",
  params = list(4L)
)
dbFetch(rs)
#>     mpg cyl  disp  hp drat    wt  qsec vs am gear carb
#> 1  22.8   4 108.0  93 3.85 2.320 18.61  1  1    4    1
#> 2  24.4   4 146.7  62 3.69 3.190 20.00  1  0    4    2
#> 3  22.8   4 140.8  95 3.92 3.150 22.90  1  0    4    2
#> 4  32.4   4  78.7  66 4.08 2.200 19.47  1  1    4    1
#> 5  30.4   4  75.7  52 4.93 1.615 18.52  1  1    4    2
#> 6  33.9   4  71.1  65 4.22 1.835 19.90  1  1    4    1
#> 7  21.5   4 120.1  97 3.70 2.465 20.01  1  0    3    1
#> 8  27.3   4  79.0  66 4.08 1.935 18.90  1  1    4    1
#> 9  26.0   4 120.3  91 4.43 2.140 16.70  0  1    5    2
#> 10 30.4   4  95.1 113 3.77 1.513 16.90  1  1    5    2
#> 11 21.4   4 121.0 109 4.11 2.780 18.60  1  1    4    2
dbClearResult(rs)

# Pass multiple sets of values with dbBind():
rs <- dbSendQuery(con, "SELECT * FROM mtcars WHERE cyl = ?")
dbBind(rs, list(6L))
dbFetch(rs)
#>    mpg cyl  disp  hp drat    wt  qsec vs am gear carb
#> 1 21.0   6 160.0 110 3.90 2.620 16.46  0  1    4    4
#> 2 21.0   6 160.0 110 3.90 2.875 17.02  0  1    4    4
#> 3 21.4   6 258.0 110 3.08 3.215 19.44  1  0    3    1
#> 4 18.1   6 225.0 105 2.76 3.460 20.22  1  0    3    1
#> 5 19.2   6 167.6 123 3.92 3.440 18.30  1  0    4    4
#> 6 17.8   6 167.6 123 3.92 3.440 18.90  1  0    4    4
#> 7 19.7   6 145.0 175 3.62 2.770 15.50  0  1    5    6
dbBind(rs, list(8L))
dbFetch(rs)
#>     mpg cyl  disp  hp drat    wt  qsec vs am gear carb
#> 1  18.7   8 360.0 175 3.15 3.440 17.02  0  0    3    2
#> 2  14.3   8 360.0 245 3.21 3.570 15.84  0  0    3    4
#> 3  16.4   8 275.8 180 3.07 4.070 17.40  0  0    3    3
#> 4  17.3   8 275.8 180 3.07 3.730 17.60  0  0    3    3
#> 5  15.2   8 275.8 180 3.07 3.780 18.00  0  0    3    3
#> 6  10.4   8 472.0 205 2.93 5.250 17.98  0  0    3    4
#> 7  10.4   8 460.0 215 3.00 5.424 17.82  0  0    3    4
#> 8  14.7   8 440.0 230 3.23 5.345 17.42  0  0    3    4
#> 9  15.5   8 318.0 150 2.76 3.520 16.87  0  0    3    2
#> 10 15.2   8 304.0 150 3.15 3.435 17.30  0  0    3    2
#> 11 13.3   8 350.0 245 3.73 3.840 15.41  0  0    3    4
#> 12 19.2   8 400.0 175 3.08 3.845 17.05  0  0    3    2
#> 13 15.8   8 351.0 264 4.22 3.170 14.50  0  1    5    4
#> 14 15.0   8 301.0 335 3.54 3.570 14.60  0  1    5    8
dbClearResult(rs)

dbDisconnect(con)
```
