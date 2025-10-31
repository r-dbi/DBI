# DBIDriver class

Base class for all DBMS drivers (e.g., RSQLite, MySQL, PostgreSQL). The
virtual class `DBIDriver` defines the operations for creating
connections and defining data type mappings. Actual driver classes, for
instance `RPostgres`, `RMariaDB`, etc. implement these operations in a
DBMS-specific manner.

## See also

Other DBI classes:
[`DBIConnection-class`](https://dbi.r-dbi.org/dev/reference/DBIConnection-class.md),
[`DBIConnector-class`](https://dbi.r-dbi.org/dev/reference/DBIConnector-class.md),
[`DBIObject-class`](https://dbi.r-dbi.org/dev/reference/DBIObject-class.md),
[`DBIResult-class`](https://dbi.r-dbi.org/dev/reference/DBIResult-class.md),
[`DBIResultArrow-class`](https://dbi.r-dbi.org/dev/reference/DBIResultArrow-class.md)

Other DBIDriver generics:
[`dbCanConnect()`](https://dbi.r-dbi.org/dev/reference/dbCanConnect.md),
[`dbConnect()`](https://dbi.r-dbi.org/dev/reference/dbConnect.md),
[`dbDataType()`](https://dbi.r-dbi.org/dev/reference/dbDataType.md),
[`dbDriver()`](https://dbi.r-dbi.org/dev/reference/dbDriver.md),
[`dbGetInfo()`](https://dbi.r-dbi.org/dev/reference/dbGetInfo.md),
[`dbIsReadOnly()`](https://dbi.r-dbi.org/dev/reference/dbIsReadOnly.md),
[`dbIsValid()`](https://dbi.r-dbi.org/dev/reference/dbIsValid.md),
[`dbListConnections()`](https://dbi.r-dbi.org/dev/reference/dbListConnections.md)
