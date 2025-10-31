# Safely interpolate values into an SQL string

Accepts a query string with placeholders for values, and returns a
string with the values embedded. The function is careful to quote all of
its inputs with
[`dbQuoteLiteral()`](https://dbi.r-dbi.org/dev/reference/dbQuoteLiteral.md)
to protect against SQL injection attacks.

Placeholders can be specified with one of two syntaxes:

- `?`: each occurrence of a standalone `?` is replaced with a value

- `?name1`, `?name2`, ...: values are given as named arguments or a
  named list, the names are used to match the values

Mixing `?` and [`?name`](https://rdrr.io/r/base/name.html) syntaxes is
an error. The number and names of values supplied must correspond to the
placeholders used in the query.

### Methods in other packages

This documentation page describes the generics. Refer to the
documentation pages linked below for the documentation for the methods
that are implemented in various backend packages.

- [`pool::sqlInterpolate("Pool")`](http://rstudio.github.io/pool/reference/DBI-wrap.md)

- `sparklyr::sqlInterpolate("spark_connection")`

## Usage

``` r
sqlInterpolate(conn, sql, ..., .dots = list())
```

## Arguments

- conn:

  A
  [DBI::DBIConnection](https://dbi.r-dbi.org/dev/reference/DBIConnection-class.md)
  object, as returned by
  [`dbConnect()`](https://dbi.r-dbi.org/dev/reference/dbConnect.md).

- sql:

  A SQL string containing variables to interpolate. Variables must start
  with a question mark and can be any valid R identifier, i.e. it must
  start with a letter or `.`, and be followed by a letter, digit, `.` or
  `_`.

- ..., .dots:

  Values (for `...`) or a list (for `.dots`) to interpolate into a
  string. Names are required if `sql` uses the
  [`?name`](https://rdrr.io/r/base/name.html) syntax for placeholders.
  All values will be first escaped with
  [`dbQuoteLiteral()`](https://dbi.r-dbi.org/dev/reference/dbQuoteLiteral.md)
  prior to interpolation to protect against SQL injection attacks.
  Arguments created by
  [`SQL()`](https://dbi.r-dbi.org/dev/reference/SQL.md) or
  [`dbQuoteIdentifier()`](https://dbi.r-dbi.org/dev/reference/dbQuoteIdentifier.md)
  remain unchanged.

## Value

The `sql` query with the values from `...` and `.dots` safely embedded.

## Backend authors

If you are implementing an SQL backend with non-ANSI quoting rules,
you'll need to implement a method for
[`sqlParseVariables()`](https://dbi.r-dbi.org/dev/reference/sqlParseVariables.md).
Failure to do so does not expose you to SQL injection attacks, but will
(rarely) result in errors matching supplied and interpolated variables.

## Examples

``` r
sql <- "SELECT * FROM X WHERE name = ?name"
sqlInterpolate(ANSI(), sql, name = "Hadley")
#> <SQL> SELECT * FROM X WHERE name = 'Hadley'

# This is safe because the single quote has been double escaped
sqlInterpolate(ANSI(), sql, name = "H'); DROP TABLE--;")
#> <SQL> SELECT * FROM X WHERE name = 'H''); DROP TABLE--;'

# Using paste0() could lead to dangerous SQL with carefully crafted inputs
# (SQL injection)
name <- "H'); DROP TABLE--;"
paste0("SELECT * FROM X WHERE name = '", name, "'")
#> [1] "SELECT * FROM X WHERE name = 'H'); DROP TABLE--;'"

# Use SQL() or dbQuoteIdentifier() to avoid escaping
sql2 <- "SELECT * FROM ?table WHERE name in ?names"
sqlInterpolate(ANSI(), sql2,
  table = dbQuoteIdentifier(ANSI(), "X"),
  names = SQL("('a', 'b')")
)
#> <SQL> SELECT * FROM "X" WHERE name in ('a', 'b')

# Don't use SQL() to escape identifiers to avoid SQL injection
sqlInterpolate(ANSI(), sql2,
  table = SQL("X; DELETE FROM X; SELECT * FROM X"),
  names = SQL("('a', 'b')")
)
#> <SQL> SELECT * FROM X; DELETE FROM X; SELECT * FROM X WHERE name in ('a', 'b')

# Use dbGetQuery() or dbExecute() to process these queries:
if (requireNamespace("RSQLite", quietly = TRUE)) {
  con <- dbConnect(RSQLite::SQLite())
  sql <- "SELECT ?value AS value"
  query <- sqlInterpolate(con, sql, value = 3)
  print(dbGetQuery(con, query))
  dbDisconnect(con)
}
#>   value
#> 1     3
```
