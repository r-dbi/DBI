# Quote literal values

Call these methods to generate a string that is suitable for use in a
query as a literal value of the correct type, to make sure that you
generate valid SQL and protect against SQL injection attacks.

### Methods in other packages

This documentation page describes the generics. Refer to the
documentation pages linked below for the documentation for the methods
that are implemented in various backend packages.

- [`adbi::dbQuoteLiteral("AdbiConnection", "character")`](https://adbi.r-dbi.org/reference/AdbiConnection-class.html)

- [`bigrquery::dbQuoteLiteral("BigQueryConnection", "logical")`](https://bigrquery.r-dbi.org/reference/DBI.html)

- `duckdb::dbQuoteLiteral("duckdb_connection", "ANY")`

- `pool::dbQuoteLiteral("Pool", "ANY")`

- `RMariaDB::dbQuoteLiteral("MariaDBConnection", "ANY")`

- `RMariaDB::dbQuoteLiteral("MySQLConnection", "ANY")`

- `RPostgres::dbQuoteLiteral("PqConnection", "ANY")`

- `RPresto::dbQuoteLiteral("PrestoConnection", "ANY")`

- `sparklyr::dbQuoteLiteral("spark_connection", "ANY")`

## Usage

``` r
dbQuoteLiteral(conn, x, ...)
```

## Arguments

- conn:

  A
  [DBI::DBIConnection](https://dbi.r-dbi.org/dev/reference/DBIConnection-class.md)
  object, as returned by
  [`dbConnect()`](https://dbi.r-dbi.org/dev/reference/dbConnect.md).

- x:

  A vector to quote as string.

- ...:

  Other arguments passed on to methods.

## Value

`dbQuoteLiteral()` returns an object that can be coerced to
[character](https://rdrr.io/r/base/character.html), of the same length
as the input. For an empty integer, numeric, character, logical, date,
time, or blob vector, this function returns a length-0 object.

When passing the returned object again to `dbQuoteLiteral()` as `x`
argument, it is returned unchanged. Passing objects of class
[DBI::SQL](https://dbi.r-dbi.org/dev/reference/SQL.md) should also
return them unchanged. (For backends it may be most convenient to return
[DBI::SQL](https://dbi.r-dbi.org/dev/reference/SQL.md) objects to
achieve this behavior, but this is not required.)

## Failure modes

Passing a list for the `x` argument raises an error.

## Specification

The returned expression can be used in a `SELECT ...` query, and the
value of `dbGetQuery(paste0("SELECT ", dbQuoteLiteral(x)))[[1]]` must be
equal to `x` for any scalar integer, numeric, string, and logical. If
`x` is `NA`, the result must merely satisfy
[`is.na()`](https://rdrr.io/r/base/NA.html). The literals `"NA"` or
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
[`dbQuoteString()`](https://dbi.r-dbi.org/dev/reference/dbQuoteString.md)

## Examples

``` r
# Quoting ensures that arbitrary input is safe for use in a query
name <- "Robert'); DROP TABLE Students;--"
dbQuoteLiteral(ANSI(), name)
#> <SQL> 'Robert''); DROP TABLE Students;--'

# NAs become NULL
dbQuoteLiteral(ANSI(), c(1:3, NA))
#> <SQL> 1
#> <SQL> 2
#> <SQL> 3
#> <SQL> NULL

# Logicals become integers by default
dbQuoteLiteral(ANSI(), c(TRUE, FALSE, NA))
#> <SQL> 1
#> <SQL> 0
#> <SQL> NULL

# Raw vectors become hex strings by default
dbQuoteLiteral(ANSI(), list(as.raw(1:3), NULL))
#> <SQL> X'010203'
#> <SQL> NULL

# SQL vectors are always passed through as is
var_name <- SQL("select")
var_name
#> <SQL> select
dbQuoteLiteral(ANSI(), var_name)
#> <SQL> select

# This mechanism is used to prevent double escaping
dbQuoteLiteral(ANSI(), dbQuoteLiteral(ANSI(), name))
#> <SQL> 'Robert''); DROP TABLE Students;--'
```
