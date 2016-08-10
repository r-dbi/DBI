# Setup

## Platform

|setting  |value                        |
|:--------|:----------------------------|
|version  |R version 3.3.1 (2016-06-21) |
|system   |x86_64, linux-gnu            |
|ui       |X11                          |
|language |en_US:en                     |
|collate  |en_US.UTF-8                  |
|tz       |Europe/Zurich                |
|date     |2016-08-08                   |

## Packages

|package   |*  |version    |date       |source                           |
|:---------|:--|:----------|:----------|:--------------------------------|
|covr      |   |2.2.0      |2016-08-04 |cran (@2.2.0)                    |
|DBI       |   |0.4-8      |2016-08-08 |local (rstats-db/DBI@NA)         |
|knitr     |   |1.13       |2016-05-09 |cran (@1.13)                     |
|rmarkdown |   |1.0        |2016-07-08 |cran (@1.0)                      |
|RSQLite   |   |1.0.0      |2014-10-25 |cran (@1.0.0)                    |
|testthat  |   |1.0.2.9000 |2016-08-01 |Github (hadley/testthat@46d15da) |

# Check results
76 packages

## archivist (2.1)
Maintainer: Przemyslaw Biecek <przemyslaw.biecek@gmail.com>  
Bug reports: https://github.com/pbiecek/archivist/issues

0 errors | 0 warnings | 2 notes

```
checking package dependencies ... NOTE
Package which this enhances but not available for checking: ‘archivist.github’

checking Rd cross-references ... NOTE
Package unavailable to check Rd xrefs: ‘archivist.github’
```

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
  ‘affxparser’ ‘affyPLM’ ‘aroma.light’ ‘gcrma’ ‘limma’ ‘oligo’
  ‘oligoClasses’ ‘pdInfoBuilder’ ‘AffymetrixDataTestFiles’
```

## BatchExperiments (1.4.1)
Maintainer: Michel Lang <michellang@gmail.com>  
Bug reports: https://github.com/tudo-r/BatchExperiments/issues

0 errors | 0 warnings | 2 notes

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

checking R code for possible problems ... NOTE
addExperiments.ExperimentRegistry: no visible global function
  definition for ‘is’
applyJobFunction.ExperimentRegistry: no visible global function
  definition for ‘setNames’
calcDynamic: no visible global function definition for ‘setNames’
checkExperimentRegistry: no visible global function definition for
  ‘head’
dbSummarizeExperiments: no visible global function definition for
  ‘setNames’
designIterator: no visible global function definition for ‘setNames’
getIndex : exprToIndex: no visible global function definition for
  ‘capture.output’
getProblemFilePaths: no visible global function definition for
  ‘setNames’
updateRegistry.ExperimentRegistry: no visible global function
  definition for ‘packageVersion’
Undefined global functions or variables:
  capture.output head is packageVersion setNames
Consider adding
  importFrom("methods", "is")
  importFrom("stats", "setNames")
  importFrom("utils", "capture.output", "head", "packageVersion")
to your NAMESPACE file (and ensure that your DESCRIPTION Imports field
contains 'methods').
```

## BatchJobs (1.6)
Maintainer: Bernd Bischl <bernd_bischl@gmx.net>  
Bug reports: https://github.com/tudo-r/BatchJobs/issues

0 errors | 0 warnings | 0 notes

## bibliospec (0.0.4)
Maintainer: Witold E. Wolski <wew@fgcz.ethz.ch>  
Bug reports: https://github.com/protViz/bibliospec/issues

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
bigglm,ANY-DBIConnection: no visible global function definition for
  ‘dbSendQuery’
bigglm,ANY-DBIConnection: no visible global function definition for
  ‘dbClearResult’
bigglm,ANY-DBIConnection : chunk: no visible global function definition
  for ‘dbClearResult’
bigglm,ANY-DBIConnection : chunk: no visible global function definition
  for ‘dbSendQuery’
bigglm,ANY-DBIConnection : chunk: no visible global function definition
  for ‘fetch’
Undefined global functions or variables:
  dbClearResult dbSendQuery fetch odbcQuery sqlGetResults

Found the following calls to data() loading into the global environment:
File ‘biglm/R/bigglm.R’:
  data(reset = TRUE)
  data(reset = FALSE)
See section ‘Good practice’ in ‘?data’.
```

## bigrquery (0.3.0)
Maintainer: Hadley Wickham <hadley@rstudio.com>  
Bug reports: https://github.com/rstats-db/bigrquery/issues

0 errors | 0 warnings | 0 notes

## chunked (0.3)
Maintainer: Edwin de Jonge <edwindjonge@gmail.com>  
Bug reports: https://github.com/edwindj/chunked/issues

0 errors | 0 warnings | 0 notes

## CITAN (2015.12-2)
Maintainer: Marek Gagolewski <gagolews@ibspan.waw.pl>  
Bug reports: https://github.com/Rexamine/CITAN/issues

0 errors | 0 warnings | 0 notes

## convey (0.1.0)
Maintainer: Djalma Pessoa <pessoad@gmail.com>  
Bug reports: https://github.com/djalmapessoa/convey/issues

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
  ‘read.table’
.onLoad : <anonymous>: no visible global function definition for
  ‘dbConnect’
.onLoad : <anonymous>: no visible global function definition for
  ‘dbListTables’
.onLoad : <anonymous>: no visible global function definition for
  ‘dbExistsTable’
.onLoad : <anonymous>: no visible global function definition for
... 9 lines ...
  dbConnect dbDisconnect dbExistsTable dbListTables dbReadTable
  dbRemoveTable dbWriteTable read.table
Consider adding
  importFrom("utils", "read.table")
to your NAMESPACE file.

Found the following calls to attach():
File ‘datamap/R/datamap.R’:
  attach(.Call("CreateUserDB", map, PACKAGE = "datamap"), pos, 
    name, warn.conflicts)
See section ‘Good practice’ in ‘?attach’.
```

## DBItest (1.3)
Maintainer: Kirill Müller <krlmlr+r@mailbox.org>  
Bug reports: https://github.com/rstats-db/DBItest/issues

0 errors | 0 warnings | 0 notes

## dplyr (0.5.0)
Maintainer: Hadley Wickham <hadley@rstudio.com>  
Bug reports: https://github.com/hadley/dplyr/issues

0 errors | 1 warning  | 2 notes

```
checking Rd cross-references ... WARNING
package ‘microbenchmark’ exists but was not installed under R >= 2.10.0 so xrefs cannot be checked

checking installed package size ... NOTE
  installed size is 15.9Mb
  sub-directories of 1Mb or more:
    libs  13.9Mb

checking dependencies in R code ... NOTE
Missing or unexported object: ‘RSQLite::rsqliteVersion’
```

## emuR (0.1.9)
Maintainer: Raphael Winkelmann <raphael@phonetik.uni-muenchen.de>  
Bug reports: https://github.com/IPS-LMU/emuR/issues

0 errors | 0 warnings | 0 notes

## etl (0.3.3)
Maintainer: Ben Baumer <ben.baumer@gmail.com>  
Bug reports: https://github.com/beanumber/etl/issues

1 error  | 0 warnings | 0 notes

```
checking tests ... ERROR
Running the tests in ‘tests/testthat.R’ failed.
Last 13 lines of output:
         password = password, ...) at /tmp/Rtmp7CN18V/devtools79ac6736fd85/dplyr/R/src-mysql.r:101
  3: dbConnect(RMySQL::MySQL(), dbname = dbname, host = host, port = port, username = user, 
         password = password, ...)
  4: .local(drv, ...)
  5: stop(sprintf("mysql default file %s does not exist", default.file)) at /tmp/RtmpOE7VhR/devtools5878507a462d/RMySQL/R/connection.R:94
  
  Failed with error:  'there is no package called 'willywonka''
  testthat results ================================================================
  OK: 25 SKIPPED: 0 FAILED: 1
  1. Error: mysql works (@test-etl.R#40) 
  
  Error: testthat unit tests failed
  Execution halted
```

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
initializeSQLite: no visible global function definition for ‘new’
dbDelete,filehashSQLite-character: no visible global function
... 7 lines ...
  definition for ‘dbGetQuery’
dbList,filehashSQLite: no visible global function definition for
  ‘dbGetQuery’
dbMultiFetch,filehashSQLite-character: no visible global function
  definition for ‘dbGetQuery’
Undefined global functions or variables:
  dbConnect dbDriver dbGetQuery dbUnloadDriver new
Consider adding
  importFrom("methods", "new")
to your NAMESPACE file (and ensure that your DESCRIPTION Imports field
contains 'methods').
```

## genomicper (1.6)
Maintainer: Claudia Cabrera <c.cabrera@qmul.ac.uk>

0 errors | 0 warnings | 1 note 

```
checking package dependencies ... NOTE
Packages suggested but not available for checking: ‘KEGG.db’ ‘reactome.db’
```

## gmDatabase (0.5.0)
Maintainer: K. Gerald van den Boogaart <support@boogaart.de>

0 errors | 0 warnings | 0 notes

## imputeMulti (0.6.1)
Maintainer: Alex Whitworth <whitworth.alex@gmail.com>

0 errors | 0 warnings | 0 notes

## macleish (0.3.0)
Maintainer: Ben Baumer <ben.baumer@gmail.com>

0 errors | 0 warnings | 0 notes

## marmap (0.9.5)
Maintainer: Eric Pante <pante.eric@gmail.com>

0 errors | 0 warnings | 0 notes

## MetaIntegrator (1.0.0)
Maintainer: Winston A. Haynes <hayneswa@stanford.edu>

1 error  | 0 warnings | 0 notes

```
checking package dependencies ... ERROR
Packages required but not available: ‘multtest’ ‘GEOquery’ ‘GEOmetadb’

See section ‘The DESCRIPTION file’ in the ‘Writing R Extensions’
manual.
```

## mitools (2.3)
Maintainer: Thomas Lumley <t.lumley@auckland.ac.nz>

0 errors | 0 warnings | 1 note 

```
checking R code for possible problems ... NOTE
MIcombine.default: no visible binding for global variable ‘vcov’
MIcombine.default: no visible binding for global variable ‘coef’
MIcombine.default: no visible global function definition for ‘var’
MIcombine.imputationResultList: no visible binding for global variable
  ‘vcov’
MIcombine.imputationResultList: no visible binding for global variable
  ‘coef’
close.DBimputationList: no visible global function definition for ‘is’
getvars: no visible global function definition for ‘is’
print.MIresult: no visible global function definition for ‘coef’
print.MIresult: no visible global function definition for ‘vcov’
summary.MIresult: no visible global function definition for ‘coef’
summary.MIresult: no visible global function definition for ‘vcov’
summary.MIresult: no visible global function definition for ‘qt’
Undefined global functions or variables:
  coef is qt var vcov
Consider adding
  importFrom("methods", "is")
  importFrom("stats", "coef", "qt", "var", "vcov")
to your NAMESPACE file (and ensure that your DESCRIPTION Imports field
contains 'methods').
```

## MonetDB.R (1.0.1)
Maintainer: Hannes Muehleisen <hannes@cwi.nl>

0 errors | 0 warnings | 0 notes

## MonetDBLite (0.3.1)
Maintainer: Hannes Muehleisen <hannes@cwi.nl>  
Bug reports: https://github.com/hannesmuehleisen/MonetDBLite/issues

0 errors | 0 warnings | 1 note 

```
checking installed package size ... NOTE
  installed size is 24.6Mb
  sub-directories of 1Mb or more:
    libs  24.3Mb
```

## oai (0.2.0)
Maintainer: Scott Chamberlain <myrmecocystus@gmail.com>  
Bug reports: https://github.com/sckott/oai/issues

0 errors | 0 warnings | 0 notes

## oce (0.9-19)
Maintainer: Dan Kelley <Dan.Kelley@Dal.Ca>  
Bug reports: https://github.com/dankelley/oce/issues

1 error  | 0 warnings | 1 note 

```
checking examples ... ERROR
Running examples in ‘oce-Ex.R’ failed
The error most likely occurred in:

> base::assign(".ptime", proc.time(), pos = "CheckExEnv")
> ### Name: read.oce
> ### Title: Read an Oceanographic Data File
> ### Aliases: read.oce
> 
> ### ** Examples
> 
> 
> library(oce)
> x <- read.oce(system.file("extdata", "ctd.cnv", package="oce"))
> plot(x) # summary with TS and profiles
Error in if (!is.null(x@metadata$startTime) && 4 < nchar(x@metadata$startTime,  : 
  missing value where TRUE/FALSE needed
Calls: plot -> plot -> .local
Execution halted

checking installed package size ... NOTE
  installed size is  5.1Mb
  sub-directories of 1Mb or more:
    help   2.0Mb
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
odb.close: no visible global function definition for ‘is’
odb.close: no visible global function definition for ‘validObject’
odb.close: no visible global function definition for ‘dbSendUpdate’
odb.close: no visible global function definition for ‘dbDisconnect’
odb.comments: no visible global function definition for ‘is’
odb.comments: no visible global function definition for ‘validObject’
odb.comments<-: no visible global function definition for ‘is’
odb.comments<-: no visible global function definition for ‘validObject’
... 31 lines ...
  ‘flush.console’
set,progress.file: no visible global function definition for
  ‘flush.console’
Undefined global functions or variables:
  JDBC dbColumnInfo dbConnect dbDisconnect dbListTables dbSendQuery
  dbSendUpdate fetch flush.console is new tail unzip validObject
Consider adding
  importFrom("methods", "is", "new", "validObject")
  importFrom("utils", "flush.console", "tail", "unzip")
to your NAMESPACE file (and ensure that your DESCRIPTION Imports field
contains 'methods').
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

1 error  | 0 warnings | 1 note 

```
checking whether package ‘pitchRx’ can be installed ... ERROR
Installation failed.
See ‘/home/muelleki/git/R/DBI/revdep/checks/pitchRx.Rcheck/00install.out’ for details.

checking package dependencies ... NOTE
Package suggested but not available for checking: ‘ggsubplot’
```

## poplite (0.99.16)
Maintainer: Daniel Bottomly <bottomly@ohsu.edu>

0 errors | 0 warnings | 1 note 

```
checking R code for possible problems ... NOTE
filter_.Database: no visible global function definition for ‘stack’
get.starting.point : <anonymous>: no visible global function definition
  for ‘na.omit’
select_.Database: no visible global function definition for ‘stack’
tsl.to.graph: no visible global function definition for ‘stack’
join,Database: no visible global function definition for ‘stack’
join,Database : .get.select.cols: no visible global function definition
  for ‘setNames’
join,Database: no visible binding for global variable ‘new.ancil’
join,Database: no visible global function definition for ‘setNames’
Undefined global functions or variables:
  na.omit new.ancil setNames stack
Consider adding
  importFrom("stats", "na.omit", "setNames")
  importFrom("utils", "stack")
to your NAMESPACE file.
```

## postGIStools (0.1.0)
Maintainer: Philippe Marchand <pmarchand@sesync.org>  
Bug reports: https://github.com/SESYNC-ci/postGIStools/issues

0 errors | 0 warnings | 0 notes

## ProjectTemplate (0.6)
Maintainer: Kirill Mueller <krlmlr+r@mailbox.org>  
Bug reports: https://github.com/johnmyleswhite/ProjectTemplate/issues

0 errors | 0 warnings | 2 notes

```
checking DESCRIPTION meta-information ... NOTE
Malformed Title field: should not end in a period.

checking R code for possible problems ... NOTE
.check.version: no visible global function definition for
  ‘compareVersion’
create.project: no visible global function definition for ‘untar’
csv.reader: no visible global function definition for ‘unzip’
csv.reader: no visible global function definition for ‘read.csv’
csv2.reader: no visible global function definition for ‘unzip’
csv2.reader: no visible global function definition for ‘read.csv’
sql.reader: no visible global function definition for ‘modifyList’
test.project: no visible global function definition for
... 6 lines ...
wsv.reader: no visible global function definition for ‘unzip’
wsv.reader: no visible global function definition for ‘read.table’
Undefined global functions or variables:
  compareVersion download.file modifyList packageVersion read.csv
  read.table setNames untar unzip
Consider adding
  importFrom("stats", "setNames")
  importFrom("utils", "compareVersion", "download.file", "modifyList",
             "packageVersion", "read.csv", "read.table", "untar",
             "unzip")
to your NAMESPACE file.
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

## RecordLinkage (0.4-10)
Maintainer: Andreas Borg <borga@uni-mainz.de>

0 errors | 0 warnings | 0 notes

## redcapAPI (1.3)
Maintainer: Stephen Lane <stephen.lane@barwonhealth.org.au>  
Bug reports: https://github.com/nutterb/redcapAPI/issues

1 error  | 0 warnings | 0 notes

```
checking whether package ‘redcapAPI’ can be installed ... ERROR
Installation failed.
See ‘/home/muelleki/git/R/DBI/revdep/checks/redcapAPI.Rcheck/00install.out’ for details.
```

## refGenome (1.7.0)
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

## RMySQL (0.10.9)
Maintainer: Jeroen Ooms <jeroen.ooms@stat.ucla.edu>  
Bug reports: https://github.com/rstats-db/rmysql/issues

0 errors | 0 warnings | 0 notes

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

1 error  | 1 warning  | 0 notes

```
checking examples ... ERROR
Running examples in ‘rplexos-Ex.R’ failed
The error most likely occurred in:

> base::assign(".ptime", proc.time(), pos = "CheckExEnv")
> ### Name: process_folder
> ### Title: Convert PLEXOS files to SQLite databases
> ### Aliases: process_folder process_input process_solution
> 
> ### ** Examples
> 
> # Process the folder with the solution file provided by rplexos
> location <- location_solution_rplexos()
> process_folder(location)
Warning: `rbind_list()` is deprecated. Please use `bind_rows()` instead.
> 
> # Process the folder with the input file provided by rplexos
> location2 <- location_input_rplexos()
> process_folder(location2)
Error in sqliteSendQuery(con, statement, bind.data) : 
  error in statement: no such column: comp_collection
Calls: process_folder ... .local -> sqliteGetQuery -> sqliteSendQuery -> .Call
Execution halted

checking re-building of vignette outputs ... WARNING
Error in re-building vignettes:
  ...
Quitting from lines 186-187 (rplexos.Rmd) 
Error: processing vignette 'rplexos.Rmd' failed with diagnostics:
error in statement: no such column: comp_collection
Execution halted

```

## RPostgreSQL (0.4-1)
Maintainer: Tomoaki Nishiyama <tomoakin@staff.kanazawa-u.ac.jp>

0 errors | 0 warnings | 3 notes

```
checking top-level files ... NOTE
Non-standard files/directories found at top level:
  ‘config.guess’ ‘config.sub’ ‘install-sh’

checking R code for possible problems ... NOTE
postgresqlImportFile: no visible global function definition for
  ‘count.fields’
postgresqlImportFile: no visible global function definition for
  ‘read.table’
Undefined global functions or variables:
  count.fields read.table
Consider adding
  importFrom("utils", "count.fields", "read.table")
to your NAMESPACE file.

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
Package which this enhances but not available for checking: ‘rjpod’
```

## RSQLite (1.0.0)
Maintainer: Hadley Wickham <hadley@rstudio.com>  
Bug reports: https://github.com/rstats-db/RSQLite/issues

0 errors | 0 warnings | 1 note 

```
checking R code for possible problems ... NOTE
safe.write: no visible global function definition for ‘write.table’
dbWriteTable,SQLiteConnection-character-character: no visible global
  function definition for ‘read.table’
summary,SQLiteDriver: no visible global function definition for
  ‘packageVersion’
Undefined global functions or variables:
  packageVersion read.table write.table
Consider adding
  importFrom("utils", "packageVersion", "read.table", "write.table")
to your NAMESPACE file.
```

## RSQLServer (0.2.0)
Maintainer: Imanuel Costigan <i.costigan@me.com>  
Bug reports: https://github.com/imanuelcostigan/RSQLServer/issues

1 error  | 0 warnings | 0 notes

```
checking whether package ‘RSQLServer’ can be installed ... ERROR
Installation failed.
See ‘/home/muelleki/git/R/DBI/revdep/checks/RSQLServer.Rcheck/00install.out’ for details.
```

## SEERaBomb (2016.1)
Maintainer: Tomas Radivoyevitch <radivot@ccf.org>

0 errors | 0 warnings | 0 notes

## sejmRP (1.3)
Maintainer: Piotr Smuda <piotrsmuda@gmail.com>  
Bug reports: http://github.com/mi2-warsaw/sejmRP/issues

0 errors | 0 warnings | 0 notes

## smnet (2.0)
Maintainer: Alastair Rushworth <alastair.rushworth@strath.ac.uk>

1 error  | 0 warnings | 0 notes

```
checking whether package ‘smnet’ can be installed ... ERROR
Installation failed.
See ‘/home/muelleki/git/R/DBI/revdep/checks/smnet.Rcheck/00install.out’ for details.
```

## snplist (0.15)
Maintainer: Alexander Sibley <alexander.sibley@dm.duke.edu>

0 errors | 0 warnings | 0 notes

## sqldf (0.4-10)
Maintainer: G. Grothendieck <ggrothendieck@gmail.com>  
Bug reports: http://groups.google.com/group/sqldf

0 errors | 1 warning  | 2 notes

```
checking whether package ‘sqldf’ can be installed ... WARNING
Found the following significant warnings:
  Warning: no DISPLAY variable so Tk is not available
See ‘/home/muelleki/git/R/DBI/revdep/checks/sqldf.Rcheck/00install.out’ for details.

checking dependencies in R code ... NOTE
'library' or 'require' call to ‘tcltk’ in package code.
  Please use :: or requireNamespace() instead.
  See section 'Suggested packages' in the 'Writing R Extensions' manual.

checking R code for possible problems ... NOTE
read.csv.sql: no visible global function definition for ‘download.file’
sqldf: no visible global function definition for ‘modifyList’
sqldf: no visible global function definition for ‘head’
Undefined global functions or variables:
  download.file head modifyList
Consider adding
  importFrom("utils", "download.file", "head", "modifyList")
to your NAMESPACE file.
```

## sqliter (0.1.0)
Maintainer: Wilson Freitas <wilson.freitas@gmail.com>

0 errors | 0 warnings | 0 notes

## sqlutils (1.2)
Maintainer: Jason Bryer <jason@bryer.org>  
Bug reports: https://github.com/jbryer/sqlutils/issues

0 errors | 0 warnings | 3 notes

```
checking DESCRIPTION meta-information ... NOTE
Malformed Title field: should not end in a period.

checking dependencies in R code ... NOTE
'library' or 'require' calls in package code:
  ‘RJDBC’ ‘RMySQL’ ‘RODBC’ ‘RPostgreSQL’ ‘RSQLite’ ‘tcltk’
  Please use :: or requireNamespace() instead.
  See section 'Suggested packages' in the 'Writing R Extensions' manual.

checking R code for possible problems ... NOTE
cacheQuery: no visible global function definition for ‘read.csv’
cacheQuery: no visible global function definition for ‘write.csv’
Undefined global functions or variables:
  read.csv write.csv
Consider adding
  importFrom("utils", "read.csv", "write.csv")
to your NAMESPACE file.
```

## storr (1.0.1)
Maintainer: Rich FitzJohn <rich.fitzjohn@gmail.com>

0 errors | 0 warnings | 0 notes

## stream (1.2-3)
Maintainer: Michael Hahsler <mhahsler@lyle.smu.edu>  
Bug reports: https://github.com/mhahsler/stream/issues

1 error  | 0 warnings | 0 notes

```
checking whether package ‘stream’ can be installed ... ERROR
Installation failed.
See ‘/home/muelleki/git/R/DBI/revdep/checks/stream.Rcheck/00install.out’ for details.
```

## survey (3.31)
Maintainer: "Thomas Lumley" <t.lumley@auckland.ac.nz>

0 errors | 0 warnings | 0 notes

## tcpl (1.2.2)
Maintainer: Dayne L Filer <dayne.filer@gmail.com>

0 errors | 0 warnings | 1 note 

```
checking installed package size ... NOTE
  installed size is  9.9Mb
  sub-directories of 1Mb or more:
    sql   8.7Mb
```

## timeseriesdb (0.2.1)
Maintainer: 'Matthias Bannert' <bannert@kof.ethz.ch>

0 errors | 0 warnings | 1 note 

```
checking R code for possible problems ... NOTE
createHstore.ts: no visible global function definition for ‘time’
exploreDb : <anonymous>: no visible global function definition for
  ‘plot’
exportTsList : <anonymous>: no visible global function definition for
  ‘time’
exportTsList: no visible global function definition for ‘write.csv2’
importTsList: no visible global function definition for ‘read.csv2’
importTsList : <anonymous>: no visible global function definition for
  ‘as.ts’
... 15 lines ...
  ‘frequency’
zooLikeDateConvert: no visible global function definition for ‘cycle’
Undefined global functions or variables:
  as.ts cycle frequency is.ts legend par plot read.csv2 time ts
  write.csv2
Consider adding
  importFrom("graphics", "legend", "par", "plot")
  importFrom("stats", "as.ts", "cycle", "frequency", "is.ts", "time",
             "ts")
  importFrom("utils", "read.csv2", "write.csv2")
to your NAMESPACE file.
```

## TScompare (2015.4-1)
Maintainer: Paul Gilbert <pgilbert.ttv9z@ncf.ca>

0 errors | 0 warnings | 1 note 

```
checking R code for possible problems ... NOTE
tfDetails: no visible global function definition for ‘start’
tfDetails: no visible global function definition for ‘end’
Undefined global functions or variables:
  end start
Consider adding
  importFrom("stats", "end", "start")
to your NAMESPACE file.
```

## TSdata (2015.4-2)
Maintainer: Paul Gilbert <pgilbert.ttv9z@ncf.ca>

0 errors | 1 warning  | 0 notes

```
checking re-building of vignette outputs ... WARNING
Error in re-building vignettes:
  ...
SDMX meaning: No results matching the query.
Aug 08, 2016 10:26:49 PM it.bancaditalia.oss.sdmx.client.custom.RestSdmx20Client getData
SEVERE: Exception caught parsing results from call to provider OECD
Aug 08, 2016 10:26:49 PM it.bancaditalia.oss.sdmx.client.custom.RestSdmx20Client getData
INFO: Exception: 
it.bancaditalia.oss.sdmx.util.SdmxException: Connection failed. HTTP error code : 404, message: Not Found
SDMX meaning: No results matching the query.
... 8 lines ...
	at sun.reflect.NativeMethodAccessorImpl.invoke(NativeMethodAccessorImpl.java:62)
	at sun.reflect.DelegatingMethodAccessorImpl.invoke(DelegatingMethodAccessorImpl.java:43)
	at java.lang.reflect.Method.invoke(Method.java:498)
	at RJavaTools.invokeMethod(RJavaTools.java:386)


Error: processing vignette 'Guide.Stex' failed with diagnostics:
 chunk 3 
Error in .local(serIDs, con, ...) : 
  QNA.CAN.PPPGDP.CARSA.Q error: java.lang.NullPointerException
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
vintageMap: no visible global function definition for ‘read.table’
TSget,character-TSfameLocalConnection: no visible global function
  definition for ‘as.ts’
TSget,character-TSfameLocalConnection: no visible global function
  definition for ‘zoo’
TSget,character-TSfameLocalConnection: no visible global function
  definition for ‘frequency’
TSget,character-TSfameServerConnection: no visible global function
  definition for ‘as.ts’
TSget,character-TSfameServerConnection: no visible global function
  definition for ‘zoo’
TSget,character-TSfameServerConnection: no visible global function
  definition for ‘frequency’
Undefined global functions or variables:
  as.ts frequency read.table zoo
Consider adding
  importFrom("stats", "as.ts", "frequency")
  importFrom("utils", "read.table")
to your NAMESPACE file.
```

## TSmisc (2015.1-3)
Maintainer: Paul Gilbert <pgilbert.ttv9z@ncf.ca>

1 error  | 0 warnings | 0 notes

```
checking whether package ‘TSmisc’ can be installed ... ERROR
Installation failed.
See ‘/home/muelleki/git/R/DBI/revdep/checks/TSmisc.Rcheck/00install.out’ for details.
```

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

## TSsql (2015.1-2)
Maintainer: Paul Gilbert <pgilbert.ttv9z@ncf.ca>

0 errors | 0 warnings | 1 note 

```
checking R code for possible problems ... NOTE
TSgetSQL: no visible global function definition for ‘ts’
TSputSQL: no visible global function definition for ‘is.ts’
TSputSQL: no visible global function definition for ‘frequency’
TSputSQL: no visible global function definition for ‘time’
TSquery: no visible global function definition for ‘ts’
Undefined global functions or variables:
  frequency is.ts time ts
Consider adding
  importFrom("stats", "frequency", "is.ts", "time", "ts")
to your NAMESPACE file.
```

## TSSQLite (2015.4-1)
Maintainer: Paul Gilbert <pgilbert.ttv9z@ncf.ca>

0 errors | 0 warnings | 0 notes

## twitteR (1.1.9)
Maintainer: Jeff Gentry <geoffjentry@gmail.com>

0 errors | 0 warnings | 0 notes

## UPMASK (1.0)
Maintainer: Alberto Krone-Martins <algol@sim.ul.pt>

0 errors | 0 warnings | 1 note 

```
checking R code for possible problems ... NOTE
UPMASKfile: no visible global function definition for ‘read.table’
UPMASKfile: no visible global function definition for ‘write.table’
analyse_randomKde2d: no visible global function definition for ‘hist’
analyse_randomKde2d: no visible global function definition for ‘lines’
analyse_randomKde2d_AutoCalibrated: no visible global function
  definition for ‘hist’
analyse_randomKde2d_AutoCalibrated: no visible global function
  definition for ‘lines’
create_randomKde2d: no visible global function definition for ‘image’
... 18 lines ...
kde2dForSubset: no visible global function definition for ‘image’
kde2dForSubset: no visible global function definition for ‘points’
Undefined global functions or variables:
  contour dev.new hist image lines pairs par plot points rainbow
  read.table rgb write.table
Consider adding
  importFrom("grDevices", "dev.new", "rainbow", "rgb")
  importFrom("graphics", "contour", "hist", "image", "lines", "pairs",
             "par", "plot", "points")
  importFrom("utils", "read.table", "write.table")
to your NAMESPACE file.
```

## vmsbase (2.1.3)
Maintainer: Lorenzo D'Andrea <support@vmsbase.org>

1 error  | 0 warnings | 0 notes

```
checking whether package ‘vmsbase’ can be installed ... ERROR
Installation failed.
See ‘/home/muelleki/git/R/DBI/revdep/checks/vmsbase.Rcheck/00install.out’ for details.
```

## WhopGenome (0.9.4)
Maintainer: Ulrich Wittelsbuerger <ulrich.wittelsbuerger@uni-duesseldorf.de>

0 errors | 0 warnings | 0 notes

