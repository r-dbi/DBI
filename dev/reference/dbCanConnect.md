# Check if a connection to a DBMS can be established

Like [`dbConnect()`](https://dbi.r-dbi.org/dev/reference/dbConnect.md),
but only checks validity without actually returning a connection object.
The default implementation opens a connection and disconnects on
success, but individual backends might implement a lighter-weight check.

### Methods in other packages

This documentation page describes the generics. Refer to the
documentation pages linked below for the documentation for the methods
that are implemented in various backend packages.

- [`AzureKusto::dbCanConnect("AzureKustoDriver")`](https://rdrr.io/pkg/AzureKusto/man/AzureKusto.html)

## Usage

``` r
dbCanConnect(drv, ...)
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

A scalar logical. If `FALSE`, the `"reason"` attribute indicates a
reason for failure.

## See also

Other DBIDriver generics:
[`DBIDriver-class`](https://dbi.r-dbi.org/dev/reference/DBIDriver-class.md),
[`dbConnect()`](https://dbi.r-dbi.org/dev/reference/dbConnect.md),
[`dbDataType()`](https://dbi.r-dbi.org/dev/reference/dbDataType.md),
[`dbDriver()`](https://dbi.r-dbi.org/dev/reference/dbDriver.md),
[`dbGetInfo()`](https://dbi.r-dbi.org/dev/reference/dbGetInfo.md),
[`dbIsReadOnly()`](https://dbi.r-dbi.org/dev/reference/dbIsReadOnly.md),
[`dbIsValid()`](https://dbi.r-dbi.org/dev/reference/dbIsValid.md),
[`dbListConnections()`](https://dbi.r-dbi.org/dev/reference/dbListConnections.md)

## Examples

``` r
# SQLite only needs a path to the database. (Here, ":memory:" is a special
# path that creates an in-memory database.) Other database drivers
# will require more details (like user, password, host, port, etc.)
dbCanConnect(RSQLite::SQLite(), ":memory:")
#> [1] TRUE
```
