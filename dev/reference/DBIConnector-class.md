# DBIConnector class

Wraps objects of the
[DBIDriver](https://dbi.r-dbi.org/dev/reference/DBIDriver-class.md)
class to include connection options. The purpose of this class is to
store both the driver and the connection options. A database connection
can be established with a call to
[`dbConnect()`](https://dbi.r-dbi.org/dev/reference/dbConnect.md),
passing only that object without additional arguments.

## Details

To prevent leakage of passwords and other credentials, this class
supports delayed evaluation. All arguments can optionally be a function
(callable without arguments). In such a case, the function is evaluated
transparently when connecting in
[`dbGetConnectArgs()`](https://dbi.r-dbi.org/dev/reference/dbGetConnectArgs.md).

## See also

Other DBI classes:
[`DBIConnection-class`](https://dbi.r-dbi.org/dev/reference/DBIConnection-class.md),
[`DBIDriver-class`](https://dbi.r-dbi.org/dev/reference/DBIDriver-class.md),
[`DBIObject-class`](https://dbi.r-dbi.org/dev/reference/DBIObject-class.md),
[`DBIResult-class`](https://dbi.r-dbi.org/dev/reference/DBIResult-class.md),
[`DBIResultArrow-class`](https://dbi.r-dbi.org/dev/reference/DBIResultArrow-class.md)

Other DBIConnector generics:
[`dbConnect()`](https://dbi.r-dbi.org/dev/reference/dbConnect.md),
[`dbDataType()`](https://dbi.r-dbi.org/dev/reference/dbDataType.md),
[`dbGetConnectArgs()`](https://dbi.r-dbi.org/dev/reference/dbGetConnectArgs.md),
[`dbIsReadOnly()`](https://dbi.r-dbi.org/dev/reference/dbIsReadOnly.md)

## Examples

``` r
# Create a connector:
cnr <- new("DBIConnector",
  .drv = RSQLite::SQLite(),
  .conn_args = list(dbname = ":memory:")
)
cnr
#> <DBIConnector><SQLiteDriver>
#> Arguments:
#> $dbname
#> [1] ":memory:"
#> 

# Establish a connection through this connector:
con <- dbConnect(cnr)
con
#> <SQLiteConnection>
#>   Path: :memory:
#>   Extensions: TRUE

# Access the database through this connection:
dbGetQuery(con, "SELECT 1 AS a")
#>   a
#> 1 1
dbDisconnect(con)
```
