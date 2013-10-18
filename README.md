# DBI

The DBI package defines a common interface between the R and database management systems (DBMS).  The interface defines a small set of classes and methods similar in spirit to Perl's [DBI](http://dbi.perl.org/), Java's [JDBC](http://www.oracle.com/technetwork/java/javase/jdbc/index.html), Python's [DB-API](http://www.python.org/dev/peps/pep-0249/), and Microsoft's [ODBC]((http://en.wikipedia.org/wiki/ODBC)). It defines a set of classes and methods defines what operations are possible and how they are performed:  

* connect/disconnect to the DBMS
* create and execute statements in the DBMS
* extract results/output from statements
* error/exception handling
* information (meta-data) from database objects
* transaction management (optional)

DBI separates the connectivity to the DBMS into a "front-end" and a "back-end".  Applications use only the exposed "front-end"" API.  The facilities that communicate with specific DBMS (SQLite, MySQL, PostgreSQL, MonetDB, etc.) are provided by "drivers" (other packages) that get invoked automatically through S4 methods. The following example illustrates some of the DBI capabilities:

```R
library(RSQLite)
# Create a temporary RSQLite database
con <- dbConnect(dbDriver("RSQLite"), dbname = tempfile())

dbListTables(con)
dbWriteTable(con, "mtcars", mtcars)
dbListTables(con)

dbListFields(con, "mtcars")
dbReadTable(con, "mtcars")

# The interface allows lower-level interface to the DBMS
res <- dbSendQuery("SELECT * FROM mtcars WHERE cyl = 4")
fetch(res)
while(!dbHasCompleted(res)){
   chunk <- fetch(res, n = 10000)
   out <- c(out, doit(chunk))
}

# Free up resources
dbClearResult(res)
dbDisconnect(con)
```

To install DBI:

* Get the released version from CRAN: `install.packages("DBI")`
* Get the development version from github: `devtools::install_github("DBI", "rstats-db")`

Discussions associated with DBI and related database packages take place on [R-SIG-DB](https://stat.ethz.ch/mailman/listinfo/r-sig-db).

## Class structure

There are four main DBI classes. Three which are each extended by individual database backends:

* `DBIObject`: a common base class for all DBI.

* `DBIDriver`: a base class representing overall DBMS properties. 
  Typically generator functions instantiate the driver objects like `RSQLite()`,
  `RPostgreSQL()`, `RMySQL()` etc.

* `DBIConnection`: represents a connection to a specific database

* `DBIResult`: the result of a DBMS query or statement.  

All classes are _virtual_: they cannot be instantiated directly and instead must be subclassed.

## Development notes

To correctly build the documentation for DBI you'll need the development version of roxygen, which you can get with `devtools::install_github("roxygen", "klutometis")`.

## History

DBI was originally developed for S, and for a long time strived to be usable from both R, S and S-plus. Many people have contributed to the development of DBI and without their contributions R would not have such a rich set of database connectors:

* David James
* Duncan Temple Lang 
* Seth Falcon

(Can you improve this history of DBI? Please let me know!)
