# Refer to a table nested in a hierarchy (e.g. within a schema)

Objects of class `Id` have a single slot `name`, which is a character
vector. The
[`dbQuoteIdentifier()`](https://dbi.r-dbi.org/dev/reference/dbQuoteIdentifier.md)
method converts `Id` objects to strings. Support for `Id` objects
depends on the database backend.

They can be used in the following methods as `name` or `table` argument:

- [`dbCreateTable()`](https://dbi.r-dbi.org/dev/reference/dbCreateTable.md)

- [`dbAppendTable()`](https://dbi.r-dbi.org/dev/reference/dbAppendTable.md)

- [`dbReadTable()`](https://dbi.r-dbi.org/dev/reference/dbReadTable.md)

- [`dbWriteTable()`](https://dbi.r-dbi.org/dev/reference/dbWriteTable.md)

- [`dbExistsTable()`](https://dbi.r-dbi.org/dev/reference/dbExistsTable.md)

- [`dbRemoveTable()`](https://dbi.r-dbi.org/dev/reference/dbRemoveTable.md)

Objects of this class are also returned from
[`dbListObjects()`](https://dbi.r-dbi.org/dev/reference/dbListObjects.md).

## Usage

``` r
Id(...)
```

## Arguments

- ...:

  Components of the hierarchy, e.g. `cluster`, `catalog`, `schema`, or
  `table`, depending on the database backend. For more on these
  concepts, see <https://stackoverflow.com/questions/7022755/>

## Examples

``` r
# Identifies a table in a specific schema:
Id("dbo", "Customer")
#> <Id> "dbo"."Customer"
# You can name the components if you want, but it's not needed
Id(table = "Customer", schema = "dbo")
#> <Id> "dbo"."Customer"

# Create a SQL expression for an identifier:
dbQuoteIdentifier(ANSI(), Id("nycflights13", "flights"))
#> <SQL> "nycflights13"."flights"

# Write a table in a specific schema:
if (FALSE) { # \dontrun{
dbWriteTable(con, Id("myschema", "mytable"), data.frame(a = 1))
} # }
```
