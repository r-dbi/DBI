# Load and unload database drivers

These methods are deprecated, please consult the documentation of the
individual backends for the construction of driver instances.

`dbDriver()` is a helper method used to create an new driver object
given the name of a database or the corresponding R package. It works
through convention: all DBI-extending packages should provide an
exported object with the same name as the package. `dbDriver()` just
looks for this object in the right places: if you know what database you
are connecting to, you should call the function directly.

`dbUnloadDriver()` is not implemented for modern backends.

## Usage

``` r
dbDriver(drvName, ...)

dbUnloadDriver(drv, ...)
```

## Arguments

- drvName:

  character name of the driver to instantiate.

- ...:

  any other arguments are passed to the driver `drvName`.

- drv:

  an object that inherits from `DBIDriver` as created by `dbDriver`.

## Value

In the case of `dbDriver`, an driver object whose class extends
`DBIDriver`. This object may be used to create connections to the actual
DBMS engine.

In the case of `dbUnloadDriver`, a logical indicating whether the
operation succeeded or not.

## Details

The client part of the database communication is initialized (typically
dynamically loading C code, etc.) but note that connecting to the
database engine itself needs to be done through calls to `dbConnect`.

## See also

Other DBIDriver generics:
[`DBIDriver-class`](https://dbi.r-dbi.org/dev/reference/DBIDriver-class.md),
[`dbCanConnect()`](https://dbi.r-dbi.org/dev/reference/dbCanConnect.md),
[`dbConnect()`](https://dbi.r-dbi.org/dev/reference/dbConnect.md),
[`dbDataType()`](https://dbi.r-dbi.org/dev/reference/dbDataType.md),
[`dbGetInfo()`](https://dbi.r-dbi.org/dev/reference/dbGetInfo.md),
[`dbIsReadOnly()`](https://dbi.r-dbi.org/dev/reference/dbIsReadOnly.md),
[`dbIsValid()`](https://dbi.r-dbi.org/dev/reference/dbIsValid.md),
[`dbListConnections()`](https://dbi.r-dbi.org/dev/reference/dbListConnections.md)

Other DBIDriver generics:
[`DBIDriver-class`](https://dbi.r-dbi.org/dev/reference/DBIDriver-class.md),
[`dbCanConnect()`](https://dbi.r-dbi.org/dev/reference/dbCanConnect.md),
[`dbConnect()`](https://dbi.r-dbi.org/dev/reference/dbConnect.md),
[`dbDataType()`](https://dbi.r-dbi.org/dev/reference/dbDataType.md),
[`dbGetInfo()`](https://dbi.r-dbi.org/dev/reference/dbGetInfo.md),
[`dbIsReadOnly()`](https://dbi.r-dbi.org/dev/reference/dbIsReadOnly.md),
[`dbIsValid()`](https://dbi.r-dbi.org/dev/reference/dbIsValid.md),
[`dbListConnections()`](https://dbi.r-dbi.org/dev/reference/dbListConnections.md)

## Examples

``` r
# Create a RSQLite driver with a string
d <- dbDriver("SQLite")
d
#> <SQLiteDriver>

# But better, access the object directly
RSQLite::SQLite()
#> <SQLiteDriver>
```
