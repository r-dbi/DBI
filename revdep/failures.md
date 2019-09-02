# anamiR

<details>

* Version: 1.12.0
* Source code: https://github.com/cran/anamiR
* URL: https://github.com/AllenTiTaiWang/anamiR
* BugReports: https://github.com/AllenTiTaiWang/anamiR/issues
* Date/Publication: 2019-05-09
* Number of recursive dependencies: 198

Run `revdep_details(,"anamiR")` for more info

</details>

## In both

*   checking for missing documentation entries ... ERROR
    ```
    ...
    Call sequence:
    6: stop(msg, call. = FALSE, domain = NA)
    5: value[[3L]](cond)
    4: tryCatchOne(expr, names, parentenv, handlers[[1L]])
    3: tryCatchList(expr, classes, parentenv, handlers)
    2: tryCatch({
           attr(package, "LibPath") <- which.lib.loc
           ns <- loadNamespace(package, lib.loc)
           env <- attachNamespace(ns, pos = pos, deps, exclude, include.only)
       }, error = function(e) {
           P <- if (!is.null(cc <- conditionCall(e))) 
               paste(" in", deparse(cc)[1L])
           else ""
           msg <- gettextf("package or namespace load failed for %s%s:\n %s", 
               sQuote(package), P, conditionMessage(e))
           if (logical.return) 
               message(paste("Error:", msg), domain = NA)
           else stop(msg, call. = FALSE, domain = NA)
       })
    1: library(package, lib.loc = lib.loc, character.only = TRUE, verbose = FALSE)
    Execution halted
    ```

*   R CMD check timed out
    

*   checking whether the package can be unloaded cleanly ... WARNING
    ```
    Error in setClass("attrData", representation(data = "list", defaults = "list")) : 
      could not find function "setClass"
    Error: package or namespace load failed for ‘anamiR’:
     unable to load R code in package ‘graph’
    Execution halted
    ```

*   checking whether the namespace can be loaded with stated dependencies ... WARNING
    ```
    Error in setClass("attrData", representation(data = "list", defaults = "list")) : 
      could not find function "setClass"
    Error: unable to load R code in package ‘graph’
    Execution halted
    
    A namespace must be able to be loaded with just the base namespace
    loaded: otherwise if the namespace gets loaded by a saved object, the
    session will be unable to start.
    
    Probably some imports need to be declared in the NAMESPACE file.
    ```

*   checking S3 generic/method consistency ... WARNING
    ```
    ...
    5: value[[3L]](cond)
    4: tryCatchOne(expr, names, parentenv, handlers[[1L]])
    3: tryCatchList(expr, classes, parentenv, handlers)
    2: tryCatch({
           attr(package, "LibPath") <- which.lib.loc
           ns <- loadNamespace(package, lib.loc)
           env <- attachNamespace(ns, pos = pos, deps, exclude, include.only)
       }, error = function(e) {
           P <- if (!is.null(cc <- conditionCall(e))) 
               paste(" in", deparse(cc)[1L])
           else ""
           msg <- gettextf("package or namespace load failed for %s%s:\n %s", 
               sQuote(package), P, conditionMessage(e))
           if (logical.return) 
               message(paste("Error:", msg), domain = NA)
           else stop(msg, call. = FALSE, domain = NA)
       })
    1: library(package, lib.loc = lib.loc, character.only = TRUE, verbose = FALSE)
    Execution halted
    See section ‘Generic functions and methods’ in the ‘Writing R
    Extensions’ manual.
    ```

*   checking replacement functions ... WARNING
    ```
    ...
    5: value[[3L]](cond)
    4: tryCatchOne(expr, names, parentenv, handlers[[1L]])
    3: tryCatchList(expr, classes, parentenv, handlers)
    2: tryCatch({
           attr(package, "LibPath") <- which.lib.loc
           ns <- loadNamespace(package, lib.loc)
           env <- attachNamespace(ns, pos = pos, deps, exclude, include.only)
       }, error = function(e) {
           P <- if (!is.null(cc <- conditionCall(e))) 
               paste(" in", deparse(cc)[1L])
           else ""
           msg <- gettextf("package or namespace load failed for %s%s:\n %s", 
               sQuote(package), P, conditionMessage(e))
           if (logical.return) 
               message(paste("Error:", msg), domain = NA)
           else stop(msg, call. = FALSE, domain = NA)
       })
    1: library(package, lib.loc = lib.loc, character.only = TRUE, verbose = FALSE)
    Execution halted
    The argument of a replacement function which corresponds to the right
    hand side must be named ‘value’.
    ```

*   checking for code/documentation mismatches ... WARNING
    ```
    ...
    Call sequence:
    6: stop(msg, call. = FALSE, domain = NA)
    5: value[[3L]](cond)
    4: tryCatchOne(expr, names, parentenv, handlers[[1L]])
    3: tryCatchList(expr, classes, parentenv, handlers)
    2: tryCatch({
           attr(package, "LibPath") <- which.lib.loc
           ns <- loadNamespace(package, lib.loc)
           env <- attachNamespace(ns, pos = pos, deps, exclude, include.only)
       }, error = function(e) {
           P <- if (!is.null(cc <- conditionCall(e))) 
               paste(" in", deparse(cc)[1L])
           else ""
           msg <- gettextf("package or namespace load failed for %s%s:\n %s", 
               sQuote(package), P, conditionMessage(e))
           if (logical.return) 
               message(paste("Error:", msg), domain = NA)
           else stop(msg, call. = FALSE, domain = NA)
       })
    1: library(package, lib.loc = lib.loc, character.only = TRUE, verbose = FALSE)
    Execution halted
    ```

*   checking installed package size ... NOTE
    ```
      installed size is 22.9Mb
      sub-directories of 1Mb or more:
        data      1.8Mb
        doc       1.3Mb
        extdata  19.6Mb
    ```

*   checking dependencies in R code ... NOTE
    ```
    ...
    Call sequence:
    6: stop(msg, call. = FALSE, domain = NA)
    5: value[[3L]](cond)
    4: tryCatchOne(expr, names, parentenv, handlers[[1L]])
    3: tryCatchList(expr, classes, parentenv, handlers)
    2: tryCatch({
           attr(package, "LibPath") <- which.lib.loc
           ns <- loadNamespace(package, lib.loc)
           env <- attachNamespace(ns, pos = pos, deps, exclude, include.only)
       }, error = function(e) {
           P <- if (!is.null(cc <- conditionCall(e))) 
               paste(" in", deparse(cc)[1L])
           else ""
           msg <- gettextf("package or namespace load failed for %s%s:\n %s", 
               sQuote(package), P, conditionMessage(e))
           if (logical.return) 
               message(paste("Error:", msg), domain = NA)
           else stop(msg, call. = FALSE, domain = NA)
       })
    1: library(package, lib.loc = lib.loc, character.only = TRUE, verbose = FALSE)
    Execution halted
    ```

*   checking foreign function calls ... NOTE
    ```
    ...
    5: value[[3L]](cond)
    4: tryCatchOne(expr, names, parentenv, handlers[[1L]])
    3: tryCatchList(expr, classes, parentenv, handlers)
    2: tryCatch({
           attr(package, "LibPath") <- which.lib.loc
           ns <- loadNamespace(package, lib.loc)
           env <- attachNamespace(ns, pos = pos, deps, exclude, include.only)
       }, error = function(e) {
           P <- if (!is.null(cc <- conditionCall(e))) 
               paste(" in", deparse(cc)[1L])
           else ""
           msg <- gettextf("package or namespace load failed for %s%s:\n %s", 
               sQuote(package), P, conditionMessage(e))
           if (logical.return) 
               message(paste("Error:", msg), domain = NA)
           else stop(msg, call. = FALSE, domain = NA)
       })
    1: library(package, lib.loc = lib.loc, character.only = TRUE, verbose = FALSE)
    Execution halted
    See chapter ‘System and foreign language interfaces’ in the ‘Writing R
    Extensions’ manual.
    ```

*   checking R code for possible problems ... NOTE
    ```
    Error in setClass("attrData", representation(data = "list", defaults = "list")) : 
      could not find function "setClass"
    Error: unable to load R code in package ‘graph’
    Execution halted
    ```

*   checking Rd \usage sections ... NOTE
    ```
    ...
    3: tryCatchList(expr, classes, parentenv, handlers)
    2: tryCatch({
           attr(package, "LibPath") <- which.lib.loc
           ns <- loadNamespace(package, lib.loc)
           env <- attachNamespace(ns, pos = pos, deps, exclude, include.only)
       }, error = function(e) {
           P <- if (!is.null(cc <- conditionCall(e))) 
               paste(" in", deparse(cc)[1L])
           else ""
           msg <- gettextf("package or namespace load failed for %s%s:\n %s", 
               sQuote(package), P, conditionMessage(e))
           if (logical.return) 
               message(paste("Error:", msg), domain = NA)
           else stop(msg, call. = FALSE, domain = NA)
       })
    1: library(package, lib.loc = lib.loc, character.only = TRUE, verbose = FALSE)
    Execution halted
    The \usage entries for S3 methods should use the \method markup and not
    their full name.
    See chapter ‘Writing R documentation files’ in the ‘Writing R
    Extensions’ manual.
    ```

# aroma.affymetrix

<details>

* Version: 3.2.0
* Source code: https://github.com/cran/aroma.affymetrix
* URL: https://www.aroma-project.org/, https://github.com/HenrikBengtsson/aroma.affymetrix
* BugReports: https://github.com/HenrikBengtsson/aroma.affymetrix/issues
* Date/Publication: 2019-06-23 06:00:14 UTC
* Number of recursive dependencies: 80

Run `revdep_details(,"aroma.affymetrix")` for more info

</details>

## In both

*   checking whether package ‘aroma.affymetrix’ can be installed ... ERROR
    ```
    Installation failed.
    See ‘/home/rstudio/DBI/revdep/checks/aroma.affymetrix/new/aroma.affymetrix.Rcheck/00install.out’ for details.
    ```

## Installation

### Devel

```
* installing *source* package ‘aroma.affymetrix’ ...
** package ‘aroma.affymetrix’ successfully unpacked and MD5 sums checked
** using staged installation
** R
** inst
** byte-compile and prepare package for lazy loading
Error: package or namespace load failed for ‘aroma.core’:
 object ‘extract’ is not exported by 'namespace:R.filesets'
Error: package ‘aroma.core’ could not be loaded
In addition: Warning messages:
1: In setMethodS3.default("append", "default", function(...) { :
  Method already existed and was overwritten: append.default
2: In setGenericS3.default(name, export = exportGeneric, envir = envir,  :
  Renamed the preexisting function write to write.default, which was defined in environment base.
Execution halted
ERROR: lazy loading failed for package ‘aroma.affymetrix’
* removing ‘/home/rstudio/DBI/revdep/checks/aroma.affymetrix/new/aroma.affymetrix.Rcheck/aroma.affymetrix’

```
### CRAN

```
* installing *source* package ‘aroma.affymetrix’ ...
** package ‘aroma.affymetrix’ successfully unpacked and MD5 sums checked
** using staged installation
** R
** inst
** byte-compile and prepare package for lazy loading
Error: package or namespace load failed for ‘aroma.core’:
 object ‘extract’ is not exported by 'namespace:R.filesets'
Error: package ‘aroma.core’ could not be loaded
In addition: Warning messages:
1: In setMethodS3.default("append", "default", function(...) { :
  Method already existed and was overwritten: append.default
2: In setGenericS3.default(name, export = exportGeneric, envir = envir,  :
  Renamed the preexisting function write to write.default, which was defined in environment base.
Execution halted
ERROR: lazy loading failed for package ‘aroma.affymetrix’
* removing ‘/home/rstudio/DBI/revdep/checks/aroma.affymetrix/old/aroma.affymetrix.Rcheck/aroma.affymetrix’

```
# BIEN

<details>

* Version: 1.2.3
* Source code: https://github.com/cran/BIEN
* Date/Publication: 2018-05-09 17:02:00 UTC
* Number of recursive dependencies: 37

Run `revdep_details(,"BIEN")` for more info

</details>

## In both

*   R CMD check timed out
    

# bioassayR

<details>

* Version: 1.22.0
* Source code: https://github.com/cran/bioassayR
* URL: https://github.com/TylerBackman/bioassayR
* BugReports: https://github.com/TylerBackman/bioassayR/issues
* Date/Publication: 2019-05-02
* Number of recursive dependencies: 123

Run `revdep_details(,"bioassayR")` for more info

</details>

## In both

*   checking whether package ‘bioassayR’ can be installed ... ERROR
    ```
    Installation failed.
    See ‘/home/rstudio/DBI/revdep/checks/bioassayR/new/bioassayR.Rcheck/00install.out’ for details.
    ```

## Installation

### Devel

```
* installing *source* package ‘bioassayR’ ...
** using staged installation
** R
** data
** inst
** byte-compile and prepare package for lazy loading
Warning in data(atomprop) : data set ‘atomprop’ not found
Error in eval(exprs[i], envir) : object 'atomprop' not found
Error: unable to load R code in package ‘ChemmineR’
Execution halted
ERROR: lazy loading failed for package ‘bioassayR’
* removing ‘/home/rstudio/DBI/revdep/checks/bioassayR/new/bioassayR.Rcheck/bioassayR’

```
### CRAN

```
* installing *source* package ‘bioassayR’ ...
** using staged installation
** R
** data
** inst
** byte-compile and prepare package for lazy loading
Warning in data(atomprop) : data set ‘atomprop’ not found
Error in eval(exprs[i], envir) : object 'atomprop' not found
Error: unable to load R code in package ‘ChemmineR’
Execution halted
ERROR: lazy loading failed for package ‘bioassayR’
* removing ‘/home/rstudio/DBI/revdep/checks/bioassayR/old/bioassayR.Rcheck/bioassayR’

```
# biotmle

<details>

* Version: 1.8.0
* Source code: https://github.com/cran/biotmle
* URL: https://code.nimahejazi.org/biotmle
* BugReports: https://github.com/nhejazi/biotmle/issues
* Date/Publication: 2019-05-02
* Number of recursive dependencies: 103

Run `revdep_details(,"biotmle")` for more info

</details>

## In both

*   R CMD check timed out
    

# ChIPpeakAnno

<details>

* Version: 
* Source code: ???
* URL: http://r-dbi.github.io/DBI
* BugReports: https://github.com/r-dbi/DBI/issues
* Number of recursive dependencies: 0

Run `revdep_details(,"")` for more info

</details>

## Error before installation

### Devel

```






```
### CRAN

```






```
# clariomdhumanprobeset.db

<details>

* Version: 8.7.0
* Source code: https://github.com/cran/clariomdhumanprobeset.db
* Number of recursive dependencies: 32

Run `revdep_details(,"clariomdhumanprobeset.db")` for more info

</details>

## In both

*   R CMD check timed out
    

*   checking installed package size ... NOTE
    ```
      installed size is 288.8Mb
      sub-directories of 1Mb or more:
        extdata  288.7Mb
    ```

*   checking DESCRIPTION meta-information ... NOTE
    ```
    Malformed Description field: should contain one or more complete sentences.
    Packages listed in more than one of Depends, Imports, Suggests, Enhances:
      ‘methods’ ‘AnnotationDbi’
    A package should be listed in only one of these fields.
    ```

*   checking dependencies in R code ... NOTE
    ```
    Package in Depends field not imported from: ‘org.Hs.eg.db’
      These packages need to be imported from (in the NAMESPACE file)
      for when this namespace is loaded but not attached.
    Unexported objects imported by ':::' calls:
      ‘AnnotationDbi:::annoStartupMessages’ ‘AnnotationDbi:::dbObjectName’
      See the note in ?`:::` about the use of this operator.
    ```

*   checking R code for possible problems ... NOTE
    ```
    File ‘clariomdhumanprobeset.db/R/zzz.R’:
      .onLoad calls:
        packageStartupMessage(AnnotationDbi:::annoStartupMessages("clariomdhumanprobeset.db"))
    
    See section ‘Good practice’ in '?.onAttach'.
    ```

# cn.farms

<details>

* Version: 
* Source code: ???
* URL: http://r-dbi.github.io/DBI
* BugReports: https://github.com/r-dbi/DBI/issues
* Number of recursive dependencies: 0

Run `revdep_details(,"")` for more info

</details>

## Error before installation

### Devel

```






```
### CRAN

```






```
# CNEr

<details>

* Version: 1.20.0
* Source code: https://github.com/cran/CNEr
* URL: https://github.com/ge11232002/CNEr
* BugReports: https://github.com/ge11232002/CNEr/issues
* Date/Publication: 2019-05-02
* Number of recursive dependencies: 140

Run `revdep_details(,"CNEr")` for more info

</details>

## In both

*   R CMD check timed out
    

*   checking whether the package can be unloaded cleanly ... WARNING
    ```
    Error in setRefClass("distribution", fields = list(dat = "ANY", internal = "list",  : 
      could not find function "setRefClass"
    Error: package or namespace load failed for ‘CNEr’:
     unable to load R code in package ‘poweRlaw’
    Execution halted
    ```

*   checking whether the namespace can be loaded with stated dependencies ... WARNING
    ```
    Error in setRefClass("distribution", fields = list(dat = "ANY", internal = "list",  : 
      could not find function "setRefClass"
    Error: unable to load R code in package ‘poweRlaw’
    Execution halted
    
    A namespace must be able to be loaded with just the base namespace
    loaded: otherwise if the namespace gets loaded by a saved object, the
    session will be unable to start.
    
    Probably some imports need to be declared in the NAMESPACE file.
    ```

*   checking S3 generic/method consistency ... WARNING
    ```
    ...
    5: value[[3L]](cond)
    4: tryCatchOne(expr, names, parentenv, handlers[[1L]])
    3: tryCatchList(expr, classes, parentenv, handlers)
    2: tryCatch({
           attr(package, "LibPath") <- which.lib.loc
           ns <- loadNamespace(package, lib.loc)
           env <- attachNamespace(ns, pos = pos, deps, exclude, include.only)
       }, error = function(e) {
           P <- if (!is.null(cc <- conditionCall(e))) 
               paste(" in", deparse(cc)[1L])
           else ""
           msg <- gettextf("package or namespace load failed for %s%s:\n %s", 
               sQuote(package), P, conditionMessage(e))
           if (logical.return) 
               message(paste("Error:", msg), domain = NA)
           else stop(msg, call. = FALSE, domain = NA)
       })
    1: library(package, lib.loc = lib.loc, character.only = TRUE, verbose = FALSE)
    Execution halted
    See section ‘Generic functions and methods’ in the ‘Writing R
    Extensions’ manual.
    ```

*   checking replacement functions ... WARNING
    ```
    ...
    5: value[[3L]](cond)
    4: tryCatchOne(expr, names, parentenv, handlers[[1L]])
    3: tryCatchList(expr, classes, parentenv, handlers)
    2: tryCatch({
           attr(package, "LibPath") <- which.lib.loc
           ns <- loadNamespace(package, lib.loc)
           env <- attachNamespace(ns, pos = pos, deps, exclude, include.only)
       }, error = function(e) {
           P <- if (!is.null(cc <- conditionCall(e))) 
               paste(" in", deparse(cc)[1L])
           else ""
           msg <- gettextf("package or namespace load failed for %s%s:\n %s", 
               sQuote(package), P, conditionMessage(e))
           if (logical.return) 
               message(paste("Error:", msg), domain = NA)
           else stop(msg, call. = FALSE, domain = NA)
       })
    1: library(package, lib.loc = lib.loc, character.only = TRUE, verbose = FALSE)
    Execution halted
    The argument of a replacement function which corresponds to the right
    hand side must be named ‘value’.
    ```

*   checking for code/documentation mismatches ... WARNING
    ```
    ...
    Call sequence:
    6: stop(msg, call. = FALSE, domain = NA)
    5: value[[3L]](cond)
    4: tryCatchOne(expr, names, parentenv, handlers[[1L]])
    3: tryCatchList(expr, classes, parentenv, handlers)
    2: tryCatch({
           attr(package, "LibPath") <- which.lib.loc
           ns <- loadNamespace(package, lib.loc)
           env <- attachNamespace(ns, pos = pos, deps, exclude, include.only)
       }, error = function(e) {
           P <- if (!is.null(cc <- conditionCall(e))) 
               paste(" in", deparse(cc)[1L])
           else ""
           msg <- gettextf("package or namespace load failed for %s%s:\n %s", 
               sQuote(package), P, conditionMessage(e))
           if (logical.return) 
               message(paste("Error:", msg), domain = NA)
           else stop(msg, call. = FALSE, domain = NA)
       })
    1: library(package, lib.loc = lib.loc, character.only = TRUE, verbose = FALSE)
    Execution halted
    ```

*   checking data for non-ASCII characters ... WARNING
    ```
    ...
        unable to find required package 'CNEr'
      
      Error in distribution$accessors : 
        object of type 'closure' is not subsettable
      Error loading dataset 'cneFinalListDanRer10Hg38':
       Error in .requirePackage(package) : 
        unable to find required package 'CNEr'
      
      Error in distribution$accessors : 
        object of type 'closure' is not subsettable
      Error loading dataset 'CNEHg38DanRer10':
       Error in .requirePackage(package) : 
        unable to find required package 'CNEr'
      
      Error in distribution$accessors : 
        object of type 'closure' is not subsettable
      Error loading dataset 'grangesPairsForDotplot':
       Error in .requirePackage(package) : 
        unable to find required package 'CNEr'
      
      The dataset(s) may use package(s) not declared in the DESCRIPTION file.
    ```

*   checking compiled code ... WARNING
    ```
    ...
    File ‘CNEr/libs/CNEr.so’:
      Found ‘abort’, possibly from ‘abort’ (C)
        Object: ‘ucsc/errabort.o’
      Found ‘exit’, possibly from ‘exit’ (C)
        Objects: ‘ucsc/errabort.o’, ‘ucsc/pipeline.o’
      Found ‘puts’, possibly from ‘printf’ (C), ‘puts’ (C)
        Object: ‘ucsc/pipeline.o’
      Found ‘rand’, possibly from ‘rand’ (C)
        Object: ‘ucsc/obscure.o’
      Found ‘stderr’, possibly from ‘stderr’ (C)
        Objects: ‘ucsc/axt.o’, ‘ucsc/errabort.o’, ‘ucsc/obscure.o’,
          ‘ucsc/verbose.o’, ‘ucsc/os.o’
      Found ‘stdout’, possibly from ‘stdout’ (C)
        Objects: ‘ucsc/common.o’, ‘ucsc/errabort.o’, ‘ucsc/verbose.o’,
          ‘ucsc/os.o’
    
    Compiled code should not call entry points which might terminate R nor
    write to stdout/stderr instead of to the console, nor use Fortran I/O
    nor system RNGs.
    
    See ‘Writing portable packages’ in the ‘Writing R Extensions’ manual.
    ```

*   checking installed package size ... NOTE
    ```
      installed size is 21.7Mb
      sub-directories of 1Mb or more:
        doc       1.9Mb
        extdata  15.9Mb
        libs      1.2Mb
        R         2.4Mb
    ```

*   checking dependencies in R code ... NOTE
    ```
    ...
    Call sequence:
    6: stop(msg, call. = FALSE, domain = NA)
    5: value[[3L]](cond)
    4: tryCatchOne(expr, names, parentenv, handlers[[1L]])
    3: tryCatchList(expr, classes, parentenv, handlers)
    2: tryCatch({
           attr(package, "LibPath") <- which.lib.loc
           ns <- loadNamespace(package, lib.loc)
           env <- attachNamespace(ns, pos = pos, deps, exclude, include.only)
       }, error = function(e) {
           P <- if (!is.null(cc <- conditionCall(e))) 
               paste(" in", deparse(cc)[1L])
           else ""
           msg <- gettextf("package or namespace load failed for %s%s:\n %s", 
               sQuote(package), P, conditionMessage(e))
           if (logical.return) 
               message(paste("Error:", msg), domain = NA)
           else stop(msg, call. = FALSE, domain = NA)
       })
    1: library(package, lib.loc = lib.loc, character.only = TRUE, verbose = FALSE)
    Execution halted
    ```

*   checking foreign function calls ... NOTE
    ```
    ...
    5: value[[3L]](cond)
    4: tryCatchOne(expr, names, parentenv, handlers[[1L]])
    3: tryCatchList(expr, classes, parentenv, handlers)
    2: tryCatch({
           attr(package, "LibPath") <- which.lib.loc
           ns <- loadNamespace(package, lib.loc)
           env <- attachNamespace(ns, pos = pos, deps, exclude, include.only)
       }, error = function(e) {
           P <- if (!is.null(cc <- conditionCall(e))) 
               paste(" in", deparse(cc)[1L])
           else ""
           msg <- gettextf("package or namespace load failed for %s%s:\n %s", 
               sQuote(package), P, conditionMessage(e))
           if (logical.return) 
               message(paste("Error:", msg), domain = NA)
           else stop(msg, call. = FALSE, domain = NA)
       })
    1: library(package, lib.loc = lib.loc, character.only = TRUE, verbose = FALSE)
    Execution halted
    See chapter ‘System and foreign language interfaces’ in the ‘Writing R
    Extensions’ manual.
    ```

*   checking R code for possible problems ... NOTE
    ```
    Error in setRefClass("distribution", fields = list(dat = "ANY", internal = "list",  : 
      could not find function "setRefClass"
    Error: unable to load R code in package ‘poweRlaw’
    Execution halted
    ```

*   checking Rd \usage sections ... NOTE
    ```
    ...
    3: tryCatchList(expr, classes, parentenv, handlers)
    2: tryCatch({
           attr(package, "LibPath") <- which.lib.loc
           ns <- loadNamespace(package, lib.loc)
           env <- attachNamespace(ns, pos = pos, deps, exclude, include.only)
       }, error = function(e) {
           P <- if (!is.null(cc <- conditionCall(e))) 
               paste(" in", deparse(cc)[1L])
           else ""
           msg <- gettextf("package or namespace load failed for %s%s:\n %s", 
               sQuote(package), P, conditionMessage(e))
           if (logical.return) 
               message(paste("Error:", msg), domain = NA)
           else stop(msg, call. = FALSE, domain = NA)
       })
    1: library(package, lib.loc = lib.loc, character.only = TRUE, verbose = FALSE)
    Execution halted
    The \usage entries for S3 methods should use the \method markup and not
    their full name.
    See chapter ‘Writing R documentation files’ in the ‘Writing R
    Extensions’ manual.
    ```

# eiR

<details>

* Version: 1.24.0
* Source code: https://github.com/cran/eiR
* URL: https://github.com/girke-lab/eiR
* Date/Publication: 2019-05-02
* Number of recursive dependencies: 134

Run `revdep_details(,"eiR")` for more info

</details>

## In both

*   checking whether package ‘eiR’ can be installed ... ERROR
    ```
    Installation failed.
    See ‘/home/rstudio/DBI/revdep/checks/eiR/new/eiR.Rcheck/00install.out’ for details.
    ```

*   checking for hidden files and directories ... NOTE
    ```
    Found the following hidden files and directories:
      .BBSoptions
    These were most likely included in error. See section ‘Package
    structure’ in the ‘Writing R Extensions’ manual.
    ```

## Installation

### Devel

```
* installing *source* package ‘eiR’ ...
** using staged installation
** libs
g++ -std=gnu++11 -I"/usr/local/lib/R/include" -DNDEBUG   -I/usr/local/include  -fpic  -g -O2 -fstack-protector-strong -Wformat -Werror=format-security -Wdate-time -D_FORTIFY_SOURCE=2 -g  -c optimFunctions.cc -o optimFunctions.o
g++ -std=gnu++11 -shared -L/usr/local/lib/R/lib -L/usr/local/lib -o eiR.so optimFunctions.o -L/usr/local/lib/R/lib -lR
installing to /home/rstudio/DBI/revdep/checks/eiR/new/eiR.Rcheck/00LOCK-eiR/00new/eiR/libs
** R
** data
** inst
** byte-compile and prepare package for lazy loading
Error in eval(exprs[i], envir) : object 'atomprop' not found
In addition: Warning message:
In data(atomprop) : data set ‘atomprop’ not found
Error: package or namespace load failed for ‘ChemmineR’:
 unable to load R code in package ‘ChemmineR’
Error: package ‘ChemmineR’ could not be loaded
Execution halted
ERROR: lazy loading failed for package ‘eiR’
* removing ‘/home/rstudio/DBI/revdep/checks/eiR/new/eiR.Rcheck/eiR’

```
### CRAN

```
* installing *source* package ‘eiR’ ...
** using staged installation
** libs
g++ -std=gnu++11 -I"/usr/local/lib/R/include" -DNDEBUG   -I/usr/local/include  -fpic  -g -O2 -fstack-protector-strong -Wformat -Werror=format-security -Wdate-time -D_FORTIFY_SOURCE=2 -g  -c optimFunctions.cc -o optimFunctions.o
g++ -std=gnu++11 -shared -L/usr/local/lib/R/lib -L/usr/local/lib -o eiR.so optimFunctions.o -L/usr/local/lib/R/lib -lR
installing to /home/rstudio/DBI/revdep/checks/eiR/old/eiR.Rcheck/00LOCK-eiR/00new/eiR/libs
** R
** data
** inst
** byte-compile and prepare package for lazy loading
Error in eval(exprs[i], envir) : object 'atomprop' not found
In addition: Warning message:
In data(atomprop) : data set ‘atomprop’ not found
Error: package or namespace load failed for ‘ChemmineR’:
 unable to load R code in package ‘ChemmineR’
Error: package ‘ChemmineR’ could not be loaded
Execution halted
ERROR: lazy loading failed for package ‘eiR’
* removing ‘/home/rstudio/DBI/revdep/checks/eiR/old/eiR.Rcheck/eiR’

```
# GenVisR

<details>

* Version: 1.16.1
* Source code: https://github.com/cran/GenVisR
* BugReports: https://github.com/griffithlab/GenVisR/issues
* Date/Publication: 2019-08-16
* Number of recursive dependencies: 151

Run `revdep_details(,"GenVisR")` for more info

</details>

## In both

*   R CMD check timed out
    

*   checking installed package size ... NOTE
    ```
      installed size is 14.8Mb
      sub-directories of 1Mb or more:
        doc      11.4Mb
        extdata   1.0Mb
        R         1.8Mb
    ```

*   checking dependencies in R code ... NOTE
    ```
    Namespace in Imports field not imported from: ‘reshape2’
      All declared Imports should be used.
    ```

*   checking R code for possible problems ... NOTE
    ```
    setTierTwo,data.table : a: no visible binding for global variable ‘tmp’
      (/home/rstudio/DBI/revdep/checks/GenVisR/new/GenVisR.Rcheck/00_pkg_src/GenVisR/R/Lolliplot-class.R:970)
    toLolliplot,GMS: no visible binding for global variable ‘missingINdex’
      (/home/rstudio/DBI/revdep/checks/GenVisR/new/GenVisR.Rcheck/00_pkg_src/GenVisR/R/GMS-class.R:536-537)
    Undefined global functions or variables:
      missingINdex tmp
    ```

# hta20probeset.db

<details>

* Version: 8.7.0
* Source code: https://github.com/cran/hta20probeset.db
* Number of recursive dependencies: 32

Run `revdep_details(,"hta20probeset.db")` for more info

</details>

## In both

*   R CMD check timed out
    

*   checking installed package size ... NOTE
    ```
      installed size is 295.1Mb
      sub-directories of 1Mb or more:
        extdata  295.0Mb
    ```

*   checking DESCRIPTION meta-information ... NOTE
    ```
    Malformed Description field: should contain one or more complete sentences.
    Packages listed in more than one of Depends, Imports, Suggests, Enhances:
      ‘methods’ ‘AnnotationDbi’
    A package should be listed in only one of these fields.
    ```

*   checking dependencies in R code ... NOTE
    ```
    Package in Depends field not imported from: ‘org.Hs.eg.db’
      These packages need to be imported from (in the NAMESPACE file)
      for when this namespace is loaded but not attached.
    Unexported objects imported by ':::' calls:
      ‘AnnotationDbi:::annoStartupMessages’ ‘AnnotationDbi:::dbObjectName’
      See the note in ?`:::` about the use of this operator.
    ```

*   checking R code for possible problems ... NOTE
    ```
    File ‘hta20probeset.db/R/zzz.R’:
      .onLoad calls:
        packageStartupMessage(AnnotationDbi:::annoStartupMessages("hta20probeset.db"))
    
    See section ‘Good practice’ in '?.onAttach'.
    ```

# huex10stprobeset.db

<details>

* Version: 8.7.0
* Source code: https://github.com/cran/huex10stprobeset.db
* Number of recursive dependencies: 32

Run `revdep_details(,"huex10stprobeset.db")` for more info

</details>

## Newly broken

*   R CMD check timed out
    

## Newly fixed

*   checking examples ... ERROR
    ```
    ...
    +     got <- xx[[1]]           
    +     got[[1]][["GOID"]]
    +     got[[1]][["Ontology"]]
    +     got[[1]][["Evidence"]]
    + }
    [1] "IMP"
    > # For the reverse map:
    > # Convert to a list
    > xx <- as.list(huex10stprobesetGO2PROBE)
    > if(length(xx) > 0){
    +     # Gets the manufacturer ids for the top 2nd and 3nd GO identifiers
    +     goids <- xx[2:3]
    +     # Gets the manufacturer ids for the first element of goids
    +     goids[[1]]
    +     # Evidence code for the mappings
    +     names(goids[[1]])
    + }
     [1] "IEP" "IEP" "IEP" "IEP" "IEP" "IEP" "IEP" "IEP" "IEP" "IEP"
    > # Convert huex10stprobesetGO2ALLPROBES to a list
    > xx <- as.list(huex10stprobesetGO2ALLPROBES)
    Killed
    ```

## In both

*   checking installed package size ... NOTE
    ```
      installed size is 255.1Mb
      sub-directories of 1Mb or more:
        extdata  255.0Mb
    ```

*   checking DESCRIPTION meta-information ... NOTE
    ```
    Malformed Description field: should contain one or more complete sentences.
    Packages listed in more than one of Depends, Imports, Suggests, Enhances:
      ‘methods’ ‘AnnotationDbi’
    A package should be listed in only one of these fields.
    ```

*   checking dependencies in R code ... NOTE
    ```
    Package in Depends field not imported from: ‘org.Hs.eg.db’
      These packages need to be imported from (in the NAMESPACE file)
      for when this namespace is loaded but not attached.
    Unexported objects imported by ':::' calls:
      ‘AnnotationDbi:::annoStartupMessages’ ‘AnnotationDbi:::dbObjectName’
      See the note in ?`:::` about the use of this operator.
    ```

*   checking R code for possible problems ... NOTE
    ```
    File ‘huex10stprobeset.db/R/zzz.R’:
      .onLoad calls:
        packageStartupMessage(AnnotationDbi:::annoStartupMessages("huex10stprobeset.db"))
    
    See section ‘Good practice’ in '?.onAttach'.
    ```

# IntEREst

<details>

* Version: 1.8.0
* Source code: https://github.com/cran/IntEREst
* Date/Publication: 2019-05-02
* Number of recursive dependencies: 129

Run `revdep_details(,"IntEREst")` for more info

</details>

## In both

*   R CMD check timed out
    

*   checking whether the namespace can be loaded with stated dependencies ... WARNING
    ```
    Error in globalVariables("naresid.omit") : 
      could not find function "globalVariables"
    Error: unable to load R code in package ‘Hmisc’
    Execution halted
    
    A namespace must be able to be loaded with just the base namespace
    loaded: otherwise if the namespace gets loaded by a saved object, the
    session will be unable to start.
    
    Probably some imports need to be declared in the NAMESPACE file.
    ```

*   checking S3 generic/method consistency ... NOTE
    ```
    Found the following apparent S3 methods exported but not registered:
      plot.InterestResult
    See section ‘Registering S3 methods’ in the ‘Writing R Extensions’
    manual.
    ```

*   checking R code for possible problems ... NOTE
    ```
    Error in globalVariables("naresid.omit") : 
      could not find function "globalVariables"
    Error: unable to load R code in package ‘Hmisc’
    Execution halted
    ```

# isobar

<details>

* Version: 1.30.0
* Source code: https://github.com/cran/isobar
* URL: https://github.com/fbreitwieser/isobar
* BugReports: https://github.com/fbreitwieser/isobar/issues
* Date/Publication: 2019-05-02
* Number of recursive dependencies: 125

Run `revdep_details(,"isobar")` for more info

</details>

## In both

*   checking whether package ‘isobar’ can be installed ... ERROR
    ```
    Installation failed.
    See ‘/home/rstudio/DBI/revdep/checks/isobar/new/isobar.Rcheck/00install.out’ for details.
    ```

## Installation

### Devel

```
* installing *source* package ‘isobar’ ...
** using staged installation
** R
** data
** inst
** byte-compile and prepare package for lazy loading
From .checkSubclasses(): subclass "ScalarCharacter" of class "character" is not local and is not updated for new inheritance information currently; 
[where=<environment: 0x564e36bf04e0>, where2=<environment: namespace:S4Vectors>]
From .checkSubclasses(): subclass "Versions" of class "vector" is not local and is not updated for new inheritance information currently; 
[where=<environment: 0x564e36bf04e0>, where2=<environment: namespace:S4Vectors>]
From .checkSubclasses(): subclass "VersionsNull" of class "vector" is not local and is not updated for new inheritance information currently; 
[where=<environment: 0x564e36bf04e0>, where2=<environment: namespace:S4Vectors>]
in method for ‘normalizeSingleBracketReplacementValue’ with signature ‘"List"’: no definition for class “List”
Creating a generic function for ‘complete.cases’ from package ‘stats’ in package ‘S4Vectors’
Creating a new generic function for ‘expand.grid’ in package ‘S4Vectors’
Creating a generic function for ‘%in%’ from package ‘base’ in package ‘S4Vectors’
Creating a new generic function for ‘findMatches’ in package ‘S4Vectors’
Creating a generic function for ‘setequal’ from package ‘base’ in package ‘S4Vectors’
Creating a generic function for ‘as.factor’ from package ‘base’ in package ‘S4Vectors’
Creating a generic function for ‘tabulate’ from package ‘base’ in package ‘S4Vectors’
Creating a generic function for ‘cov’ from package ‘stats’ in package ‘S4Vectors’
Creating a generic function for ‘cor’ from package ‘stats’ in package ‘S4Vectors’
Creating a generic function for ‘smoothEnds’ from package ‘stats’ in package ‘S4Vectors’
Creating a generic function for ‘runmed’ from package ‘stats’ in package ‘S4Vectors’
Creating a generic function for ‘nchar’ from package ‘base’ in package ‘S4Vectors’
Creating a generic function for ‘substr’ from package ‘base’ in package ‘S4Vectors’
Creating a generic function for ‘substring’ from package ‘base’ in package ‘S4Vectors’
Creating a generic function for ‘chartr’ from package ‘base’ in package ‘S4Vectors’
Creating a generic function for ‘tolower’ from package ‘base’ in package ‘S4Vectors’
Creating a generic function for ‘toupper’ from package ‘base’ in package ‘S4Vectors’
Creating a generic function for ‘sub’ from package ‘base’ in package ‘S4Vectors’
Creating a generic function for ‘gsub’ from package ‘base’ in package ‘S4Vectors’
in method for ‘coerce’ with signature ‘"data.table","DataFrame"’: no definition for class “data.table”
From .checkSubclasses(): subclass "ScalarCharacter" of class "character" is not local and is not updated for new inheritance information currently; 
[where=<environment: 0x564e399cc9d0>, where2=<environment: namespace:IRanges>]
Creating a generic function for ‘drop’ from package ‘base’ in package ‘IRanges’
Creating a generic function for ‘runmed’ from package ‘stats’ in package ‘IRanges’
Creating a generic function for ‘chartr’ from package ‘base’ in package ‘IRanges’
Creating a generic function for ‘toupper’ from package ‘base’ in package ‘IRanges’
Creating a generic function for ‘tolower’ from package ‘base’ in package ‘IRanges’
Creating a generic function for ‘sub’ from package ‘base’ in package ‘IRanges’
Creating a generic function for ‘gsub’ from package ‘base’ in package ‘IRanges’
Creating a generic function for ‘smoothEnds’ from package ‘stats’ in package ‘IRanges’
Creating a new generic function for ‘packageName’ in package ‘AnnotationDbi’
Creating a generic function for ‘ls’ from package ‘base’ in package ‘AnnotationDbi’
Creating a generic function for ‘eapply’ from package ‘base’ in package ‘AnnotationDbi’
Creating a generic function for ‘exists’ from package ‘base’ in package ‘AnnotationDbi’
Creating a generic function for ‘sample’ from package ‘base’ in package ‘AnnotationDbi’
Warning in packageDescription("distrEx") :
  no package 'distrEx' was found
From .checkSubclasses(): subclass "FilterMatrix" of class "matrix" is not local and is not updated for new inheritance information currently; 
[where=<environment: 0x564e38296b00>, where2=<environment: namespace:distr>]
Creating a new generic function for ‘qqplot’ in package ‘distr’
Error in setMethod("gaps", signature(object = "AbscontDistribution"),  : 
  no existing definition for function ‘gaps’
Error: unable to load R code in package ‘distr’
Execution halted
ERROR: lazy loading failed for package ‘isobar’
* removing ‘/home/rstudio/DBI/revdep/checks/isobar/new/isobar.Rcheck/isobar’

```
### CRAN

```
* installing *source* package ‘isobar’ ...
** using staged installation
** R
** data
** inst
** byte-compile and prepare package for lazy loading
From .checkSubclasses(): subclass "ScalarCharacter" of class "character" is not local and is not updated for new inheritance information currently; 
[where=<environment: 0x5581d8c185b8>, where2=<environment: namespace:S4Vectors>]
From .checkSubclasses(): subclass "Versions" of class "vector" is not local and is not updated for new inheritance information currently; 
[where=<environment: 0x5581d8c185b8>, where2=<environment: namespace:S4Vectors>]
From .checkSubclasses(): subclass "VersionsNull" of class "vector" is not local and is not updated for new inheritance information currently; 
[where=<environment: 0x5581d8c185b8>, where2=<environment: namespace:S4Vectors>]
in method for ‘normalizeSingleBracketReplacementValue’ with signature ‘"List"’: no definition for class “List”
Creating a generic function for ‘complete.cases’ from package ‘stats’ in package ‘S4Vectors’
Creating a new generic function for ‘expand.grid’ in package ‘S4Vectors’
Creating a generic function for ‘%in%’ from package ‘base’ in package ‘S4Vectors’
Creating a new generic function for ‘findMatches’ in package ‘S4Vectors’
Creating a generic function for ‘setequal’ from package ‘base’ in package ‘S4Vectors’
Creating a generic function for ‘as.factor’ from package ‘base’ in package ‘S4Vectors’
Creating a generic function for ‘tabulate’ from package ‘base’ in package ‘S4Vectors’
Creating a generic function for ‘cov’ from package ‘stats’ in package ‘S4Vectors’
Creating a generic function for ‘cor’ from package ‘stats’ in package ‘S4Vectors’
Creating a generic function for ‘smoothEnds’ from package ‘stats’ in package ‘S4Vectors’
Creating a generic function for ‘runmed’ from package ‘stats’ in package ‘S4Vectors’
Creating a generic function for ‘nchar’ from package ‘base’ in package ‘S4Vectors’
Creating a generic function for ‘substr’ from package ‘base’ in package ‘S4Vectors’
Creating a generic function for ‘substring’ from package ‘base’ in package ‘S4Vectors’
Creating a generic function for ‘chartr’ from package ‘base’ in package ‘S4Vectors’
Creating a generic function for ‘tolower’ from package ‘base’ in package ‘S4Vectors’
Creating a generic function for ‘toupper’ from package ‘base’ in package ‘S4Vectors’
Creating a generic function for ‘sub’ from package ‘base’ in package ‘S4Vectors’
Creating a generic function for ‘gsub’ from package ‘base’ in package ‘S4Vectors’
in method for ‘coerce’ with signature ‘"data.table","DataFrame"’: no definition for class “data.table”
From .checkSubclasses(): subclass "ScalarCharacter" of class "character" is not local and is not updated for new inheritance information currently; 
[where=<environment: 0x5581db404350>, where2=<environment: namespace:IRanges>]
Creating a generic function for ‘drop’ from package ‘base’ in package ‘IRanges’
Creating a generic function for ‘runmed’ from package ‘stats’ in package ‘IRanges’
Creating a generic function for ‘chartr’ from package ‘base’ in package ‘IRanges’
Creating a generic function for ‘toupper’ from package ‘base’ in package ‘IRanges’
Creating a generic function for ‘tolower’ from package ‘base’ in package ‘IRanges’
Creating a generic function for ‘sub’ from package ‘base’ in package ‘IRanges’
Creating a generic function for ‘gsub’ from package ‘base’ in package ‘IRanges’
Creating a generic function for ‘smoothEnds’ from package ‘stats’ in package ‘IRanges’
Creating a new generic function for ‘packageName’ in package ‘AnnotationDbi’
Creating a generic function for ‘ls’ from package ‘base’ in package ‘AnnotationDbi’
Creating a generic function for ‘eapply’ from package ‘base’ in package ‘AnnotationDbi’
Creating a generic function for ‘exists’ from package ‘base’ in package ‘AnnotationDbi’
Creating a generic function for ‘sample’ from package ‘base’ in package ‘AnnotationDbi’
Warning in packageDescription("distrEx") :
  no package 'distrEx' was found
From .checkSubclasses(): subclass "FilterMatrix" of class "matrix" is not local and is not updated for new inheritance information currently; 
[where=<environment: 0x5581dafdb7e0>, where2=<environment: namespace:distr>]
Creating a new generic function for ‘qqplot’ in package ‘distr’
Error in setMethod("gaps", signature(object = "AbscontDistribution"),  : 
  no existing definition for function ‘gaps’
Error: unable to load R code in package ‘distr’
Execution halted
ERROR: lazy loading failed for package ‘isobar’
* removing ‘/home/rstudio/DBI/revdep/checks/isobar/old/isobar.Rcheck/isobar’

```
# IsoformSwitchAnalyzeR

<details>

* Version: 1.6.0
* Source code: https://github.com/cran/IsoformSwitchAnalyzeR
* URL: http://bioconductor.org/packages/IsoformSwitchAnalyzeR/
* BugReports: https://github.com/kvittingseerup/IsoformSwitchAnalyzeR/issues
* Date/Publication: 2019-05-02
* Number of recursive dependencies: 139

Run `revdep_details(,"IsoformSwitchAnalyzeR")` for more info

</details>

## In both

*   R CMD check timed out
    

*   checking whether the namespace can be loaded with stated dependencies ... WARNING
    ```
    Error in setMethod("coefficients", "dmDSfit", function(object, level = "gene") { : 
      no existing definition for function ‘coefficients’
    Error: unable to load R code in package ‘DRIMSeq’
    Execution halted
    
    A namespace must be able to be loaded with just the base namespace
    loaded: otherwise if the namespace gets loaded by a saved object, the
    session will be unable to start.
    
    Probably some imports need to be declared in the NAMESPACE file.
    ```

*   checking installed package size ... NOTE
    ```
      installed size is  9.8Mb
      sub-directories of 1Mb or more:
        doc       3.8Mb
        extdata   2.0Mb
        R         2.9Mb
    ```

*   checking R code for possible problems ... NOTE
    ```
    Error in setMethod("coefficients", "dmDSfit", function(object, level = "gene") { : 
      no existing definition for function ‘coefficients’
    Error: unable to load R code in package ‘DRIMSeq’
    Execution halted
    ```

# ITALICS

<details>

* Version: 
* Source code: ???
* URL: http://r-dbi.github.io/DBI
* BugReports: https://github.com/r-dbi/DBI/issues
* Number of recursive dependencies: 0

Run `revdep_details(,"")` for more info

</details>

## Error before installation

### Devel

```






```
### CRAN

```






```
# org.Pt.eg.db

<details>

* Version: 3.8.2
* Source code: https://github.com/cran/org.Pt.eg.db
* Number of recursive dependencies: 31

Run `revdep_details(,"org.Pt.eg.db")` for more info

</details>

## Newly broken

*   checking whether package ‘org.Pt.eg.db’ can be installed ... ERROR
    ```
    Installation failed.
    See ‘/home/rstudio/DBI/revdep/checks/org.Pt.eg.db/new/org.Pt.eg.db.Rcheck/00install.out’ for details.
    ```

## Newly fixed

*   checking for code/documentation mismatches ... WARNING
    ```
    ...
     .onLoad failed in loadNamespace() for 'utils', details:
      call: system(paste(which, shQuote(names[i])), intern = TRUE, ignore.stderr = TRUE)
      error: cannot popen '/usr/bin/which 'uname' 2>/dev/null', probable reason 'Cannot allocate memory'
    Error: package or namespace load failed for ‘stats’:
     .onLoad failed in loadNamespace() for 'utils', details:
      call: system(paste(which, shQuote(names[i])), intern = TRUE, ignore.stderr = TRUE)
      error: cannot popen '/usr/bin/which 'uname' 2>/dev/null', probable reason 'Cannot allocate memory'
    During startup - Warning messages:
    1: package ‘utils’ in options("defaultPackages") was not found 
    2: package ‘stats’ in options("defaultPackages") was not found 
    Error: package ‘utils’ could not be loaded
    Call sequence:
    5: stop(gettextf("package %s could not be loaded", sQuote(pkg)), 
           call. = FALSE, domain = NA)
    4: .getRequiredPackages2(pkgInfo, quietly = quietly)
    3: library(pkg, character.only = TRUE, logical.return = TRUE, lib.loc = lib.loc, 
           quietly = quietly)
    2: .getRequiredPackages2(pkgInfo, quietly = quietly)
    1: library(package, lib.loc = lib.loc, character.only = TRUE, verbose = FALSE)
    Execution halted
    Warning: system call failed: Cannot allocate memory
    ```

*   checking installed package size ... NOTE
    ```
      installed size is 96.7Mb
      sub-directories of 1Mb or more:
        extdata  96.5Mb
    ```

*   checking DESCRIPTION meta-information ... NOTE
    ```
    Packages listed in more than one of Depends, Imports, Suggests, Enhances:
      ‘methods’ ‘AnnotationDbi’
    A package should be listed in only one of these fields.
    ```

*   checking R code for possible problems ... NOTE
    ```
    File ‘org.Pt.eg.db/R/zzz.R’:
      .onLoad calls:
        packageStartupMessage(AnnotationDbi:::annoStartupMessages("org.Pt.eg"))
    
    See section ‘Good practice’ in '?.onAttach'.
    ```

## Installation

### Devel

```
* installing *source* package ‘org.Pt.eg.db’ ...
** using staged installation
** R
** inst
** byte-compile and prepare package for lazy loading
From .checkSubclasses(): subclass "ScalarCharacter" of class "character" is not local and is not updated for new inheritance information currently; 
[where=<environment: 0x5606ca4d3568>, where2=<environment: namespace:S4Vectors>]
From .checkSubclasses(): subclass "Versions" of class "vector" is not local and is not updated for new inheritance information currently; 
[where=<environment: 0x5606ca4d3568>, where2=<environment: namespace:S4Vectors>]
From .checkSubclasses(): subclass "VersionsNull" of class "vector" is not local and is not updated for new inheritance information currently; 
[where=<environment: 0x5606ca4d3568>, where2=<environment: namespace:S4Vectors>]
in method for ‘normalizeSingleBracketReplacementValue’ with signature ‘"List"’: no definition for class “List”
Creating a generic function for ‘complete.cases’ from package ‘stats’ in package ‘S4Vectors’
Creating a new generic function for ‘expand.grid’ in package ‘S4Vectors’
Creating a generic function for ‘%in%’ from package ‘base’ in package ‘S4Vectors’
Creating a new generic function for ‘findMatches’ in package ‘S4Vectors’
Creating a generic function for ‘setequal’ from package ‘base’ in package ‘S4Vectors’
Creating a generic function for ‘as.factor’ from package ‘base’ in package ‘S4Vectors’
Creating a generic function for ‘tabulate’ from package ‘base’ in package ‘S4Vectors’
Creating a generic function for ‘cov’ from package ‘stats’ in package ‘S4Vectors’
Creating a generic function for ‘cor’ from package ‘stats’ in package ‘S4Vectors’
Creating a generic function for ‘smoothEnds’ from package ‘stats’ in package ‘S4Vectors’
Creating a generic function for ‘runmed’ from package ‘stats’ in package ‘S4Vectors’
Creating a generic function for ‘nchar’ from package ‘base’ in package ‘S4Vectors’
Creating a generic function for ‘substr’ from package ‘base’ in package ‘S4Vectors’
Creating a generic function for ‘substring’ from package ‘base’ in package ‘S4Vectors’
Creating a generic function for ‘chartr’ from package ‘base’ in package ‘S4Vectors’
Creating a generic function for ‘tolower’ from package ‘base’ in package ‘S4Vectors’
Creating a generic function for ‘toupper’ from package ‘base’ in package ‘S4Vectors’
Creating a generic function for ‘sub’ from package ‘base’ in package ‘S4Vectors’
Creating a generic function for ‘gsub’ from package ‘base’ in package ‘S4Vectors’
in method for ‘coerce’ with signature ‘"data.table","DataFrame"’: no definition for class “data.table”
From .checkSubclasses(): subclass "ScalarCharacter" of class "character" is not local and is not updated for new inheritance information currently; 
[where=<environment: 0x5606caea5590>, where2=<environment: namespace:IRanges>]
Creating a generic function for ‘drop’ from package ‘base’ in package ‘IRanges’
Creating a generic function for ‘runmed’ from package ‘stats’ in package ‘IRanges’
Creating a generic function for ‘chartr’ from package ‘base’ in package ‘IRanges’
Creating a generic function for ‘toupper’ from package ‘base’ in package ‘IRanges’
Creating a generic function for ‘tolower’ from package ‘base’ in package ‘IRanges’
Creating a generic function for ‘sub’ from package ‘base’ in package ‘IRanges’
Creating a generic function for ‘gsub’ from package ‘base’ in package ‘IRanges’
Error : memory exhausted (limit reached?)
Error in setClass("ManyToOneGrouping", contains = "Grouping", representation("VIRTUAL")) : 
  error in contained classes ("Grouping") for class “ManyToOneGrouping”; class definition removed from ‘IRanges’
Error in sprintf(gettext(fmt, domain = domain), ...) : 
  unsupported conversion from '' to 'UTF-8'
Calls: suppressPackageStartupMessages ... tryCatchList -> tryCatchOne -> <Anonymous> -> gettextf -> sprintf
Execution halted
Warning message:
system call failed: Cannot allocate memory 
ERROR: lazy loading failed for package ‘org.Pt.eg.db’
* removing ‘/home/rstudio/DBI/revdep/checks/org.Pt.eg.db/new/org.Pt.eg.db.Rcheck/org.Pt.eg.db’

```
### CRAN

```
* installing *source* package ‘org.Pt.eg.db’ ...
** using staged installation
** R
** inst
** byte-compile and prepare package for lazy loading
From .checkSubclasses(): subclass "ScalarCharacter" of class "character" is not local and is not updated for new inheritance information currently; 
[where=<environment: 0x55cf3d5ff568>, where2=<environment: namespace:S4Vectors>]
From .checkSubclasses(): subclass "Versions" of class "vector" is not local and is not updated for new inheritance information currently; 
[where=<environment: 0x55cf3d5ff568>, where2=<environment: namespace:S4Vectors>]
From .checkSubclasses(): subclass "VersionsNull" of class "vector" is not local and is not updated for new inheritance information currently; 
[where=<environment: 0x55cf3d5ff568>, where2=<environment: namespace:S4Vectors>]
in method for ‘normalizeSingleBracketReplacementValue’ with signature ‘"List"’: no definition for class “List”
Creating a generic function for ‘complete.cases’ from package ‘stats’ in package ‘S4Vectors’
Creating a new generic function for ‘expand.grid’ in package ‘S4Vectors’
Creating a generic function for ‘%in%’ from package ‘base’ in package ‘S4Vectors’
Creating a new generic function for ‘findMatches’ in package ‘S4Vectors’
Creating a generic function for ‘setequal’ from package ‘base’ in package ‘S4Vectors’
Creating a generic function for ‘as.factor’ from package ‘base’ in package ‘S4Vectors’
Creating a generic function for ‘tabulate’ from package ‘base’ in package ‘S4Vectors’
Creating a generic function for ‘cov’ from package ‘stats’ in package ‘S4Vectors’
Creating a generic function for ‘cor’ from package ‘stats’ in package ‘S4Vectors’
Creating a generic function for ‘smoothEnds’ from package ‘stats’ in package ‘S4Vectors’
Creating a generic function for ‘runmed’ from package ‘stats’ in package ‘S4Vectors’
Creating a generic function for ‘nchar’ from package ‘base’ in package ‘S4Vectors’
Creating a generic function for ‘substr’ from package ‘base’ in package ‘S4Vectors’
Creating a generic function for ‘substring’ from package ‘base’ in package ‘S4Vectors’
Creating a generic function for ‘chartr’ from package ‘base’ in package ‘S4Vectors’
Creating a generic function for ‘tolower’ from package ‘base’ in package ‘S4Vectors’
Creating a generic function for ‘toupper’ from package ‘base’ in package ‘S4Vectors’
Creating a generic function for ‘sub’ from package ‘base’ in package ‘S4Vectors’
Creating a generic function for ‘gsub’ from package ‘base’ in package ‘S4Vectors’
in method for ‘coerce’ with signature ‘"data.table","DataFrame"’: no definition for class “data.table”
From .checkSubclasses(): subclass "ScalarCharacter" of class "character" is not local and is not updated for new inheritance information currently; 
[where=<environment: 0x55cf3dfd86e8>, where2=<environment: namespace:IRanges>]
Creating a generic function for ‘drop’ from package ‘base’ in package ‘IRanges’
Creating a generic function for ‘runmed’ from package ‘stats’ in package ‘IRanges’
Creating a generic function for ‘chartr’ from package ‘base’ in package ‘IRanges’
Creating a generic function for ‘toupper’ from package ‘base’ in package ‘IRanges’
Creating a generic function for ‘tolower’ from package ‘base’ in package ‘IRanges’
Creating a generic function for ‘sub’ from package ‘base’ in package ‘IRanges’
Creating a generic function for ‘gsub’ from package ‘base’ in package ‘IRanges’
Creating a generic function for ‘smoothEnds’ from package ‘stats’ in package ‘IRanges’
Creating a new generic function for ‘packageName’ in package ‘AnnotationDbi’
Creating a generic function for ‘ls’ from package ‘base’ in package ‘AnnotationDbi’
Creating a generic function for ‘eapply’ from package ‘base’ in package ‘AnnotationDbi’
Creating a generic function for ‘exists’ from package ‘base’ in package ‘AnnotationDbi’
Creating a generic function for ‘sample’ from package ‘base’ in package ‘AnnotationDbi’
** help
*** installing help indices
** building package indices
** testing if installed package can be loaded from temporary location
From .checkSubclasses(): subclass "ScalarCharacter" of class "character" is not local and is not updated for new inheritance information currently; 
[where=<environment: 0x563bbb6a2798>, where2=<environment: namespace:S4Vectors>]
From .checkSubclasses(): subclass "Versions" of class "vector" is not local and is not updated for new inheritance information currently; 
[where=<environment: 0x563bbb6a2798>, where2=<environment: namespace:S4Vectors>]
From .checkSubclasses(): subclass "VersionsNull" of class "vector" is not local and is not updated for new inheritance information currently; 
[where=<environment: 0x563bbb6a2798>, where2=<environment: namespace:S4Vectors>]
in method for ‘normalizeSingleBracketReplacementValue’ with signature ‘"List"’: no definition for class “List”
Creating a generic function for ‘complete.cases’ from package ‘stats’ in package ‘S4Vectors’
Creating a new generic function for ‘expand.grid’ in package ‘S4Vectors’
Creating a generic function for ‘%in%’ from package ‘base’ in package ‘S4Vectors’
Creating a new generic function for ‘findMatches’ in package ‘S4Vectors’
Creating a generic function for ‘setequal’ from package ‘base’ in package ‘S4Vectors’
Creating a generic function for ‘as.factor’ from package ‘base’ in package ‘S4Vectors’
Creating a generic function for ‘tabulate’ from package ‘base’ in package ‘S4Vectors’
Creating a generic function for ‘cov’ from package ‘stats’ in package ‘S4Vectors’
Creating a generic function for ‘cor’ from package ‘stats’ in package ‘S4Vectors’
Creating a generic function for ‘smoothEnds’ from package ‘stats’ in package ‘S4Vectors’
Creating a generic function for ‘runmed’ from package ‘stats’ in package ‘S4Vectors’
Creating a generic function for ‘nchar’ from package ‘base’ in package ‘S4Vectors’
Creating a generic function for ‘substr’ from package ‘base’ in package ‘S4Vectors’
Creating a generic function for ‘substring’ from package ‘base’ in package ‘S4Vectors’
Creating a generic function for ‘chartr’ from package ‘base’ in package ‘S4Vectors’
Creating a generic function for ‘tolower’ from package ‘base’ in package ‘S4Vectors’
Creating a generic function for ‘toupper’ from package ‘base’ in package ‘S4Vectors’
Creating a generic function for ‘sub’ from package ‘base’ in package ‘S4Vectors’
Creating a generic function for ‘gsub’ from package ‘base’ in package ‘S4Vectors’
in method for ‘coerce’ with signature ‘"data.table","DataFrame"’: no definition for class “data.table”
From .checkSubclasses(): subclass "ScalarCharacter" of class "character" is not local and is not updated for new inheritance information currently; 
[where=<environment: 0x563bbc52d180>, where2=<environment: namespace:IRanges>]
Creating a generic function for ‘drop’ from package ‘base’ in package ‘IRanges’
Creating a generic function for ‘runmed’ from package ‘stats’ in package ‘IRanges’
Creating a generic function for ‘chartr’ from package ‘base’ in package ‘IRanges’
Creating a generic function for ‘toupper’ from package ‘base’ in package ‘IRanges’
Creating a generic function for ‘tolower’ from package ‘base’ in package ‘IRanges’
Creating a generic function for ‘sub’ from package ‘base’ in package ‘IRanges’
Creating a generic function for ‘gsub’ from package ‘base’ in package ‘IRanges’
Creating a generic function for ‘smoothEnds’ from package ‘stats’ in package ‘IRanges’
Creating a new generic function for ‘packageName’ in package ‘AnnotationDbi’
Creating a generic function for ‘ls’ from package ‘base’ in package ‘AnnotationDbi’
Creating a generic function for ‘eapply’ from package ‘base’ in package ‘AnnotationDbi’
Creating a generic function for ‘exists’ from package ‘base’ in package ‘AnnotationDbi’
Creating a generic function for ‘sample’ from package ‘base’ in package ‘AnnotationDbi’
** testing if installed package can be loaded from final location
From .checkSubclasses(): subclass "ScalarCharacter" of class "character" is not local and is not updated for new inheritance information currently; 
[where=<environment: 0x560fb3a2f1b8>, where2=<environment: namespace:S4Vectors>]
From .checkSubclasses(): subclass "Versions" of class "vector" is not local and is not updated for new inheritance information currently; 
[where=<environment: 0x560fb3a2f1b8>, where2=<environment: namespace:S4Vectors>]
From .checkSubclasses(): subclass "VersionsNull" of class "vector" is not local and is not updated for new inheritance information currently; 
[where=<environment: 0x560fb3a2f1b8>, where2=<environment: namespace:S4Vectors>]
in method for ‘normalizeSingleBracketReplacementValue’ with signature ‘"List"’: no definition for class “List”
Creating a generic function for ‘complete.cases’ from package ‘stats’ in package ‘S4Vectors’
Creating a new generic function for ‘expand.grid’ in package ‘S4Vectors’
Creating a generic function for ‘%in%’ from package ‘base’ in package ‘S4Vectors’
Creating a new generic function for ‘findMatches’ in package ‘S4Vectors’
Creating a generic function for ‘setequal’ from package ‘base’ in package ‘S4Vectors’
Creating a generic function for ‘as.factor’ from package ‘base’ in package ‘S4Vectors’
Creating a generic function for ‘tabulate’ from package ‘base’ in package ‘S4Vectors’
Creating a generic function for ‘cov’ from package ‘stats’ in package ‘S4Vectors’
Creating a generic function for ‘cor’ from package ‘stats’ in package ‘S4Vectors’
Creating a generic function for ‘smoothEnds’ from package ‘stats’ in package ‘S4Vectors’
Creating a generic function for ‘runmed’ from package ‘stats’ in package ‘S4Vectors’
Creating a generic function for ‘nchar’ from package ‘base’ in package ‘S4Vectors’
Creating a generic function for ‘substr’ from package ‘base’ in package ‘S4Vectors’
Creating a generic function for ‘substring’ from package ‘base’ in package ‘S4Vectors’
Creating a generic function for ‘chartr’ from package ‘base’ in package ‘S4Vectors’
Creating a generic function for ‘tolower’ from package ‘base’ in package ‘S4Vectors’
Creating a generic function for ‘toupper’ from package ‘base’ in package ‘S4Vectors’
Creating a generic function for ‘sub’ from package ‘base’ in package ‘S4Vectors’
Creating a generic function for ‘gsub’ from package ‘base’ in package ‘S4Vectors’
in method for ‘coerce’ with signature ‘"data.table","DataFrame"’: no definition for class “data.table”
From .checkSubclasses(): subclass "ScalarCharacter" of class "character" is not local and is not updated for new inheritance information currently; 
[where=<environment: 0x560fb489d3a8>, where2=<environment: namespace:IRanges>]
Creating a generic function for ‘drop’ from package ‘base’ in package ‘IRanges’
Creating a generic function for ‘runmed’ from package ‘stats’ in package ‘IRanges’
Creating a generic function for ‘chartr’ from package ‘base’ in package ‘IRanges’
Creating a generic function for ‘toupper’ from package ‘base’ in package ‘IRanges’
Creating a generic function for ‘tolower’ from package ‘base’ in package ‘IRanges’
Creating a generic function for ‘sub’ from package ‘base’ in package ‘IRanges’
Creating a generic function for ‘gsub’ from package ‘base’ in package ‘IRanges’
Creating a generic function for ‘smoothEnds’ from package ‘stats’ in package ‘IRanges’
Creating a new generic function for ‘packageName’ in package ‘AnnotationDbi’
Creating a generic function for ‘ls’ from package ‘base’ in package ‘AnnotationDbi’
Creating a generic function for ‘eapply’ from package ‘base’ in package ‘AnnotationDbi’
Creating a generic function for ‘exists’ from package ‘base’ in package ‘AnnotationDbi’
Creating a generic function for ‘sample’ from package ‘base’ in package ‘AnnotationDbi’
** testing if installed package keeps a record of temporary installation path
* DONE (org.Pt.eg.db)

```
# Organism.dplyr

<details>

* Version: 1.12.1
* Source code: https://github.com/cran/Organism.dplyr
* Date/Publication: 2019-05-10
* Number of recursive dependencies: 110

Run `revdep_details(,"Organism.dplyr")` for more info

</details>

## Newly broken

*   checking whether package ‘Organism.dplyr’ can be installed ... ERROR
    ```
    Installation failed.
    See ‘/home/rstudio/DBI/revdep/checks/Organism.dplyr/new/Organism.dplyr.Rcheck/00install.out’ for details.
    ```

## Newly fixed

*   checking whether the package can be unloaded cleanly ... WARNING
    ```
    Error in setGeneric("condition", function(object, ...) standardGeneric("condition")) : 
      could not find function "setGeneric"
    Error: package ‘AnnotationFilter’ could not be loaded
    Execution halted
    ```

*   checking whether the namespace can be loaded with stated dependencies ... WARNING
    ```
    Error in setGeneric("condition", function(object, ...) standardGeneric("condition")) : 
      could not find function "setGeneric"
    Error: unable to load R code in package ‘AnnotationFilter’
    Execution halted
    
    A namespace must be able to be loaded with just the base namespace
    loaded: otherwise if the namespace gets loaded by a saved object, the
    session will be unable to start.
    
    Probably some imports need to be declared in the NAMESPACE file.
    ```

*   checking S3 generic/method consistency ... WARNING
    ```
    Error: package ‘AnnotationFilter’ could not be loaded
    Call sequence:
    3: stop(gettextf("package %s could not be loaded", sQuote(pkg)), 
           call. = FALSE, domain = NA)
    2: .getRequiredPackages2(pkgInfo, quietly = quietly)
    1: library(package, lib.loc = lib.loc, character.only = TRUE, verbose = FALSE)
    Execution halted
    See section ‘Generic functions and methods’ in the ‘Writing R
    Extensions’ manual.
    ```

*   checking replacement functions ... WARNING
    ```
    Error: package ‘AnnotationFilter’ could not be loaded
    Call sequence:
    3: stop(gettextf("package %s could not be loaded", sQuote(pkg)), 
           call. = FALSE, domain = NA)
    2: .getRequiredPackages2(pkgInfo, quietly = quietly)
    1: library(package, lib.loc = lib.loc, character.only = TRUE, verbose = FALSE)
    Execution halted
    The argument of a replacement function which corresponds to the right
    hand side must be named ‘value’.
    ```

*   checking Rd files ... WARNING
    ```
    Error: package or namespace load failed for ‘utils’:
     .onLoad failed in loadNamespace() for 'utils', details:
      call: system(paste(which, shQuote(names[i])), intern = TRUE, ignore.stderr = TRUE)
      error: cannot popen '/usr/bin/which 'uname' 2>/dev/null', probable reason 'Cannot allocate memory'
    Error: package or namespace load failed for ‘stats’:
     .onLoad failed in loadNamespace() for 'utils', details:
      call: system(paste(which, shQuote(names[i])), intern = TRUE, ignore.stderr = TRUE)
      error: cannot popen '/usr/bin/which 'uname' 2>/dev/null', probable reason 'Cannot allocate memory'
    During startup - Warning messages:
    1: package ‘utils’ in options("defaultPackages") was not found 
    2: package ‘stats’ in options("defaultPackages") was not found 
    Warning: system call failed: Cannot allocate memory
    ```

*   checking Rd metadata ... WARNING
    ```
    Warning: system call failed: Cannot allocate memory
    ```

*   checking dependencies in R code ... NOTE
    ```
    Error: package ‘AnnotationFilter’ could not be loaded
    Call sequence:
    3: stop(gettextf("package %s could not be loaded", sQuote(pkg)), 
           call. = FALSE, domain = NA)
    2: .getRequiredPackages2(pkgInfo, quietly = quietly)
    1: library(package, lib.loc = lib.loc, character.only = TRUE, verbose = FALSE)
    Execution halted
    ```

*   checking foreign function calls ... NOTE
    ```
    Error: package ‘AnnotationFilter’ could not be loaded
    Call sequence:
    3: stop(gettextf("package %s could not be loaded", sQuote(pkg)), 
           call. = FALSE, domain = NA)
    2: .getRequiredPackages2(pkgInfo, quietly = quietly)
    1: library(package, lib.loc = lib.loc, character.only = TRUE, verbose = FALSE)
    Execution halted
    See chapter ‘System and foreign language interfaces’ in the ‘Writing R
    Extensions’ manual.
    ```

*   checking R code for possible problems ... NOTE
    ```
    Error in setGeneric("condition", function(object, ...) standardGeneric("condition")) : 
      could not find function "setGeneric"
    Error: unable to load R code in package ‘AnnotationFilter’
    Execution halted
    ```

## Installation

### Devel

```
* install options ‘--no-html --no-multiarch’


```
### CRAN

```
* installing *source* package ‘Organism.dplyr’ ...
** using staged installation
** R
** inst
** byte-compile and prepare package for lazy loading
in method for ‘normalizeSingleBracketReplacementValue’ with signature ‘"List"’: no definition for class “List”
Creating a generic function for ‘complete.cases’ from package ‘stats’ in package ‘S4Vectors’
Creating a new generic function for ‘expand.grid’ in package ‘S4Vectors’
Creating a generic function for ‘%in%’ from package ‘base’ in package ‘S4Vectors’
Creating a new generic function for ‘findMatches’ in package ‘S4Vectors’
Creating a generic function for ‘setequal’ from package ‘base’ in package ‘S4Vectors’
Creating a generic function for ‘as.factor’ from package ‘base’ in package ‘S4Vectors’
Creating a generic function for ‘tabulate’ from package ‘base’ in package ‘S4Vectors’
Creating a generic function for ‘cov’ from package ‘stats’ in package ‘S4Vectors’
Creating a generic function for ‘cor’ from package ‘stats’ in package ‘S4Vectors’
Creating a generic function for ‘smoothEnds’ from package ‘stats’ in package ‘S4Vectors’
Creating a generic function for ‘runmed’ from package ‘stats’ in package ‘S4Vectors’
Creating a generic function for ‘nchar’ from package ‘base’ in package ‘S4Vectors’
Creating a generic function for ‘substr’ from package ‘base’ in package ‘S4Vectors’
Creating a generic function for ‘substring’ from package ‘base’ in package ‘S4Vectors’
Creating a generic function for ‘chartr’ from package ‘base’ in package ‘S4Vectors’
Creating a generic function for ‘tolower’ from package ‘base’ in package ‘S4Vectors’
Creating a generic function for ‘toupper’ from package ‘base’ in package ‘S4Vectors’
Creating a generic function for ‘sub’ from package ‘base’ in package ‘S4Vectors’
Creating a generic function for ‘gsub’ from package ‘base’ in package ‘S4Vectors’
in method for ‘coerce’ with signature ‘"data.table","DataFrame"’: no definition for class “data.table”
Creating a generic function for ‘drop’ from package ‘base’ in package ‘IRanges’
Creating a generic function for ‘runmed’ from package ‘stats’ in package ‘IRanges’
Creating a generic function for ‘chartr’ from package ‘base’ in package ‘IRanges’
Creating a generic function for ‘toupper’ from package ‘base’ in package ‘IRanges’
Creating a generic function for ‘tolower’ from package ‘base’ in package ‘IRanges’
Creating a generic function for ‘sub’ from package ‘base’ in package ‘IRanges’
Creating a generic function for ‘gsub’ from package ‘base’ in package ‘IRanges’
Creating a generic function for ‘smoothEnds’ from package ‘stats’ in package ‘IRanges’
From .checkSubclasses(): subclass "AnnotationFilterList" of class "list" is not local and is not updated for new inheritance information currently; 
[where=<environment: 0x5573cd8c08b8>, where2=<environment: namespace:Biobase>]
Creating a new generic function for ‘packageName’ in package ‘AnnotationDbi’
Creating a generic function for ‘ls’ from package ‘base’ in package ‘AnnotationDbi’
Creating a generic function for ‘eapply’ from package ‘base’ in package ‘AnnotationDbi’
Creating a generic function for ‘exists’ from package ‘base’ in package ‘AnnotationDbi’
Creating a generic function for ‘sample’ from package ‘base’ in package ‘AnnotationDbi’
in method for ‘twoWayAlphabetFrequencyByQuality’ with signature ‘"QualityScaledXStringSet"’: no definition for class “QualityScaledXStringSet”
Creating a new generic function for ‘strsplit’ in package ‘Biostrings’
Creating a generic function for ‘ls’ from package ‘base’ in package ‘Biostrings’
Creating a new generic function for ‘offset’ in package ‘Biostrings’
Creating a new generic function for ‘aperm’ in package ‘DelayedArray’
From .checkSubclasses(): subclass "ScalarInteger" of class "integer" is not local and is not updated for new inheritance information currently; 
[where=<environment: 0x5573c8c9ad18>, where2=<environment: namespace:DelayedArray>]
Creating a generic function for ‘sweep’ from package ‘base’ in package ‘DelayedArray’
Creating a new generic function for ‘apply’ in package ‘DelayedArray’
Creating a new generic function for ‘rowsum’ in package ‘DelayedArray’
Creating a generic function for ‘dnorm’ from package ‘stats’ in package ‘DelayedArray’
Creating a generic function for ‘pnorm’ from package ‘stats’ in package ‘DelayedArray’
Creating a generic function for ‘qnorm’ from package ‘stats’ in package ‘DelayedArray’
Creating a generic function for ‘dbinom’ from package ‘stats’ in package ‘DelayedArray’
Creating a generic function for ‘pbinom’ from package ‘stats’ in package ‘DelayedArray’
Creating a generic function for ‘qbinom’ from package ‘stats’ in package ‘DelayedArray’
Creating a generic function for ‘dpois’ from package ‘stats’ in package ‘DelayedArray’
Creating a generic function for ‘ppois’ from package ‘stats’ in package ‘DelayedArray’
Creating a generic function for ‘qpois’ from package ‘stats’ in package ‘DelayedArray’
Creating a generic function for ‘dlogis’ from package ‘stats’ in package ‘DelayedArray’
Creating a generic function for ‘plogis’ from package ‘stats’ in package ‘DelayedArray’
Creating a generic function for ‘qlogis’ from package ‘stats’ in package ‘DelayedArray’
Creating a new generic function for ‘rowMaxs’ in package ‘DelayedArray’
Creating a new generic function for ‘colMaxs’ in package ‘DelayedArray’
Creating a new generic function for ‘rowMins’ in package ‘DelayedArray’
Creating a new generic function for ‘colMins’ in package ‘DelayedArray’
Creating a new generic function for ‘rowRanges’ in package ‘DelayedArray’
Creating a new generic function for ‘colRanges’ in package ‘DelayedArray’
Creating a generic function for ‘offset’ from package ‘stats’ in package ‘rtracklayer’
Creating a generic function from function ‘uri’ in package ‘rtracklayer’
** help
*** installing help indices
** building package indices
** installing vignettes
** testing if installed package can be loaded from temporary location
in method for ‘normalizeSingleBracketReplacementValue’ with signature ‘"List"’: no definition for class “List”
Creating a generic function for ‘complete.cases’ from package ‘stats’ in package ‘S4Vectors’
Creating a new generic function for ‘expand.grid’ in package ‘S4Vectors’
Creating a generic function for ‘%in%’ from package ‘base’ in package ‘S4Vectors’
Creating a new generic function for ‘findMatches’ in package ‘S4Vectors’
Creating a generic function for ‘setequal’ from package ‘base’ in package ‘S4Vectors’
Creating a generic function for ‘as.factor’ from package ‘base’ in package ‘S4Vectors’
Creating a generic function for ‘tabulate’ from package ‘base’ in package ‘S4Vectors’
Creating a generic function for ‘cov’ from package ‘stats’ in package ‘S4Vectors’
Creating a generic function for ‘cor’ from package ‘stats’ in package ‘S4Vectors’
Creating a generic function for ‘smoothEnds’ from package ‘stats’ in package ‘S4Vectors’
Creating a generic function for ‘runmed’ from package ‘stats’ in package ‘S4Vectors’
Creating a generic function for ‘nchar’ from package ‘base’ in package ‘S4Vectors’
Creating a generic function for ‘substr’ from package ‘base’ in package ‘S4Vectors’
Creating a generic function for ‘substring’ from package ‘base’ in package ‘S4Vectors’
Creating a generic function for ‘chartr’ from package ‘base’ in package ‘S4Vectors’
Creating a generic function for ‘tolower’ from package ‘base’ in package ‘S4Vectors’
Creating a generic function for ‘toupper’ from package ‘base’ in package ‘S4Vectors’
Creating a generic function for ‘sub’ from package ‘base’ in package ‘S4Vectors’
Creating a generic function for ‘gsub’ from package ‘base’ in package ‘S4Vectors’
in method for ‘coerce’ with signature ‘"data.table","DataFrame"’: no definition for class “data.table”
Creating a generic function for ‘drop’ from package ‘base’ in package ‘IRanges’
Creating a generic function for ‘runmed’ from package ‘stats’ in package ‘IRanges’
Creating a generic function for ‘chartr’ from package ‘base’ in package ‘IRanges’
Creating a generic function for ‘toupper’ from package ‘base’ in package ‘IRanges’
Creating a generic function for ‘tolower’ from package ‘base’ in package ‘IRanges’
Creating a generic function for ‘sub’ from package ‘base’ in package ‘IRanges’
Creating a generic function for ‘gsub’ from package ‘base’ in package ‘IRanges’
Creating a generic function for ‘smoothEnds’ from package ‘stats’ in package ‘IRanges’
From .checkSubclasses(): subclass "AnnotationFilterList" of class "list" is not local and is not updated for new inheritance information currently; 
[where=<environment: 0x5630c7b17100>, where2=<environment: namespace:Biobase>]
Creating a new generic function for ‘packageName’ in package ‘AnnotationDbi’
Creating a generic function for ‘ls’ from package ‘base’ in package ‘AnnotationDbi’
Creating a generic function for ‘eapply’ from package ‘base’ in package ‘AnnotationDbi’
Creating a generic function for ‘exists’ from package ‘base’ in package ‘AnnotationDbi’
Creating a generic function for ‘sample’ from package ‘base’ in package ‘AnnotationDbi’
in method for ‘twoWayAlphabetFrequencyByQuality’ with signature ‘"QualityScaledXStringSet"’: no definition for class “QualityScaledXStringSet”
Creating a new generic function for ‘strsplit’ in package ‘Biostrings’
Creating a generic function for ‘ls’ from package ‘base’ in package ‘Biostrings’
Creating a new generic function for ‘offset’ in package ‘Biostrings’
Creating a new generic function for ‘aperm’ in package ‘DelayedArray’
From .checkSubclasses(): subclass "ScalarInteger" of class "integer" is not local and is not updated for new inheritance information currently; 
[where=<environment: 0x5630ca694518>, where2=<environment: namespace:DelayedArray>]
Creating a generic function for ‘sweep’ from package ‘base’ in package ‘DelayedArray’
Creating a new generic function for ‘apply’ in package ‘DelayedArray’
Creating a new generic function for ‘rowsum’ in package ‘DelayedArray’
Creating a generic function for ‘dnorm’ from package ‘stats’ in package ‘DelayedArray’
Creating a generic function for ‘pnorm’ from package ‘stats’ in package ‘DelayedArray’
Creating a generic function for ‘qnorm’ from package ‘stats’ in package ‘DelayedArray’
Creating a generic function for ‘dbinom’ from package ‘stats’ in package ‘DelayedArray’
Creating a generic function for ‘pbinom’ from package ‘stats’ in package ‘DelayedArray’
Creating a generic function for ‘qbinom’ from package ‘stats’ in package ‘DelayedArray’
Creating a generic function for ‘dpois’ from package ‘stats’ in package ‘DelayedArray’
Creating a generic function for ‘ppois’ from package ‘stats’ in package ‘DelayedArray’
Creating a generic function for ‘qpois’ from package ‘stats’ in package ‘DelayedArray’
Creating a generic function for ‘dlogis’ from package ‘stats’ in package ‘DelayedArray’
Creating a generic function for ‘plogis’ from package ‘stats’ in package ‘DelayedArray’
Creating a generic function for ‘qlogis’ from package ‘stats’ in package ‘DelayedArray’
Creating a new generic function for ‘rowMaxs’ in package ‘DelayedArray’
Creating a new generic function for ‘colMaxs’ in package ‘DelayedArray’
Creating a new generic function for ‘rowMins’ in package ‘DelayedArray’
Creating a new generic function for ‘colMins’ in package ‘DelayedArray’
Creating a new generic function for ‘rowRanges’ in package ‘DelayedArray’
Creating a new generic function for ‘colRanges’ in package ‘DelayedArray’
Creating a generic function for ‘offset’ from package ‘stats’ in package ‘rtracklayer’
Creating a generic function from function ‘uri’ in package ‘rtracklayer’
** testing if installed package can be loaded from final location
in method for ‘normalizeSingleBracketReplacementValue’ with signature ‘"List"’: no definition for class “List”
Creating a generic function for ‘complete.cases’ from package ‘stats’ in package ‘S4Vectors’
Creating a new generic function for ‘expand.grid’ in package ‘S4Vectors’
Creating a generic function for ‘%in%’ from package ‘base’ in package ‘S4Vectors’
Creating a new generic function for ‘findMatches’ in package ‘S4Vectors’
Creating a generic function for ‘setequal’ from package ‘base’ in package ‘S4Vectors’
Creating a generic function for ‘as.factor’ from package ‘base’ in package ‘S4Vectors’
Creating a generic function for ‘tabulate’ from package ‘base’ in package ‘S4Vectors’
Creating a generic function for ‘cov’ from package ‘stats’ in package ‘S4Vectors’
Creating a generic function for ‘cor’ from package ‘stats’ in package ‘S4Vectors’
Creating a generic function for ‘smoothEnds’ from package ‘stats’ in package ‘S4Vectors’
Creating a generic function for ‘runmed’ from package ‘stats’ in package ‘S4Vectors’
Creating a generic function for ‘nchar’ from package ‘base’ in package ‘S4Vectors’
Creating a generic function for ‘substr’ from package ‘base’ in package ‘S4Vectors’
Creating a generic function for ‘substring’ from package ‘base’ in package ‘S4Vectors’
Creating a generic function for ‘chartr’ from package ‘base’ in package ‘S4Vectors’
Creating a generic function for ‘tolower’ from package ‘base’ in package ‘S4Vectors’
Creating a generic function for ‘toupper’ from package ‘base’ in package ‘S4Vectors’
Creating a generic function for ‘sub’ from package ‘base’ in package ‘S4Vectors’
Creating a generic function for ‘gsub’ from package ‘base’ in package ‘S4Vectors’
in method for ‘coerce’ with signature ‘"data.table","DataFrame"’: no definition for class “data.table”
Creating a generic function for ‘drop’ from package ‘base’ in package ‘IRanges’
Creating a generic function for ‘runmed’ from package ‘stats’ in package ‘IRanges’
Creating a generic function for ‘chartr’ from package ‘base’ in package ‘IRanges’
Creating a generic function for ‘toupper’ from package ‘base’ in package ‘IRanges’
Creating a generic function for ‘tolower’ from package ‘base’ in package ‘IRanges’
Creating a generic function for ‘sub’ from package ‘base’ in package ‘IRanges’
Creating a generic function for ‘gsub’ from package ‘base’ in package ‘IRanges’
Creating a generic function for ‘smoothEnds’ from package ‘stats’ in package ‘IRanges’
From .checkSubclasses(): subclass "AnnotationFilterList" of class "list" is not local and is not updated for new inheritance information currently; 
[where=<environment: 0x55a2e738dde8>, where2=<environment: namespace:Biobase>]
Creating a new generic function for ‘packageName’ in package ‘AnnotationDbi’
Creating a generic function for ‘ls’ from package ‘base’ in package ‘AnnotationDbi’
Creating a generic function for ‘eapply’ from package ‘base’ in package ‘AnnotationDbi’
Creating a generic function for ‘exists’ from package ‘base’ in package ‘AnnotationDbi’
Creating a generic function for ‘sample’ from package ‘base’ in package ‘AnnotationDbi’
in method for ‘twoWayAlphabetFrequencyByQuality’ with signature ‘"QualityScaledXStringSet"’: no definition for class “QualityScaledXStringSet”
Creating a new generic function for ‘strsplit’ in package ‘Biostrings’
Creating a generic function for ‘ls’ from package ‘base’ in package ‘Biostrings’
Creating a new generic function for ‘offset’ in package ‘Biostrings’
Creating a new generic function for ‘aperm’ in package ‘DelayedArray’
From .checkSubclasses(): subclass "ScalarInteger" of class "integer" is not local and is not updated for new inheritance information currently; 
[where=<environment: 0x55a2ea0ea640>, where2=<environment: namespace:DelayedArray>]
Creating a generic function for ‘sweep’ from package ‘base’ in package ‘DelayedArray’
Creating a new generic function for ‘apply’ in package ‘DelayedArray’
Creating a new generic function for ‘rowsum’ in package ‘DelayedArray’
Creating a generic function for ‘dnorm’ from package ‘stats’ in package ‘DelayedArray’
Creating a generic function for ‘pnorm’ from package ‘stats’ in package ‘DelayedArray’
Creating a generic function for ‘qnorm’ from package ‘stats’ in package ‘DelayedArray’
Creating a generic function for ‘dbinom’ from package ‘stats’ in package ‘DelayedArray’
Creating a generic function for ‘pbinom’ from package ‘stats’ in package ‘DelayedArray’
Creating a generic function for ‘qbinom’ from package ‘stats’ in package ‘DelayedArray’
Creating a generic function for ‘dpois’ from package ‘stats’ in package ‘DelayedArray’
Creating a generic function for ‘ppois’ from package ‘stats’ in package ‘DelayedArray’
Creating a generic function for ‘qpois’ from package ‘stats’ in package ‘DelayedArray’
Creating a generic function for ‘dlogis’ from package ‘stats’ in package ‘DelayedArray’
Creating a generic function for ‘plogis’ from package ‘stats’ in package ‘DelayedArray’
Creating a generic function for ‘qlogis’ from package ‘stats’ in package ‘DelayedArray’
Creating a new generic function for ‘rowMaxs’ in package ‘DelayedArray’
Creating a new generic function for ‘colMaxs’ in package ‘DelayedArray’
Creating a new generic function for ‘rowMins’ in package ‘DelayedArray’
Creating a new generic function for ‘colMins’ in package ‘DelayedArray’
Creating a new generic function for ‘rowRanges’ in package ‘DelayedArray’
Creating a new generic function for ‘colRanges’ in package ‘DelayedArray’
Creating a generic function for ‘offset’ from package ‘stats’ in package ‘rtracklayer’
Creating a generic function from function ‘uri’ in package ‘rtracklayer’
** testing if installed package keeps a record of temporary installation path
* DONE (Organism.dplyr)

```
# OrganismDbi

<details>

* Version: 1.26.0
* Source code: https://github.com/cran/OrganismDbi
* Date/Publication: 2019-05-02
* Number of recursive dependencies: 100

Run `revdep_details(,"OrganismDbi")` for more info

</details>

## Newly broken

*   checking whether package ‘OrganismDbi’ can be installed ... ERROR
    ```
    Installation failed.
    See ‘/home/rstudio/DBI/revdep/checks/OrganismDbi/new/OrganismDbi.Rcheck/00install.out’ for details.
    ```

## Newly fixed

*   checking tests ...
    ```
     ERROR
    Running the tests in ‘tests/OrganismDbi_unit_tests.R’ failed.
    Last 13 lines of output:
      ERROR in test_microRNAs: Error in loadNamespace("mirbase.db") : 
        there is no package called 'mirbase.db'
      
      Test files with failing tests
      
         test_select.R 
           /home/rstudio/DBI/revdep/checks/OrganismDbi/old/OrganismDbi.Rcheck/OrganismDbi/unitTests/test_select.R 
      
         test_wrappedFuns.R 
           test_microRNAs 
      
      
      Error in BiocGenerics:::testPackage("OrganismDbi") : 
        unit tests failed for package OrganismDbi
      Execution halted
    ```

*   checking whether the namespace can be loaded with stated dependencies ... WARNING
    ```
    Error in setClass("attrData", representation(data = "list", defaults = "list")) : 
      could not find function "setClass"
    Error: unable to load R code in package ‘graph’
    Execution halted
    
    A namespace must be able to be loaded with just the base namespace
    loaded: otherwise if the namespace gets loaded by a saved object, the
    session will be unable to start.
    
    Probably some imports need to be declared in the NAMESPACE file.
    ```

*   checking Rd cross-references ... WARNING
    ```
    Missing link or links in documentation object 'coordinate-mapping-method.Rd':
      ‘mapToAlignments’
    
    Missing link or links in documentation object 'OrganismDb.Rd':
      ‘GenomeInfoDb’ ‘seqlevels’ ‘seqlengths’ ‘isCircular’ ‘genome’
    
    Missing link or links in documentation object 'rangeBasedAccessors.Rd':
      ‘BSgenome’ ‘DNAString’
    
    See section 'Cross-references' in the 'Writing R Extensions' manual.
    ```

*   checking dependencies in R code ... NOTE
    ```
    Unexported object imported by a ':::' call: ‘BiocGenerics:::testPackage’
      See the note in ?`:::` about the use of this operator.
    There are ::: calls to the package's namespace in its code. A package
      almost never needs to use ::: for its own objects:
      ‘.biocAnnPackages’ ‘.extractPkgsAndCols’ ‘.gentlyExtractDbFiles’
      ‘.lookupDbNameFromKeytype’ ‘.mungeGraphData’ ‘.taxIdToOrgDb’
      ‘.taxIdToOrgDbName’ ‘.testGraphData’ ‘.testKeys’ ‘OrganismDb’
    ```

*   checking R code for possible problems ... NOTE
    ```
    Error in setClass("attrData", representation(data = "list", defaults = "list")) : 
      could not find function "setClass"
    Error: unable to load R code in package ‘graph’
    Execution halted
    ```

## In both

*   checking package dependencies ... NOTE
    ```
    Package suggested but not available for checking: ‘Rattus.norvegicus’
    ```

## Installation

### Devel

```
* installing *source* package ‘OrganismDbi’ ...
** using staged installation
** R
** inst
** byte-compile and prepare package for lazy loading
From .checkSubclasses(): subclass "ScalarCharacter" of class "character" is not local and is not updated for new inheritance information currently; 
[where=<environment: 0x558fecf8d7e8>, where2=<environment: namespace:S4Vectors>]
From .checkSubclasses(): subclass "Versions" of class "vector" is not local and is not updated for new inheritance information currently; 
[where=<environment: 0x558fecf8d7e8>, where2=<environment: namespace:S4Vectors>]
From .checkSubclasses(): subclass "VersionsNull" of class "vector" is not local and is not updated for new inheritance information currently; 
[where=<environment: 0x558fecf8d7e8>, where2=<environment: namespace:S4Vectors>]
in method for ‘normalizeSingleBracketReplacementValue’ with signature ‘"List"’: no definition for class “List”
Creating a generic function for ‘complete.cases’ from package ‘stats’ in package ‘S4Vectors’
Creating a new generic function for ‘expand.grid’ in package ‘S4Vectors’
Creating a generic function for ‘%in%’ from package ‘base’ in package ‘S4Vectors’
Creating a new generic function for ‘findMatches’ in package ‘S4Vectors’
Creating a generic function for ‘setequal’ from package ‘base’ in package ‘S4Vectors’
Creating a generic function for ‘as.factor’ from package ‘base’ in package ‘S4Vectors’
Creating a generic function for ‘tabulate’ from package ‘base’ in package ‘S4Vectors’
Creating a generic function for ‘cov’ from package ‘stats’ in package ‘S4Vectors’
Creating a generic function for ‘cor’ from package ‘stats’ in package ‘S4Vectors’
Creating a generic function for ‘smoothEnds’ from package ‘stats’ in package ‘S4Vectors’
Creating a generic function for ‘runmed’ from package ‘stats’ in package ‘S4Vectors’
Creating a generic function for ‘nchar’ from package ‘base’ in package ‘S4Vectors’
Creating a generic function for ‘substr’ from package ‘base’ in package ‘S4Vectors’
Creating a generic function for ‘substring’ from package ‘base’ in package ‘S4Vectors’
Creating a generic function for ‘chartr’ from package ‘base’ in package ‘S4Vectors’
Creating a generic function for ‘tolower’ from package ‘base’ in package ‘S4Vectors’
Creating a generic function for ‘toupper’ from package ‘base’ in package ‘S4Vectors’
Creating a generic function for ‘sub’ from package ‘base’ in package ‘S4Vectors’
Creating a generic function for ‘gsub’ from package ‘base’ in package ‘S4Vectors’
in method for ‘coerce’ with signature ‘"data.table","DataFrame"’: no definition for class “data.table”
From .checkSubclasses(): subclass "ScalarCharacter" of class "character" is not local and is not updated for new inheritance information currently; 
[where=<environment: 0x558fec0e4330>, where2=<environment: namespace:IRanges>]
Creating a generic function for ‘drop’ from package ‘base’ in package ‘IRanges’
Creating a generic function for ‘runmed’ from package ‘stats’ in package ‘IRanges’
Creating a generic function for ‘chartr’ from package ‘base’ in package ‘IRanges’
Creating a generic function for ‘toupper’ from package ‘base’ in package ‘IRanges’
Creating a generic function for ‘tolower’ from package ‘base’ in package ‘IRanges’
Creating a generic function for ‘sub’ from package ‘base’ in package ‘IRanges’
Creating a generic function for ‘gsub’ from package ‘base’ in package ‘IRanges’
Creating a generic function for ‘smoothEnds’ from package ‘stats’ in package ‘IRanges’
Creating a new generic function for ‘packageName’ in package ‘AnnotationDbi’
Creating a generic function for ‘ls’ from package ‘base’ in package ‘AnnotationDbi’
Creating a generic function for ‘eapply’ from package ‘base’ in package ‘AnnotationDbi’
Creating a generic function for ‘exists’ from package ‘base’ in package ‘AnnotationDbi’
Creating a generic function for ‘sample’ from package ‘base’ in package ‘AnnotationDbi’
in method for ‘twoWayAlphabetFrequencyByQuality’ with signature ‘"QualityScaledXStringSet"’: no definition for class “QualityScaledXStringSet”
Creating a new generic function for ‘strsplit’ in package ‘Biostrings’
Creating a new generic function for ‘offset’ in package ‘Biostrings’
Error: package or namespace load failed for ‘GenomicFeatures’ in dyn.load(file, DLLpath = DLLpath, ...):
 unable to load shared object '/home/rstudio/DBI/revdep/library/OrganismDbi/Biostrings/libs/Biostrings.so':
  /home/rstudio/DBI/revdep/library/OrganismDbi/Biostrings/libs/Biostrings.so: cannot map zero-fill pages
Error: package ‘GenomicFeatures’ could not be loaded
Execution halted
Warning message:
system call failed: Cannot allocate memory 
ERROR: lazy loading failed for package ‘OrganismDbi’
* removing ‘/home/rstudio/DBI/revdep/checks/OrganismDbi/new/OrganismDbi.Rcheck/OrganismDbi’

```
### CRAN

```
* installing *source* package ‘OrganismDbi’ ...
** using staged installation
** R
** inst
** byte-compile and prepare package for lazy loading
From .checkSubclasses(): subclass "ScalarCharacter" of class "character" is not local and is not updated for new inheritance information currently; 
[where=<environment: 0x55d6692297e8>, where2=<environment: namespace:S4Vectors>]
From .checkSubclasses(): subclass "Versions" of class "vector" is not local and is not updated for new inheritance information currently; 
[where=<environment: 0x55d6692297e8>, where2=<environment: namespace:S4Vectors>]
From .checkSubclasses(): subclass "VersionsNull" of class "vector" is not local and is not updated for new inheritance information currently; 
[where=<environment: 0x55d6692297e8>, where2=<environment: namespace:S4Vectors>]
in method for ‘normalizeSingleBracketReplacementValue’ with signature ‘"List"’: no definition for class “List”
Creating a generic function for ‘complete.cases’ from package ‘stats’ in package ‘S4Vectors’
Creating a new generic function for ‘expand.grid’ in package ‘S4Vectors’
Creating a generic function for ‘%in%’ from package ‘base’ in package ‘S4Vectors’
Creating a new generic function for ‘findMatches’ in package ‘S4Vectors’
Creating a generic function for ‘setequal’ from package ‘base’ in package ‘S4Vectors’
Creating a generic function for ‘as.factor’ from package ‘base’ in package ‘S4Vectors’
Creating a generic function for ‘tabulate’ from package ‘base’ in package ‘S4Vectors’
Creating a generic function for ‘cov’ from package ‘stats’ in package ‘S4Vectors’
Creating a generic function for ‘cor’ from package ‘stats’ in package ‘S4Vectors’
Creating a generic function for ‘smoothEnds’ from package ‘stats’ in package ‘S4Vectors’
Creating a generic function for ‘runmed’ from package ‘stats’ in package ‘S4Vectors’
Creating a generic function for ‘nchar’ from package ‘base’ in package ‘S4Vectors’
Creating a generic function for ‘substr’ from package ‘base’ in package ‘S4Vectors’
Creating a generic function for ‘substring’ from package ‘base’ in package ‘S4Vectors’
Creating a generic function for ‘chartr’ from package ‘base’ in package ‘S4Vectors’
Creating a generic function for ‘tolower’ from package ‘base’ in package ‘S4Vectors’
Creating a generic function for ‘toupper’ from package ‘base’ in package ‘S4Vectors’
Creating a generic function for ‘sub’ from package ‘base’ in package ‘S4Vectors’
Creating a generic function for ‘gsub’ from package ‘base’ in package ‘S4Vectors’
in method for ‘coerce’ with signature ‘"data.table","DataFrame"’: no definition for class “data.table”
From .checkSubclasses(): subclass "ScalarCharacter" of class "character" is not local and is not updated for new inheritance information currently; 
[where=<environment: 0x55d669ddf8a8>, where2=<environment: namespace:IRanges>]
Creating a generic function for ‘drop’ from package ‘base’ in package ‘IRanges’
Creating a generic function for ‘runmed’ from package ‘stats’ in package ‘IRanges’
Creating a generic function for ‘chartr’ from package ‘base’ in package ‘IRanges’
Creating a generic function for ‘toupper’ from package ‘base’ in package ‘IRanges’
Creating a generic function for ‘tolower’ from package ‘base’ in package ‘IRanges’
Creating a generic function for ‘sub’ from package ‘base’ in package ‘IRanges’
Creating a generic function for ‘gsub’ from package ‘base’ in package ‘IRanges’
Creating a generic function for ‘smoothEnds’ from package ‘stats’ in package ‘IRanges’
Creating a new generic function for ‘packageName’ in package ‘AnnotationDbi’
Creating a generic function for ‘ls’ from package ‘base’ in package ‘AnnotationDbi’
Creating a generic function for ‘eapply’ from package ‘base’ in package ‘AnnotationDbi’
Creating a generic function for ‘exists’ from package ‘base’ in package ‘AnnotationDbi’
Creating a generic function for ‘sample’ from package ‘base’ in package ‘AnnotationDbi’
in method for ‘twoWayAlphabetFrequencyByQuality’ with signature ‘"QualityScaledXStringSet"’: no definition for class “QualityScaledXStringSet”
Creating a new generic function for ‘strsplit’ in package ‘Biostrings’
Creating a new generic function for ‘offset’ in package ‘Biostrings’
Creating a new generic function for ‘aperm’ in package ‘DelayedArray’
Creating a generic function for ‘sweep’ from package ‘base’ in package ‘DelayedArray’
Creating a new generic function for ‘apply’ in package ‘DelayedArray’
Creating a new generic function for ‘rowsum’ in package ‘DelayedArray’
Creating a generic function for ‘dnorm’ from package ‘stats’ in package ‘DelayedArray’
Creating a generic function for ‘pnorm’ from package ‘stats’ in package ‘DelayedArray’
Creating a generic function for ‘qnorm’ from package ‘stats’ in package ‘DelayedArray’
Creating a generic function for ‘dbinom’ from package ‘stats’ in package ‘DelayedArray’
Creating a generic function for ‘pbinom’ from package ‘stats’ in package ‘DelayedArray’
Creating a generic function for ‘qbinom’ from package ‘stats’ in package ‘DelayedArray’
Creating a generic function for ‘dpois’ from package ‘stats’ in package ‘DelayedArray’
Creating a generic function for ‘ppois’ from package ‘stats’ in package ‘DelayedArray’
Creating a generic function for ‘qpois’ from package ‘stats’ in package ‘DelayedArray’
Creating a generic function for ‘dlogis’ from package ‘stats’ in package ‘DelayedArray’
Creating a generic function for ‘plogis’ from package ‘stats’ in package ‘DelayedArray’
Creating a generic function for ‘qlogis’ from package ‘stats’ in package ‘DelayedArray’
Creating a new generic function for ‘rowMaxs’ in package ‘DelayedArray’
Creating a new generic function for ‘colMaxs’ in package ‘DelayedArray’
Creating a new generic function for ‘rowMins’ in package ‘DelayedArray’
Creating a new generic function for ‘colMins’ in package ‘DelayedArray’
Creating a new generic function for ‘rowRanges’ in package ‘DelayedArray’
Creating a new generic function for ‘colRanges’ in package ‘DelayedArray’
Creating a generic function for ‘offset’ from package ‘stats’ in package ‘rtracklayer’
Creating a generic function from function ‘uri’ in package ‘rtracklayer’
** help
*** installing help indices
** building package indices
** installing vignettes
** testing if installed package can be loaded from temporary location
From .checkSubclasses(): subclass "ScalarCharacter" of class "character" is not local and is not updated for new inheritance information currently; 
[where=<environment: 0x557bda47a2d8>, where2=<environment: namespace:S4Vectors>]
From .checkSubclasses(): subclass "Versions" of class "vector" is not local and is not updated for new inheritance information currently; 
[where=<environment: 0x557bda47a2d8>, where2=<environment: namespace:S4Vectors>]
From .checkSubclasses(): subclass "VersionsNull" of class "vector" is not local and is not updated for new inheritance information currently; 
[where=<environment: 0x557bda47a2d8>, where2=<environment: namespace:S4Vectors>]
in method for ‘normalizeSingleBracketReplacementValue’ with signature ‘"List"’: no definition for class “List”
Creating a generic function for ‘complete.cases’ from package ‘stats’ in package ‘S4Vectors’
Creating a new generic function for ‘expand.grid’ in package ‘S4Vectors’
Creating a generic function for ‘%in%’ from package ‘base’ in package ‘S4Vectors’
Creating a new generic function for ‘findMatches’ in package ‘S4Vectors’
Creating a generic function for ‘setequal’ from package ‘base’ in package ‘S4Vectors’
Creating a generic function for ‘as.factor’ from package ‘base’ in package ‘S4Vectors’
Creating a generic function for ‘tabulate’ from package ‘base’ in package ‘S4Vectors’
Creating a generic function for ‘cov’ from package ‘stats’ in package ‘S4Vectors’
Creating a generic function for ‘cor’ from package ‘stats’ in package ‘S4Vectors’
Creating a generic function for ‘smoothEnds’ from package ‘stats’ in package ‘S4Vectors’
Creating a generic function for ‘runmed’ from package ‘stats’ in package ‘S4Vectors’
Creating a generic function for ‘nchar’ from package ‘base’ in package ‘S4Vectors’
Creating a generic function for ‘substr’ from package ‘base’ in package ‘S4Vectors’
Creating a generic function for ‘substring’ from package ‘base’ in package ‘S4Vectors’
Creating a generic function for ‘chartr’ from package ‘base’ in package ‘S4Vectors’
Creating a generic function for ‘tolower’ from package ‘base’ in package ‘S4Vectors’
Creating a generic function for ‘toupper’ from package ‘base’ in package ‘S4Vectors’
Creating a generic function for ‘sub’ from package ‘base’ in package ‘S4Vectors’
Creating a generic function for ‘gsub’ from package ‘base’ in package ‘S4Vectors’
in method for ‘coerce’ with signature ‘"data.table","DataFrame"’: no definition for class “data.table”
From .checkSubclasses(): subclass "ScalarCharacter" of class "character" is not local and is not updated for new inheritance information currently; 
[where=<environment: 0x557bdb375e10>, where2=<environment: namespace:IRanges>]
Creating a generic function for ‘drop’ from package ‘base’ in package ‘IRanges’
Creating a generic function for ‘runmed’ from package ‘stats’ in package ‘IRanges’
Creating a generic function for ‘chartr’ from package ‘base’ in package ‘IRanges’
Creating a generic function for ‘toupper’ from package ‘base’ in package ‘IRanges’
Creating a generic function for ‘tolower’ from package ‘base’ in package ‘IRanges’
Creating a generic function for ‘sub’ from package ‘base’ in package ‘IRanges’
Creating a generic function for ‘gsub’ from package ‘base’ in package ‘IRanges’
Creating a generic function for ‘smoothEnds’ from package ‘stats’ in package ‘IRanges’
Creating a new generic function for ‘packageName’ in package ‘AnnotationDbi’
Creating a generic function for ‘ls’ from package ‘base’ in package ‘AnnotationDbi’
Creating a generic function for ‘eapply’ from package ‘base’ in package ‘AnnotationDbi’
Creating a generic function for ‘exists’ from package ‘base’ in package ‘AnnotationDbi’
Creating a generic function for ‘sample’ from package ‘base’ in package ‘AnnotationDbi’
in method for ‘twoWayAlphabetFrequencyByQuality’ with signature ‘"QualityScaledXStringSet"’: no definition for class “QualityScaledXStringSet”
Creating a new generic function for ‘strsplit’ in package ‘Biostrings’
Creating a new generic function for ‘offset’ in package ‘Biostrings’
Creating a new generic function for ‘aperm’ in package ‘DelayedArray’
Creating a generic function for ‘sweep’ from package ‘base’ in package ‘DelayedArray’
Creating a new generic function for ‘apply’ in package ‘DelayedArray’
Creating a new generic function for ‘rowsum’ in package ‘DelayedArray’
Creating a generic function for ‘dnorm’ from package ‘stats’ in package ‘DelayedArray’
Creating a generic function for ‘pnorm’ from package ‘stats’ in package ‘DelayedArray’
Creating a generic function for ‘qnorm’ from package ‘stats’ in package ‘DelayedArray’
Creating a generic function for ‘dbinom’ from package ‘stats’ in package ‘DelayedArray’
Creating a generic function for ‘pbinom’ from package ‘stats’ in package ‘DelayedArray’
Creating a generic function for ‘qbinom’ from package ‘stats’ in package ‘DelayedArray’
Creating a generic function for ‘dpois’ from package ‘stats’ in package ‘DelayedArray’
Creating a generic function for ‘ppois’ from package ‘stats’ in package ‘DelayedArray’
Creating a generic function for ‘qpois’ from package ‘stats’ in package ‘DelayedArray’
Creating a generic function for ‘dlogis’ from package ‘stats’ in package ‘DelayedArray’
Creating a generic function for ‘plogis’ from package ‘stats’ in package ‘DelayedArray’
Creating a generic function for ‘qlogis’ from package ‘stats’ in package ‘DelayedArray’
Creating a new generic function for ‘rowMaxs’ in package ‘DelayedArray’
Creating a new generic function for ‘colMaxs’ in package ‘DelayedArray’
Creating a new generic function for ‘rowMins’ in package ‘DelayedArray’
Creating a new generic function for ‘colMins’ in package ‘DelayedArray’
Creating a new generic function for ‘rowRanges’ in package ‘DelayedArray’
Creating a new generic function for ‘colRanges’ in package ‘DelayedArray’
Creating a generic function for ‘offset’ from package ‘stats’ in package ‘rtracklayer’
Creating a generic function from function ‘uri’ in package ‘rtracklayer’
** testing if installed package can be loaded from final location
From .checkSubclasses(): subclass "ScalarCharacter" of class "character" is not local and is not updated for new inheritance information currently; 
[where=<environment: 0x557101043e38>, where2=<environment: namespace:S4Vectors>]
From .checkSubclasses(): subclass "Versions" of class "vector" is not local and is not updated for new inheritance information currently; 
[where=<environment: 0x557101043e38>, where2=<environment: namespace:S4Vectors>]
From .checkSubclasses(): subclass "VersionsNull" of class "vector" is not local and is not updated for new inheritance information currently; 
[where=<environment: 0x557101043e38>, where2=<environment: namespace:S4Vectors>]
in method for ‘normalizeSingleBracketReplacementValue’ with signature ‘"List"’: no definition for class “List”
Creating a generic function for ‘complete.cases’ from package ‘stats’ in package ‘S4Vectors’
Creating a new generic function for ‘expand.grid’ in package ‘S4Vectors’
Creating a generic function for ‘%in%’ from package ‘base’ in package ‘S4Vectors’
Creating a new generic function for ‘findMatches’ in package ‘S4Vectors’
Creating a generic function for ‘setequal’ from package ‘base’ in package ‘S4Vectors’
Creating a generic function for ‘as.factor’ from package ‘base’ in package ‘S4Vectors’
Creating a generic function for ‘tabulate’ from package ‘base’ in package ‘S4Vectors’
Creating a generic function for ‘cov’ from package ‘stats’ in package ‘S4Vectors’
Creating a generic function for ‘cor’ from package ‘stats’ in package ‘S4Vectors’
Creating a generic function for ‘smoothEnds’ from package ‘stats’ in package ‘S4Vectors’
Creating a generic function for ‘runmed’ from package ‘stats’ in package ‘S4Vectors’
Creating a generic function for ‘nchar’ from package ‘base’ in package ‘S4Vectors’
Creating a generic function for ‘substr’ from package ‘base’ in package ‘S4Vectors’
Creating a generic function for ‘substring’ from package ‘base’ in package ‘S4Vectors’
Creating a generic function for ‘chartr’ from package ‘base’ in package ‘S4Vectors’
Creating a generic function for ‘tolower’ from package ‘base’ in package ‘S4Vectors’
Creating a generic function for ‘toupper’ from package ‘base’ in package ‘S4Vectors’
Creating a generic function for ‘sub’ from package ‘base’ in package ‘S4Vectors’
Creating a generic function for ‘gsub’ from package ‘base’ in package ‘S4Vectors’
in method for ‘coerce’ with signature ‘"data.table","DataFrame"’: no definition for class “data.table”
From .checkSubclasses(): subclass "ScalarCharacter" of class "character" is not local and is not updated for new inheritance information currently; 
[where=<environment: 0x557101f0fdf8>, where2=<environment: namespace:IRanges>]
Creating a generic function for ‘drop’ from package ‘base’ in package ‘IRanges’
Creating a generic function for ‘runmed’ from package ‘stats’ in package ‘IRanges’
Creating a generic function for ‘chartr’ from package ‘base’ in package ‘IRanges’
Creating a generic function for ‘toupper’ from package ‘base’ in package ‘IRanges’
Creating a generic function for ‘tolower’ from package ‘base’ in package ‘IRanges’
Creating a generic function for ‘sub’ from package ‘base’ in package ‘IRanges’
Creating a generic function for ‘gsub’ from package ‘base’ in package ‘IRanges’
Creating a generic function for ‘smoothEnds’ from package ‘stats’ in package ‘IRanges’
Creating a new generic function for ‘packageName’ in package ‘AnnotationDbi’
Creating a generic function for ‘ls’ from package ‘base’ in package ‘AnnotationDbi’
Creating a generic function for ‘eapply’ from package ‘base’ in package ‘AnnotationDbi’
Creating a generic function for ‘exists’ from package ‘base’ in package ‘AnnotationDbi’
Creating a generic function for ‘sample’ from package ‘base’ in package ‘AnnotationDbi’
in method for ‘twoWayAlphabetFrequencyByQuality’ with signature ‘"QualityScaledXStringSet"’: no definition for class “QualityScaledXStringSet”
Creating a new generic function for ‘strsplit’ in package ‘Biostrings’
Creating a new generic function for ‘offset’ in package ‘Biostrings’
Creating a new generic function for ‘aperm’ in package ‘DelayedArray’
Creating a generic function for ‘sweep’ from package ‘base’ in package ‘DelayedArray’
Creating a new generic function for ‘apply’ in package ‘DelayedArray’
Creating a new generic function for ‘rowsum’ in package ‘DelayedArray’
Creating a generic function for ‘dnorm’ from package ‘stats’ in package ‘DelayedArray’
Creating a generic function for ‘pnorm’ from package ‘stats’ in package ‘DelayedArray’
Creating a generic function for ‘qnorm’ from package ‘stats’ in package ‘DelayedArray’
Creating a generic function for ‘dbinom’ from package ‘stats’ in package ‘DelayedArray’
Creating a generic function for ‘pbinom’ from package ‘stats’ in package ‘DelayedArray’
Creating a generic function for ‘qbinom’ from package ‘stats’ in package ‘DelayedArray’
Creating a generic function for ‘dpois’ from package ‘stats’ in package ‘DelayedArray’
Creating a generic function for ‘ppois’ from package ‘stats’ in package ‘DelayedArray’
Creating a generic function for ‘qpois’ from package ‘stats’ in package ‘DelayedArray’
Creating a generic function for ‘dlogis’ from package ‘stats’ in package ‘DelayedArray’
Creating a generic function for ‘plogis’ from package ‘stats’ in package ‘DelayedArray’
Creating a generic function for ‘qlogis’ from package ‘stats’ in package ‘DelayedArray’
Creating a new generic function for ‘rowMaxs’ in package ‘DelayedArray’
Creating a new generic function for ‘colMaxs’ in package ‘DelayedArray’
Creating a new generic function for ‘rowMins’ in package ‘DelayedArray’
Creating a new generic function for ‘colMins’ in package ‘DelayedArray’
Creating a new generic function for ‘rowRanges’ in package ‘DelayedArray’
Creating a new generic function for ‘colRanges’ in package ‘DelayedArray’
Creating a generic function for ‘offset’ from package ‘stats’ in package ‘rtracklayer’
Creating a generic function from function ‘uri’ in package ‘rtracklayer’
** testing if installed package keeps a record of temporary installation path
* DONE (OrganismDbi)

```
# ragene21stprobeset.db

<details>

* Version: 8.7.0
* Source code: https://github.com/cran/ragene21stprobeset.db
* Number of recursive dependencies: 32

Run `revdep_details(,"ragene21stprobeset.db")` for more info

</details>

## In both

*   checking whether package ‘ragene21stprobeset.db’ can be installed ... ERROR
    ```
    Installation failed.
    See ‘/home/rstudio/DBI/revdep/checks/ragene21stprobeset.db/new/ragene21stprobeset.db.Rcheck/00install.out’ for details.
    ```

## Installation

### Devel

```
* install options ‘--no-html --no-multiarch’


```
### CRAN

```
* installing *source* package ‘ragene21stprobeset.db’ ...
** using staged installation
** R
** inst
** byte-compile and prepare package for lazy loading
From .checkSubclasses(): subclass "ScalarCharacter" of class "character" is not local and is not updated for new inheritance information currently; 
[where=<environment: 0x55cc9e33a5f8>, where2=<environment: namespace:S4Vectors>]
From .checkSubclasses(): subclass "Versions" of class "vector" is not local and is not updated for new inheritance information currently; 
[where=<environment: 0x55cc9e33a5f8>, where2=<environment: namespace:S4Vectors>]
From .checkSubclasses(): subclass "VersionsNull" of class "vector" is not local and is not updated for new inheritance information currently; 
[where=<environment: 0x55cc9e33a5f8>, where2=<environment: namespace:S4Vectors>]
in method for ‘normalizeSingleBracketReplacementValue’ with signature ‘"List"’: no definition for class “List”
Creating a generic function for ‘complete.cases’ from package ‘stats’ in package ‘S4Vectors’
Creating a new generic function for ‘expand.grid’ in package ‘S4Vectors’
Creating a generic function for ‘%in%’ from package ‘base’ in package ‘S4Vectors’
Creating a new generic function for ‘findMatches’ in package ‘S4Vectors’
Creating a generic function for ‘setequal’ from package ‘base’ in package ‘S4Vectors’
Creating a generic function for ‘as.factor’ from package ‘base’ in package ‘S4Vectors’
Creating a generic function for ‘tabulate’ from package ‘base’ in package ‘S4Vectors’
Creating a generic function for ‘cov’ from package ‘stats’ in package ‘S4Vectors’
Creating a generic function for ‘cor’ from package ‘stats’ in package ‘S4Vectors’
Creating a generic function for ‘smoothEnds’ from package ‘stats’ in package ‘S4Vectors’
Creating a generic function for ‘runmed’ from package ‘stats’ in package ‘S4Vectors’
Creating a generic function for ‘nchar’ from package ‘base’ in package ‘S4Vectors’
Creating a generic function for ‘substr’ from package ‘base’ in package ‘S4Vectors’
Creating a generic function for ‘substring’ from package ‘base’ in package ‘S4Vectors’
Creating a generic function for ‘chartr’ from package ‘base’ in package ‘S4Vectors’
Creating a generic function for ‘tolower’ from package ‘base’ in package ‘S4Vectors’
Creating a generic function for ‘toupper’ from package ‘base’ in package ‘S4Vectors’
Creating a generic function for ‘sub’ from package ‘base’ in package ‘S4Vectors’
Creating a generic function for ‘gsub’ from package ‘base’ in package ‘S4Vectors’
in method for ‘coerce’ with signature ‘"data.table","DataFrame"’: no definition for class “data.table”
From .checkSubclasses(): subclass "ScalarCharacter" of class "character" is not local and is not updated for new inheritance information currently; 
[where=<environment: 0x55cc9ee18510>, where2=<environment: namespace:IRanges>]
Creating a generic function for ‘drop’ from package ‘base’ in package ‘IRanges’
Creating a generic function for ‘runmed’ from package ‘stats’ in package ‘IRanges’
Creating a generic function for ‘chartr’ from package ‘base’ in package ‘IRanges’
Creating a generic function for ‘toupper’ from package ‘base’ in package ‘IRanges’
Creating a generic function for ‘tolower’ from package ‘base’ in package ‘IRanges’
Creating a generic function for ‘sub’ from package ‘base’ in package ‘IRanges’
Creating a generic function for ‘gsub’ from package ‘base’ in package ‘IRanges’
Creating a generic function for ‘smoothEnds’ from package ‘stats’ in package ‘IRanges’
Creating a new generic function for ‘packageName’ in package ‘AnnotationDbi’
Creating a generic function for ‘ls’ from package ‘base’ in package ‘AnnotationDbi’
Creating a generic function for ‘eapply’ from package ‘base’ in package ‘AnnotationDbi’
Creating a generic function for ‘exists’ from package ‘base’ in package ‘AnnotationDbi’
Creating a generic function for ‘sample’ from package ‘base’ in package ‘AnnotationDbi’
Warning: system call failed: Cannot allocate memory
** help
*** installing help indices
** building package indices
** testing if installed package can be loaded from temporary location
Error: package or namespace load failed for ‘utils’:
 .onLoad failed in loadNamespace() for 'utils', details:
  call: system(paste(which, shQuote(names[i])), intern = TRUE, ignore.stderr = TRUE)
  error: cannot popen '/usr/bin/which 'uname' 2>/dev/null', probable reason 'Cannot allocate memory'
Error: package or namespace load failed for ‘stats’:
 .onLoad failed in loadNamespace() for 'utils', details:
  call: system(paste(which, shQuote(names[i])), intern = TRUE, ignore.stderr = TRUE)
  error: cannot popen '/usr/bin/which 'uname' 2>/dev/null', probable reason 'Cannot allocate memory'
During startup - Warning messages:
1: package ‘utils’ in options("defaultPackages") was not found 
2: package ‘stats’ in options("defaultPackages") was not found 
Error: package or namespace load failed for ‘utils’:
 .onLoad failed in loadNamespace() for 'utils', details:
  call: system(paste(which, shQuote(names[i])), intern = TRUE, ignore.stderr = TRUE)
  error: cannot popen '/usr/bin/which 'uname' 2>/dev/null', probable reason 'Cannot allocate memory'
Error : package ‘utils’ could not be loaded
Error: loading failed
Execution halted
Warning: system call failed: Cannot allocate memory
ERROR: loading failed
* removing ‘/home/rstudio/DBI/revdep/checks/ragene21stprobeset.db/old/ragene21stprobeset.db.Rcheck/ragene21stprobeset.db’

```
# RCAS

<details>

* Version: 1.10.1
* Source code: https://github.com/cran/RCAS
* Date/Publication: 2019-07-11
* Number of recursive dependencies: 145

Run `revdep_details(,"RCAS")` for more info

</details>

## In both

*   checking whether package ‘RCAS’ can be installed ... ERROR
    ```
    Installation failed.
    See ‘/home/rstudio/DBI/revdep/checks/RCAS/new/RCAS.Rcheck/00install.out’ for details.
    ```

## Installation

### Devel

```
* installing *source* package ‘RCAS’ ...
** using staged installation
** R
** data
*** moving datasets to lazyload DB
** inst
** byte-compile and prepare package for lazy loading
From .checkSubclasses(): subclass "ScalarCharacter" of class "character" is not local and is not updated for new inheritance information currently; 
[where=<environment: 0x56185453a378>, where2=<environment: namespace:S4Vectors>]
From .checkSubclasses(): subclass "Versions" of class "vector" is not local and is not updated for new inheritance information currently; 
[where=<environment: 0x56185453a378>, where2=<environment: namespace:S4Vectors>]
From .checkSubclasses(): subclass "VersionsNull" of class "vector" is not local and is not updated for new inheritance information currently; 
[where=<environment: 0x56185453a378>, where2=<environment: namespace:S4Vectors>]
in method for ‘normalizeSingleBracketReplacementValue’ with signature ‘"List"’: no definition for class “List”
Creating a generic function for ‘complete.cases’ from package ‘stats’ in package ‘S4Vectors’
Creating a new generic function for ‘expand.grid’ in package ‘S4Vectors’
Creating a generic function for ‘%in%’ from package ‘base’ in package ‘S4Vectors’
Creating a new generic function for ‘findMatches’ in package ‘S4Vectors’
Creating a generic function for ‘setequal’ from package ‘base’ in package ‘S4Vectors’
Creating a generic function for ‘as.factor’ from package ‘base’ in package ‘S4Vectors’
Creating a generic function for ‘tabulate’ from package ‘base’ in package ‘S4Vectors’
Creating a generic function for ‘cov’ from package ‘stats’ in package ‘S4Vectors’
Creating a generic function for ‘cor’ from package ‘stats’ in package ‘S4Vectors’
Creating a generic function for ‘smoothEnds’ from package ‘stats’ in package ‘S4Vectors’
Creating a generic function for ‘runmed’ from package ‘stats’ in package ‘S4Vectors’
Creating a generic function for ‘nchar’ from package ‘base’ in package ‘S4Vectors’
Creating a generic function for ‘substr’ from package ‘base’ in package ‘S4Vectors’
Creating a generic function for ‘substring’ from package ‘base’ in package ‘S4Vectors’
Creating a generic function for ‘chartr’ from package ‘base’ in package ‘S4Vectors’
Creating a generic function for ‘tolower’ from package ‘base’ in package ‘S4Vectors’
Creating a generic function for ‘toupper’ from package ‘base’ in package ‘S4Vectors’
Creating a generic function for ‘sub’ from package ‘base’ in package ‘S4Vectors’
Creating a generic function for ‘gsub’ from package ‘base’ in package ‘S4Vectors’
From .checkSubclasses(): subclass "ScalarCharacter" of class "character" is not local and is not updated for new inheritance information currently; 
[where=<environment: 0x561857523760>, where2=<environment: namespace:IRanges>]
Creating a generic function for ‘drop’ from package ‘base’ in package ‘IRanges’
Creating a generic function for ‘runmed’ from package ‘stats’ in package ‘IRanges’
Creating a generic function for ‘chartr’ from package ‘base’ in package ‘IRanges’
Creating a generic function for ‘toupper’ from package ‘base’ in package ‘IRanges’
Creating a generic function for ‘tolower’ from package ‘base’ in package ‘IRanges’
Creating a generic function for ‘sub’ from package ‘base’ in package ‘IRanges’
Creating a generic function for ‘gsub’ from package ‘base’ in package ‘IRanges’
Creating a generic function for ‘smoothEnds’ from package ‘stats’ in package ‘IRanges’
Creating a new generic function for ‘packageName’ in package ‘AnnotationDbi’
Creating a generic function for ‘ls’ from package ‘base’ in package ‘AnnotationDbi’
Creating a generic function for ‘eapply’ from package ‘base’ in package ‘AnnotationDbi’
Creating a generic function for ‘exists’ from package ‘base’ in package ‘AnnotationDbi’
Creating a generic function for ‘sample’ from package ‘base’ in package ‘AnnotationDbi’

groupGOTerms: 	GOBPTerm, GOMFTerm, GOCCTerm environments built.
in method for ‘twoWayAlphabetFrequencyByQuality’ with signature ‘"QualityScaledXStringSet"’: no definition for class “QualityScaledXStringSet”
Creating a new generic function for ‘strsplit’ in package ‘Biostrings’
Creating a new generic function for ‘offset’ in package ‘Biostrings’
Error: package or namespace load failed for ‘rtracklayer’ in dyn.load(file, DLLpath = DLLpath, ...):
 unable to load shared object '/home/rstudio/DBI/revdep/library/RCAS/Rsamtools/libs/Rsamtools.so':
  /home/rstudio/DBI/revdep/library/RCAS/Rsamtools/libs/Rsamtools.so: failed to map segment from shared object
Error: package ‘rtracklayer’ could not be loaded
Execution halted
Warning message:
system call failed: Cannot allocate memory 
ERROR: lazy loading failed for package ‘RCAS’
* removing ‘/home/rstudio/DBI/revdep/checks/RCAS/new/RCAS.Rcheck/RCAS’

```
### CRAN

```
* installing *source* package ‘RCAS’ ...
** using staged installation
** R
** data
*** moving datasets to lazyload DB
** inst
** byte-compile and prepare package for lazy loading
From .checkSubclasses(): subclass "ScalarCharacter" of class "character" is not local and is not updated for new inheritance information currently; 
[where=<environment: 0x55d9edc71d20>, where2=<environment: namespace:S4Vectors>]
From .checkSubclasses(): subclass "Versions" of class "vector" is not local and is not updated for new inheritance information currently; 
[where=<environment: 0x55d9edc71d20>, where2=<environment: namespace:S4Vectors>]
From .checkSubclasses(): subclass "VersionsNull" of class "vector" is not local and is not updated for new inheritance information currently; 
[where=<environment: 0x55d9edc71d20>, where2=<environment: namespace:S4Vectors>]
in method for ‘normalizeSingleBracketReplacementValue’ with signature ‘"List"’: no definition for class “List”
Creating a generic function for ‘complete.cases’ from package ‘stats’ in package ‘S4Vectors’
Creating a new generic function for ‘expand.grid’ in package ‘S4Vectors’
Creating a generic function for ‘%in%’ from package ‘base’ in package ‘S4Vectors’
Creating a new generic function for ‘findMatches’ in package ‘S4Vectors’
Creating a generic function for ‘setequal’ from package ‘base’ in package ‘S4Vectors’
Creating a generic function for ‘as.factor’ from package ‘base’ in package ‘S4Vectors’
Creating a generic function for ‘tabulate’ from package ‘base’ in package ‘S4Vectors’
Creating a generic function for ‘cov’ from package ‘stats’ in package ‘S4Vectors’
Creating a generic function for ‘cor’ from package ‘stats’ in package ‘S4Vectors’
Creating a generic function for ‘smoothEnds’ from package ‘stats’ in package ‘S4Vectors’
Creating a generic function for ‘runmed’ from package ‘stats’ in package ‘S4Vectors’
Creating a generic function for ‘nchar’ from package ‘base’ in package ‘S4Vectors’
Creating a generic function for ‘substr’ from package ‘base’ in package ‘S4Vectors’
Creating a generic function for ‘substring’ from package ‘base’ in package ‘S4Vectors’
Creating a generic function for ‘chartr’ from package ‘base’ in package ‘S4Vectors’
Creating a generic function for ‘tolower’ from package ‘base’ in package ‘S4Vectors’
Creating a generic function for ‘toupper’ from package ‘base’ in package ‘S4Vectors’
Creating a generic function for ‘sub’ from package ‘base’ in package ‘S4Vectors’
Creating a generic function for ‘gsub’ from package ‘base’ in package ‘S4Vectors’
From .checkSubclasses(): subclass "ScalarCharacter" of class "character" is not local and is not updated for new inheritance information currently; 
[where=<environment: 0x55d9f0b8cac0>, where2=<environment: namespace:IRanges>]
Creating a generic function for ‘drop’ from package ‘base’ in package ‘IRanges’
Creating a generic function for ‘runmed’ from package ‘stats’ in package ‘IRanges’
Creating a generic function for ‘chartr’ from package ‘base’ in package ‘IRanges’
Creating a generic function for ‘toupper’ from package ‘base’ in package ‘IRanges’
Creating a generic function for ‘tolower’ from package ‘base’ in package ‘IRanges’
Creating a generic function for ‘sub’ from package ‘base’ in package ‘IRanges’
Creating a generic function for ‘gsub’ from package ‘base’ in package ‘IRanges’
Creating a generic function for ‘smoothEnds’ from package ‘stats’ in package ‘IRanges’
Creating a new generic function for ‘packageName’ in package ‘AnnotationDbi’
Creating a generic function for ‘ls’ from package ‘base’ in package ‘AnnotationDbi’
Creating a generic function for ‘eapply’ from package ‘base’ in package ‘AnnotationDbi’
Creating a generic function for ‘exists’ from package ‘base’ in package ‘AnnotationDbi’
Creating a generic function for ‘sample’ from package ‘base’ in package ‘AnnotationDbi’

groupGOTerms: 	GOBPTerm, GOMFTerm, GOCCTerm environments built.
in method for ‘twoWayAlphabetFrequencyByQuality’ with signature ‘"QualityScaledXStringSet"’: no definition for class “QualityScaledXStringSet”
Creating a new generic function for ‘strsplit’ in package ‘Biostrings’
Creating a new generic function for ‘offset’ in package ‘Biostrings’
Creating a new generic function for ‘aperm’ in package ‘DelayedArray’
Creating a generic function for ‘sweep’ from package ‘base’ in package ‘DelayedArray’
Creating a new generic function for ‘apply’ in package ‘DelayedArray’
Creating a new generic function for ‘rowsum’ in package ‘DelayedArray’
Creating a generic function for ‘dnorm’ from package ‘stats’ in package ‘DelayedArray’
Creating a generic function for ‘pnorm’ from package ‘stats’ in package ‘DelayedArray’
Creating a generic function for ‘qnorm’ from package ‘stats’ in package ‘DelayedArray’
Creating a generic function for ‘dbinom’ from package ‘stats’ in package ‘DelayedArray’
Creating a generic function for ‘pbinom’ from package ‘stats’ in package ‘DelayedArray’
Creating a generic function for ‘qbinom’ from package ‘stats’ in package ‘DelayedArray’
Creating a generic function for ‘dpois’ from package ‘stats’ in package ‘DelayedArray’
Creating a generic function for ‘ppois’ from package ‘stats’ in package ‘DelayedArray’
Creating a generic function for ‘qpois’ from package ‘stats’ in package ‘DelayedArray’
Creating a generic function for ‘dlogis’ from package ‘stats’ in package ‘DelayedArray’
Creating a generic function for ‘plogis’ from package ‘stats’ in package ‘DelayedArray’
Creating a generic function for ‘qlogis’ from package ‘stats’ in package ‘DelayedArray’
Creating a new generic function for ‘rowMaxs’ in package ‘DelayedArray’
Creating a new generic function for ‘colMaxs’ in package ‘DelayedArray’
Creating a new generic function for ‘rowMins’ in package ‘DelayedArray’
Creating a new generic function for ‘colMins’ in package ‘DelayedArray’
Creating a new generic function for ‘rowRanges’ in package ‘DelayedArray’
Creating a new generic function for ‘colRanges’ in package ‘DelayedArray’
Creating a generic function for ‘offset’ from package ‘stats’ in package ‘rtracklayer’
Creating a generic function from function ‘uri’ in package ‘rtracklayer’
** help
*** installing help indices
** building package indices
** installing vignettes
** testing if installed package can be loaded from temporary location
From .checkSubclasses(): subclass "ScalarCharacter" of class "character" is not local and is not updated for new inheritance information currently; 
[where=<environment: 0x55b804428128>, where2=<environment: namespace:S4Vectors>]
From .checkSubclasses(): subclass "Versions" of class "vector" is not local and is not updated for new inheritance information currently; 
[where=<environment: 0x55b804428128>, where2=<environment: namespace:S4Vectors>]
From .checkSubclasses(): subclass "VersionsNull" of class "vector" is not local and is not updated for new inheritance information currently; 
[where=<environment: 0x55b804428128>, where2=<environment: namespace:S4Vectors>]
in method for ‘normalizeSingleBracketReplacementValue’ with signature ‘"List"’: no definition for class “List”
Creating a generic function for ‘complete.cases’ from package ‘stats’ in package ‘S4Vectors’
Creating a new generic function for ‘expand.grid’ in package ‘S4Vectors’
Creating a generic function for ‘%in%’ from package ‘base’ in package ‘S4Vectors’
Creating a new generic function for ‘findMatches’ in package ‘S4Vectors’
Creating a generic function for ‘setequal’ from package ‘base’ in package ‘S4Vectors’
Creating a generic function for ‘as.factor’ from package ‘base’ in package ‘S4Vectors’
Creating a generic function for ‘tabulate’ from package ‘base’ in package ‘S4Vectors’
Creating a generic function for ‘cov’ from package ‘stats’ in package ‘S4Vectors’
Creating a generic function for ‘cor’ from package ‘stats’ in package ‘S4Vectors’
Creating a generic function for ‘smoothEnds’ from package ‘stats’ in package ‘S4Vectors’
Creating a generic function for ‘runmed’ from package ‘stats’ in package ‘S4Vectors’
Creating a generic function for ‘nchar’ from package ‘base’ in package ‘S4Vectors’
Creating a generic function for ‘substr’ from package ‘base’ in package ‘S4Vectors’
Creating a generic function for ‘substring’ from package ‘base’ in package ‘S4Vectors’
Creating a generic function for ‘chartr’ from package ‘base’ in package ‘S4Vectors’
Creating a generic function for ‘tolower’ from package ‘base’ in package ‘S4Vectors’
Creating a generic function for ‘toupper’ from package ‘base’ in package ‘S4Vectors’
Creating a generic function for ‘sub’ from package ‘base’ in package ‘S4Vectors’
Creating a generic function for ‘gsub’ from package ‘base’ in package ‘S4Vectors’
From .checkSubclasses(): subclass "ScalarCharacter" of class "character" is not local and is not updated for new inheritance information currently; 
[where=<environment: 0x55b8073270f0>, where2=<environment: namespace:IRanges>]
Creating a generic function for ‘drop’ from package ‘base’ in package ‘IRanges’
Creating a generic function for ‘runmed’ from package ‘stats’ in package ‘IRanges’
Creating a generic function for ‘chartr’ from package ‘base’ in package ‘IRanges’
Creating a generic function for ‘toupper’ from package ‘base’ in package ‘IRanges’
Creating a generic function for ‘tolower’ from package ‘base’ in package ‘IRanges’
Creating a generic function for ‘sub’ from package ‘base’ in package ‘IRanges’
Creating a generic function for ‘gsub’ from package ‘base’ in package ‘IRanges’
Creating a generic function for ‘smoothEnds’ from package ‘stats’ in package ‘IRanges’
Creating a new generic function for ‘packageName’ in package ‘AnnotationDbi’
Creating a generic function for ‘ls’ from package ‘base’ in package ‘AnnotationDbi’
Creating a generic function for ‘eapply’ from package ‘base’ in package ‘AnnotationDbi’
Creating a generic function for ‘exists’ from package ‘base’ in package ‘AnnotationDbi’
Creating a generic function for ‘sample’ from package ‘base’ in package ‘AnnotationDbi’

groupGOTerms: 	GOBPTerm, GOMFTerm, GOCCTerm environments built.
in method for ‘twoWayAlphabetFrequencyByQuality’ with signature ‘"QualityScaledXStringSet"’: no definition for class “QualityScaledXStringSet”
Creating a new generic function for ‘strsplit’ in package ‘Biostrings’
Creating a new generic function for ‘offset’ in package ‘Biostrings’
Creating a new generic function for ‘aperm’ in package ‘DelayedArray’
Creating a generic function for ‘sweep’ from package ‘base’ in package ‘DelayedArray’
Creating a new generic function for ‘apply’ in package ‘DelayedArray’
Creating a new generic function for ‘rowsum’ in package ‘DelayedArray’
Creating a generic function for ‘dnorm’ from package ‘stats’ in package ‘DelayedArray’
Creating a generic function for ‘pnorm’ from package ‘stats’ in package ‘DelayedArray’
Creating a generic function for ‘qnorm’ from package ‘stats’ in package ‘DelayedArray’
Creating a generic function for ‘dbinom’ from package ‘stats’ in package ‘DelayedArray’
Creating a generic function for ‘pbinom’ from package ‘stats’ in package ‘DelayedArray’
Creating a generic function for ‘qbinom’ from package ‘stats’ in package ‘DelayedArray’
Creating a generic function for ‘dpois’ from package ‘stats’ in package ‘DelayedArray’
Creating a generic function for ‘ppois’ from package ‘stats’ in package ‘DelayedArray’
Creating a generic function for ‘qpois’ from package ‘stats’ in package ‘DelayedArray’
Creating a generic function for ‘dlogis’ from package ‘stats’ in package ‘DelayedArray’
Creating a generic function for ‘plogis’ from package ‘stats’ in package ‘DelayedArray’
Creating a generic function for ‘qlogis’ from package ‘stats’ in package ‘DelayedArray’
Creating a new generic function for ‘rowMaxs’ in package ‘DelayedArray’
Creating a new generic function for ‘colMaxs’ in package ‘DelayedArray’
Creating a new generic function for ‘rowMins’ in package ‘DelayedArray’
Creating a new generic function for ‘colMins’ in package ‘DelayedArray’
Creating a new generic function for ‘rowRanges’ in package ‘DelayedArray’
Creating a new generic function for ‘colRanges’ in package ‘DelayedArray’
Creating a generic function for ‘offset’ from package ‘stats’ in package ‘rtracklayer’
Creating a generic function from function ‘uri’ in package ‘rtracklayer’
Error: package or namespace load failed for ‘rtracklayer’ in dyn.load(file, DLLpath = DLLpath, ...):
 unable to load shared object '/home/rstudio/DBI/revdep/library/RCAS/rtracklayer/libs/rtracklayer.so':
  /home/rstudio/DBI/revdep/library/RCAS/rtracklayer/libs/rtracklayer.so: failed to map segment from shared object
Error : package ‘rtracklayer’ could not be loaded
Error: loading failed
Execution halted
Warning: system call failed: Cannot allocate memory
ERROR: loading failed
* removing ‘/home/rstudio/DBI/revdep/checks/RCAS/old/RCAS.Rcheck/RCAS’

```
# ROracle

<details>

* Version: 1.3-1
* Source code: https://github.com/cran/ROracle
* URL: http://www.oracle.com
* Date/Publication: 2016-10-26 10:37:42
* Number of recursive dependencies: 1

Run `revdep_details(,"ROracle")` for more info

</details>

## In both

*   checking whether package ‘ROracle’ can be installed ... ERROR
    ```
    Installation failed.
    See ‘/home/rstudio/DBI/revdep/checks/ROracle/new/ROracle.Rcheck/00install.out’ for details.
    ```

## Installation

### Devel

```
* installing *source* package ‘ROracle’ ...
** package ‘ROracle’ successfully unpacked and MD5 sums checked
** using staged installation
configure: error: OCI libraries not found
ERROR: configuration failed for package ‘ROracle’
* removing ‘/home/rstudio/DBI/revdep/checks/ROracle/new/ROracle.Rcheck/ROracle’

```
### CRAN

```
* installing *source* package ‘ROracle’ ...
** package ‘ROracle’ successfully unpacked and MD5 sums checked
** using staged installation
configure: error: OCI libraries not found
ERROR: configuration failed for package ‘ROracle’
* removing ‘/home/rstudio/DBI/revdep/checks/ROracle/old/ROracle.Rcheck/ROracle’

```
# seqplots

<details>

* Version: 1.22.2
* Source code: https://github.com/cran/seqplots
* URL: http://github.com/przemol/seqplots
* BugReports: http://github.com/przemol/seqplots/issues
* Date/Publication: 2019-06-12
* Number of recursive dependencies: 114

Run `revdep_details(,"seqplots")` for more info

</details>

## In both

*   checking whether package ‘seqplots’ can be installed ... ERROR
    ```
    Installation failed.
    See ‘/home/rstudio/DBI/revdep/checks/seqplots/new/seqplots.Rcheck/00install.out’ for details.
    ```

## Installation

### Devel

```
* installing *source* package ‘seqplots’ ...
** using staged installation
** R
** inst
** byte-compile and prepare package for lazy loading
in method for ‘normalizeSingleBracketReplacementValue’ with signature ‘"List"’: no definition for class “List”
Creating a generic function for ‘complete.cases’ from package ‘stats’ in package ‘S4Vectors’
Creating a new generic function for ‘expand.grid’ in package ‘S4Vectors’
Creating a generic function for ‘%in%’ from package ‘base’ in package ‘S4Vectors’
Creating a new generic function for ‘findMatches’ in package ‘S4Vectors’
Creating a generic function for ‘setequal’ from package ‘base’ in package ‘S4Vectors’
Creating a generic function for ‘as.factor’ from package ‘base’ in package ‘S4Vectors’
Creating a generic function for ‘tabulate’ from package ‘base’ in package ‘S4Vectors’
Creating a generic function for ‘cov’ from package ‘stats’ in package ‘S4Vectors’
Creating a generic function for ‘cor’ from package ‘stats’ in package ‘S4Vectors’
Creating a generic function for ‘smoothEnds’ from package ‘stats’ in package ‘S4Vectors’
Creating a generic function for ‘runmed’ from package ‘stats’ in package ‘S4Vectors’
Creating a generic function for ‘nchar’ from package ‘base’ in package ‘S4Vectors’
Creating a generic function for ‘substr’ from package ‘base’ in package ‘S4Vectors’
Creating a generic function for ‘substring’ from package ‘base’ in package ‘S4Vectors’
Creating a generic function for ‘chartr’ from package ‘base’ in package ‘S4Vectors’
Creating a generic function for ‘tolower’ from package ‘base’ in package ‘S4Vectors’
Creating a generic function for ‘toupper’ from package ‘base’ in package ‘S4Vectors’
Creating a generic function for ‘sub’ from package ‘base’ in package ‘S4Vectors’
Creating a generic function for ‘gsub’ from package ‘base’ in package ‘S4Vectors’
in method for ‘coerce’ with signature ‘"data.table","DataFrame"’: no definition for class “data.table”
Creating a generic function for ‘drop’ from package ‘base’ in package ‘IRanges’
Creating a generic function for ‘runmed’ from package ‘stats’ in package ‘IRanges’
Creating a generic function for ‘chartr’ from package ‘base’ in package ‘IRanges’
Creating a generic function for ‘toupper’ from package ‘base’ in package ‘IRanges’
Creating a generic function for ‘tolower’ from package ‘base’ in package ‘IRanges’
Creating a generic function for ‘sub’ from package ‘base’ in package ‘IRanges’
Creating a generic function for ‘gsub’ from package ‘base’ in package ‘IRanges’
Creating a generic function for ‘smoothEnds’ from package ‘stats’ in package ‘IRanges’
in method for ‘twoWayAlphabetFrequencyByQuality’ with signature ‘"QualityScaledXStringSet"’: no definition for class “QualityScaledXStringSet”
Creating a new generic function for ‘strsplit’ in package ‘Biostrings’
Creating a generic function for ‘ls’ from package ‘base’ in package ‘Biostrings’
Creating a new generic function for ‘offset’ in package ‘Biostrings’
From .checkSubclasses(): subclass "RsamtoolsFile" of class "environment" is not local and is not updated for new inheritance information currently; 
[where=<environment: 0x56483693e150>, where2=<environment: namespace:Biobase>]
From .checkSubclasses(): subclass "BamFile" of class "environment" is not local and is not updated for new inheritance information currently; 
[where=<environment: 0x56483693e150>, where2=<environment: namespace:Biobase>]
From .checkSubclasses(): subclass "BcfFile" of class "environment" is not local and is not updated for new inheritance information currently; 
[where=<environment: 0x56483693e150>, where2=<environment: namespace:Biobase>]
From .checkSubclasses(): subclass "TabixFile" of class "environment" is not local and is not updated for new inheritance information currently; 
[where=<environment: 0x56483693e150>, where2=<environment: namespace:Biobase>]
From .checkSubclasses(): subclass "FaFile" of class "environment" is not local and is not updated for new inheritance information currently; 
[where=<environment: 0x56483693e150>, where2=<environment: namespace:Biobase>]
From .checkSubclasses(): subclass "BamSampler" of class "environment" is not local and is not updated for new inheritance information currently; 
[where=<environment: 0x56483693e150>, where2=<environment: namespace:Biobase>]
Creating a new generic function for ‘aperm’ in package ‘DelayedArray’
From .checkSubclasses(): subclass "ScalarInteger" of class "integer" is not local and is not updated for new inheritance information currently; 
[where=<environment: 0x564835562fc8>, where2=<environment: namespace:DelayedArray>]
Creating a generic function for ‘sweep’ from package ‘base’ in package ‘DelayedArray’
Creating a new generic function for ‘apply’ in package ‘DelayedArray’
Creating a new generic function for ‘rowsum’ in package ‘DelayedArray’
Creating a generic function for ‘dnorm’ from package ‘stats’ in package ‘DelayedArray’
Creating a generic function for ‘pnorm’ from package ‘stats’ in package ‘DelayedArray’
Creating a generic function for ‘qnorm’ from package ‘stats’ in package ‘DelayedArray’
Creating a generic function for ‘dbinom’ from package ‘stats’ in package ‘DelayedArray’
Creating a generic function for ‘pbinom’ from package ‘stats’ in package ‘DelayedArray’
Creating a generic function for ‘qbinom’ from package ‘stats’ in package ‘DelayedArray’
Creating a generic function for ‘dpois’ from package ‘stats’ in package ‘DelayedArray’
Creating a generic function for ‘ppois’ from package ‘stats’ in package ‘DelayedArray’
Creating a generic function for ‘qpois’ from package ‘stats’ in package ‘DelayedArray’
Creating a generic function for ‘dlogis’ from package ‘stats’ in package ‘DelayedArray’
Creating a generic function for ‘plogis’ from package ‘stats’ in package ‘DelayedArray’
Creating a generic function for ‘qlogis’ from package ‘stats’ in package ‘DelayedArray’
Creating a new generic function for ‘rowMaxs’ in package ‘DelayedArray’
Creating a new generic function for ‘colMaxs’ in package ‘DelayedArray’
Creating a new generic function for ‘rowMins’ in package ‘DelayedArray’
Creating a new generic function for ‘colMins’ in package ‘DelayedArray’
Creating a new generic function for ‘rowRanges’ in package ‘DelayedArray’
Creating a new generic function for ‘colRanges’ in package ‘DelayedArray’
Creating a generic function for ‘offset’ from package ‘stats’ in package ‘rtracklayer’
Creating a generic function from function ‘uri’ in package ‘rtracklayer’
Creating a generic function for ‘diag’ from package ‘base’ in package ‘spam’
Creating a generic function for ‘diag<-’ from package ‘base’ in package ‘spam’
Error in setOldClass(c("dist", "numeric")) : 
  inconsistent old-style class information for “dist”; the class is defined but does not extend “numeric” and is not valid as the data part
Error: unable to load R code in package ‘spam’
Execution halted
ERROR: lazy loading failed for package ‘seqplots’
* removing ‘/home/rstudio/DBI/revdep/checks/seqplots/new/seqplots.Rcheck/seqplots’

```
### CRAN

```
* installing *source* package ‘seqplots’ ...
** using staged installation
** R
** inst
** byte-compile and prepare package for lazy loading
in method for ‘normalizeSingleBracketReplacementValue’ with signature ‘"List"’: no definition for class “List”
Creating a generic function for ‘complete.cases’ from package ‘stats’ in package ‘S4Vectors’
Creating a new generic function for ‘expand.grid’ in package ‘S4Vectors’
Creating a generic function for ‘%in%’ from package ‘base’ in package ‘S4Vectors’
Creating a new generic function for ‘findMatches’ in package ‘S4Vectors’
Creating a generic function for ‘setequal’ from package ‘base’ in package ‘S4Vectors’
Creating a generic function for ‘as.factor’ from package ‘base’ in package ‘S4Vectors’
Creating a generic function for ‘tabulate’ from package ‘base’ in package ‘S4Vectors’
Creating a generic function for ‘cov’ from package ‘stats’ in package ‘S4Vectors’
Creating a generic function for ‘cor’ from package ‘stats’ in package ‘S4Vectors’
Creating a generic function for ‘smoothEnds’ from package ‘stats’ in package ‘S4Vectors’
Creating a generic function for ‘runmed’ from package ‘stats’ in package ‘S4Vectors’
Creating a generic function for ‘nchar’ from package ‘base’ in package ‘S4Vectors’
Creating a generic function for ‘substr’ from package ‘base’ in package ‘S4Vectors’
Creating a generic function for ‘substring’ from package ‘base’ in package ‘S4Vectors’
Creating a generic function for ‘chartr’ from package ‘base’ in package ‘S4Vectors’
Creating a generic function for ‘tolower’ from package ‘base’ in package ‘S4Vectors’
Creating a generic function for ‘toupper’ from package ‘base’ in package ‘S4Vectors’
Creating a generic function for ‘sub’ from package ‘base’ in package ‘S4Vectors’
Creating a generic function for ‘gsub’ from package ‘base’ in package ‘S4Vectors’
in method for ‘coerce’ with signature ‘"data.table","DataFrame"’: no definition for class “data.table”
Creating a generic function for ‘drop’ from package ‘base’ in package ‘IRanges’
Creating a generic function for ‘runmed’ from package ‘stats’ in package ‘IRanges’
Creating a generic function for ‘chartr’ from package ‘base’ in package ‘IRanges’
Creating a generic function for ‘toupper’ from package ‘base’ in package ‘IRanges’
Creating a generic function for ‘tolower’ from package ‘base’ in package ‘IRanges’
Creating a generic function for ‘sub’ from package ‘base’ in package ‘IRanges’
Creating a generic function for ‘gsub’ from package ‘base’ in package ‘IRanges’
Creating a generic function for ‘smoothEnds’ from package ‘stats’ in package ‘IRanges’
in method for ‘twoWayAlphabetFrequencyByQuality’ with signature ‘"QualityScaledXStringSet"’: no definition for class “QualityScaledXStringSet”
Creating a new generic function for ‘strsplit’ in package ‘Biostrings’
Creating a generic function for ‘ls’ from package ‘base’ in package ‘Biostrings’
Creating a new generic function for ‘offset’ in package ‘Biostrings’
From .checkSubclasses(): subclass "RsamtoolsFile" of class "environment" is not local and is not updated for new inheritance information currently; 
[where=<environment: 0x55828075a6b0>, where2=<environment: namespace:Biobase>]
From .checkSubclasses(): subclass "BamFile" of class "environment" is not local and is not updated for new inheritance information currently; 
[where=<environment: 0x55828075a6b0>, where2=<environment: namespace:Biobase>]
From .checkSubclasses(): subclass "BcfFile" of class "environment" is not local and is not updated for new inheritance information currently; 
[where=<environment: 0x55828075a6b0>, where2=<environment: namespace:Biobase>]
From .checkSubclasses(): subclass "TabixFile" of class "environment" is not local and is not updated for new inheritance information currently; 
[where=<environment: 0x55828075a6b0>, where2=<environment: namespace:Biobase>]
From .checkSubclasses(): subclass "FaFile" of class "environment" is not local and is not updated for new inheritance information currently; 
[where=<environment: 0x55828075a6b0>, where2=<environment: namespace:Biobase>]
From .checkSubclasses(): subclass "BamSampler" of class "environment" is not local and is not updated for new inheritance information currently; 
[where=<environment: 0x55828075a6b0>, where2=<environment: namespace:Biobase>]
Creating a new generic function for ‘aperm’ in package ‘DelayedArray’
From .checkSubclasses(): subclass "ScalarInteger" of class "integer" is not local and is not updated for new inheritance information currently; 
[where=<environment: 0x5582878ac5f8>, where2=<environment: namespace:DelayedArray>]
Creating a generic function for ‘sweep’ from package ‘base’ in package ‘DelayedArray’
Creating a new generic function for ‘apply’ in package ‘DelayedArray’
Creating a new generic function for ‘rowsum’ in package ‘DelayedArray’
Creating a generic function for ‘dnorm’ from package ‘stats’ in package ‘DelayedArray’
Creating a generic function for ‘pnorm’ from package ‘stats’ in package ‘DelayedArray’
Creating a generic function for ‘qnorm’ from package ‘stats’ in package ‘DelayedArray’
Creating a generic function for ‘dbinom’ from package ‘stats’ in package ‘DelayedArray’
Creating a generic function for ‘pbinom’ from package ‘stats’ in package ‘DelayedArray’
Creating a generic function for ‘qbinom’ from package ‘stats’ in package ‘DelayedArray’
Creating a generic function for ‘dpois’ from package ‘stats’ in package ‘DelayedArray’
Creating a generic function for ‘ppois’ from package ‘stats’ in package ‘DelayedArray’
Creating a generic function for ‘qpois’ from package ‘stats’ in package ‘DelayedArray’
Creating a generic function for ‘dlogis’ from package ‘stats’ in package ‘DelayedArray’
Creating a generic function for ‘plogis’ from package ‘stats’ in package ‘DelayedArray’
Creating a generic function for ‘qlogis’ from package ‘stats’ in package ‘DelayedArray’
Creating a new generic function for ‘rowMaxs’ in package ‘DelayedArray’
Creating a new generic function for ‘colMaxs’ in package ‘DelayedArray’
Creating a new generic function for ‘rowMins’ in package ‘DelayedArray’
Creating a new generic function for ‘colMins’ in package ‘DelayedArray’
Creating a new generic function for ‘rowRanges’ in package ‘DelayedArray’
Creating a new generic function for ‘colRanges’ in package ‘DelayedArray’
Creating a generic function for ‘offset’ from package ‘stats’ in package ‘rtracklayer’
Creating a generic function from function ‘uri’ in package ‘rtracklayer’
Creating a generic function for ‘diag’ from package ‘base’ in package ‘spam’
Creating a generic function for ‘diag<-’ from package ‘base’ in package ‘spam’
Error in setOldClass(c("dist", "numeric")) : 
  inconsistent old-style class information for “dist”; the class is defined but does not extend “numeric” and is not valid as the data part
Error: unable to load R code in package ‘spam’
Execution halted
ERROR: lazy loading failed for package ‘seqplots’
* removing ‘/home/rstudio/DBI/revdep/checks/seqplots/old/seqplots.Rcheck/seqplots’

```
# trena

<details>

* Version: 
* Source code: ???
* URL: http://r-dbi.github.io/DBI
* BugReports: https://github.com/r-dbi/DBI/issues
* Number of recursive dependencies: 0

Run `revdep_details(,"")` for more info

</details>

## Error before installation

### Devel

```






```
### CRAN

```






```
