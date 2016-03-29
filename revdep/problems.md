# Setup

## Platform

|setting  |value                                       |
|:--------|:-------------------------------------------|
|version  |R version 3.2.4 Revised (2016-03-16 r70336) |
|system   |x86_64, linux-gnu                           |
|ui       |X11                                         |
|language |en_US:en                                    |
|collate  |en_US.UTF-8                                 |
|tz       |NA                                          |
|date     |2016-03-29                                  |

## Packages

|package  |*  |version    |date       |source                |
|:--------|:--|:----------|:----------|:---------------------|
|DBI      |   |0.3.1.9008 |2016-03-29 |local (rstats-db/DBI) |
|knitr    |   |1.12.3     |2016-01-22 |CRAN (R 3.2.3)        |
|testthat |   |0.11.0     |2015-10-14 |CRAN (R 3.2.3)        |

# Check results
14 packages with problems

## aroma.affymetrix (3.0.0)
Maintainer: Henrik Bengtsson <henrikb@braju.com>  
Bug reports: https://github.com/HenrikBengtsson/aroma.affymetrix/issues

1 error  | 0 warnings | 1 note 

```
checking whether package ‘aroma.affymetrix’ can be installed ... ERROR
Installation failed.
See ‘/home/muelleki/git/R/DBI/revdep/checks/aroma.affymetrix.Rcheck/00install.out’ for details.

checking package dependencies ... NOTE
Packages suggested but not available for checking:
  ‘affxparser’ ‘affyPLM’ ‘gcrma’ ‘oligo’ ‘oligoClasses’ ‘pdInfoBuilder’
  ‘AffymetrixDataTestFiles’
```

## dplyr (0.4.3)
Maintainer: Hadley Wickham <hadley@rstudio.com>  
Bug reports: https://github.com/hadley/dplyr/issues

0 errors | 1 warning  | 2 notes

```
checking Rd cross-references ... WARNING
package ‘microbenchmark’ exists but was not installed under R >= 2.10.0 so xrefs cannot be checked

checking installed package size ... NOTE
  installed size is 22.6Mb
  sub-directories of 1Mb or more:
    libs  20.5Mb

checking re-building of vignette outputs ... NOTE
Error in re-building vignettes:
  ...

Attaching package: 'dplyr'

The following objects are masked from 'package:stats':

    filter, lag

The following objects are masked from 'package:base':

    intersect, setdiff, setequal, union

Quitting from lines 217-220 (databases.Rmd) 
Error: processing vignette 'databases.Rmd' failed with diagnostics:
RS-DBI driver: (could not connect muelleki@local on dbname "nycflights13"
)
Execution halted

```

## ora (2.0-1)
Maintainer: Arni Magnusson <arnima@hafro.is>

1 error  | 0 warnings | 0 notes

```
checking package dependencies ... ERROR
Package required but not available: ‘ROracle’

See section ‘The DESCRIPTION file’ in the ‘Writing R Extensions’
manual.
```

## RJDBC (0.2-5)
Maintainer: Simon Urbanek <Simon.Urbanek@r-project.org>

0 errors | 1 warning  | 1 note 

```
checking for missing documentation entries ... WARNING
Undocumented S4 methods:
  generic 'dbDataType' and siglist 'JDBCConnection,ANY'
All user-level objects in a package (including S4 classes and methods)
should have documentation entries.
See chapter ‘Writing R documentation files’ in the ‘Writing R
Extensions’ manual.

checking top-level files ... NOTE
Non-standard file/directory found at top level:
  ‘java-src’
```

## RMySQL (0.10.8)
Maintainer: Jeroen Ooms <jeroen.ooms@stat.ucla.edu>  
Bug reports: https://github.com/rstats-db/rmysql/issues

1 error  | 1 warning  | 0 notes

```
checking tests ... ERROR
Running the tests in ‘tests/testthat.R’ failed.
Last 13 lines of output:
         .Internal(.dfltWarn(message, call))
     }, muffleWarning = function() NULL)
  15: withOneRestart(expr, restarts[[1L]])
  
  testthat results ================================================================
  OK: 0 SKIPPED: 0 FAILED: 4
  1. Error: options work 
  2. Error: query returns expected number of rows 
  3. Error: correctly computes affected rows 
  4. Error: basic roundtrip is succesful 
  
  Error: testthat unit tests failed
  Execution halted

checking for missing documentation entries ... WARNING
Undocumented S4 methods:
  generic 'dbDataType' and siglist 'MySQLConnection,ANY'
  generic 'dbDataType' and siglist 'MySQLDriver,ANY'
All user-level objects in a package (including S4 classes and methods)
should have documentation entries.
See chapter ‘Writing R documentation files’ in the ‘Writing R
Extensions’ manual.
```

## ROracle (1.2-2)
Maintainer: Rajendra S. Pingte <rajendra.pingte@oracle.com>

1 error  | 0 warnings | 0 notes

```
checking whether package ‘ROracle’ can be installed ... ERROR
Installation failed.
See ‘/home/muelleki/git/R/DBI/revdep/checks/ROracle.Rcheck/00install.out’ for details.
```

## RPostgreSQL (0.4)
Maintainer: Tomoaki Nishiyama <tomoakin@staff.kanazawa-u.ac.jp>

0 errors | 1 warning  | 2 notes

```
checking for missing documentation entries ... WARNING
Undocumented S4 methods:
  generic 'dbDataType' and siglist 'PostgreSQLObject,ANY'
All user-level objects in a package (including S4 classes and methods)
should have documentation entries.
See chapter ‘Writing R documentation files’ in the ‘Writing R
Extensions’ manual.

checking top-level files ... NOTE
Non-standard files/directories found at top level:
  ‘config.guess’ ‘config.sub’ ‘install-sh’

checking Rd line widths ... NOTE
Rd file 'postgresqlBuildTableDefinition.Rd':
  \usage lines wider than 90 characters:
     postgresqlBuildTableDefinition(dbObj, name, obj, field.types = NULL, row.names = TRUE, ...)

Rd file 'postgresqlSupport.Rd':
  \usage lines wider than 90 characters:
        postgresqlNewConnection(drv, user, password, host, dbname, port, tty, options, forceISOdate = TRUE)

These lines will be truncated in the PDF manual.
```

## RPresto (1.2.0)
Maintainer: Onur Ismail Filiz <onur@fb.com>  
Bug reports: https://github.com/prestodb/RPresto/issues

1 error  | 1 warning  | 0 notes

```
checking tests ... ERROR
Running the tests in ‘tests/testthat.R’ failed.
Last 13 lines of output:
  Component "<odd_name>": 1 string mismatch
  
  testthat results ================================================================
  OK: 203 SKIPPED: 24 FAILED: 5
  1. Failure (at test-dbFetch.R#211): dbFetch rbind works correctly 
  2. Failure (at test-dbFetch.R#260): dbFetch rbind works with zero row chunks 
  3. Failure (at test-extract.data.R#67): extract.data works 
  4. Failure (at test-json_tabular_to_data_frame.R#129): regular data is converted correctly 
  5. Failure (at test-json_tabular_to_data_frame.R#163): regular data is converted correctly 
  
  Error: testthat unit tests failed
  In addition: There were 22 warnings (use warnings() to see them)
  Execution halted

checking for missing documentation entries ... WARNING
Undocumented S4 methods:
  generic 'dbDataType' and siglist 'PrestoDriver,ANY'
All user-level objects in a package (including S4 classes and methods)
should have documentation entries.
See chapter ‘Writing R documentation files’ in the ‘Writing R
Extensions’ manual.
```

## RQDA (0.2-7)
Maintainer: HUANG Ronggui <ronggui.huang@gmail.com>

1 error  | 0 warnings | 1 note 

```
checking whether package ‘RQDA’ can be installed ... ERROR
Installation failed.
See ‘/home/muelleki/git/R/DBI/revdep/checks/RQDA.Rcheck/00install.out’ for details.

checking package dependencies ... NOTE
Packages which this enhances but not available for checking:
  ‘rjpod’ ‘d3Network’
```

## RSQLite (1.0.0)
Maintainer: Hadley Wickham <hadley@rstudio.com>  
Bug reports: https://github.com/rstats-db/RSQLite/issues

0 errors | 1 warning  | 0 notes

```
checking for missing documentation entries ... WARNING
Undocumented S4 methods:
  generic 'dbDataType' and siglist 'SQLiteConnection,ANY'
  generic 'dbDataType' and siglist 'SQLiteDriver,ANY'
All user-level objects in a package (including S4 classes and methods)
should have documentation entries.
See chapter ‘Writing R documentation files’ in the ‘Writing R
Extensions’ manual.
```

## RSQLServer (0.2.0)
Maintainer: Imanuel Costigan <i.costigan@me.com>  
Bug reports: https://github.com/imanuelcostigan/RSQLServer/issues

0 errors | 1 warning  | 0 notes

```
checking for missing documentation entries ... WARNING
Undocumented S4 methods:
  generic 'dbDataType' and siglist 'SQLServerConnection,ANY'
All user-level objects in a package (including S4 classes and methods)
should have documentation entries.
See chapter ‘Writing R documentation files’ in the ‘Writing R
Extensions’ manual.
```

## sqldf (0.4-10)
Maintainer: G. Grothendieck <ggrothendieck@gmail.com>  
Bug reports: http://groups.google.com/group/sqldf

0 errors | 1 warning  | 1 note 

```
checking whether package ‘sqldf’ can be installed ... WARNING
Found the following significant warnings:
  Warning: no DISPLAY variable so Tk is not available
See ‘/home/muelleki/git/R/DBI/revdep/checks/sqldf.Rcheck/00install.out’ for details.

checking dependencies in R code ... NOTE
'library' or 'require' call to ‘tcltk’ in package code.
  Please use :: or requireNamespace() instead.
  See section 'Suggested packages' in the 'Writing R Extensions' manual.
```

## TSdata (2015.4-2)
Maintainer: Paul Gilbert <pgilbert.ttv9z@ncf.ca>

1 error  | 0 warnings | 1 note 

```
checking running R code from vignettes ... ERROR
Errors in running code in vignettes:
when running code in ‘Guide.Stex’
  ...
Mar 29, 2016 6:13:14 PM it.bancaditalia.oss.sdmx.client.RestSdmxClient runQuery
INFO: Contacting web service with query: http://stats.oecd.org/restsdmx/sdmx.ashx//GetData/QNA/CAN.PPPGDP.CARSA.Q?format=compact_v2
Mar 29, 2016 6:13:14 PM it.bancaditalia.oss.sdmx.client.RestSdmxClient runQuery
SEVERE: Connection failed. HTTP error code : 404, message: Not Found
SDMX meaning: No results matching the query.

... 6 lines ...
  ...

> user <- Sys.getenv("MYSQL_USER")

> setup <- RMySQL::dbConnect(RMySQL::MySQL(), dbname = "test")

> TSsql::removeTSdbTables(setup, yesIknowWhatIamDoing = TRUE)

  When sourcing ‘GuideAppendix.R’:
Error: corrupt resultSet, missing fieldDescription
Execution halted

checking re-building of vignette outputs ... NOTE
Error in re-building vignettes:
  ...
Loading required package: TSdbi
Mar 29, 2016 6:13:18 PM it.bancaditalia.oss.sdmx.util.Configuration init
INFO: Configuration file: /home/muelleki/R-revdep/RJSDMX/configuration.properties
Mar 29, 2016 6:13:18 PM it.bancaditalia.oss.sdmx.client.RestSdmxClient runQuery
INFO: Contacting web service with query: http://stats.oecd.org/restsdmx/sdmx.ashx//GetDataStructure/QNA
Mar 29, 2016 6:13:19 PM it.bancaditalia.oss.sdmx.client.RestSdmxClient runQuery
INFO: Contacting web service with query: http://stats.oecd.org/restsdmx/sdmx.ashx//GetDataStructure/QNA
Mar 29, 2016 6:13:19 PM it.bancaditalia.oss.sdmx.client.RestSdmxClient runQuery
INFO: Contacting web service with query: http://stats.oecd.org/restsdmx/sdmx.ashx//GetData/QNA/CAN.PPPGDP.CARSA.Q?format=compact_v2
Mar 29, 2016 6:13:19 PM it.bancaditalia.oss.sdmx.client.RestSdmxClient runQuery
SEVERE: Connection failed. HTTP error code : 404, message: Not Found
SDMX meaning: No results matching the query.

Error: processing vignette 'Guide.Stex' failed with diagnostics:
 chunk 3 
Error in .local(serIDs, con, ...) : 
  QNA.CAN.PPPGDP.CARSA.Q error: it.bancaditalia.oss.sdmx.util.SdmxException: Connection failed. HTTP error code : 404, message: Not Found
SDMX meaning: No results matching the query.
Execution halted

```

## vmsbase (2.1)
Maintainer: Lorenzo D'Andrea <support@vmsbase.org>

1 error  | 0 warnings | 0 notes

```
checking whether package ‘vmsbase’ can be installed ... ERROR
Installation failed.
See ‘/home/muelleki/git/R/DBI/revdep/checks/vmsbase.Rcheck/00install.out’ for details.
```

