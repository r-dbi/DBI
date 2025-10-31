# Quote literal strings

Call this method to generate a string that is suitable for use in a
query as a string literal, to make sure that you generate valid SQL and
protect against SQL injection attacks.

### Methods in other packages

This documentation page describes the generics. Refer to the
documentation pages linked below for the documentation for the methods
that are implemented in various backend packages.

- [`adbi::dbQuoteString("AdbiConnection", "character")`](https://adbi.r-dbi.org/reference/AdbiConnection-class.html)

- [`adbi::dbQuoteString("AdbiConnection", "SQL")`](https://adbi.r-dbi.org/reference/AdbiConnection-class.html)

- [`bigrquery::dbQuoteString("BigQueryConnection", "character")`](https://bigrquery.r-dbi.org/reference/DBI.html)

- [`bigrquery::dbQuoteString("BigQueryConnection", "SQL")`](https://bigrquery.r-dbi.org/reference/DBI.html)

- `DatabaseConnector::dbQuoteString("DatabaseConnectorConnection", "character")`

- [`dittodb::dbQuoteString("DBIMockMariaDBConnection", "character")`](https://dittodb.jonkeane.com/reference/mock-db-methods.html)

- [`dittodb::dbQuoteString("DBIMockMariaDBConnection", "SQL")`](https://dittodb.jonkeane.com/reference/mock-db-methods.html)

- [`dittodb::dbQuoteString("DBIMockRPostgresConnection", "character")`](https://dittodb.jonkeane.com/reference/mock-db-methods.html)

- [`dittodb::dbQuoteString("DBIMockRPostgresConnection", "SQL")`](https://dittodb.jonkeane.com/reference/mock-db-methods.html)

- [`odbc::dbQuoteString("Hive", "character")`](https://odbc.r-dbi.org/reference/DBI-methods.html)

- [`pool::dbQuoteString("Pool", "ANY")`](http://rstudio.github.io/pool/reference/DBI-wrap.md)

- [`RAthena::dbQuoteString("AthenaConnection", "character")`](https://dyfanjones.github.io/RAthena/reference/AthenaConnection.html)

- [`RAthena::dbQuoteString("AthenaConnection", "Date")`](https://dyfanjones.github.io/RAthena/reference/AthenaConnection.html)

- [`RAthena::dbQuoteString("AthenaConnection", "POSIXct")`](https://dyfanjones.github.io/RAthena/reference/AthenaConnection.html)

- [`RMariaDB::dbQuoteString("MariaDBConnection", "character")`](https://rmariadb.r-dbi.org/reference/mariadb-quoting.html)

- [`RMariaDB::dbQuoteString("MariaDBConnection", "SQL")`](https://rmariadb.r-dbi.org/reference/mariadb-quoting.html)

- `RMySQL::dbQuoteString("MySQLConnection", "character")`

- `RMySQL::dbQuoteString("MySQLConnection", "SQL")`

- [`RPostgres::dbQuoteString("PqConnection", "character")`](https://rpostgres.r-dbi.org/reference/quote.html)

- [`RPostgres::dbQuoteString("PqConnection", "SQL")`](https://rpostgres.r-dbi.org/reference/quote.html)

- `sparklyr::dbQuoteString("spark_connection", "character")`

## Usage

``` r
dbQuoteString(conn, x, ...)
```

## Arguments

- conn:

  A
  [DBI::DBIConnection](https://dbi.r-dbi.org/dev/reference/DBIConnection-class.md)
  object, as returned by
  [`dbConnect()`](https://dbi.r-dbi.org/dev/reference/dbConnect.md).

- x:

  A character vector to quote as string.

- ...:

  Other arguments passed on to methods.

## Value

`dbQuoteString()` returns an object that can be coerced to
[character](https://rdrr.io/r/base/character.html), of the same length
as the input. For an empty character vector this function returns a
length-0 object.

When passing the returned object again to `dbQuoteString()` as `x`
argument, it is returned unchanged. Passing objects of class
[DBI::SQL](https://dbi.r-dbi.org/dev/reference/SQL.md) should also
return them unchanged. (For backends it may be most convenient to return
[DBI::SQL](https://dbi.r-dbi.org/dev/reference/SQL.md) objects to
achieve this behavior, but this is not required.)

## Failure modes

Passing a numeric, integer, logical, or raw vector, or a list for the
`x` argument raises an error.

## Specification

The returned expression can be used in a `SELECT ...` query, and for any
scalar character `x` the value of
`dbGetQuery(paste0("SELECT ", dbQuoteString(x)))[[1]]` must be identical
to `x`, even if `x` contains spaces, tabs, quotes (single or double),
backticks, or newlines (in any combination) or is itself the result of a
`dbQuoteString()` call coerced back to character (even repeatedly). If
`x` is `NA`, the result must merely satisfy
[`is.na()`](https://rdrr.io/r/base/NA.html). The strings `"NA"` or
`"NULL"` are not treated specially.

`NA` should be translated to an unquoted SQL `NULL`, so that the query
`SELECT * FROM (SELECT 1) a WHERE ... IS NULL` returns one row.

## See also

Other DBIResult generics:
[`DBIResult-class`](https://dbi.r-dbi.org/dev/reference/DBIResult-class.md),
[`dbBind()`](https://dbi.r-dbi.org/dev/reference/dbBind.md),
[`dbClearResult()`](https://dbi.r-dbi.org/dev/reference/dbClearResult.md),
[`dbColumnInfo()`](https://dbi.r-dbi.org/dev/reference/dbColumnInfo.md),
[`dbFetch()`](https://dbi.r-dbi.org/dev/reference/dbFetch.md),
[`dbGetInfo()`](https://dbi.r-dbi.org/dev/reference/dbGetInfo.md),
[`dbGetRowCount()`](https://dbi.r-dbi.org/dev/reference/dbGetRowCount.md),
[`dbGetRowsAffected()`](https://dbi.r-dbi.org/dev/reference/dbGetRowsAffected.md),
[`dbGetStatement()`](https://dbi.r-dbi.org/dev/reference/dbGetStatement.md),
[`dbHasCompleted()`](https://dbi.r-dbi.org/dev/reference/dbHasCompleted.md),
[`dbIsReadOnly()`](https://dbi.r-dbi.org/dev/reference/dbIsReadOnly.md),
[`dbIsValid()`](https://dbi.r-dbi.org/dev/reference/dbIsValid.md),
[`dbQuoteLiteral()`](https://dbi.r-dbi.org/dev/reference/dbQuoteLiteral.md)

## Examples

``` r
# Quoting ensures that arbitrary input is safe for use in a query
name <- "Robert'); DROP TABLE Students;--"
dbQuoteString(ANSI(), name)
#> <SQL> 'Robert''); DROP TABLE Students;--'

# NAs become NULL
dbQuoteString(ANSI(), c("x", NA))
#> <SQL> 'x'
#> <SQL> NULL

# SQL vectors are always passed through as is
var_name <- SQL("select")
var_name
#> <SQL> select
dbQuoteString(ANSI(), var_name)
#> <SQL> select

# This mechanism is used to prevent double escaping
dbQuoteString(ANSI(), dbQuoteString(ANSI(), name))
#> <SQL> 'Robert''); DROP TABLE Students;--'
```
