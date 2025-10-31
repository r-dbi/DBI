# Create a table in the database based on an Arrow object

**\[experimental\]**

The default `dbCreateTableArrow()` method determines the R data types of
the Arrow schema associated with the Arrow object, and calls
[`dbCreateTable()`](https://dbi.r-dbi.org/dev/reference/dbCreateTable.md).
Backends that implement
[`dbAppendTableArrow()`](https://dbi.r-dbi.org/dev/reference/dbAppendTableArrow.md)
should typically also implement this generic. Use
[`dbCreateTable()`](https://dbi.r-dbi.org/dev/reference/dbCreateTable.md)
to create a table from the column types as defined in a data frame.

### Methods in other packages

This documentation page describes the generics. Refer to the
documentation pages linked below for the documentation for the methods
that are implemented in various backend packages.

- [`pool::dbCreateTableArrow("Pool")`](http://rstudio.github.io/pool/reference/DBI-wrap.md)

## Usage

``` r
dbCreateTableArrow(conn, name, value, ..., temporary = FALSE)
```

## Arguments

- conn:

  A
  [DBI::DBIConnection](https://dbi.r-dbi.org/dev/reference/DBIConnection-class.md)
  object, as returned by
  [`dbConnect()`](https://dbi.r-dbi.org/dev/reference/dbConnect.md).

- name:

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

- value:

  An object for which a schema can be determined via
  [`nanoarrow::infer_nanoarrow_schema()`](https://arrow.apache.org/nanoarrow/latest/r/reference/as_nanoarrow_schema.html).

- ...:

  Other parameters passed on to methods.

- temporary:

  If `TRUE`, will generate a temporary table.

## Value

`dbCreateTableArrow()` returns `TRUE`, invisibly.

## Failure modes

If the table exists, an error is raised; the remote table remains
unchanged.

An error is raised when calling this method for a closed or invalid
connection. An error is also raised if `name` cannot be processed with
[`DBI::dbQuoteIdentifier()`](https://dbi.r-dbi.org/dev/reference/dbQuoteIdentifier.md)
or if this results in a non-scalar. Invalid values for the `temporary`
argument (non-scalars, unsupported data types, `NA`, incompatible
values, duplicate names) also raise an error.

## Additional arguments

The following arguments are not part of the `dbCreateTableArrow()`
generic (to improve compatibility across backends) but are part of the
DBI specification:

- `temporary` (default: `FALSE`)

They must be provided as named arguments. See the "Specification" and
"Value" sections for details on their usage.

## Specification

The `name` argument is processed as follows, to support databases that
allow non-syntactic names for their objects:

- If an unquoted table name as string: `dbCreateTableArrow()` will do
  the quoting, perhaps by calling `dbQuoteIdentifier(conn, x = name)`

- If the result of a call to
  [`DBI::dbQuoteIdentifier()`](https://dbi.r-dbi.org/dev/reference/dbQuoteIdentifier.md):
  no more quoting is done

The `value` argument can be:

- a data frame,

- a nanoarrow array

- a nanoarrow array stream (which will still contain the data after the
  call)

- a nanoarrow schema

If the `temporary` argument is `TRUE`, the table is not available in a
second connection and is gone after reconnecting. Not all backends
support this argument. A regular, non-temporary table is visible in a
second connection, in a pre-existing connection, and after reconnecting
to the database.

SQL keywords can be used freely in table names, column names, and data.
Quotes, commas, and spaces can also be used for table names and column
names, if the database supports non-syntactic identifiers.

## See also

Other DBIConnection generics:
[`DBIConnection-class`](https://dbi.r-dbi.org/dev/reference/DBIConnection-class.md),
[`dbAppendTable()`](https://dbi.r-dbi.org/dev/reference/dbAppendTable.md),
[`dbAppendTableArrow()`](https://dbi.r-dbi.org/dev/reference/dbAppendTableArrow.md),
[`dbCreateTable()`](https://dbi.r-dbi.org/dev/reference/dbCreateTable.md),
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
[`dbSendQuery()`](https://dbi.r-dbi.org/dev/reference/dbSendQuery.md),
[`dbSendQueryArrow()`](https://dbi.r-dbi.org/dev/reference/dbSendQueryArrow.md),
[`dbSendStatement()`](https://dbi.r-dbi.org/dev/reference/dbSendStatement.md),
[`dbUnquoteIdentifier()`](https://dbi.r-dbi.org/dev/reference/dbUnquoteIdentifier.md),
[`dbWriteTable()`](https://dbi.r-dbi.org/dev/reference/dbWriteTable.md),
[`dbWriteTableArrow()`](https://dbi.r-dbi.org/dev/reference/dbWriteTableArrow.md)

## Examples

``` r
con <- dbConnect(RSQLite::SQLite(), ":memory:")
ptype <- data.frame(a = numeric())
dbCreateTableArrow(con, "df", nanoarrow::infer_nanoarrow_schema(ptype))
dbReadTable(con, "df")
#> [1] a
#> <0 rows> (or 0-length row.names)
dbDisconnect(con)
```
