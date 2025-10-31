# Using DBI with Arrow

## Who this tutorial is for

This tutorial is for you if you want to leverage [Apache
Arrow](https://arrow.apache.org/) for accessing and manipulating data on
databases. See
[`vignette("DBI", package = "DBI")`](https://dbi.r-dbi.org/dev/articles/DBI.md)
and
[`vignette("DBI-advanced", package = "DBI")`](https://dbi.r-dbi.org/dev/articles/DBI-advanced.md)
for tutorials on accessing data using R’s data frames instead of Arrow’s
structures.

## Rationale

Apache Arrow is

> a cross-language development platform for in-memory analytics,

suitable for large and huge data, with support for out-of-memory
operation. Arrow is also a data exchange format, the data types covered
by Arrow align well with the data types supported by SQL databases.

DBI 1.2.0 introduced support for Arrow as a format for exchanging data
between R and databases. The aim is to:

- accelerate data retrieval and loading, by using fewer costly data
  conversions;
- better support reading and summarizing data from a database that is
  larger than memory;
- provide better type fidelity with workflows centered around Arrow.

This allows existing code to be used with Arrow, and it allows new code
to be written that is more efficient and more flexible than code that
uses R’s data frames.

The interface is built around the {nanoarrow} R package, with
[`nanoarrow::as_nanoarrow_array`](https://arrow.apache.org/nanoarrow/latest/r/reference/as_nanoarrow_array.html)
and
[`nanoarrow::as_nanoarrow_array_stream`](https://arrow.apache.org/nanoarrow/latest/r/reference/as_nanoarrow_array_stream.html)
as fundamental data structures.

## New classes and generics

DBI 1.2.0 introduces new classes and generics for working with Arrow
data:

- [`dbReadTableArrow()`](https://dbi.r-dbi.org/dev/reference/dbReadTableArrow.md)
- [`dbWriteTableArrow()`](https://dbi.r-dbi.org/dev/reference/dbWriteTableArrow.md)
- [`dbCreateTableArrow()`](https://dbi.r-dbi.org/dev/reference/dbCreateTableArrow.md)
- [`dbAppendTableArrow()`](https://dbi.r-dbi.org/dev/reference/dbAppendTableArrow.md)
- [`dbGetQueryArrow()`](https://dbi.r-dbi.org/dev/reference/dbGetQueryArrow.md)
- [`dbSendQueryArrow()`](https://dbi.r-dbi.org/dev/reference/dbSendQueryArrow.md)
- [`dbBindArrow()`](https://dbi.r-dbi.org/dev/reference/dbBind.md)
- [`dbFetchArrow()`](https://dbi.r-dbi.org/dev/reference/dbFetchArrow.md)
- [`dbFetchArrowChunk()`](https://dbi.r-dbi.org/dev/reference/dbFetchArrowChunk.md)
- `DBIResultArrow-class`
- `DBIResultArrowDefault-class`

Compatibility is important for DBI, and implementing new generics and
classes greatly reduces the risk of breaking existing code. The DBI
package comes with a fully functional fallback implementation for all
existing DBI backends. The fallback is not improving performance, but it
allows existing code to be used with Arrow before switching to a backend
with native Arrow support. Backends with native support, like the
[adbi](https://adbi.r-dbi.org/) package, implement the new generics and
classes for direct support and improved performance.

In the remainder of this tutorial, we will demonstrate the new generics
and classes using the RSQLite package. SQLite is an in-memory database,
this code does not need a database server to be installed and running.

## Prepare

We start by setting up a database connection and creating a table with
some data, using the original
[`dbWriteTable()`](https://dbi.r-dbi.org/dev/reference/dbWriteTable.md)
method.

``` r
library(DBI)

con <- dbConnect(RSQLite::SQLite())

data <- data.frame(
  a = 1:3,
  b = 4.5,
  c = "five"
)

dbWriteTable(con, "tbl", data)
```

## Read all rows from a table

The
[`dbReadTableArrow()`](https://dbi.r-dbi.org/dev/reference/dbReadTableArrow.md)
method reads all rows from a table into an Arrow stream, similarly to
[`dbReadTable()`](https://dbi.r-dbi.org/dev/reference/dbReadTable.md).
Arrow objects implement the
[`as.data.frame()`](https://rdrr.io/r/base/as.data.frame.html) method,
so we can convert the stream to a data frame.

``` r
stream <- dbReadTableArrow(con, "tbl")
stream
```

    ## <nanoarrow_array_stream struct<a: int32, b: double, c: string>>
    ##  $ get_schema:function ()  
    ##  $ get_next  :function (schema = x$get_schema(), validate = TRUE)  
    ##  $ release   :function ()

``` r
as.data.frame(stream)
```

    ##   a   b    c
    ## 1 1 4.5 five
    ## 2 2 4.5 five
    ## 3 3 4.5 five

## Run queries

The
[`dbGetQueryArrow()`](https://dbi.r-dbi.org/dev/reference/dbGetQueryArrow.md)
method runs a query and returns the result as an Arrow stream. This
stream can be turned into an
[`arrow::RecordBatchReader`](https://arrow.apache.org/docs/r/reference/RecordBatchReader.html)
object and processed further, without bringing it into R.

``` r
stream <- dbGetQueryArrow(con, "SELECT COUNT(*) AS n FROM tbl WHERE a < 3")
stream
```

    ## <nanoarrow_array_stream struct<n: int32>>
    ##  $ get_schema:function ()  
    ##  $ get_next  :function (schema = x$get_schema(), validate = TRUE)  
    ##  $ release   :function ()

``` r
path <- tempfile(fileext = ".parquet")
arrow::write_parquet(arrow::as_record_batch_reader(stream), path)
arrow::read_parquet(path)
```

    ##   n
    ## 1 2

## Prepared queries

The
[`dbGetQueryArrow()`](https://dbi.r-dbi.org/dev/reference/dbGetQueryArrow.md)
method supports prepared queries, using the `params` argument which
accepts a data frame or a list.

``` r
params <- data.frame(a = 3L)
stream <- dbGetQueryArrow(con, "SELECT $a AS batch, * FROM tbl WHERE a < $a", params = params)
as.data.frame(stream)
```

    ##   batch a   b    c
    ## 1     3 1 4.5 five
    ## 2     3 2 4.5 five

``` r
params <- data.frame(a = c(2L, 4L))
# Equivalent to dbBind()
stream <- dbGetQueryArrow(con, "SELECT $a AS batch, * FROM tbl WHERE a < $a", params = params)
as.data.frame(stream)
```

    ##   batch a   b    c
    ## 1     2 1 4.5 five
    ## 2     4 1 4.5 five
    ## 3     4 2 4.5 five
    ## 4     4 3 4.5 five

## Manual flow

For the manual flow, use
[`dbSendQueryArrow()`](https://dbi.r-dbi.org/dev/reference/dbSendQueryArrow.md)
to send a query to the database, and
[`dbFetchArrow()`](https://dbi.r-dbi.org/dev/reference/dbFetchArrow.md)
to fetch the result. This also allows using the new
[`dbBindArrow()`](https://dbi.r-dbi.org/dev/reference/dbBind.md) method
to bind data in Arrow format to a prepared query. Result objects must be
cleared with
[`dbClearResult()`](https://dbi.r-dbi.org/dev/reference/dbClearResult.md).

``` r
rs <- dbSendQueryArrow(con, "SELECT $a AS batch, * FROM tbl WHERE a < $a")

in_arrow <- nanoarrow::as_nanoarrow_array(data.frame(a = 1L))
dbBindArrow(rs, in_arrow)
as.data.frame(dbFetchArrow(rs))
```

    ## [1] batch a     b     c    
    ## <0 rows> (or 0-length row.names)

``` r
in_arrow <- nanoarrow::as_nanoarrow_array(data.frame(a = 2L))
dbBindArrow(rs, in_arrow)
as.data.frame(dbFetchArrow(rs))
```

    ##   batch a   b    c
    ## 1     2 1 4.5 five

``` r
in_arrow <- nanoarrow::as_nanoarrow_array(data.frame(a = 3L))
dbBindArrow(rs, in_arrow)
as.data.frame(dbFetchArrow(rs))
```

    ##   batch a   b    c
    ## 1     3 1 4.5 five
    ## 2     3 2 4.5 five

``` r
in_arrow <- nanoarrow::as_nanoarrow_array(data.frame(a = 1:4L))
dbBindArrow(rs, in_arrow)
as.data.frame(dbFetchArrow(rs))
```

    ##   batch a   b    c
    ## 1     2 1 4.5 five
    ## 2     3 1 4.5 five
    ## 3     3 2 4.5 five
    ## 4     4 1 4.5 five
    ## 5     4 2 4.5 five
    ## 6     4 3 4.5 five

``` r
dbClearResult(rs)
```

## Writing data

Streams returned by
[`dbGetQueryArrow()`](https://dbi.r-dbi.org/dev/reference/dbGetQueryArrow.md)
and
[`dbReadTableArrow()`](https://dbi.r-dbi.org/dev/reference/dbReadTableArrow.md)
can be written to a table using
[`dbWriteTableArrow()`](https://dbi.r-dbi.org/dev/reference/dbWriteTableArrow.md).

``` r
stream <- dbGetQueryArrow(con, "SELECT * FROM tbl WHERE a < 3")
dbWriteTableArrow(con, "tbl_new", stream)
dbReadTable(con, "tbl_new")
```

    ##   a   b    c
    ## 1 1 4.5 five
    ## 2 2 4.5 five

## Appending data

For more control over the writing process, use
[`dbCreateTableArrow()`](https://dbi.r-dbi.org/dev/reference/dbCreateTableArrow.md)
and
[`dbAppendTableArrow()`](https://dbi.r-dbi.org/dev/reference/dbAppendTableArrow.md).

``` r
stream <- dbGetQueryArrow(con, "SELECT * FROM tbl WHERE a < 3")
dbCreateTableArrow(con, "tbl_split", stream)
dbAppendTableArrow(con, "tbl_split", stream)
```

    ## [1] 2

``` r
stream <- dbGetQueryArrow(con, "SELECT * FROM tbl WHERE a >= 3")
dbAppendTableArrow(con, "tbl_split", stream)
```

    ## [1] 1

``` r
dbReadTable(con, "tbl_split")
```

    ##   a   b    c
    ## 1 1 4.5 five
    ## 2 2 4.5 five
    ## 3 3 4.5 five

## Conclusion

Do not forget to disconnect from the database when done.

``` r
dbDisconnect(con)
```

That concludes the major features of DBI’s new Arrow interface. For more
details on the library functions covered in this tutorial see the DBI
specification at
[`vignette("spec", package = "DBI")`](https://dbi.r-dbi.org/dev/articles/spec.md).
See the [adbi](https://adbi.r-dbi.org/) package for a backend with
native Arrow support, and
[nanoarrow](https://github.com/apache/arrow-nanoarrow) and
[arrow](https://arrow.apache.org/docs/r/) for packages to work with the
Arrow format.
