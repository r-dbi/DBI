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
61 packages

## archivist (2.0.3)
Maintainer: Przemyslaw Biecek <przemyslaw.biecek@gmail.com>  
Bug reports: https://github.com/pbiecek/archivist/issues

0 errors | 0 warnings | 0 notes

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

## BatchExperiments (1.4.1)
Maintainer: Michel Lang <michellang@gmail.com>  
Bug reports: https://github.com/tudo-r/BatchExperiments/issues

0 errors | 0 warnings | 1 note 

```
checking dependencies in R code ... NOTE
Unexported objects imported by ':::' calls:
  ‘BatchJobs:::addIntModulo’ ‘BatchJobs:::buffer’
  ‘BatchJobs:::checkDir’ ‘BatchJobs:::checkId’ ‘BatchJobs:::checkIds’
  ‘BatchJobs:::checkPart’ ‘BatchJobs:::createShardedDirs’
  ‘BatchJobs:::dbConnectToJobsDB’ ‘BatchJobs:::dbCreateJobStatusTable’
  ‘BatchJobs:::dbDoQuery’ ‘BatchJobs:::dbFindDone’
  ‘BatchJobs:::dbFindRunning’ ‘BatchJobs:::dbRemoveJobs’
  ‘BatchJobs:::dbSelectWithIds’ ‘BatchJobs:::getJobDirs’
  ‘BatchJobs:::getJobInfoInternal’ ‘BatchJobs:::getKillJob’
  ‘BatchJobs:::getListJobs’ ‘BatchJobs:::getRandomSeed’
  ‘BatchJobs:::getResult’ ‘BatchJobs:::isRegistryDir’
  ‘BatchJobs:::makeRegistryInternal’ ‘BatchJobs:::saveRegistry’
  ‘BatchJobs:::seeder’ ‘BatchJobs:::syncRegistry’
  See the note in ?`:::` about the use of this operator.
```

## BatchJobs (1.6)
Maintainer: Bernd Bischl <bernd_bischl@gmx.net>  
Bug reports: https://github.com/tudo-r/BatchJobs/issues

0 errors | 0 warnings | 0 notes

## biglm (0.9-1)
Maintainer: Thomas Lumley <tlumley@u.washington.edu>

0 errors | 0 warnings | 5 notes

```
checking DESCRIPTION meta-information ... NOTE
Malformed Description field: should contain one or more complete sentences.

checking top-level files ... NOTE
Non-standard file/directory found at top level:
  ‘test’

checking dependencies in R code ... NOTE
Packages in Depends field not imported from:
  ‘DBI’ ‘methods’
  These packages need to be imported from (in the NAMESPACE file)
  for when this namespace is loaded but not attached.

checking foreign function calls ... NOTE
Call with DUP:
   .Fortran("regcf", as.integer(p), as.integer(p * p/2), bigQR$D, 
       bigQR$rbar, bigQR$thetab, bigQR$tol, beta = numeric(p), nreq = as.integer(nvar), 
       ier = integer(1), DUP = FALSE)
DUP is no longer supported and will be ignored.

checking R code for possible problems ... NOTE
bigglm.RODBC: no visible global function definition for ‘odbcQuery’
bigglm.RODBC : chunk: no visible global function definition for
  ‘odbcQuery’
bigglm.RODBC : chunk: no visible global function definition for
  ‘sqlGetResults’
bigglm,ANY-DBIConnection : .local: no visible global function
  definition for ‘dbSendQuery’
bigglm,ANY-DBIConnection : .local: no visible global function
  definition for ‘dbClearResult’
bigglm,ANY-DBIConnection : .local : chunk: no visible global function
  definition for ‘dbClearResult’
bigglm,ANY-DBIConnection : .local : chunk: no visible global function
  definition for ‘dbSendQuery’
bigglm,ANY-DBIConnection : .local : chunk: no visible global function
  definition for ‘fetch’

Found the following calls to data() loading into the global environment:
File ‘biglm/R/bigglm.R’:
  data(reset = TRUE)
  data(reset = FALSE)
See section ‘Good practice’ in ‘?data’.
```

## CITAN (2015.12-2)
Maintainer: Marek Gagolewski <gagolews@ibspan.waw.pl>  
Bug reports: https://github.com/Rexamine/CITAN/issues

0 errors | 0 warnings | 0 notes

## datamap (0.1-1)
Maintainer: Jeffrey Horner <jeffrey.horner@gmail.com>

0 errors | 0 warnings | 2 notes

```
checking dependencies in R code ... NOTE
Package in Depends field not imported from: ‘DBI’
  These packages need to be imported from (in the NAMESPACE file)
  for when this namespace is loaded but not attached.

checking R code for possible problems ... NOTE
.onLoad : <anonymous>: no visible global function definition for
  ‘dbConnect’
.onLoad : <anonymous>: no visible global function definition for
  ‘dbListTables’
.onLoad : <anonymous>: no visible global function definition for
  ‘dbExistsTable’
.onLoad : <anonymous>: no visible global function definition for
  ‘dbReadTable’
.onLoad : <anonymous>: no visible global function definition for
  ‘dbWriteTable’
.onLoad : <anonymous>: no visible global function definition for
  ‘dbDisconnect’
.onLoad : <anonymous>: no visible global function definition for
  ‘dbRemoveTable’

Found the following calls to attach():
File ‘datamap/R/datamap.R’:
  attach(.Call("CreateUserDB", map, PACKAGE = "datamap"), pos, 
    name, warn.conflicts)
See section ‘Good practice’ in ‘?attach’.
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

## emuR (0.1.7)
Maintainer: Raphael Winkelmann <raphael@phonetik.uni-muenchen.de>  
Bug reports: https://github.com/IPS-LMU/emuR/issues

0 errors | 0 warnings | 0 notes

## ETLUtils (1.3)
Maintainer: Jan Wijffels <jwijffels@bnosac.be>

0 errors | 0 warnings | 0 notes

## filehashSQLite (0.2-4)
Maintainer: Roger D. Peng <rpeng@jhsph.edu>

0 errors | 0 warnings | 3 notes

```
checking DESCRIPTION meta-information ... NOTE
Malformed Description field: should contain one or more complete sentences.
Packages listed in more than one of Depends, Imports, Suggests, Enhances:
  ‘filehash’ ‘DBI’
A package should be listed in only one of these fields.

checking dependencies in R code ... NOTE
Packages in Depends field not imported from:
  ‘RSQLite’ ‘methods’
  These packages need to be imported from (in the NAMESPACE file)
  for when this namespace is loaded but not attached.

checking R code for possible problems ... NOTE
createSQLite: no visible global function definition for ‘dbDriver’
createSQLite: no visible global function definition for ‘dbConnect’
createSQLite: no visible global function definition for
  ‘dbUnloadDriver’
createSQLite: no visible global function definition for ‘dbGetQuery’
initializeSQLite: no visible global function definition for ‘dbDriver’
initializeSQLite: no visible global function definition for ‘dbConnect’
dbDelete,filehashSQLite-character: no visible global function
  definition for ‘dbGetQuery’
dbDisconnect,filehashSQLite: no visible global function definition for
  ‘dbUnloadDriver’
dbFetch,filehashSQLite-character: no visible global function definition
  for ‘dbGetQuery’
dbInsert,filehashSQLite-character: no visible global function
  definition for ‘dbGetQuery’
dbList,filehashSQLite: no visible global function definition for
  ‘dbGetQuery’
dbMultiFetch,filehashSQLite-character: no visible global function
  definition for ‘dbGetQuery’
```

## marmap (0.9.5)
Maintainer: Eric Pante <pante.eric@gmail.com>

0 errors | 0 warnings | 0 notes

## mitools (2.3)
Maintainer: Thomas Lumley <t.lumley@auckland.ac.nz>

0 errors | 0 warnings | 0 notes

## MonetDB.R (1.0.1)
Maintainer: Hannes Muehleisen <hannes@cwi.nl>

0 errors | 0 warnings | 1 note 

```
checking package dependencies ... NOTE
Package which this enhances but not available for checking: ‘MonetDBLite’
```

## oai (0.2.0)
Maintainer: Scott Chamberlain <myrmecocystus@gmail.com>  
Bug reports: https://github.com/sckott/oai/issues

0 errors | 0 warnings | 0 notes

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

## ODB (1.1.1)
Maintainer: Sylvain Mareschal <maressyl@gmail.com>

0 errors | 0 warnings | 2 notes

```
checking dependencies in R code ... NOTE
Packages in Depends field not imported from:
  ‘DBI’ ‘RJDBC’ ‘methods’
  These packages need to be imported from (in the NAMESPACE file)
  for when this namespace is loaded but not attached.

checking R code for possible problems ... NOTE
isClosed: no visible global function definition for ‘dbSendUpdate’
odb.close: no visible global function definition for ‘dbSendUpdate’
odb.close: no visible global function definition for ‘dbDisconnect’
odb.insert: no visible global function definition for ‘dbSendQuery’
odb.insert: no visible global function definition for ‘dbColumnInfo’
odb.open: no visible global function definition for ‘JDBC’
odb.open: no visible global function definition for ‘dbConnect’
odb.read: no visible global function definition for ‘dbSendQuery’
odb.read: no visible global function definition for ‘fetch’
odb.read: no visible global function definition for ‘dbColumnInfo’
odb.tables: no visible global function definition for ‘dbListTables’
odb.tables: no visible global function definition for ‘dbSendQuery’
odb.tables: no visible global function definition for ‘dbColumnInfo’
odb.write: no visible global function definition for ‘dbSendUpdate’
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

## pitchRx (1.8.2)
Maintainer: Carson Sievert <cpsievert1@gmail.com>  
Bug reports: http://github.com/cpsievert/pitchRx/issues

0 errors | 0 warnings | 1 note 

```
checking package dependencies ... NOTE
Package suggested but not available for checking: ‘ggsubplot’
```

## poplite (0.99.16)
Maintainer: Daniel Bottomly <bottomly@ohsu.edu>

0 errors | 0 warnings | 1 note 

```
checking R code for possible problems ... NOTE
join,Database : .local: no visible binding for global variable
  ‘new.ancil’
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

## quantmod (0.4-5)
Maintainer: Joshua M. Ulrich <josh.m.ulrich@gmail.com>  
Bug reports: https://github.com/joshuaulrich/quantmod/issues

0 errors | 0 warnings | 1 note 

```
checking R code for possible problems ... NOTE
Found the following calls to attach():
File ‘quantmod/R/attachSymbols.R’:
  attach(NULL, pos = pos, name = DB$name)
  attach(NULL, pos = pos, name = DB$name)
See section ‘Good practice’ in ‘?attach’.
```

## RecordLinkage (0.4-8)
Maintainer: Andreas Borg <borga@uni-mainz.de>

0 errors | 0 warnings | 0 notes

## redcapAPI (1.3)
Maintainer: Stephen Lane <stephen.lane@barwonhealth.org.au>  
Bug reports: https://github.com/nutterb/redcapAPI/issues

0 errors | 0 warnings | 0 notes

## refGenome (1.6.0)
Maintainer: Wolfgang Kaisers <kaisers@med.uni-duesseldorf.de>

0 errors | 0 warnings | 0 notes

## RJDBC (0.2-5)
Maintainer: Simon Urbanek <Simon.Urbanek@r-project.org>

0 errors | 0 warnings | 1 note 

```
checking top-level files ... NOTE
Non-standard file/directory found at top level:
  ‘java-src’
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

## RObsDat (16.03)
Maintainer: Dominik Reusser <reusser@pik-potsdam.de>

0 errors | 0 warnings | 1 note 

```
checking package dependencies ... NOTE
Package suggested but not available for checking: ‘SSOAP’
```

## RODBCDBI (0.1.1)
Maintainer: Nagi Teramo <teramonagi@gmail.com>

0 errors | 0 warnings | 0 notes

## ROracle (1.2-2)
Maintainer: Rajendra S. Pingte <rajendra.pingte@oracle.com>

1 error  | 0 warnings | 0 notes

```
checking whether package ‘ROracle’ can be installed ... ERROR
Installation failed.
See ‘/home/muelleki/git/R/DBI/revdep/checks/ROracle.Rcheck/00install.out’ for details.
```

## rplexos (1.1.4)
Maintainer: Eduardo Ibanez <edu.ibanez@gmail.com>  
Bug reports: https://github.com/NREL/rplexos/issues

0 errors | 0 warnings | 0 notes

## RPostgreSQL (0.4)
Maintainer: Tomoaki Nishiyama <tomoakin@staff.kanazawa-u.ac.jp>

0 errors | 0 warnings | 2 notes

```
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

## RPresto (1.2.1)
Maintainer: Onur Ismail Filiz <onur@fb.com>  
Bug reports: https://github.com/prestodb/RPresto/issues

0 errors | 0 warnings | 0 notes

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

0 errors | 0 warnings | 0 notes

## RSQLServer (0.2.0)
Maintainer: Imanuel Costigan <i.costigan@me.com>  
Bug reports: https://github.com/imanuelcostigan/RSQLServer/issues

0 errors | 0 warnings | 0 notes

## SEERaBomb (2015.2)
Maintainer: Tomas Radivoyevitch <radivot@ccf.org>

0 errors | 0 warnings | 0 notes

## sejmRP (1.3)
Maintainer: Piotr Smuda <piotrsmuda@gmail.com>  
Bug reports: http://github.com/mi2-warsaw/sejmRP/issues

0 errors | 0 warnings | 0 notes

## smnet (2.0)
Maintainer: Alastair Rushworth <alastair.rushworth@strath.ac.uk>

0 errors | 0 warnings | 0 notes

## snplist (0.15)
Maintainer: Alexander Sibley <alexander.sibley@dm.duke.edu>

0 errors | 0 warnings | 0 notes

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

## sqliter (0.1.0)
Maintainer: Wilson Freitas <wilson.freitas@gmail.com>

0 errors | 0 warnings | 0 notes

## sqlutils (1.2)
Maintainer: Jason Bryer <jason@bryer.org>  
Bug reports: https://github.com/jbryer/sqlutils/issues

0 errors | 0 warnings | 2 notes

```
checking DESCRIPTION meta-information ... NOTE
Malformed Title field: should not end in a period.

checking dependencies in R code ... NOTE
'library' or 'require' calls in package code:
  ‘RJDBC’ ‘RMySQL’ ‘RODBC’ ‘RPostgreSQL’ ‘RSQLite’ ‘tcltk’
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

## stream (1.2-2)
Maintainer: Michael Hahsler <mhahsler@lyle.smu.edu>  
Bug reports: https://r-forge.r-project.org/projects/clusterds/

0 errors | 0 warnings | 1 note 

```
checking installed package size ... NOTE
  installed size is  5.7Mb
  sub-directories of 1Mb or more:
    doc    1.6Mb
    libs   3.6Mb
```

## timeseriesdb (0.2.1)
Maintainer: 'Matthias Bannert' <bannert@kof.ethz.ch>

0 errors | 0 warnings | 0 notes

## TScompare (2015.4-1)
Maintainer: Paul Gilbert <pgilbert.ttv9z@ncf.ca>

0 errors | 0 warnings | 0 notes

## TSdata (2015.4-2)
Maintainer: Paul Gilbert <pgilbert.ttv9z@ncf.ca>

1 error  | 0 warnings | 1 note 

```
checking running R code from vignettes ... ERROR
Errors in running code in vignettes:
when running code in ‘Guide.Stex’
  ...
Apr 20, 2016 11:50:31 AM it.bancaditalia.oss.sdmx.client.RestSdmxClient runQuery
INFO: Contacting web service with query: http://stats.oecd.org/restsdmx/sdmx.ashx//GetData/QNA/CAN.PPPGDP.CARSA.Q?format=compact_v2
Apr 20, 2016 11:50:31 AM it.bancaditalia.oss.sdmx.client.RestSdmxClient runQuery
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
Apr 20, 2016 11:50:41 AM it.bancaditalia.oss.sdmx.util.Configuration init
INFO: Configuration file: /home/muelleki/R-revdep/RJSDMX/configuration.properties
Apr 20, 2016 11:50:41 AM it.bancaditalia.oss.sdmx.client.RestSdmxClient runQuery
INFO: Contacting web service with query: http://stats.oecd.org/restsdmx/sdmx.ashx//GetDataStructure/QNA
Apr 20, 2016 11:50:42 AM it.bancaditalia.oss.sdmx.client.RestSdmxClient runQuery
INFO: Contacting web service with query: http://stats.oecd.org/restsdmx/sdmx.ashx//GetDataStructure/QNA
Apr 20, 2016 11:50:42 AM it.bancaditalia.oss.sdmx.client.RestSdmxClient runQuery
INFO: Contacting web service with query: http://stats.oecd.org/restsdmx/sdmx.ashx//GetData/QNA/CAN.PPPGDP.CARSA.Q?format=compact_v2
Apr 20, 2016 11:50:42 AM it.bancaditalia.oss.sdmx.client.RestSdmxClient runQuery
SEVERE: Connection failed. HTTP error code : 404, message: Not Found
SDMX meaning: No results matching the query.

Error: processing vignette 'Guide.Stex' failed with diagnostics:
 chunk 3 
Error in .local(serIDs, con, ...) : 
  QNA.CAN.PPPGDP.CARSA.Q error: it.bancaditalia.oss.sdmx.util.SdmxException: Connection failed. HTTP error code : 404, message: Not Found
SDMX meaning: No results matching the query.
Execution halted

```

## TSdbi (2015.7-1)
Maintainer: Paul Gilbert <pgilbert.ttv9z@ncf.ca>

0 errors | 0 warnings | 0 notes

## TSfame (2015.4-1)
Maintainer: Paul Gilbert <pgilbert.ttv9z@ncf.ca>

0 errors | 0 warnings | 1 note 

```
checking R code for possible problems ... NOTE
TSget,character-TSfameLocalConnection : .local: no visible global
  function definition for ‘zoo’
TSget,character-TSfameServerConnection : .local: no visible global
  function definition for ‘zoo’
```

## TSmisc (2015.1-3)
Maintainer: Paul Gilbert <pgilbert.ttv9z@ncf.ca>

0 errors | 0 warnings | 0 notes

## TSMySQL (2015.4-1)
Maintainer: Paul Gilbert <pgilbert.ttv9z@ncf.ca>

0 errors | 0 warnings | 0 notes

## TSodbc (2015.4-1)
Maintainer: Paul Gilbert <pgilbert.ttv9z@ncf.ca>

0 errors | 0 warnings | 0 notes

## TSPostgreSQL (2015.4-1)
Maintainer: Paul Gilbert <pgilbert.ttv9z@ncf.ca>

0 errors | 0 warnings | 0 notes

## TSsdmx (2015.12-1)
Maintainer: Paul Gilbert <pgilbert.ttv9z@ncf.ca>

0 errors | 0 warnings | 0 notes

## TSSQLite (2015.4-1)
Maintainer: Paul Gilbert <pgilbert.ttv9z@ncf.ca>

0 errors | 0 warnings | 0 notes

## TSsql (2015.1-2)
Maintainer: Paul Gilbert <pgilbert.ttv9z@ncf.ca>

0 errors | 0 warnings | 0 notes

## twitteR (1.1.9)
Maintainer: Jeff Gentry <geoffjentry@gmail.com>

0 errors | 0 warnings | 0 notes

## UPMASK (1.0)
Maintainer: Alberto Krone-Martins <algol@sim.ul.pt>

0 errors | 0 warnings | 0 notes

## vmsbase (2.1)
Maintainer: Lorenzo D'Andrea <support@vmsbase.org>

1 error  | 0 warnings | 0 notes

```
checking whether package ‘vmsbase’ can be installed ... ERROR
Installation failed.
See ‘/home/muelleki/git/R/DBI/revdep/checks/vmsbase.Rcheck/00install.out’ for details.
```

## WhopGenome (0.9.3)
Maintainer: Ulrich Wittelsbuerger <ulrich.wittelsbuerger@uni-duesseldorf.de>

0 errors | 0 warnings | 0 notes

