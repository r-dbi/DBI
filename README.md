# DBI

[![Build Status](https://travis-ci.org/rstats-db/DBI.png?branch=master)](https://travis-ci.org/rstats-db/DBI)

The DBI package defines a common interface between the R and database management systems (DBMS).  The interface defines a small set of classes and methods similar in spirit to Perl's [DBI](http://dbi.perl.org/), Java's [JDBC](http://www.oracle.com/technetwork/java/javase/jdbc/index.html), Python's [DB-API](http://www.python.org/dev/peps/pep-0249/), and Microsoft's [ODBC]((http://en.wikipedia.org/wiki/ODBC)). It defines a set of classes and methods defines what operations are possible and how they are performed:  

* connect/disconnect to the DBMS
* create and execute statements in the DBMS
* extract results/output from statements
* error/exception handling
* information (meta-data) from database objects
* transaction management (optional)

DBI separates the connectivity to the DBMS into a "front-end" and a "back-end".  Applications use only the exposed "front-end" API. The facilities that communicate with specific DBMSs (SQLite, MySQL, PostgreSQL, MonetDB, etc.) are provided by "drivers" (other packages) that get invoked automatically through S4 methods. 

The following example illustrates some of the DBI capabilities:

```R
library(DBI)
# Create an ephemeral in-memory RSQLite database
con <- dbConnect(RSQLite::SQLite(), dbname = ":memory:")

dbListTables(con)
dbWriteTable(con, "mtcars", mtcars)
dbListTables(con)

dbListFields(con, "mtcars")
dbReadTable(con, "mtcars")

# You can fetch all results:
res <- dbSendQuery(con, "SELECT * FROM mtcars WHERE cyl = 4")
dbFetch(res)
dbClearResult(res)

# Or a chunk at a time
res <- dbSendQuery(con, "SELECT * FROM mtcars WHERE cyl = 4")
while(!dbHasCompleted(res)){
  chunk <- dbFetch(res, n = 5)
  print(nrow(chunk))
}
dbClearResult(res)

dbDisconnect(con)
```

To install DBI:

* Get the released version from CRAN: `install.packages("DBI")`
* Get the development version from github: `devtools::install_github("rstats-db/DBI")`

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

## History

The following history of DBI was contributed by David James, the driving force behind the development of DBI, and many of the packages that implement it.

The idea/work of interfacing S (originally S3 and S4) to RDBMS goes back to the mid- and late 1990's in Bell Labs. The first toy interface I did was to implement John Chamber's early concept of "Data Management in S" (1991). The implementation followed that interface pretty closely and immediately showed some of the limitations when dealing with very large databases; if my memory serves me, the issue was the instance-based of the language back then, e.g., if you attached an RDBMS to the `search()` path and then needed to resolve a symbol "foo", you effectively had to bring all the objects in the database to check their mode/class, i.e., the instance object had the metadata in itself as attributes. The experiment showed that the S3 implementation of "data management" was not really suitable to large external RDBMS (probably it was never intended to do that anyway). (Note however, that since then, John and Duncan Temple Lang generalized the data management in S4 a lot, including Duncan's implementation in his [RObjectTables](http://www.omegahat.org/RObjectTables/) package where he considered a lot of synchronization/caching issues relevant to DBI and, more generally, to most external interfaces).

Back then we were working very closely with Lucent's microelectronics manufacturing --- our colleagues there had huge Oracle (mostly) databases that we needed to constantly query via [SQL*Plus](http://en.wikipedia.org/wiki/SQL*Plus). My colleague Jake Luciani was developing advanced applications in C and SQL, and the two of us came up with the first implementation of S3 directly connecting with Oracle.  What I remember is that the Linux [PRO*C](http://en.wikipedia.org/wiki/Pro*C) pre-compiler (that embedded SQL in C code) was very buggy --- we spent a lot of time looking for workarounds and tricks until we got the C interface running.  At the time, other projects within Bell Labs began using MySQL, and we moved to MySQL (with the help of Doug Bates' student Saikat DebRoy, then a summer intern) with no intentions of looking back at the very difficult Oracle interface.  It was at this time that I moved all the code from S3 methods to S4 classes and methods and begun reaching out to the S/R community for suggestions, ideas, etc.  All (most) of this work was on Bell Labs versions of S3 and S4, but I made sure it worked with S-Plus. At some point around 2000 (I don't remember exactly when), I ported all the code to R regressing to S3 methods, and later on (once S4 classes and methods were available in R) I re-implemented everything back to S4 classes and methods in R (a painful back-and-forth). It was at this point that I decided to drop S-Plus altogether.  Around that time, I came across a very early implementation of SQLite and I was quite interested and thought it was a very nice RDBMS that could be used for all kinds of experimentation, etc., so it was pretty easy to implement on top of the DBI.

Within the R community, there were quite a number of people that showed interest on defining a common interface to databases, but only a few folks actually provided code/suggestions/etc.  (Tim Keitt was most active with the dbi/PostgreSQL packages --- he also was considering what he called "proxy" objects, which was reminiscent of what Duncan had been doing).  Kurt Hornick, Vincent Carey, Robert Gentleman, and others provided suggestions/comments/support for the DBI definition. By around 2003, the DBI was more or less implemented as it is today.

I'm sure I'll forget some (most should be in the THANKS sections of the various packages), but the names that come to my mind at this moment are Jake Luciani (ROracle), Don MacQueen and other early ROracle users (super helpful), Doug Bates and his student Saikat DebRoy for RMySQL, Fei Chen (at the time a student of Prof. Ripley) also contributed to RMySQL, Tim Keitt (working on an early S3 interface to PostgrSQL), Torsten Hothorn (worked with mSQL and also MySQL), Prof. Ripley working/extending the RODBC package, in addition to John Chambers and Duncan Temple-Lang who provided very important comments and suggestions.

Actually, the real impetus behind the DBI was always to do distributed statistical computing --- *not* to provide a yet-another import/export mechanism --- and this perspective was driven by John and Duncan's vision and work on inter-system computing, COM, CORBA, etc.  I'm not sure many of us really appreciated (even now) the full extent of those ideas and concepts.  Just like in other languages (C's ODBC, Java's JDBC, Perl's DBI/DBD, Python dbapi), R/S DBI was meant to unify the interfacing to RDBMS so that R/S applications could be developed on top of the DBI and not be hard coded to any one relation database.  The interface I tried to follow the closest was the Python's DBAPI --- I haven't worked on this topic for a while, but I still feel Python's DBAPI is the cleanest and most relevant for the S language.
