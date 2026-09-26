# Begin/commit/rollback SQL transactions

A transaction encapsulates several SQL statements in an atomic unit. It
is initiated with `dbBegin()` and either made persistent with
`dbCommit()` or undone with `dbRollback()`. In any case, the DBMS
guarantees that either all or none of the statements have a permanent
effect. This helps ensuring consistency of write operations to multiple
tables.

### Methods in other packages

This documentation page describes the generics. Refer to the
documentation pages linked below for the documentation for the methods
that are implemented in various backend packages.

- [`adbi::dbBegin("AdbiConnection")`](https://adbi.r-dbi.org/reference/AdbiConnection-class.html)

- [`adbi::dbCommit("AdbiConnection")`](https://adbi.r-dbi.org/reference/AdbiConnection-class.html)

- [`adbi::dbRollback("AdbiConnection")`](https://adbi.r-dbi.org/reference/AdbiConnection-class.html)

- [`bigrquery::dbBegin("BigQueryConnection")`](https://bigrquery.r-dbi.org/reference/DBI.html)

- [`bigrquery::dbCommit("BigQueryConnection")`](https://bigrquery.r-dbi.org/reference/DBI.html)

- [`bigrquery::dbRollback("BigQueryConnection")`](https://bigrquery.r-dbi.org/reference/DBI.html)

- `DatabaseConnector::dbBegin("DatabaseConnectorConnection")`

- `DatabaseConnector::dbCommit("DatabaseConnectorConnection")`

- `DatabaseConnector::dbRollback("DatabaseConnectorConnection")`

- [`dittodb::dbBegin("DBIMockConnection")`](https://dittodb.jonkeane.com/reference/mock-db-methods.html)

- [`dittodb::dbCommit("DBIMockConnection")`](https://dittodb.jonkeane.com/reference/mock-db-methods.html)

- [`dittodb::dbRollback("DBIMockConnection")`](https://dittodb.jonkeane.com/reference/mock-db-methods.html)

- [`duckdb::dbBegin("duckdb_connection")`](https://r.duckdb.org/reference/duckdb_connection-class.html)

- [`duckdb::dbCommit("duckdb_connection")`](https://r.duckdb.org/reference/duckdb_connection-class.html)

- [`duckdb::dbRollback("duckdb_connection")`](https://r.duckdb.org/reference/duckdb_connection-class.html)

- [`odbc::dbBegin("OdbcConnection")`](https://odbc.r-dbi.org/reference/OdbcConnection.html)

- [`odbc::dbCommit("OdbcConnection")`](https://odbc.r-dbi.org/reference/OdbcConnection.html)

- [`odbc::dbRollback("OdbcConnection")`](https://odbc.r-dbi.org/reference/OdbcConnection.html)

- [`pool::dbBegin("Pool")`](http://rstudio.github.io/pool/reference/DBI-custom.md)

- [`pool::dbCommit("Pool")`](http://rstudio.github.io/pool/reference/DBI-custom.md)

- [`pool::dbRollback("Pool")`](http://rstudio.github.io/pool/reference/DBI-custom.md)

- [`RAthena::dbBegin("AthenaConnection")`](https://dyfanjones.github.io/RAthena/reference/AthenaConnection.html)

- [`RAthena::dbCommit("AthenaConnection")`](https://dyfanjones.github.io/RAthena/reference/AthenaConnection.html)

- [`RAthena::dbRollback("AthenaConnection")`](https://dyfanjones.github.io/RAthena/reference/AthenaConnection.html)

- [`RJDBC::dbBegin("JDBCConnection")`](https://rdrr.io/pkg/RJDBC/man/JDBCConnection-methods.html)

- [`RJDBC::dbCommit("JDBCConnection")`](https://rdrr.io/pkg/RJDBC/man/JDBCConnection-methods.html)

- [`RJDBC::dbRollback("JDBCConnection")`](https://rdrr.io/pkg/RJDBC/man/JDBCConnection-methods.html)

- [`RMariaDB::dbBegin("MariaDBConnection")`](https://rmariadb.r-dbi.org/reference/transactions.html)

- [`RMariaDB::dbCommit("MariaDBConnection")`](https://rmariadb.r-dbi.org/reference/transactions.html)

- [`RMariaDB::dbRollback("MariaDBConnection")`](https://rmariadb.r-dbi.org/reference/transactions.html)

- [`RMySQL::dbBegin("MySQLConnection")`](https://r-dbi.r-universe.dev/RMySQL/reference/transactions.html)

- [`RMySQL::dbCommit("MySQLConnection")`](https://r-dbi.r-universe.dev/RMySQL/reference/transactions.html)

- [`RMySQL::dbRollback("MySQLConnection")`](https://r-dbi.r-universe.dev/RMySQL/reference/transactions.html)

- [`RPostgres::dbBegin("PqConnection")`](https://rpostgres.r-dbi.org/reference/postgres-transactions.html)

- [`RPostgres::dbCommit("PqConnection")`](https://rpostgres.r-dbi.org/reference/postgres-transactions.html)

- [`RPostgres::dbRollback("PqConnection")`](https://rpostgres.r-dbi.org/reference/postgres-transactions.html)

- [`RPostgreSQL::dbBegin("PostgreSQLConnection")`](https://rdrr.io/pkg/RPostgreSQL/man/dbCommit-methods.html)

- [`RPostgreSQL::dbCommit("PostgreSQLConnection")`](https://rdrr.io/pkg/RPostgreSQL/man/dbCommit-methods.html)

- [`RPostgreSQL::dbRollback("PostgreSQLConnection")`](https://rdrr.io/pkg/RPostgreSQL/man/dbCommit-methods.html)

- [`RSQLite::dbBegin("SQLiteConnection")`](https://rsqlite.r-dbi.org/reference/sqlite-transaction.html)

- [`RSQLite::dbCommit("SQLiteConnection")`](https://rsqlite.r-dbi.org/reference/sqlite-transaction.html)

- [`RSQLite::dbRollback("SQLiteConnection")`](https://rsqlite.r-dbi.org/reference/sqlite-transaction.html)

- `sparklyr::dbBegin("spark_connection")`

- `sparklyr::dbCommit("spark_connection")`

- `sparklyr::dbRollback("spark_connection")`

## Usage

``` r
dbBegin(conn, ...)

dbCommit(conn, ...)

dbRollback(conn, ...)
```

## Arguments

- conn:

  A
  [DBI::DBIConnection](https://dbi.r-dbi.org/dev/reference/DBIConnection-class.md)
  object, as returned by
  [`dbConnect()`](https://dbi.r-dbi.org/dev/reference/dbConnect.md).

- ...:

  Other parameters passed on to methods.

## Value

`dbBegin()`, `dbCommit()` and `dbRollback()` return `TRUE`, invisibly.

## Details

Not all database engines implement transaction management, in which case
these methods should not be implemented for the specific
[DBIConnection](https://dbi.r-dbi.org/dev/reference/DBIConnection-class.md)
subclass.

## Failure modes

The implementations are expected to raise an error in case of failure,
but this is not tested. In any way, all generics throw an error with a
closed or invalid connection. In addition, a call to `dbCommit()` or
`dbRollback()` without a prior call to `dbBegin()` raises an error.
Nested transactions are not supported by DBI, an attempt to call
`dbBegin()` twice yields an error.

## Specification

Actual support for transactions may vary between backends. A transaction
is initiated by a call to `dbBegin()` and committed by a call to
`dbCommit()`. Data written in a transaction must persist after the
transaction is committed. For example, a record that is missing when the
transaction is started but is created during the transaction must exist
both during and after the transaction, and also in a new connection.

A transaction can also be aborted with `dbRollback()`. All data written
in such a transaction must be removed after the transaction is rolled
back. For example, a record that is missing when the transaction is
started but is created during the transaction must not exist anymore
after the rollback.

Disconnection from a connection with an open transaction effectively
rolls back the transaction. All data written in such a transaction must
be removed after the transaction is rolled back.

The behavior is not specified if other arguments are passed to these
functions. In particular, RSQLite issues named transactions with support
for nesting if the `name` argument is set.

The transaction isolation level is not specified by DBI.

## See also

Self-contained transactions:
[`dbWithTransaction()`](https://dbi.r-dbi.org/dev/reference/dbWithTransaction.md)

## Examples

``` r
con <- dbConnect(RSQLite::SQLite(), ":memory:")

dbWriteTable(con, "cash", data.frame(amount = 100))
dbWriteTable(con, "account", data.frame(amount = 2000))

# All operations are carried out as logical unit:
dbBegin(con)
withdrawal <- 300
dbExecute(con, "UPDATE cash SET amount = amount + ?", list(withdrawal))
#> [1] 1
dbExecute(con, "UPDATE account SET amount = amount - ?", list(withdrawal))
#> [1] 1
dbCommit(con)

dbReadTable(con, "cash")
#>   amount
#> 1    400
dbReadTable(con, "account")
#>   amount
#> 1   1700

# Rolling back after detecting negative value on account:
dbBegin(con)
withdrawal <- 5000
dbExecute(con, "UPDATE cash SET amount = amount + ?", list(withdrawal))
#> [1] 1
dbExecute(con, "UPDATE account SET amount = amount - ?", list(withdrawal))
#> [1] 1
if (dbReadTable(con, "account")$amount >= 0) {
  dbCommit(con)
} else {
  dbRollback(con)
}

dbReadTable(con, "cash")
#>   amount
#> 1    400
dbReadTable(con, "account")
#>   amount
#> 1   1700

dbDisconnect(con)
```
