# DBI

The DBI package provides a common set of classes and methods used to provide a consistent interface for all database packages in R. DBI does very little, but it plays an important role in establishing standards that all database connectors should adhere to.

To install DBI:

* Get the released version from CRAN: `install.packages("DBI")`
* Get the development version from github: `devtools::install_github("DBI", "R-DBI")`

Discussions associated with DBI and related database packages take place on [R-SIG-DB](https://stat.ethz.ch/mailman/listinfo/r-sig-db).

## History

DBI was originally developed for S, and for a long time strived to be usable from both R, S and S-plus. Many people have contributed to the development of DBI and without their contributions R would not have such a rich set of database connectors:

* David James
* Duncan Temple Lang 
* Seth Falcon

(Can you improve this history of DBI? Please let me know!)