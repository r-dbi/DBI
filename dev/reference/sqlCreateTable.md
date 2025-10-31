# Compose query to create a simple table

Exposes an interface to simple `CREATE TABLE` commands. The default
method is ANSI SQL 99 compliant. This method is mostly useful for
backend implementers.

### Methods in other packages

This documentation page describes the generics. Refer to the
documentation pages linked below for the documentation for the methods
that are implemented in various backend packages.

- [`odbc::sqlCreateTable("DB2/AIX64")`](https://odbc.r-dbi.org/reference/DBI-methods.html)

- [`odbc::sqlCreateTable("HDB")`](https://odbc.r-dbi.org/reference/DBI-methods.html)

- [`odbc::sqlCreateTable("Microsoft SQL Server")`](https://odbc.r-dbi.org/reference/SQLServer.html)

- [`odbc::sqlCreateTable("OdbcConnection")`](https://odbc.r-dbi.org/reference/DBI-tables.html)

- [`odbc::sqlCreateTable("Oracle")`](https://odbc.r-dbi.org/reference/Oracle.html)

- [`odbc::sqlCreateTable("Teradata")`](https://odbc.r-dbi.org/reference/DBI-methods.html)

- [`pool::sqlCreateTable("Pool")`](http://rstudio.github.io/pool/reference/DBI-wrap.md)

- [`RAthena::sqlCreateTable("AthenaConnection")`](https://dyfanjones.github.io/RAthena/reference/sqlCreateTable.html)

- [`RPresto::sqlCreateTable("PrestoConnection")`](https://rdrr.io/pkg/RPresto/man/PrestoConnection-class.html)

## Usage

``` r
sqlCreateTable(con, table, fields, row.names = NA, temporary = FALSE, ...)
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

- fields:

  Either a character vector or a data frame.

  A named character vector: Names are column names, values are types.
  Names are escaped with
  [`dbQuoteIdentifier()`](https://dbi.r-dbi.org/dev/reference/dbQuoteIdentifier.md).
  Field types are unescaped.

  A data frame: field types are generated using
  [`dbDataType()`](https://dbi.r-dbi.org/dev/reference/dbDataType.md).

- row.names:

  Either `TRUE`, `FALSE`, `NA` or a string.

  If `TRUE`, always translate row names to a column called "row_names".
  If `FALSE`, never translate row names. If `NA`, translate rownames
  only if they're a character vector.

  A string is equivalent to `TRUE`, but allows you to override the
  default name.

  For backward compatibility, `NULL` is equivalent to `FALSE`.

- temporary:

  If `TRUE`, will generate a temporary table.

- ...:

  Other arguments used by individual methods.

## Details

The `row.names` argument must be passed explicitly in order to avoid a
compatibility warning. The default will be changed in a later release.

## Examples

``` r
sqlCreateTable(ANSI(), "my-table", c(a = "integer", b = "text"))
#> Warning: Do not rely on the default value of the row.names argument for sqlCreateTable(), it will change in the future.
#> <SQL> CREATE TABLE "my-table" (
#>   "a" integer,
#>   "b" text
#> )
#> 
sqlCreateTable(ANSI(), "my-table", iris)
#> Warning: Do not rely on the default value of the row.names argument for sqlCreateTable(), it will change in the future.
#> <SQL> CREATE TABLE "my-table" (
#>   "Sepal.Length" DOUBLE,
#>   "Sepal.Width" DOUBLE,
#>   "Petal.Length" DOUBLE,
#>   "Petal.Width" DOUBLE,
#>   "Species" TEXT
#> )
#> 

# By default, character row names are converted to a row_names colum
sqlCreateTable(ANSI(), "mtcars", mtcars[, 1:5])
#> Warning: Do not rely on the default value of the row.names argument for sqlCreateTable(), it will change in the future.
#> <SQL> CREATE TABLE "mtcars" (
#>   "row_names" TEXT,
#>   "mpg" DOUBLE,
#>   "cyl" DOUBLE,
#>   "disp" DOUBLE,
#>   "hp" DOUBLE,
#>   "drat" DOUBLE
#> )
#> 
sqlCreateTable(ANSI(), "mtcars", mtcars[, 1:5], row.names = FALSE)
#> <SQL> CREATE TABLE "mtcars" (
#>   "mpg" DOUBLE,
#>   "cyl" DOUBLE,
#>   "disp" DOUBLE,
#>   "hp" DOUBLE,
#>   "drat" DOUBLE
#> )
#> 
```
