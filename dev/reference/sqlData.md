# Convert a data frame into form suitable for upload to an SQL database

This is a generic method that coerces R objects into vectors suitable
for upload to the database. The output will vary a little from method to
method depending on whether the main upload device is through a single
SQL string or multiple parameterized queries. This method is mostly
useful for backend implementers.

### Methods in other packages

This documentation page describes the generics. Refer to the
documentation pages linked below for the documentation for the methods
that are implemented in various backend packages.

- [`odbc::sqlData("OdbcConnection")`](https://odbc.r-dbi.org/reference/DBI-methods.html)

- [`pool::sqlData("Pool")`](http://rstudio.github.io/pool/reference/DBI-wrap.md)

- [`RAthena::sqlData("AthenaConnection")`](https://dyfanjones.github.io/RAthena/reference/sqlData.html)

- `RMariaDB::sqlData("MariaDBConnection")`

- [`RPostgres::sqlData("PqConnection")`](https://rpostgres.r-dbi.org/reference/postgres-tables.html)

- [`RSQLite::sqlData("SQLiteConnection")`](https://rsqlite.r-dbi.org/reference/SQLiteConnection-class.html)

## Usage

``` r
sqlData(con, value, row.names = NA, ...)
```

## Arguments

- con:

  A database connection.

- value:

  A data frame

- row.names:

  Either `TRUE`, `FALSE`, `NA` or a string.

  If `TRUE`, always translate row names to a column called "row_names".
  If `FALSE`, never translate row names. If `NA`, translate rownames
  only if they're a character vector.

  A string is equivalent to `TRUE`, but allows you to override the
  default name.

  For backward compatibility, `NULL` is equivalent to `FALSE`.

- ...:

  Other arguments used by individual methods.

## Details

The default method:

- Converts factors to characters

- Quotes all strings with
  [`dbQuoteIdentifier()`](https://dbi.r-dbi.org/dev/reference/dbQuoteIdentifier.md)

- Converts all columns to strings with
  [`dbQuoteLiteral()`](https://dbi.r-dbi.org/dev/reference/dbQuoteLiteral.md)

- Replaces NA with NULL

## Examples

``` r
con <- dbConnect(RSQLite::SQLite(), ":memory:")

sqlData(con, head(iris))
#>   Sepal.Length Sepal.Width Petal.Length Petal.Width  Species
#> 1          5.1         3.5          1.4         0.2 'setosa'
#> 2          4.9         3.0          1.4         0.2 'setosa'
#> 3          4.7         3.2          1.3         0.2 'setosa'
#> 4          4.6         3.1          1.5         0.2 'setosa'
#> 5          5.0         3.6          1.4         0.2 'setosa'
#> 6          5.4         3.9          1.7         0.4 'setosa'
sqlData(con, head(mtcars))
#>    mpg cyl disp  hp drat    wt  qsec vs am gear carb
#> 1 21.0   6  160 110 3.90 2.620 16.46  0  1    4    4
#> 2 21.0   6  160 110 3.90 2.875 17.02  0  1    4    4
#> 3 22.8   4  108  93 3.85 2.320 18.61  1  1    4    1
#> 4 21.4   6  258 110 3.08 3.215 19.44  1  0    3    1
#> 5 18.7   8  360 175 3.15 3.440 17.02  0  0    3    2
#> 6 18.1   6  225 105 2.76 3.460 20.22  1  0    3    1

dbDisconnect(con)
```
