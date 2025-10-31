# Compose query to insert rows into a table

`sqlAppendTable()` generates a single SQL string that inserts a data
frame into an existing table. `sqlAppendTableTemplate()` generates a
template suitable for use with
[`dbBind()`](https://dbi.r-dbi.org/dev/reference/dbBind.md). The default
methods are ANSI SQL 99 compliant. These methods are mostly useful for
backend implementers.

### Methods in other packages

This documentation page describes the generics. Refer to the
documentation pages linked below for the documentation for the methods
that are implemented in various backend packages.

- [`pool::sqlAppendTable("Pool")`](http://rstudio.github.io/pool/reference/DBI-wrap.md)

## Usage

``` r
sqlAppendTable(con, table, values, row.names = NA, ...)

sqlAppendTableTemplate(
  con,
  table,
  values,
  row.names = NA,
  prefix = "?",
  ...,
  pattern = ""
)
```

## Arguments

- con:

  A database connection.

- table:

  The table name, passed on to
  [`dbQuoteIdentifier()`](https://dbi.r-dbi.org/dev/reference/dbQuoteIdentifier.md).
  Options are:

  - a character string with the unquoted DBMS table name, e.g.
    `"table_name"`,

  - a call to [`Id()`](https://dbi.r-dbi.org/dev/reference/Id.md) with
    components to the fully qualified table name, e.g.
    `Id(schema = "my_schema", table = "table_name")`

  - a call to [`SQL()`](https://dbi.r-dbi.org/dev/reference/SQL.md) with
    the quoted and fully qualified table name given verbatim, e.g.
    `SQL('"my_schema"."table_name"')`

- values:

  A data frame. Factors will be converted to character vectors.
  Character vectors will be escaped with
  [`dbQuoteString()`](https://dbi.r-dbi.org/dev/reference/dbQuoteString.md).

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

- prefix:

  Parameter prefix to use for placeholders.

- pattern:

  Parameter pattern to use for placeholders:

  - `""`: no pattern

  - `"1"`: position

  - anything else: field name

## Details

The `row.names` argument must be passed explicitly in order to avoid a
compatibility warning. The default will be changed in a later release.

## Examples

``` r
sqlAppendTable(ANSI(), "iris", head(iris))
#> Warning: Do not rely on the default value of the row.names argument for sqlAppendTable(), it will change in the future.
#> <SQL> INSERT INTO "iris"
#>   ("Sepal.Length", "Sepal.Width", "Petal.Length", "Petal.Width", "Species")
#> VALUES
#>   (5.1, 3.5, 1.4, 0.2, 'setosa'),
#>   (4.9, 3, 1.4, 0.2, 'setosa'),
#>   (4.7, 3.2, 1.3, 0.2, 'setosa'),
#>   (4.6, 3.1, 1.5, 0.2, 'setosa'),
#>   (5, 3.6, 1.4, 0.2, 'setosa'),
#>   (5.4, 3.9, 1.7, 0.4, 'setosa')

sqlAppendTable(ANSI(), "mtcars", head(mtcars))
#> Warning: Do not rely on the default value of the row.names argument for sqlAppendTable(), it will change in the future.
#> <SQL> INSERT INTO "mtcars"
#>   ("row_names", "mpg", "cyl", "disp", "hp", "drat", "wt", "qsec", "vs", "am", "gear", "carb")
#> VALUES
#>   ('Mazda RX4', 21, 6, 160, 110, 3.9, 2.62, 16.46, 0, 1, 4, 4),
#>   ('Mazda RX4 Wag', 21, 6, 160, 110, 3.9, 2.875, 17.02, 0, 1, 4, 4),
#>   ('Datsun 710', 22.8, 4, 108, 93, 3.85, 2.32, 18.61, 1, 1, 4, 1),
#>   ('Hornet 4 Drive', 21.4, 6, 258, 110, 3.08, 3.215, 19.44, 1, 0, 3, 1),
#>   ('Hornet Sportabout', 18.7, 8, 360, 175, 3.15, 3.44, 17.02, 0, 0, 3, 2),
#>   ('Valiant', 18.1, 6, 225, 105, 2.76, 3.46, 20.22, 1, 0, 3, 1)
sqlAppendTable(ANSI(), "mtcars", head(mtcars), row.names = FALSE)
#> <SQL> INSERT INTO "mtcars"
#>   ("mpg", "cyl", "disp", "hp", "drat", "wt", "qsec", "vs", "am", "gear", "carb")
#> VALUES
#>   (21, 6, 160, 110, 3.9, 2.62, 16.46, 0, 1, 4, 4),
#>   (21, 6, 160, 110, 3.9, 2.875, 17.02, 0, 1, 4, 4),
#>   (22.8, 4, 108, 93, 3.85, 2.32, 18.61, 1, 1, 4, 1),
#>   (21.4, 6, 258, 110, 3.08, 3.215, 19.44, 1, 0, 3, 1),
#>   (18.7, 8, 360, 175, 3.15, 3.44, 17.02, 0, 0, 3, 2),
#>   (18.1, 6, 225, 105, 2.76, 3.46, 20.22, 1, 0, 3, 1)
sqlAppendTableTemplate(ANSI(), "iris", iris)
#> Warning: Do not rely on the default value of the `row.names` argument to `sqlAppendTableTemplate()`, it will change in the future.
#> <SQL> INSERT INTO "iris"
#>   ("Sepal.Length", "Sepal.Width", "Petal.Length", "Petal.Width", "Species")
#> VALUES
#>   (?, ?, ?, ?, ?)

sqlAppendTableTemplate(ANSI(), "mtcars", mtcars)
#> Warning: Do not rely on the default value of the `row.names` argument to `sqlAppendTableTemplate()`, it will change in the future.
#> <SQL> INSERT INTO "mtcars"
#>   ("row_names", "mpg", "cyl", "disp", "hp", "drat", "wt", "qsec", "vs", "am", "gear", "carb")
#> VALUES
#>   (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)
sqlAppendTableTemplate(ANSI(), "mtcars", mtcars, row.names = FALSE)
#> <SQL> INSERT INTO "mtcars"
#>   ("mpg", "cyl", "disp", "hp", "drat", "wt", "qsec", "vs", "am", "gear", "carb")
#> VALUES
#>   (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)
```
