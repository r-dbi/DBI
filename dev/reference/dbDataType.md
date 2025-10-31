# Determine the SQL data type of an object

Returns an SQL string that describes the SQL data type to be used for an
object. The default implementation of this generic determines the SQL
type of an R object according to the SQL 92 specification, which may
serve as a starting point for driver implementations. DBI also provides
an implementation for data.frame which will return a character vector
giving the type for each column in the dataframe.

### Methods in other packages

This documentation page describes the generics. Refer to the
documentation pages linked below for the documentation for the methods
that are implemented in various backend packages.

- `adbi::dbDataType("AdbiConnection", "ANY")`

- `adbi::dbDataType("AdbiDriver", "ANY")`

- `bigrquery::dbDataType("BigQueryConnection", "ANY")`

- `bigrquery::dbDataType("BigQueryDriver", "ANY")`

- `duckdb::dbDataType("duckdb_connection", "ANY")`

- `duckdb::dbDataType("duckdb_driver", "ANY")`

- [`lazysf::dbDataType("SFSQLDriver", "ANY")`](https://hypertidy.github.io/lazysf/reference/SFSQLDriver-class.html)

- [`odbc::dbDataType("OdbcConnection", "ANY")`](https://odbc.r-dbi.org/reference/OdbcConnection.html)

- [`odbc::dbDataType("OdbcConnection", "data.frame")`](https://odbc.r-dbi.org/reference/OdbcConnection.html)

- [`odbc::dbDataType("OdbcDriver", "ANY")`](https://odbc.r-dbi.org/reference/OdbcDriver.html)

- [`odbc::dbDataType("OdbcDriver", "data.frame")`](https://odbc.r-dbi.org/reference/OdbcDriver.html)

- [`odbc::dbDataType("OdbcDriver", "list")`](https://odbc.r-dbi.org/reference/OdbcDriver.html)

- `pool::dbDataType("Pool", "ANY")`

- [`RAthena::dbDataType("AthenaConnection", "ANY")`](https://dyfanjones.github.io/RAthena/reference/AthenaConnection.html)

- [`RAthena::dbDataType("AthenaConnection", "data.frame")`](https://dyfanjones.github.io/RAthena/reference/AthenaConnection.html)

- [`RAthena::dbDataType("AthenaDriver", "ANY")`](https://dyfanjones.github.io/RAthena/reference/AthenaDriver.html)

- [`RAthena::dbDataType("AthenaDriver", "list")`](https://dyfanjones.github.io/RAthena/reference/AthenaDriver.html)

- `RH2::dbDataType("H2Connection", "ANY")`

- `RJDBC::dbDataType("JDBCConnection", "ANY")`

- `RMariaDB::dbDataType("MariaDBConnection", "ANY")`

- `RMariaDB::dbDataType("MariaDBDriver", "ANY")`

- `RMySQL::dbDataType("MySQLConnection", "ANY")`

- `RMySQL::dbDataType("MySQLDriver", "ANY")`

- `RPostgres::dbDataType("PqConnection", "ANY")`

- `RPostgres::dbDataType("PqDriver", "ANY")`

- `RPostgreSQL::dbDataType("PostgreSQLObject", "ANY")`

- `RPresto::dbDataType("PrestoDriver", "ANY")`

- `RSQLite::dbDataType("SQLiteConnection", "ANY")`

- `RSQLite::dbDataType("SQLiteDriver", "ANY")`

- `sergeant::dbDataType("DrillConnection", "ANY")`

- [`sf::dbDataType("DBIObject", "sf")`](https://r-spatial.github.io/sf/reference/dbDataType.html)

- [`sf::dbDataType("PostgreSQLConnection", "sf")`](https://r-spatial.github.io/sf/reference/dbDataType.html)

- `sparklyr::dbDataType("spark_connection", "ANY")`

## Usage

``` r
dbDataType(dbObj, obj, ...)
```

## Arguments

- dbObj:

  A object inheriting from
  [DBI::DBIDriver](https://dbi.r-dbi.org/dev/reference/DBIDriver-class.md)
  or
  [DBI::DBIConnection](https://dbi.r-dbi.org/dev/reference/DBIConnection-class.md)

- obj:

  An R object whose SQL type we want to determine.

- ...:

  Other arguments passed on to methods.

## Value

`dbDataType()` returns the SQL type that corresponds to the `obj`
argument as a non-empty character string. For data frames, a character
vector with one element per column is returned.

## Details

The data types supported by databases are different than the data types
in R, but the mapping between the primitive types is straightforward:

- Any of the many fixed and varying length character types are mapped to
  character vectors

- Fixed-precision (non-IEEE) numbers are mapped into either numeric or
  integer vectors.

Notice that many DBMS do not follow IEEE arithmetic, so there are
potential problems with under/overflows and loss of precision.

## Failure modes

An error is raised for invalid values for the `obj` argument such as a
`NULL` value.

## Specification

The backend can override the `DBI::dbDataType()` generic for its driver
class.

This generic expects an arbitrary object as second argument. To query
the values returned by the default implementation, run
`example(dbDataType, package = "DBI")`. If the backend needs to override
this generic, it must accept all basic R data types as its second
argument, namely [logical](https://rdrr.io/r/base/logical.html),
[integer](https://rdrr.io/r/base/integer.html),
[numeric](https://rdrr.io/r/base/numeric.html),
[character](https://rdrr.io/r/base/character.html), dates (see
[Dates](https://rdrr.io/r/base/Dates.html)), date-time (see
[DateTimeClasses](https://rdrr.io/r/base/DateTimeClasses.html)), and
[difftime](https://rdrr.io/r/base/difftime.html). If the database
supports blobs, this method also must accept lists of
[raw](https://rdrr.io/r/base/raw.html) vectors, and
[blob::blob](https://blob.tidyverse.org/reference/blob.html) objects.
As-is objects (i.e., wrapped by
[`I()`](https://rdrr.io/r/base/AsIs.html)) must be supported and return
the same results as their unwrapped counterparts. The SQL data type for
[factor](https://rdrr.io/r/base/factor.html) and
[ordered](https://rdrr.io/r/base/factor.html) is the same as for
character. The behavior for other object types is not specified.

All data types returned by `dbDataType()` are usable in an SQL statement
of the form `"CREATE TABLE test (a ...)"`.

## See also

Other DBIDriver generics:
[`DBIDriver-class`](https://dbi.r-dbi.org/dev/reference/DBIDriver-class.md),
[`dbCanConnect()`](https://dbi.r-dbi.org/dev/reference/dbCanConnect.md),
[`dbConnect()`](https://dbi.r-dbi.org/dev/reference/dbConnect.md),
[`dbDriver()`](https://dbi.r-dbi.org/dev/reference/dbDriver.md),
[`dbGetInfo()`](https://dbi.r-dbi.org/dev/reference/dbGetInfo.md),
[`dbIsReadOnly()`](https://dbi.r-dbi.org/dev/reference/dbIsReadOnly.md),
[`dbIsValid()`](https://dbi.r-dbi.org/dev/reference/dbIsValid.md),
[`dbListConnections()`](https://dbi.r-dbi.org/dev/reference/dbListConnections.md)

Other DBIConnection generics:
[`DBIConnection-class`](https://dbi.r-dbi.org/dev/reference/DBIConnection-class.md),
[`dbAppendTable()`](https://dbi.r-dbi.org/dev/reference/dbAppendTable.md),
[`dbAppendTableArrow()`](https://dbi.r-dbi.org/dev/reference/dbAppendTableArrow.md),
[`dbCreateTable()`](https://dbi.r-dbi.org/dev/reference/dbCreateTable.md),
[`dbCreateTableArrow()`](https://dbi.r-dbi.org/dev/reference/dbCreateTableArrow.md),
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

Other DBIConnector generics:
[`DBIConnector-class`](https://dbi.r-dbi.org/dev/reference/DBIConnector-class.md),
[`dbConnect()`](https://dbi.r-dbi.org/dev/reference/dbConnect.md),
[`dbGetConnectArgs()`](https://dbi.r-dbi.org/dev/reference/dbGetConnectArgs.md),
[`dbIsReadOnly()`](https://dbi.r-dbi.org/dev/reference/dbIsReadOnly.md)

## Examples

``` r
dbDataType(ANSI(), 1:5)
#> [1] "INT"
dbDataType(ANSI(), 1)
#> [1] "DOUBLE"
dbDataType(ANSI(), TRUE)
#> [1] "SMALLINT"
dbDataType(ANSI(), Sys.Date())
#> [1] "DATE"
dbDataType(ANSI(), Sys.time())
#> [1] "TIMESTAMP"
dbDataType(ANSI(), Sys.time() - as.POSIXct(Sys.Date()))
#> [1] "TIME"
dbDataType(ANSI(), c("x", "abc"))
#> [1] "TEXT"
dbDataType(ANSI(), list(raw(10), raw(20)))
#> [1] "BLOB"
dbDataType(ANSI(), I(3))
#> [1] "DOUBLE"

dbDataType(ANSI(), iris)
#> Sepal.Length  Sepal.Width Petal.Length  Petal.Width      Species 
#>     "DOUBLE"     "DOUBLE"     "DOUBLE"     "DOUBLE"       "TEXT" 

con <- dbConnect(RSQLite::SQLite(), ":memory:")

dbDataType(con, 1:5)
#> [1] "INTEGER"
dbDataType(con, 1)
#> [1] "REAL"
dbDataType(con, TRUE)
#> [1] "INTEGER"
dbDataType(con, Sys.Date())
#> [1] "REAL"
dbDataType(con, Sys.time())
#> [1] "REAL"
dbDataType(con, Sys.time() - as.POSIXct(Sys.Date()))
#> [1] "REAL"
dbDataType(con, c("x", "abc"))
#> [1] "TEXT"
dbDataType(con, list(raw(10), raw(20)))
#> [1] "BLOB"
dbDataType(con, I(3))
#> [1] "REAL"

dbDataType(con, iris)
#> Sepal.Length  Sepal.Width Petal.Length  Petal.Width      Species 
#>     "DOUBLE"     "DOUBLE"     "DOUBLE"     "DOUBLE"       "TEXT" 

dbDisconnect(con)
```
