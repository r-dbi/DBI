# Self-contained SQL transactions

Given that
[transactions](https://dbi.r-dbi.org/dev/reference/transactions.md) are
implemented, this function allows you to pass in code that is run in a
transaction. The default method of `dbWithTransaction()` calls
[`dbBegin()`](https://dbi.r-dbi.org/dev/reference/transactions.md)
before executing the code, and
[`dbCommit()`](https://dbi.r-dbi.org/dev/reference/transactions.md)
after successful completion, or
[`dbRollback()`](https://dbi.r-dbi.org/dev/reference/transactions.md) in
case of an error. The advantage is that you don't have to remember to do
[`dbBegin()`](https://dbi.r-dbi.org/dev/reference/transactions.md) and
[`dbCommit()`](https://dbi.r-dbi.org/dev/reference/transactions.md) or
[`dbRollback()`](https://dbi.r-dbi.org/dev/reference/transactions.md) –
that is all taken care of. The special function `dbBreak()` allows an
early exit with rollback, it can be called only inside
`dbWithTransaction()`.

### Methods in other packages

This documentation page describes the generics. Refer to the
documentation pages linked below for the documentation for the methods
that are implemented in various backend packages.

- [`pool::dbWithTransaction("Pool")`](http://rstudio.github.io/pool/reference/DBI-custom.md)

## Usage

``` r
dbWithTransaction(conn, code, ...)

dbBreak()
```

## Arguments

- conn:

  A
  [DBI::DBIConnection](https://dbi.r-dbi.org/dev/reference/DBIConnection-class.md)
  object, as returned by
  [`dbConnect()`](https://dbi.r-dbi.org/dev/reference/dbConnect.md).

- code:

  An arbitrary block of R code.

- ...:

  Other parameters passed on to methods.

## Value

`dbWithTransaction()` returns the value of the executed code.

## Details

DBI implements `dbWithTransaction()`, backends should need to override
this generic only if they implement specialized handling.

## Failure modes

Failure to initiate the transaction (e.g., if the connection is closed
or invalid or if
[`DBI::dbBegin()`](https://dbi.r-dbi.org/dev/reference/transactions.md)
has been called already) gives an error.

## Specification

`dbWithTransaction()` initiates a transaction with
[`dbBegin()`](https://dbi.r-dbi.org/dev/reference/transactions.md),
executes the code given in the `code` argument, and commits the
transaction with
[`DBI::dbCommit()`](https://dbi.r-dbi.org/dev/reference/transactions.md).
If the code raises an error, the transaction is instead aborted with
[`DBI::dbRollback()`](https://dbi.r-dbi.org/dev/reference/transactions.md),
and the error is propagated. If the code calls `dbBreak()`, execution of
the code stops and the transaction is silently aborted. All side effects
caused by the code (such as the creation of new variables) propagate to
the calling environment.

## Examples

``` r
con <- dbConnect(RSQLite::SQLite(), ":memory:")

dbWriteTable(con, "cash", data.frame(amount = 100))
dbWriteTable(con, "account", data.frame(amount = 2000))

# All operations are carried out as logical unit:
dbWithTransaction(
  con,
  {
    withdrawal <- 300
    dbExecute(con, "UPDATE cash SET amount = amount + ?", list(withdrawal))
    dbExecute(con, "UPDATE account SET amount = amount - ?", list(withdrawal))
  }
)
#> [1] 1

# The code is executed as if in the current environment:
withdrawal
#> [1] 300

# The changes are committed to the database after successful execution:
dbReadTable(con, "cash")
#>   amount
#> 1    400
dbReadTable(con, "account")
#>   amount
#> 1   1700

# Rolling back with dbBreak():
dbWithTransaction(
  con,
  {
    withdrawal <- 5000
    dbExecute(con, "UPDATE cash SET amount = amount + ?", list(withdrawal))
    dbExecute(con, "UPDATE account SET amount = amount - ?", list(withdrawal))
    if (dbReadTable(con, "account")$amount < 0) {
      dbBreak()
    }
  }
)

# These changes were not committed to the database:
dbReadTable(con, "cash")
#>   amount
#> 1    400
dbReadTable(con, "account")
#>   amount
#> 1   1700

dbDisconnect(con)
```
