# Create a connection to a DBMS

Connect to a DBMS going through the appropriate authentication
procedure. Some implementations may allow you to have multiple
connections open, so you may invoke this function repeatedly assigning
its output to different objects. The authentication mechanism is left
unspecified, so check the documentation of individual drivers for
details. Use
[`dbCanConnect()`](https://dbi.r-dbi.org/dev/reference/dbCanConnect.md)
to check if a connection can be established.

### Methods in other packages

This documentation page describes the generics. Refer to the
documentation pages linked below for the documentation for the methods
that are implemented in various backend packages.

- [`adbi::dbConnect("AdbiDriver")`](https://adbi.r-dbi.org/reference/dbConnect.html)

- [`AzureKusto::dbConnect("AzureKustoDriver")`](https://rdrr.io/pkg/AzureKusto/man/AzureKusto.html)

- [`bigrquery::dbConnect("BigQueryDriver")`](https://bigrquery.r-dbi.org/reference/bigquery.html)

- [`bigrquery::dbConnect("bq_dataset")`](https://bigrquery.r-dbi.org/reference/DBI.html)

- [`DatabaseConnector::dbConnect("DatabaseConnectorDriver")`](https://ohdsi.github.io/DatabaseConnector/reference/dbConnect-DatabaseConnectorDriver-method.html)

- [`duckdb::dbConnect("duckdb_driver")`](https://r.duckdb.org/reference/duckdb.html)

- [`lazysf::dbConnect("SFSQLDriver")`](https://hypertidy.github.io/lazysf/reference/dbConnect-SFSQLDriver-method.html)

- [`odbc::dbConnect("DatabricksOdbcDriver")`](https://odbc.r-dbi.org/reference/databricks.html)

- [`odbc::dbConnect("OdbcDriver")`](https://odbc.r-dbi.org/reference/dbConnect-OdbcDriver-method.html)

- [`odbc::dbConnect("RedshiftOdbcDriver")`](https://odbc.r-dbi.org/reference/redshift.html)

- [`odbc::dbConnect("SnowflakeOdbcDriver")`](https://odbc.r-dbi.org/reference/snowflake.html)

- [`RAthena::dbConnect("AthenaDriver")`](https://dyfanjones.github.io/RAthena/reference/dbConnect-AthenaDriver-method.html)

- [`RH2::dbConnect("H2Driver")`](https://rdrr.io/pkg/RH2/man/H2Driver-methods.html)

- [`RJDBC::dbConnect("JDBCDriver")`](https://rdrr.io/pkg/RJDBC/man/JDBCDriver-methods.html)

- [`RMariaDB::dbConnect("MariaDBDriver")`](https://rmariadb.r-dbi.org/reference/dbConnect-MariaDBDriver-method.html)

- [`RMySQL::dbConnect("MySQLConnection")`](https://r-dbi.r-universe.dev/RMySQL/reference/dbConnect-MySQLDriver-method.html)

- [`RMySQL::dbConnect("MySQLDriver")`](https://r-dbi.r-universe.dev/RMySQL/reference/dbConnect-MySQLDriver-method.html)

- [`RPostgres::dbConnect("PqDriver")`](https://rpostgres.r-dbi.org/reference/Postgres.html)

- [`RPostgres::dbConnect("RedshiftDriver")`](https://rpostgres.r-dbi.org/reference/Redshift.html)

- [`RPostgreSQL::dbConnect("character")`](https://rdrr.io/pkg/RPostgreSQL/man/dbConnect-methods.html)

- [`RPostgreSQL::dbConnect("PostgreSQLConnection")`](https://rdrr.io/pkg/RPostgreSQL/man/dbConnect-methods.html)

- [`RPostgreSQL::dbConnect("PostgreSQLDriver")`](https://rdrr.io/pkg/RPostgreSQL/man/dbConnect-methods.html)

- [`RPresto::dbConnect("PrestoDriver")`](https://rdrr.io/pkg/RPresto/man/Presto.html)

- [`RSQLite::dbConnect("SQLiteConnection")`](https://rsqlite.r-dbi.org/reference/SQLite.html)

- [`RSQLite::dbConnect("SQLiteDriver")`](https://rsqlite.r-dbi.org/reference/SQLite.html)

- [`sergeant::dbConnect("DrillDriver")`](https://rdrr.io/pkg/sergeant/man/Drill.html)

## Usage

``` r
dbConnect(drv, ...)
```

## Arguments

- drv:

  An object that inherits from
  [DBI::DBIDriver](https://dbi.r-dbi.org/dev/reference/DBIDriver-class.md),
  or an existing
  [DBI::DBIConnection](https://dbi.r-dbi.org/dev/reference/DBIConnection-class.md)
  object (in order to clone an existing connection).

- ...:

  Authentication arguments needed by the DBMS instance; these typically
  include `user`, `password`, `host`, `port`, `dbname`, etc. For details
  see the appropriate `DBIDriver`.

## Value

`dbConnect()` returns an S4 object that inherits from
[DBI::DBIConnection](https://dbi.r-dbi.org/dev/reference/DBIConnection-class.md).
This object is used to communicate with the database engine.

A [`format()`](https://rdrr.io/r/base/format.html) method is defined for
the connection object. It returns a string that consists of a single
line of text.

## Specification

DBI recommends using the following argument names for authentication
parameters, with `NULL` default:

- `user` for the user name (default: current user)

- `password` for the password

- `host` for the host name (default: local connection)

- `port` for the port number (default: local connection)

- `dbname` for the name of the database on the host, or the database
  file name

The defaults should provide reasonable behavior, in particular a local
connection for `host = NULL`. For some DBMS (e.g., PostgreSQL), this is
different to a TCP/IP connection to `localhost`.

In addition, DBI supports the `bigint` argument that governs how 64-bit
integer data is returned. The following values are supported:

- `"integer"`: always return as `integer`, silently overflow

- `"numeric"`: always return as `numeric`, silently round

- `"character"`: always return the decimal representation as `character`

- `"integer64"`: return as a data type that can be coerced using
  [`as.integer()`](https://rdrr.io/r/base/integer.html) (with warning on
  overflow), [`as.numeric()`](https://rdrr.io/r/base/numeric.html) and
  [`as.character()`](https://rdrr.io/r/base/character.html)

## See also

[`dbDisconnect()`](https://dbi.r-dbi.org/dev/reference/dbDisconnect.md)
to disconnect from a database.

Other DBIDriver generics:
[`DBIDriver-class`](https://dbi.r-dbi.org/dev/reference/DBIDriver-class.md),
[`dbCanConnect()`](https://dbi.r-dbi.org/dev/reference/dbCanConnect.md),
[`dbDataType()`](https://dbi.r-dbi.org/dev/reference/dbDataType.md),
[`dbDriver()`](https://dbi.r-dbi.org/dev/reference/dbDriver.md),
[`dbGetInfo()`](https://dbi.r-dbi.org/dev/reference/dbGetInfo.md),
[`dbIsReadOnly()`](https://dbi.r-dbi.org/dev/reference/dbIsReadOnly.md),
[`dbIsValid()`](https://dbi.r-dbi.org/dev/reference/dbIsValid.md),
[`dbListConnections()`](https://dbi.r-dbi.org/dev/reference/dbListConnections.md)

Other DBIConnector generics:
[`DBIConnector-class`](https://dbi.r-dbi.org/dev/reference/DBIConnector-class.md),
[`dbDataType()`](https://dbi.r-dbi.org/dev/reference/dbDataType.md),
[`dbGetConnectArgs()`](https://dbi.r-dbi.org/dev/reference/dbGetConnectArgs.md),
[`dbIsReadOnly()`](https://dbi.r-dbi.org/dev/reference/dbIsReadOnly.md)

## Examples

``` r
# SQLite only needs a path to the database. (Here, ":memory:" is a special
# path that creates an in-memory database.) Other database drivers
# will require more details (like user, password, host, port, etc.)
con <- dbConnect(RSQLite::SQLite(), ":memory:")
con
#> <SQLiteConnection>
#>   Path: :memory:
#>   Extensions: TRUE

dbListTables(con)
#> character(0)

dbDisconnect(con)

# Bad, for subtle reasons:
# This code fails when RSQLite isn't loaded yet,
# because dbConnect() doesn't know yet about RSQLite.
dbListTables(con <- dbConnect(RSQLite::SQLite(), ":memory:"))
#> character(0)
```
