# Call an SQL stored procedure

**Deprecated since 2014**

## Usage

``` r
dbCallProc(conn, ...)
```

## Arguments

- conn:

  A
  [DBI::DBIConnection](https://dbi.r-dbi.org/dev/reference/DBIConnection-class.md)
  object, as returned by
  [`dbConnect()`](https://dbi.r-dbi.org/dev/reference/dbConnect.md).

- ...:

  Other parameters passed on to methods.

## Details

The recommended way of calling a stored procedure is now

1.  [`dbGetQuery`](https://dbi.r-dbi.org/dev/reference/dbGetQuery.md) if
    a result set is returned

2.  [`dbExecute`](https://dbi.r-dbi.org/dev/reference/dbExecute.md) for
    data manipulation and other cases where no result set is returned
