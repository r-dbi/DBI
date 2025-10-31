# DBI: R Database Interface

DBI defines an interface for communication between R and relational
database management systems. All classes in this package are virtual and
need to be extended by the various R/DBMS implementations (so-called
*DBI backends*).

## Definition

A DBI backend is an R package which imports the DBI and methods
packages. For better or worse, the names of many existing backends start
with ‘R’, e.g., RSQLite, RMySQL, RSQLServer; it is up to the backend
author to adopt this convention or not.

## DBI classes and methods

A backend defines three classes, which are subclasses of
[DBI::DBIDriver](https://dbi.r-dbi.org/dev/reference/DBIDriver-class.md),
[DBI::DBIConnection](https://dbi.r-dbi.org/dev/reference/DBIConnection-class.md),
and
[DBI::DBIResult](https://dbi.r-dbi.org/dev/reference/DBIResult-class.md).
The backend provides implementation for all methods of these base
classes that are defined but not implemented by DBI. All methods defined
in DBI are reexported (so that the package can be used without having to
attach DBI), and have an ellipsis `...` in their formals for
extensibility.

## Construction of the DBIDriver object

The backend must support creation of an instance of its
[DBI::DBIDriver](https://dbi.r-dbi.org/dev/reference/DBIDriver-class.md)
subclass with a constructor function. By default, its name is the
package name without the leading ‘R’ (if it exists), e.g., `SQLite` for
the RSQLite package. However, backend authors may choose a different
name. The constructor must be exported, and it must be a function that
is callable without arguments. DBI recommends to define a constructor
with an empty argument list.

## See also

Important generics:
[`dbConnect()`](https://dbi.r-dbi.org/dev/reference/dbConnect.md),
[`dbGetQuery()`](https://dbi.r-dbi.org/dev/reference/dbGetQuery.md),
[`dbReadTable()`](https://dbi.r-dbi.org/dev/reference/dbReadTable.md),
[`dbWriteTable()`](https://dbi.r-dbi.org/dev/reference/dbWriteTable.md),
[`dbDisconnect()`](https://dbi.r-dbi.org/dev/reference/dbDisconnect.md)

Formal specification (currently work in progress and incomplete):
[`vignette("spec", package = "DBI")`](https://dbi.r-dbi.org/dev/articles/spec.md)

## Author

**Maintainer**: Kirill Müller <kirill@cynkra.com>
([ORCID](https://orcid.org/0000-0002-1416-3412))

Authors:

- R Special Interest Group on Databases (R-SIG-DB)

- Hadley Wickham

Other contributors:

- R Consortium \[funder\]

## Examples

``` r
RSQLite::SQLite()
#> <SQLiteDriver>
```
