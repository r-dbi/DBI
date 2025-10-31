# DBIObject class

Base class for all other DBI classes (e.g., drivers, connections). This
is a virtual Class: No objects may be created from it.

## Details

More generally, the DBI defines a very small set of classes and generics
that allows users and applications access DBMS with a common interface.
The virtual classes are `DBIDriver` that individual drivers extend,
`DBIConnection` that represent instances of DBMS connections, and
`DBIResult` that represent the result of a DBMS statement. These three
classes extend the basic class of `DBIObject`, which serves as the root
or parent of the class hierarchy.

## Implementation notes

An implementation MUST provide methods for the following generics:

- [`dbGetInfo()`](https://dbi.r-dbi.org/dev/reference/dbGetInfo.md).

It MAY also provide methods for:

- [`summary()`](https://rdrr.io/r/base/summary.html). Print a concise
  description of the object. The default method invokes
  `dbGetInfo(dbObj)` and prints the name-value pairs one per line.
  Individual implementations may tailor this appropriately.

## See also

Other DBI classes:
[`DBIConnection-class`](https://dbi.r-dbi.org/dev/reference/DBIConnection-class.md),
[`DBIConnector-class`](https://dbi.r-dbi.org/dev/reference/DBIConnector-class.md),
[`DBIDriver-class`](https://dbi.r-dbi.org/dev/reference/DBIDriver-class.md),
[`DBIResult-class`](https://dbi.r-dbi.org/dev/reference/DBIResult-class.md),
[`DBIResultArrow-class`](https://dbi.r-dbi.org/dev/reference/DBIResultArrow-class.md)

## Examples

``` r
drv <- RSQLite::SQLite()
con <- dbConnect(drv)

rs <- dbSendQuery(con, "SELECT 1")
is(drv, "DBIObject")   ## True
#> [1] TRUE
is(con, "DBIObject")   ## True
#> [1] TRUE
is(rs, "DBIObject")
#> [1] TRUE

dbClearResult(rs)
dbDisconnect(con)
```
