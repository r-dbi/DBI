# Fetch the next batch of records from a previously executed query as an Arrow object

**\[experimental\]**

Fetch the next chunk of the result set and return it as an Arrow object.
The chunk size is implementation-specific. Use
[`dbFetchArrow()`](https://dbi.r-dbi.org/dev/reference/dbFetchArrow.md)
to fetch all results.

### Methods in other packages

This documentation page describes the generics. Refer to the
documentation pages linked below for the documentation for the methods
that are implemented in various backend packages.

- [`adbi::dbFetchArrowChunk("AdbiResultArrow")`](https://adbi.r-dbi.org/reference/AdbiResultArrow-class.html)

## Usage

``` r
dbFetchArrowChunk(res, ...)
```

## Arguments

- res:

  An object inheriting from
  [DBI::DBIResultArrow](https://dbi.r-dbi.org/dev/reference/DBIResultArrow-class.md),
  created by
  [`dbSendQueryArrow()`](https://dbi.r-dbi.org/dev/reference/dbSendQueryArrow.md).

- ...:

  Other arguments passed on to methods.

## Value

`dbFetchArrowChunk()` always returns an object coercible to a
[data.frame](https://rdrr.io/r/base/data.frame.html) with as many rows
as records were fetched and as many columns as fields in the result set,
even if the result is a single value or has one or zero rows.

## The data retrieval flow for Arrow streams

This section gives a complete overview over the flow for the execution
of queries that return tabular data as an Arrow stream.

Most of this flow, except repeated calling of
[`dbBindArrow()`](https://dbi.r-dbi.org/dev/reference/dbBind.md) or
[`dbBind()`](https://dbi.r-dbi.org/dev/reference/dbBind.md), is
implemented by
[`dbGetQueryArrow()`](https://dbi.r-dbi.org/dev/reference/dbGetQueryArrow.md),
which should be sufficient unless you have a parameterized query that
you want to reuse. This flow requires an active connection established
by [`dbConnect()`](https://dbi.r-dbi.org/dev/reference/dbConnect.md).
See also `vignette("dbi-advanced")` for a walkthrough.

1.  Use
    [`dbSendQueryArrow()`](https://dbi.r-dbi.org/dev/reference/dbSendQueryArrow.md)
    to create a result set object of class
    [DBIResultArrow](https://dbi.r-dbi.org/dev/reference/DBIResultArrow-class.md).

2.  Optionally, bind query parameters with
    [`dbBindArrow()`](https://dbi.r-dbi.org/dev/reference/dbBind.md) or
    [`dbBind()`](https://dbi.r-dbi.org/dev/reference/dbBind.md). This is
    required only if the query contains placeholders such as `?` or
    `$1`, depending on the database backend.

3.  Use
    [`dbFetchArrow()`](https://dbi.r-dbi.org/dev/reference/dbFetchArrow.md)
    to get a data stream.

4.  Repeat the last two steps as necessary.

5.  Use
    [`dbClearResult()`](https://dbi.r-dbi.org/dev/reference/dbClearResult.md)
    to clean up the result set object. This step is mandatory even if no
    rows have been fetched or if an error has occurred during the
    processing. It is good practice to use
    [`on.exit()`](https://rdrr.io/r/base/on.exit.html) or
    [`withr::defer()`](https://withr.r-lib.org/reference/defer.html) to
    ensure that this step is always executed.

## Failure modes

An attempt to fetch from a closed result set raises an error.

## Specification

Fetching multi-row queries with one or more columns returns the next
chunk. The size of the chunk is implementation-specific. The object
returned by `dbFetchArrowChunk()` can also be passed to
[`nanoarrow::as_nanoarrow_array()`](https://arrow.apache.org/nanoarrow/latest/r/reference/as_nanoarrow_array.html)
to create a nanoarrow array object. The chunk size is
implementation-specific.

## See also

Close the result set with
[`dbClearResult()`](https://dbi.r-dbi.org/dev/reference/dbClearResult.md)
as soon as you finish retrieving the records you want.

Other DBIResultArrow generics:
[`DBIResultArrow-class`](https://dbi.r-dbi.org/dev/reference/DBIResultArrow-class.md),
[`dbBind()`](https://dbi.r-dbi.org/dev/reference/dbBind.md),
[`dbClearResult()`](https://dbi.r-dbi.org/dev/reference/dbClearResult.md),
[`dbFetchArrow()`](https://dbi.r-dbi.org/dev/reference/dbFetchArrow.md),
[`dbHasCompleted()`](https://dbi.r-dbi.org/dev/reference/dbHasCompleted.md),
[`dbIsValid()`](https://dbi.r-dbi.org/dev/reference/dbIsValid.md)

Other data retrieval generics:
[`dbBind()`](https://dbi.r-dbi.org/dev/reference/dbBind.md),
[`dbClearResult()`](https://dbi.r-dbi.org/dev/reference/dbClearResult.md),
[`dbFetch()`](https://dbi.r-dbi.org/dev/reference/dbFetch.md),
[`dbFetchArrow()`](https://dbi.r-dbi.org/dev/reference/dbFetchArrow.md),
[`dbGetQuery()`](https://dbi.r-dbi.org/dev/reference/dbGetQuery.md),
[`dbGetQueryArrow()`](https://dbi.r-dbi.org/dev/reference/dbGetQueryArrow.md),
[`dbHasCompleted()`](https://dbi.r-dbi.org/dev/reference/dbHasCompleted.md),
[`dbSendQuery()`](https://dbi.r-dbi.org/dev/reference/dbSendQuery.md),
[`dbSendQueryArrow()`](https://dbi.r-dbi.org/dev/reference/dbSendQueryArrow.md)

## Examples

``` r
con <- dbConnect(RSQLite::SQLite(), ":memory:")

dbWriteTable(con, "mtcars", mtcars)

# Fetch all results
rs <- dbSendQueryArrow(con, "SELECT * FROM mtcars WHERE cyl = 4")
dbHasCompleted(rs)
#> [1] FALSE
as.data.frame(dbFetchArrowChunk(rs))
#>     mpg cyl  disp  hp drat    wt  qsec vs am gear carb
#> 1  22.8   4 108.0  93 3.85 2.320 18.61  1  1    4    1
#> 2  24.4   4 146.7  62 3.69 3.190 20.00  1  0    4    2
#> 3  22.8   4 140.8  95 3.92 3.150 22.90  1  0    4    2
#> 4  32.4   4  78.7  66 4.08 2.200 19.47  1  1    4    1
#> 5  30.4   4  75.7  52 4.93 1.615 18.52  1  1    4    2
#> 6  33.9   4  71.1  65 4.22 1.835 19.90  1  1    4    1
#> 7  21.5   4 120.1  97 3.70 2.465 20.01  1  0    3    1
#> 8  27.3   4  79.0  66 4.08 1.935 18.90  1  1    4    1
#> 9  26.0   4 120.3  91 4.43 2.140 16.70  0  1    5    2
#> 10 30.4   4  95.1 113 3.77 1.513 16.90  1  1    5    2
#> 11 21.4   4 121.0 109 4.11 2.780 18.60  1  1    4    2
dbHasCompleted(rs)
#> [1] TRUE
as.data.frame(dbFetchArrowChunk(rs))
#>  [1] mpg  cyl  disp hp   drat wt   qsec vs   am   gear carb
#> <0 rows> (or 0-length row.names)
dbClearResult(rs)

dbDisconnect(con)
```
