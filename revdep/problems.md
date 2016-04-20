# Setup

## Platform

|setting  |value                        |
|:--------|:----------------------------|
|version  |R version 3.2.5 (2016-04-14) |
|system   |x86_64, linux-gnu            |
|ui       |X11                          |
|language |en_US:en                     |
|collate  |en_US.UTF-8                  |
|tz       |NA                           |
|date     |2016-04-20                   |

## Packages

|package  |*  |version    |date       |source                |
|:--------|:--|:----------|:----------|:---------------------|
|DBI      |   |0.3.1.9009 |2016-04-20 |local (rstats-db/DBI) |
|knitr    |   |1.12.3     |2016-01-22 |CRAN (R 3.2.3)        |
|testthat |   |1.0.0      |2016-04-14 |CRAN (R 3.2.4)        |

# Check results
12 packages with problems

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

## oce (0.9-18)
Maintainer: Dan Kelley <Dan.Kelley@Dal.Ca>  
Bug reports: https://github.com/dankelley/oce/issues?
        sort=created&direction=desc&state=open

1 error  | 0 warnings | 0 notes

```
checking tests ... ERROR
Running the tests in ‘tests/testthat.R’ failed.
Last 13 lines of output:
  `cs` not equal to `cs2`.
  Component "longitude": names for current but not for target
  Component "latitude": names for current but not for target
  
  
  testthat results ================================================================
  OK: 538 SKIPPED: 1 FAILED: 1
  1. Failure: lonlat2map() near Cape Split (@test_map.R#62) 
  
  Error: testthat unit tests failed
  In addition: Warning message:
  Deprecated: please use `expect_lt()` instead 
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

## ProjectTemplate (0.6)
Maintainer: Kirill Mueller <krlmlr+r@mailbox.org>  
Bug reports: https://github.com/johnmyleswhite/ProjectTemplate/issues

1 error  | 0 warnings | 1 note 

```
checking tests ... ERROR
Running the tests in ‘tests/run-all.R’ failed.
Last 13 lines of output:
  
  
  testthat results ================================================================
  OK: 307 SKIPPED: 0 FAILED: 6
  1. Error: All elements have length 1 (@test-load.R#4) 
  2. Failure: Test full project into existing directory (@test-overwrite.R#5) 
  3. Error: Test full project into existing directory (@test-overwrite.R#9) 
  4. Failure: Test minimal project into existing directory with an unrelated entry (@test-overwrite.R#45) 
  5. Error: Test minimal project into existing directory with an unrelated entry (@test-overwrite.R#53) 
  6. Failure: Test failure creating project into existing directory with an unrelated entry if merge.existing is not set (@test-overwrite.R#75) 
  
  Error: testthat unit tests failed
  Execution halted

checking DESCRIPTION meta-information ... NOTE
Malformed Title field: should not end in a period.
```

## RMySQL (0.10.8)
Maintainer: Jeroen Ooms <jeroen.ooms@stat.ucla.edu>  
Bug reports: https://github.com/rstats-db/rmysql/issues

1 error  | 0 warnings | 0 notes

```
checking tests ... ERROR
Running the tests in ‘tests/testthat.R’ failed.
Last 13 lines of output:
  1. Failure: options work (@test-dbWriteTable.R#16) -----------------------------
  dbReadTable(con, "dat") not equal to `expected`.
  Attributes: < Component "row.names": Numeric: lengths (0, 4) differ >
  Component "a": Numeric: lengths (0, 4) differ
  Component "b": Lengths (0, 4) differ (string compare on first 0)
  
  
  testthat results ================================================================
  OK: 15 SKIPPED: 0 FAILED: 1
  1. Failure: options work (@test-dbWriteTable.R#16) 
  
  Error: testthat unit tests failed
  Execution halted
```

## ROracle (1.2-2)
Maintainer: Rajendra S. Pingte <rajendra.pingte@oracle.com>

1 error  | 0 warnings | 0 notes

```
checking whether package ‘ROracle’ can be installed ... ERROR
Installation failed.
See ‘/home/muelleki/git/R/DBI/revdep/checks/ROracle.Rcheck/00install.out’ for details.
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

## storr (1.0.0)
Maintainer: Rich FitzJohn <rich.fitzjohn@gmail.com>

1 error  | 0 warnings | 1 note 

```
checking examples ... ERROR
Running examples in ‘storr-Ex.R’ failed
The error most likely occurred in:

> base::assign(".ptime", proc.time(), pos = "CheckExEnv")
> ### Name: test_driver
> ### Title: Test a storr driver
> ### Aliases: test_driver
> 
> ### ** Examples
> 
> ## Testing the environment driver is nice and fast:
> if (requireNamespace("testthat")) {
+   test_driver(function() driver_environment())
+ }
Loading required namespace: testthat
Error in test_driver(function() driver_environment()) : 
  attempt to apply non-function
Execution halted

checking re-building of vignette outputs ... NOTE
Error in re-building vignettes:
  ...
Quitting from lines 419-420 (drivers.Rmd) 
Error: processing vignette 'drivers.Rmd' failed with diagnostics:
attempt to apply non-function
Execution halted

```

## TSdata (2015.4-2)
Maintainer: Paul Gilbert <pgilbert.ttv9z@ncf.ca>

1 error  | 0 warnings | 1 note 

```
checking running R code from vignettes ... ERROR
Errors in running code in vignettes:
when running code in ‘Guide.Stex’
  ...
Apr 20, 2016 9:55:34 PM it.bancaditalia.oss.sdmx.client.RestSdmxClient runQuery
INFO: Contacting web service with query: http://stats.oecd.org/restsdmx/sdmx.ashx//GetData/QNA/CAN.PPPGDP.CARSA.Q?format=compact_v2
Apr 20, 2016 9:55:34 PM it.bancaditalia.oss.sdmx.client.RestSdmxClient runQuery
SEVERE: Connection failed. HTTP error code : 404, message: Not Found
SDMX meaning: No results matching the query.

  When sourcing ‘Guide.R’:
Error: QNA.CAN.PPPGDP.CARSA.Q error: it.bancaditalia.oss.sdmx.util.SdmxException: Connection failed. HTTP error code : 404, message: Not Found
SDMX meaning: No results matching the query.
Execution halted


checking re-building of vignette outputs ... NOTE
Error in re-building vignettes:
  ...
Loading required package: TSdbi
Apr 20, 2016 9:55:43 PM it.bancaditalia.oss.sdmx.util.Configuration init
INFO: Configuration file: /home/muelleki/R-revdep/RJSDMX/configuration.properties
Apr 20, 2016 9:55:43 PM it.bancaditalia.oss.sdmx.client.RestSdmxClient runQuery
INFO: Contacting web service with query: http://stats.oecd.org/restsdmx/sdmx.ashx//GetDataStructure/QNA
Apr 20, 2016 9:55:44 PM it.bancaditalia.oss.sdmx.client.RestSdmxClient runQuery
INFO: Contacting web service with query: http://stats.oecd.org/restsdmx/sdmx.ashx//GetDataStructure/QNA
Apr 20, 2016 9:55:45 PM it.bancaditalia.oss.sdmx.client.RestSdmxClient runQuery
INFO: Contacting web service with query: http://stats.oecd.org/restsdmx/sdmx.ashx//GetData/QNA/CAN.PPPGDP.CARSA.Q?format=compact_v2
Apr 20, 2016 9:55:45 PM it.bancaditalia.oss.sdmx.client.RestSdmxClient runQuery
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

