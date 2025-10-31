# List currently open connections

DEPRECATED, drivers are no longer required to implement this method.
Keep track of the connections you opened if you require a list.

## Usage

``` r
dbListConnections(drv, ...)
```

## Arguments

- drv:

  A object inheriting from
  [DBIDriver](https://dbi.r-dbi.org/dev/reference/DBIDriver-class.md)

- ...:

  Other arguments passed on to methods.

## Value

a list

## See also

Other DBIDriver generics:
[`DBIDriver-class`](https://dbi.r-dbi.org/dev/reference/DBIDriver-class.md),
[`dbCanConnect()`](https://dbi.r-dbi.org/dev/reference/dbCanConnect.md),
[`dbConnect()`](https://dbi.r-dbi.org/dev/reference/dbConnect.md),
[`dbDataType()`](https://dbi.r-dbi.org/dev/reference/dbDataType.md),
[`dbDriver()`](https://dbi.r-dbi.org/dev/reference/dbDriver.md),
[`dbGetInfo()`](https://dbi.r-dbi.org/dev/reference/dbGetInfo.md),
[`dbIsReadOnly()`](https://dbi.r-dbi.org/dev/reference/dbIsReadOnly.md),
[`dbIsValid()`](https://dbi.r-dbi.org/dev/reference/dbIsValid.md)
