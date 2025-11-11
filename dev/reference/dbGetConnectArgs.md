# Get connection arguments

Returns the arguments stored in a
[DBIConnector](https://dbi.r-dbi.org/dev/reference/DBIConnector-class.md)
object for inspection, optionally evaluating them. This function is
called by
[`dbConnect()`](https://dbi.r-dbi.org/dev/reference/dbConnect.md) and
usually does not need to be called directly.

## Usage

``` r
dbGetConnectArgs(drv, eval = TRUE, ...)
```

## Arguments

- drv:

  A object inheriting from
  [DBIConnector](https://dbi.r-dbi.org/dev/reference/DBIConnector-class.md).

- eval:

  Set to `FALSE` to return the functions that generate the argument
  instead of evaluating them.

- ...:

  Other arguments passed on to methods. Not otherwise used.

## See also

Other DBIConnector generics:
[`DBIConnector-class`](https://dbi.r-dbi.org/dev/reference/DBIConnector-class.md),
[`dbConnect()`](https://dbi.r-dbi.org/dev/reference/dbConnect.md),
[`dbDataType()`](https://dbi.r-dbi.org/dev/reference/dbDataType.md),
[`dbIsReadOnly()`](https://dbi.r-dbi.org/dev/reference/dbIsReadOnly.md)

## Examples

``` r
cnr <- new("DBIConnector",
  .drv = RSQLite::SQLite(),
  .conn_args = list(dbname = ":memory:", password = function() "supersecret")
)
dbGetConnectArgs(cnr)
#> $dbname
#> [1] ":memory:"
#> 
#> $password
#> [1] "supersecret"
#> 
dbGetConnectArgs(cnr, eval = FALSE)
#> $dbname
#> [1] ":memory:"
#> 
#> $password
#> function () 
#> "supersecret"
#> <environment: 0x55c1e9872188>
#> 
```
