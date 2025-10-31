# Set data mappings between an DBMS and R.

This generic is deprecated since no working implementation was ever
produced.

## Usage

``` r
dbSetDataMappings(res, flds, ...)
```

## Arguments

- res:

  An object inheriting from
  [DBI::DBIResult](https://dbi.r-dbi.org/dev/reference/DBIResult-class.md).

- flds:

  a field description object as returned by `dbColumnInfo`.

- ...:

  Other arguments passed on to methods.

## Details

Sets one or more conversion functions to handle the translation of DBMS
data types to R objects. This is only needed for non-primitive data,
since all DBI drivers handle the common base types (integers, numeric,
strings, etc.)

The details on conversion functions (e.g., arguments, whether they can
invoke initializers and/or destructors) have not been specified.
