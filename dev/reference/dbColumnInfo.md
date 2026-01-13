# Information about result types

Produces a data.frame that describes the output of a query. The
data.frame should have as many rows as there are output fields in the
result set, and each column in the data.frame describes an aspect of the
result set field (field name, type, etc.)

### Methods in other packages

This documentation page describes the generics. Refer to the
documentation pages linked below for the documentation for the methods
that are implemented in various backend packages.

- [`adbi::dbColumnInfo("AdbiResult")`](https://adbi.r-dbi.org/reference/AdbiResult-class.html)

- [`adbi::dbColumnInfo("AdbiResultArrow")`](https://adbi.r-dbi.org/reference/AdbiResultArrow-class.html)

- [`AzureKusto::dbColumnInfo("AzureKustoResult")`](https://rdrr.io/pkg/AzureKusto/man/DBI_query.html)

- [`bigrquery::dbColumnInfo("BigQueryResult")`](https://bigrquery.r-dbi.org/reference/DBI.html)

- [`DatabaseConnector::dbColumnInfo("DatabaseConnectorDbiResult")`](https://ohdsi.github.io/DatabaseConnector/reference/dbColumnInfo-DatabaseConnectorDbiResult-method.html)

- [`DatabaseConnector::dbColumnInfo("DatabaseConnectorJdbcResult")`](https://ohdsi.github.io/DatabaseConnector/reference/dbColumnInfo-DatabaseConnectorJdbcResult-method.html)

- [`dittodb::dbColumnInfo("DBIMockResult")`](https://dittodb.jonkeane.com/reference/mock-db-methods.html)

- [`duckdb::dbColumnInfo("duckdb_result")`](https://r.duckdb.org/reference/duckdb_result-class.html)

- [`odbc::dbColumnInfo("OdbcResult")`](https://odbc.r-dbi.org/reference/OdbcResult.html)

- [`RAthena::dbColumnInfo("AthenaResult")`](https://dyfanjones.github.io/RAthena/reference/AthenaResult.html)

- [`RJDBC::dbColumnInfo("JDBCResult")`](https://rdrr.io/pkg/RJDBC/man/JDBCResult-methods.html)

- [`RMariaDB::dbColumnInfo("MariaDBResult")`](https://rmariadb.r-dbi.org/reference/result-meta.html)

- [`RMySQL::dbColumnInfo("MySQLConnection")`](https://r-dbi.r-universe.dev/RMySQL/reference/dbColumnInfo-MySQLConnection-method.html)

- [`RMySQL::dbColumnInfo("MySQLResult")`](https://r-dbi.r-universe.dev/RMySQL/reference/result-meta.html)

- [`RPostgres::dbColumnInfo("PqResult")`](https://rpostgres.r-dbi.org/reference/PqResult-class.html)

- [`RPostgreSQL::dbColumnInfo("PostgreSQLResult")`](https://rdrr.io/pkg/RPostgreSQL/man/dbGetInfo-methods.html)

- [`RPresto::dbColumnInfo("PrestoResult")`](https://rdrr.io/pkg/RPresto/man/PrestoResult-class.html)

- [`RSQLite::dbColumnInfo("SQLiteResult")`](https://rsqlite.r-dbi.org/reference/SQLiteResult-class.html)

- `sparklyr::dbColumnInfo("DBISparkResult")`

## Usage

``` r
dbColumnInfo(res, ...)
```

## Arguments

- res:

  An object inheriting from
  [DBI::DBIResult](https://dbi.r-dbi.org/dev/reference/DBIResult-class.md).

- ...:

  Other arguments passed on to methods.

## Value

`dbColumnInfo()` returns a data frame with at least two columns `"name"`
and `"type"` (in that order) (and optional columns that start with a
dot). The `"name"` and `"type"` columns contain the names and types of
the R columns of the data frame that is returned from
[`DBI::dbFetch()`](https://dbi.r-dbi.org/dev/reference/dbFetch.md). The
`"type"` column is of type `character` and only for information. Do not
compute on the `"type"` column, instead use `dbFetch(res, n = 0)` to
create a zero-row data frame initialized with the correct data types.

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

1.  Use
    [`dbSendQuery()`](https://dbi.r-dbi.org/dev/reference/dbSendQuery.md)
    to create a result set object of class
    [DBIResult](https://dbi.r-dbi.org/dev/reference/DBIResult-class.md).

2.  Optionally, bind query parameters with
    [`dbBind()`](https://dbi.r-dbi.org/dev/reference/dbBind.md) or
    [`dbBindArrow()`](https://dbi.r-dbi.org/dev/reference/dbBind.md).
    This is required only if the query contains placeholders such as `?`
    or `$1`, depending on the database backend.

3.  Optionally, use `dbColumnInfo()` to retrieve the structure of the
    result set without retrieving actual data.

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

An attempt to query columns for a closed result set raises an error.

## Specification

A column named `row_names` is treated like any other column.

The column names are always consistent with the data returned by
[`dbFetch()`](https://dbi.r-dbi.org/dev/reference/dbFetch.md).

If the query returns unnamed columns, non-empty and non-`NA` names are
assigned.

Column names that correspond to SQL or R keywords are left unchanged.

## See also

Other DBIResult generics:
[`DBIResult-class`](https://dbi.r-dbi.org/dev/reference/DBIResult-class.md),
[`dbBind()`](https://dbi.r-dbi.org/dev/reference/dbBind.md),
[`dbClearResult()`](https://dbi.r-dbi.org/dev/reference/dbClearResult.md),
[`dbFetch()`](https://dbi.r-dbi.org/dev/reference/dbFetch.md),
[`dbGetInfo()`](https://dbi.r-dbi.org/dev/reference/dbGetInfo.md),
[`dbGetRowCount()`](https://dbi.r-dbi.org/dev/reference/dbGetRowCount.md),
[`dbGetRowsAffected()`](https://dbi.r-dbi.org/dev/reference/dbGetRowsAffected.md),
[`dbGetStatement()`](https://dbi.r-dbi.org/dev/reference/dbGetStatement.md),
[`dbHasCompleted()`](https://dbi.r-dbi.org/dev/reference/dbHasCompleted.md),
[`dbIsReadOnly()`](https://dbi.r-dbi.org/dev/reference/dbIsReadOnly.md),
[`dbIsValid()`](https://dbi.r-dbi.org/dev/reference/dbIsValid.md),
[`dbQuoteLiteral()`](https://dbi.r-dbi.org/dev/reference/dbQuoteLiteral.md),
[`dbQuoteString()`](https://dbi.r-dbi.org/dev/reference/dbQuoteString.md)

## Examples

``` r
con <- dbConnect(RSQLite::SQLite(), ":memory:")

rs <- dbSendQuery(con, "SELECT 1 AS a, 2 AS b")
dbColumnInfo(rs)
#>   name    type
#> 1    a integer
#> 2    b integer
dbFetch(rs)
#>   a b
#> 1 1 2

dbClearResult(rs)
dbDisconnect(con)
```
