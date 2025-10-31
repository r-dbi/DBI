# Copy data frames to database tables

Writes, overwrites or appends a data frame to a database table,
optionally converting row names to a column and specifying SQL data
types for fields.

### Methods in other packages

This documentation page describes the generics. Refer to the
documentation pages linked below for the documentation for the methods
that are implemented in various backend packages.

- [`adbi::dbWriteTable("AdbiConnection", "character", "data.frame")`](https://adbi.r-dbi.org/reference/AdbiConnection-class.html)

- [`adbi::dbWriteTable("AdbiConnection", "Id", "data.frame")`](https://adbi.r-dbi.org/reference/AdbiConnection-class.html)

- [`adbi::dbWriteTable("AdbiConnection", "SQL", "data.frame")`](https://adbi.r-dbi.org/reference/AdbiConnection-class.html)

- `AzureKusto::dbWriteTable("AzureKustoConnection", "ANY", "ANY")`

- [`bigrquery::dbWriteTable("BigQueryConnection", "AsIs", "data.frame")`](https://bigrquery.r-dbi.org/reference/DBI.html)

- [`bigrquery::dbWriteTable("BigQueryConnection", "character", "data.frame")`](https://bigrquery.r-dbi.org/reference/DBI.html)

- [`bigrquery::dbWriteTable("BigQueryConnection", "Id", "data.frame")`](https://bigrquery.r-dbi.org/reference/DBI.html)

- `DatabaseConnector::dbWriteTable("DatabaseConnectorConnection", "ANY", "ANY")`

- [`dittodb::dbWriteTable("DBIMockConnection", "character", "data.frame")`](https://dittodb.jonkeane.com/reference/mock-db-methods.html)

- [`duckdb::dbWriteTable("duckdb_connection", "character", "data.frame")`](https://r.duckdb.org/reference/duckdb_connection-class.html)

- [`odbc::dbWriteTable("OdbcConnection", "character", "data.frame")`](https://odbc.r-dbi.org/reference/DBI-tables.html)

- [`odbc::dbWriteTable("OdbcConnection", "Id", "data.frame")`](https://odbc.r-dbi.org/reference/DBI-tables.html)

- [`odbc::dbWriteTable("OdbcConnection", "SQL", "data.frame")`](https://odbc.r-dbi.org/reference/DBI-tables.html)

- `pool::dbWriteTable("Pool", "ANY", "ANY")`

- [`RAthena::dbWriteTable("AthenaConnection", "character", "data.frame")`](https://dyfanjones.github.io/RAthena/reference/AthenaWriteTables.html)

- [`RAthena::dbWriteTable("AthenaConnection", "Id", "data.frame")`](https://dyfanjones.github.io/RAthena/reference/AthenaWriteTables.html)

- [`RAthena::dbWriteTable("AthenaConnection", "SQL", "data.frame")`](https://dyfanjones.github.io/RAthena/reference/AthenaWriteTables.html)

- [`RH2::dbWriteTable("H2Connection", "character", "ANY")`](https://rdrr.io/pkg/RH2/man/H2Connection-methods.html)

- [`RH2::dbWriteTable("H2Connection", "character", "data.frame")`](https://rdrr.io/pkg/RH2/man/H2Connection-methods.html)

- `RJDBC::dbWriteTable("JDBCConnection", "ANY", "ANY")`

- [`RMariaDB::dbWriteTable("MariaDBConnection", "character", "character")`](https://rmariadb.r-dbi.org/reference/mariadb-tables.html)

- [`RMariaDB::dbWriteTable("MariaDBConnection", "character", "data.frame")`](https://rmariadb.r-dbi.org/reference/mariadb-tables.html)

- [`RMySQL::dbWriteTable("MySQLConnection", "character", "character")`](https://r-dbi.r-universe.dev/RMySQL/reference/dbWriteTable.html)

- [`RMySQL::dbWriteTable("MySQLConnection", "character", "data.frame")`](https://r-dbi.r-universe.dev/RMySQL/reference/dbWriteTable.html)

- [`RPostgres::dbWriteTable("PqConnection", "character", "data.frame")`](https://rpostgres.r-dbi.org/reference/postgres-tables.html)

- [`RPostgreSQL::dbWriteTable("PostgreSQLConnection", "character", "character")`](https://rdrr.io/pkg/RPostgreSQL/man/dbReadTable-methods.html)

- [`RPostgreSQL::dbWriteTable("PostgreSQLConnection", "character", "data.frame")`](https://rdrr.io/pkg/RPostgreSQL/man/dbReadTable-methods.html)

- [`RPresto::dbWriteTable("PrestoConnection", "ANY", "data.frame")`](https://rdrr.io/pkg/RPresto/man/PrestoConnection-class.html)

- [`RSQLite::dbWriteTable("SQLiteConnection", "character", "character")`](https://rsqlite.r-dbi.org/reference/dbWriteTable.html)

- [`RSQLite::dbWriteTable("SQLiteConnection", "character", "data.frame")`](https://rsqlite.r-dbi.org/reference/dbWriteTable.html)

- [`sf::dbWriteTable("DBIObject", "character", "sf")`](https://r-spatial.github.io/sf/reference/dbWriteTable.html)

- [`sf::dbWriteTable("PostgreSQLConnection", "character", "sf")`](https://r-spatial.github.io/sf/reference/dbWriteTable.html)

- `sparklyr::dbWriteTable("spark_connection", "ANY", "ANY")`

## Usage

``` r
dbWriteTable(conn, name, value, ...)
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

  A [data.frame](https://rdrr.io/r/base/data.frame.html) (or coercible
  to data.frame).

- ...:

  Other parameters passed on to methods.

## Value

`dbWriteTable()` returns `TRUE`, invisibly.

## Details

This function expects a data frame. Use
[`dbWriteTableArrow()`](https://dbi.r-dbi.org/dev/reference/dbWriteTableArrow.md)
to write an Arrow object.

This function is useful if you want to create and load a table at the
same time. Use
[`dbAppendTable()`](https://dbi.r-dbi.org/dev/reference/dbAppendTable.md)
or
[`dbAppendTableArrow()`](https://dbi.r-dbi.org/dev/reference/dbAppendTableArrow.md)
for appending data to an existing table,
[`dbCreateTable()`](https://dbi.r-dbi.org/dev/reference/dbCreateTable.md)
or
[`dbCreateTableArrow()`](https://dbi.r-dbi.org/dev/reference/dbCreateTableArrow.md)
for creating a table, and
[`dbExistsTable()`](https://dbi.r-dbi.org/dev/reference/dbExistsTable.md)
and
[`dbRemoveTable()`](https://dbi.r-dbi.org/dev/reference/dbRemoveTable.md)
for overwriting tables.

DBI only standardizes writing data frames with `dbWriteTable()`. Some
backends might implement methods that can consume CSV files or other
data formats. For details, see the documentation for the individual
methods.

## Failure modes

If the table exists, and both `append` and `overwrite` arguments are
unset, or `append = TRUE` and the data frame with the new data has
different column names, an error is raised; the remote table remains
unchanged.

An error is raised when calling this method for a closed or invalid
connection. An error is also raised if `name` cannot be processed with
[`DBI::dbQuoteIdentifier()`](https://dbi.r-dbi.org/dev/reference/dbQuoteIdentifier.md)
or if this results in a non-scalar. Invalid values for the additional
arguments `row.names`, `overwrite`, `append`, `field.types`, and
`temporary` (non-scalars, unsupported data types, `NA`, incompatible
values, duplicate or missing names, incompatible columns) also raise an
error.

## Additional arguments

The following arguments are not part of the `dbWriteTable()` generic (to
improve compatibility across backends) but are part of the DBI
specification:

- `row.names` (default: `FALSE`)

- `overwrite` (default: `FALSE`)

- `append` (default: `FALSE`)

- `field.types` (default: `NULL`)

- `temporary` (default: `FALSE`)

They must be provided as named arguments. See the "Specification" and
"Value" sections for details on their usage.

## Specification

The `name` argument is processed as follows, to support databases that
allow non-syntactic names for their objects:

- If an unquoted table name as string: `dbWriteTable()` will do the
  quoting, perhaps by calling `dbQuoteIdentifier(conn, x = name)`

- If the result of a call to
  [`DBI::dbQuoteIdentifier()`](https://dbi.r-dbi.org/dev/reference/dbQuoteIdentifier.md):
  no more quoting is done

The `value` argument must be a data frame with a subset of the columns
of the existing table if `append = TRUE`. The order of the columns does
not matter with `append = TRUE`.

If the `overwrite` argument is `TRUE`, an existing table of the same
name will be overwritten. This argument doesn't change behavior if the
table does not exist yet.

If the `append` argument is `TRUE`, the rows in an existing table are
preserved, and the new data are appended. If the table doesn't exist
yet, it is created.

If the `temporary` argument is `TRUE`, the table is not available in a
second connection and is gone after reconnecting. Not all backends
support this argument. A regular, non-temporary table is visible in a
second connection, in a pre-existing connection, and after reconnecting
to the database.

SQL keywords can be used freely in table names, column names, and data.
Quotes, commas, spaces, and other special characters such as newlines
and tabs, can also be used in the data, and, if the database supports
non-syntactic identifiers, also for table names and column names.

The following data types must be supported at least, and be read
identically with
[`DBI::dbReadTable()`](https://dbi.r-dbi.org/dev/reference/dbReadTable.md):

- integer

- numeric (the behavior for `Inf` and `NaN` is not specified)

- logical

- `NA` as NULL

- 64-bit values (using `"bigint"` as field type); the result can be

  - converted to a numeric, which may lose precision,

  - converted a character vector, which gives the full decimal
    representation

  - written to another table and read again unchanged

- character (in both UTF-8 and native encodings), supporting empty
  strings before and after a non-empty string

- factor (returned as character)

- list of raw (if supported by the database)

- objects of type
  [blob::blob](https://blob.tidyverse.org/reference/blob.html) (if
  supported by the database)

- date (if supported by the database; returned as `Date`), also for
  dates prior to 1970 or 1900 or after 2038

- time (if supported by the database; returned as objects that inherit
  from `difftime`)

- timestamp (if supported by the database; returned as `POSIXct`
  respecting the time zone but not necessarily preserving the input time
  zone), also for timestamps prior to 1970 or 1900 or after 2038
  respecting the time zone but not necessarily preserving the input time
  zone)

Mixing column types in the same table is supported.

The `field.types` argument must be a named character vector with at most
one entry for each column. It indicates the SQL data type to be used for
a new column. If a column is missed from `field.types`, the type is
inferred from the input data with
[`DBI::dbDataType()`](https://dbi.r-dbi.org/dev/reference/dbDataType.md).

The interpretation of
[rownames](https://dbi.r-dbi.org/dev/reference/rownames.md) depends on
the `row.names` argument, see
[`DBI::sqlRownamesToColumn()`](https://dbi.r-dbi.org/dev/reference/rownames.md)
for details:

- If `FALSE` or `NULL`, row names are ignored.

- If `TRUE`, row names are converted to a column named "row_names", even
  if the input data frame only has natural row names from 1 to
  `nrow(...)`.

- If `NA`, a column named "row_names" is created if the data has custom
  row names, no extra column is created in the case of natural row
  names.

- If a string, this specifies the name of the column in the remote table
  that contains the row names, even if the input data frame only has
  natural row names.

The default is `row.names = FALSE`.

## See also

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
[`dbWriteTableArrow()`](https://dbi.r-dbi.org/dev/reference/dbWriteTableArrow.md)

## Examples

``` r
con <- dbConnect(RSQLite::SQLite(), ":memory:")

dbWriteTable(con, "mtcars", mtcars[1:5, ])
dbReadTable(con, "mtcars")
#>    mpg cyl disp  hp drat    wt  qsec vs am gear carb
#> 1 21.0   6  160 110 3.90 2.620 16.46  0  1    4    4
#> 2 21.0   6  160 110 3.90 2.875 17.02  0  1    4    4
#> 3 22.8   4  108  93 3.85 2.320 18.61  1  1    4    1
#> 4 21.4   6  258 110 3.08 3.215 19.44  1  0    3    1
#> 5 18.7   8  360 175 3.15 3.440 17.02  0  0    3    2

dbWriteTable(con, "mtcars", mtcars[6:10, ], append = TRUE)
dbReadTable(con, "mtcars")
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

dbWriteTable(con, "mtcars", mtcars[1:10, ], overwrite = TRUE)
dbReadTable(con, "mtcars")
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

# No row names
dbWriteTable(con, "mtcars", mtcars[1:10, ], overwrite = TRUE, row.names = FALSE)
dbReadTable(con, "mtcars")
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
```
