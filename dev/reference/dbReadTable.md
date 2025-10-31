# Read database tables as data frames

Reads a database table to a data frame, optionally converting a column
to row names and converting the column names to valid R identifiers. Use
[`dbReadTableArrow()`](https://dbi.r-dbi.org/dev/reference/dbReadTableArrow.md)
instead to obtain an Arrow object.

### Methods in other packages

This documentation page describes the generics. Refer to the
documentation pages linked below for the documentation for the methods
that are implemented in various backend packages.

- [`AzureKusto::dbReadTable("AzureKustoConnection", "character")`](https://rdrr.io/pkg/AzureKusto/man/DBI_table.html)

- [`bigrquery::dbReadTable("BigQueryConnection", "AsIs")`](https://bigrquery.r-dbi.org/reference/DBI.html)

- [`bigrquery::dbReadTable("BigQueryConnection", "character")`](https://bigrquery.r-dbi.org/reference/DBI.html)

- [`bigrquery::dbReadTable("BigQueryConnection", "Id")`](https://bigrquery.r-dbi.org/reference/DBI.html)

- [`DatabaseConnector::dbReadTable("DatabaseConnectorConnection", "character")`](https://ohdsi.github.io/DatabaseConnector/reference/dbReadTable-DatabaseConnectorConnection-character-method.html)

- [`lazysf::dbReadTable("SFSQLConnection", "character")`](https://hypertidy.github.io/lazysf/reference/SFSQLConnection-class.html)

- [`pool::dbReadTable("Pool", "ANY")`](http://rstudio.github.io/pool/reference/DBI-wrap.md)

- [`RJDBC::dbReadTable("JDBCConnection", "ANY")`](https://rdrr.io/pkg/RJDBC/man/JDBCConnection-methods.html)

- [`RJDBC::dbReadTable("JDBCConnection", "character")`](https://rdrr.io/pkg/RJDBC/man/JDBCConnection-methods.html)

- [`RMariaDB::dbReadTable("MariaDBConnection", "character")`](https://rmariadb.r-dbi.org/reference/mariadb-tables.html)

- [`RMySQL::dbReadTable("MySQLConnection", "character")`](https://r-dbi.r-universe.dev/RMySQL/reference/dbReadTable.html)

- [`RPostgres::dbReadTable("PqConnection", "character")`](https://rpostgres.r-dbi.org/reference/postgres-tables.html)

- [`RPostgreSQL::dbReadTable("PostgreSQLConnection", "character")`](https://rdrr.io/pkg/RPostgreSQL/man/dbReadTable-methods.html)

- [`RPresto::dbReadTable("PrestoConnection", "ANY")`](https://rdrr.io/pkg/RPresto/man/PrestoConnection-class.html)

- [`RPresto::dbReadTable("PrestoConnection", "character")`](https://rdrr.io/pkg/RPresto/man/PrestoConnection-class.html)

- [`RPresto::dbReadTable("PrestoConnection", "dbplyr_schema")`](https://rdrr.io/pkg/RPresto/man/PrestoConnection-class.html)

- [`RPresto::dbReadTable("PrestoConnection", "Id")`](https://rdrr.io/pkg/RPresto/man/PrestoConnection-class.html)

- [`RPresto::dbReadTable("PrestoConnection", "SQL")`](https://rdrr.io/pkg/RPresto/man/PrestoConnection-class.html)

- [`RSQLite::dbReadTable("SQLiteConnection", "character")`](https://rsqlite.r-dbi.org/reference/dbReadTable.html)

- `sparklyr::dbReadTable("spark_connection", "character")`

## Usage

``` r
dbReadTable(conn, name, ...)
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

- ...:

  Other parameters passed on to methods.

## Value

`dbReadTable()` returns a data frame that contains the complete data
from the remote table, effectively the result of calling
[`DBI::dbGetQuery()`](https://dbi.r-dbi.org/dev/reference/dbGetQuery.md)
with `SELECT * FROM <name>`.

An empty table is returned as a data frame with zero rows.

The presence of
[rownames](https://dbi.r-dbi.org/dev/reference/rownames.md) depends on
the `row.names` argument, see
[`DBI::sqlColumnToRownames()`](https://dbi.r-dbi.org/dev/reference/rownames.md)
for details:

- If `FALSE` or `NULL`, the returned data frame doesn't have row names.

- If `TRUE`, a column named "row_names" is converted to row names.

&nbsp;

- If `NA`, a column named "row_names" is converted to row names if it
  exists, otherwise no translation occurs.

- If a string, this specifies the name of the column in the remote table
  that contains the row names.

The default is `row.names = FALSE`.

If the database supports identifiers with special characters, the
columns in the returned data frame are converted to valid R identifiers
if the `check.names` argument is `TRUE`, If `check.names = FALSE`, the
returned table has non-syntactic column names without quotes.

## Details

This function returns a data frame. Use
[`dbReadTableArrow()`](https://dbi.r-dbi.org/dev/reference/dbReadTableArrow.md)
to obtain an Arrow object.

## Failure modes

An error is raised if the table does not exist.

An error is raised if `row.names` is `TRUE` and no "row_names" column
exists,

An error is raised if `row.names` is set to a string and no
corresponding column exists.

An error is raised when calling this method for a closed or invalid
connection. An error is raised if `name` cannot be processed with
[`DBI::dbQuoteIdentifier()`](https://dbi.r-dbi.org/dev/reference/dbQuoteIdentifier.md)
or if this results in a non-scalar. Unsupported values for `row.names`
and `check.names` (non-scalars, unsupported data types, `NA` for
`check.names`) also raise an error.

## Additional arguments

The following arguments are not part of the `dbReadTable()` generic (to
improve compatibility across backends) but are part of the DBI
specification:

- `row.names` (default: `FALSE`)

- `check.names`

They must be provided as named arguments. See the "Value" section for
details on their usage.

## Specification

The `name` argument is processed as follows, to support databases that
allow non-syntactic names for their objects:

- If an unquoted table name as string: `dbReadTable()` will do the
  quoting, perhaps by calling `dbQuoteIdentifier(conn, x = name)`

- If the result of a call to
  [`DBI::dbQuoteIdentifier()`](https://dbi.r-dbi.org/dev/reference/dbQuoteIdentifier.md):
  no more quoting is done

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

dbWriteTable(con, "mtcars", mtcars[1:10, ])
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

dbDisconnect(con)
```
