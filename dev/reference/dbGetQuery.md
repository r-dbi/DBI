# Retrieve results from a query

Returns the result of a query as a data frame. `dbGetQuery()` comes with
a default implementation (which should work with most backends) that
calls
[`dbSendQuery()`](https://dbi.r-dbi.org/dev/reference/dbSendQuery.md),
then [`dbFetch()`](https://dbi.r-dbi.org/dev/reference/dbFetch.md),
ensuring that the result is always freed by
[`dbClearResult()`](https://dbi.r-dbi.org/dev/reference/dbClearResult.md).
For retrieving chunked/paged results or for passing query parameters,
see
[`dbSendQuery()`](https://dbi.r-dbi.org/dev/reference/dbSendQuery.md),
in particular the "The data retrieval flow" section. For retrieving
results as an Arrow object, see
[`dbGetQueryArrow()`](https://dbi.r-dbi.org/dev/reference/dbGetQueryArrow.md).

### Methods in other packages

This documentation page describes the generics. Refer to the
documentation pages linked below for the documentation for the methods
that are implemented in various backend packages.

- [`AzureKusto::dbGetQuery("AzureKustoConnection", "character")`](https://rdrr.io/pkg/AzureKusto/man/DBI_query.html)

- [`DatabaseConnector::dbGetQuery("DatabaseConnectorDbiConnection", "character")`](https://ohdsi.github.io/DatabaseConnector/reference/dbGetQuery-DatabaseConnectorDbiConnection-character-method.html)

- [`DatabaseConnector::dbGetQuery("DatabaseConnectorJdbcConnection", "character")`](https://ohdsi.github.io/DatabaseConnector/reference/dbGetQuery-DatabaseConnectorJdbcConnection-character-method.html)

- [`dittodb::dbGetQuery("DBIMockRPostgreSQLConnection", "character")`](https://dittodb.jonkeane.com/reference/mock-db-methods.html)

- [`implyr::dbGetQuery("src_impala", "character")`](https://rdrr.io/pkg/implyr/man/dbGetQuery-src_impala-character-method.html)

- [`odbc::dbGetQuery("OdbcConnection", "character")`](https://odbc.r-dbi.org/reference/OdbcConnection.html)

- [`pool::dbGetQuery("Pool", "ANY")`](http://rstudio.github.io/pool/reference/DBI-wrap.md)

- [`RAthena::dbGetQuery("AthenaConnection", "character")`](https://dyfanjones.github.io/RAthena/reference/AthenaConnection.html)

- [`RH2::dbGetQuery("H2Connection", "character")`](https://rdrr.io/pkg/RH2/man/H2Connection-methods.html)

- [`RJDBC::dbGetQuery("JDBCConnection", "character")`](https://rdrr.io/pkg/RJDBC/man/JDBCConnection-methods.html)

- [`RPostgreSQL::dbGetQuery("PostgreSQLConnection", "character")`](https://rdrr.io/pkg/RPostgreSQL/man/dbSendQuery-methods.html)

- [`RPresto::dbGetQuery("PrestoConnection", "character")`](https://rdrr.io/pkg/RPresto/man/PrestoConnection-class.html)

- `sparklyr::dbGetQuery("spark_connection", "ANY")`

## Usage

``` r
dbGetQuery(conn, statement, ...)
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

`dbGetQuery()` always returns a
[data.frame](https://rdrr.io/r/base/data.frame.html), with as many rows
as records were fetched and as many columns as fields in the result set,
even if the result is a single value or has one or zero rows.

## Details

This method is for `SELECT` queries only (incl. other SQL statements
that return a `SELECT`-alike result, e.g., execution of a stored
procedure or data manipulation queries like
`INSERT INTO ... RETURNING ...`). To execute a stored procedure that
does not return a result set, use
[`dbExecute()`](https://dbi.r-dbi.org/dev/reference/dbExecute.md).

Some backends may support data manipulation statements through this
method for compatibility reasons. However, callers are strongly advised
to use [`dbExecute()`](https://dbi.r-dbi.org/dev/reference/dbExecute.md)
for data manipulation statements.

## Implementation notes

Subclasses should override this method only if they provide some sort of
performance optimization.

## Failure modes

An error is raised when issuing a query over a closed or invalid
connection, if the syntax of the query is invalid, or if the query is
not a non-`NA` string. If the `n` argument is not an atomic whole number
greater or equal to -1 or Inf, an error is raised, but a subsequent call
to `dbGetQuery()` with proper `n` argument succeeds.

## Additional arguments

The following arguments are not part of the `dbGetQuery()` generic (to
improve compatibility across backends) but are part of the DBI
specification:

- `n` (default: -1)

- `params` (default: `NULL`)

- `immediate` (default: `NULL`)

They must be provided as named arguments. See the "Specification" and
"Value" sections for details on their usage.

## Specification

A column named `row_names` is treated like any other column.

The `n` argument specifies the number of rows to be fetched. If omitted,
fetching multi-row queries with one or more columns returns the entire
result. A value of [Inf](https://rdrr.io/r/base/is.finite.html) for the
`n` argument is supported and also returns the full result. If more rows
than available are fetched (by passing a too large value for `n`), the
result is returned in full without warning. If zero rows are requested,
the columns of the data frame are still fully typed. Fetching fewer rows
than available is permitted, no warning is issued.

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

Other data retrieval generics:
[`dbBind()`](https://dbi.r-dbi.org/dev/reference/dbBind.md),
[`dbClearResult()`](https://dbi.r-dbi.org/dev/reference/dbClearResult.md),
[`dbFetch()`](https://dbi.r-dbi.org/dev/reference/dbFetch.md),
[`dbFetchArrow()`](https://dbi.r-dbi.org/dev/reference/dbFetchArrow.md),
[`dbFetchArrowChunk()`](https://dbi.r-dbi.org/dev/reference/dbFetchArrowChunk.md),
[`dbGetQueryArrow()`](https://dbi.r-dbi.org/dev/reference/dbGetQueryArrow.md),
[`dbHasCompleted()`](https://dbi.r-dbi.org/dev/reference/dbHasCompleted.md),
[`dbSendQuery()`](https://dbi.r-dbi.org/dev/reference/dbSendQuery.md),
[`dbSendQueryArrow()`](https://dbi.r-dbi.org/dev/reference/dbSendQueryArrow.md)

## Examples

``` r
con <- dbConnect(RSQLite::SQLite(), ":memory:")

dbWriteTable(con, "mtcars", mtcars)
dbGetQuery(con, "SELECT * FROM mtcars")
#>     mpg cyl  disp  hp drat    wt  qsec vs am gear carb
#> 1  21.0   6 160.0 110 3.90 2.620 16.46  0  1    4    4
#> 2  21.0   6 160.0 110 3.90 2.875 17.02  0  1    4    4
#> 3  22.8   4 108.0  93 3.85 2.320 18.61  1  1    4    1
#> 4  21.4   6 258.0 110 3.08 3.215 19.44  1  0    3    1
#> 5  18.7   8 360.0 175 3.15 3.440 17.02  0  0    3    2
#> 6  18.1   6 225.0 105 2.76 3.460 20.22  1  0    3    1
#> 7  14.3   8 360.0 245 3.21 3.570 15.84  0  0    3    4
#> 8  24.4   4 146.7  62 3.69 3.190 20.00  1  0    4    2
#> 9  22.8   4 140.8  95 3.92 3.150 22.90  1  0    4    2
#> 10 19.2   6 167.6 123 3.92 3.440 18.30  1  0    4    4
#> 11 17.8   6 167.6 123 3.92 3.440 18.90  1  0    4    4
#> 12 16.4   8 275.8 180 3.07 4.070 17.40  0  0    3    3
#> 13 17.3   8 275.8 180 3.07 3.730 17.60  0  0    3    3
#> 14 15.2   8 275.8 180 3.07 3.780 18.00  0  0    3    3
#> 15 10.4   8 472.0 205 2.93 5.250 17.98  0  0    3    4
#> 16 10.4   8 460.0 215 3.00 5.424 17.82  0  0    3    4
#> 17 14.7   8 440.0 230 3.23 5.345 17.42  0  0    3    4
#> 18 32.4   4  78.7  66 4.08 2.200 19.47  1  1    4    1
#> 19 30.4   4  75.7  52 4.93 1.615 18.52  1  1    4    2
#> 20 33.9   4  71.1  65 4.22 1.835 19.90  1  1    4    1
#> 21 21.5   4 120.1  97 3.70 2.465 20.01  1  0    3    1
#> 22 15.5   8 318.0 150 2.76 3.520 16.87  0  0    3    2
#> 23 15.2   8 304.0 150 3.15 3.435 17.30  0  0    3    2
#> 24 13.3   8 350.0 245 3.73 3.840 15.41  0  0    3    4
#> 25 19.2   8 400.0 175 3.08 3.845 17.05  0  0    3    2
#> 26 27.3   4  79.0  66 4.08 1.935 18.90  1  1    4    1
#> 27 26.0   4 120.3  91 4.43 2.140 16.70  0  1    5    2
#> 28 30.4   4  95.1 113 3.77 1.513 16.90  1  1    5    2
#> 29 15.8   8 351.0 264 4.22 3.170 14.50  0  1    5    4
#> 30 19.7   6 145.0 175 3.62 2.770 15.50  0  1    5    6
#> 31 15.0   8 301.0 335 3.54 3.570 14.60  0  1    5    8
#> 32 21.4   4 121.0 109 4.11 2.780 18.60  1  1    4    2
dbGetQuery(con, "SELECT * FROM mtcars", n = 6)
#>    mpg cyl disp  hp drat    wt  qsec vs am gear carb
#> 1 21.0   6  160 110 3.90 2.620 16.46  0  1    4    4
#> 2 21.0   6  160 110 3.90 2.875 17.02  0  1    4    4
#> 3 22.8   4  108  93 3.85 2.320 18.61  1  1    4    1
#> 4 21.4   6  258 110 3.08 3.215 19.44  1  0    3    1
#> 5 18.7   8  360 175 3.15 3.440 17.02  0  0    3    2
#> 6 18.1   6  225 105 2.76 3.460 20.22  1  0    3    1

# Pass values using the param argument:
# (This query runs eight times, once for each different
# parameter. The resulting rows are combined into a single
# data frame.)
dbGetQuery(
  con,
  "SELECT COUNT(*) FROM mtcars WHERE cyl = ?",
  params = list(1:8)
)
#>   COUNT(*)
#> 1        0
#> 2        0
#> 3        0
#> 4       11
#> 5        0
#> 6        7
#> 7        0
#> 8       14

dbDisconnect(con)
```
