# Genominator

<details>

* Version: 1.38.0
* Source code: https://github.com/cran/Genominator
* Date/Publication: 2019-05-02
* Number of recursive dependencies: 68

Run `revdep_details(,"Genominator")` for more info

</details>

## Newly broken

*   checking installed package size ... NOTE
    ```
      installed size is  5.2Mb
      sub-directories of 1Mb or more:
        R   1.2Mb
    ```

## In both

*   checking whether the namespace can be loaded with stated dependencies ... WARNING
    ```
    ...
      could not find function "setClass"
    Warning: namespace ‘GenomeGraphs’ is not available and has been replaced
    by .GlobalEnv when processing object ‘’
    Error in setClass("DisplayPars", representation(pars = "environment")) : 
      could not find function "setClass"
    Warning: namespace ‘GenomeGraphs’ is not available and has been replaced
    by .GlobalEnv when processing object ‘’
    Error in setClass("DisplayPars", representation(pars = "environment")) : 
      could not find function "setClass"
    Warning: namespace ‘GenomeGraphs’ is not available and has been replaced
    by .GlobalEnv when processing object ‘’
    Error in setClass("DisplayPars", representation(pars = "environment")) : 
      could not find function "setClass"
    Warning: namespace ‘GenomeGraphs’ is not available and has been replaced
    by .GlobalEnv when processing object ‘’
    
    A namespace must be able to be loaded with just the base namespace
    loaded: otherwise if the namespace gets loaded by a saved object, the
    session will be unable to start.
    
    Probably some imports need to be declared in the NAMESPACE file.
    ```

*   checking dependencies in R code ... NOTE
    ```
    'library' or 'require' calls to packages already attached by Depends:
      ‘GenomeGraphs’ ‘IRanges’
      Please remove these calls from your code.
    'library' or 'require' call to ‘ShortRead’ in package code.
      Please use :: or requireNamespace() instead.
      See section 'Suggested packages' in the 'Writing R Extensions' manual.
    Packages in Depends field not imported from:
      ‘GenomeGraphs’ ‘RSQLite’
      These packages need to be imported from (in the NAMESPACE file)
      for when this namespace is loaded but not attached.
    ```

*   checking S3 generic/method consistency ... NOTE
    ```
    Found the following apparent S3 methods exported but not registered:
      plot.genominator.coverage plot.genominator.goodness.of.fit
    See section ‘Registering S3 methods’ in the ‘Writing R Extensions’
    manual.
    ```

*   checking R code for possible problems ... NOTE
    ```
    ...
      (/home/rstudio/DBI/revdep/checks/Genominator/new/Genominator.Rcheck/00_pkg_src/Genominator/R/goodnessOfFit.R:81)
    plot.genominator.goodness.of.fit : <anonymous>: no visible global
      function definition for ‘ppoints’
      (/home/rstudio/DBI/revdep/checks/Genominator/new/Genominator.Rcheck/00_pkg_src/Genominator/R/goodnessOfFit.R:81)
    plot.genominator.goodness.of.fit : <anonymous>: no visible global
      function definition for ‘qunif’
      (/home/rstudio/DBI/revdep/checks/Genominator/new/Genominator.Rcheck/00_pkg_src/Genominator/R/goodnessOfFit.R:84)
    plot.genominator.goodness.of.fit : <anonymous>: no visible global
      function definition for ‘ppoints’
      (/home/rstudio/DBI/revdep/checks/Genominator/new/Genominator.Rcheck/00_pkg_src/Genominator/R/goodnessOfFit.R:84)
    plot.genominator.goodness.of.fit : <anonymous>: no visible global
      function definition for ‘qqplot’
      (/home/rstudio/DBI/revdep/checks/Genominator/new/Genominator.Rcheck/00_pkg_src/Genominator/R/goodnessOfFit.R:86)
    Undefined global functions or variables:
      alignData AlignedDataFrame chromosome DisplayPars gdPlot
      geneRegionBiomart makeAnnotationTrack makeBaseTrack makeGenericArray
      makeGenomeAxis mkAllStrings pData position ppoints qchisq qqplot
      qunif readAligned sread subseq tables varLabels varMetadata
    Consider adding
      importFrom("stats", "ppoints", "qchisq", "qqplot", "qunif")
    to your NAMESPACE file.
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

# ipumsr

<details>

* Version: 0.4.2
* Source code: https://github.com/cran/ipumsr
* URL: https://www.ipums.org, https://github.com/mnpopcenter/ipumsr
* BugReports: https://github.com/mnpopcenter/ipumsr/issues
* Date/Publication: 2019-06-04 17:00:03 UTC
* Number of recursive dependencies: 98

Run `revdep_details(,"ipumsr")` for more info

</details>

## Newly broken

*   checking R code for possible problems ... NOTE
    ```
    Error: .onLoad failed in loadNamespace() for 'utils', details:
      call: system(paste(which, shQuote(names[i])), intern = TRUE, ignore.stderr = TRUE)
      error: cannot popen '/usr/bin/which 'uname' 2>/dev/null', probable reason 'Cannot allocate memory'
    Execution halted
    Warning: system call failed: Cannot allocate memory
    ```

# mogene20stprobeset.db

<details>

* Version: 8.7.0
* Source code: https://github.com/cran/mogene20stprobeset.db
* Number of recursive dependencies: 32

Run `revdep_details(,"mogene20stprobeset.db")` for more info

</details>

## Newly broken

*   checking examples ... ERROR
    ```
    ...
    +     got[[1]][["GOID"]]
    +     got[[1]][["Ontology"]]
    +     got[[1]][["Evidence"]]
    + }
    [1] "IBA"
    > # For the reverse map:
    > # Convert to a list
    > xx <- as.list(mogene20stprobesetGO2PROBE)
    > if(length(xx) > 0){
    +     # Gets the manufacturer ids for the top 2nd and 3nd GO identifiers
    +     goids <- xx[2:3]
    +     # Gets the manufacturer ids for the first element of goids
    +     goids[[1]]
    +     # Evidence code for the mappings
    +     names(goids[[1]])
    + }
     [1] "IBA" "IBA" "IBA" "IBA" "IBA" "IBA" "IBA" "IBA" "IBA" "IBA" "IBA" "IBA"
    [13] "IBA" "IBA" "IBA" "IBA" "IBA" "IBA" "IBA"
    > # Convert mogene20stprobesetGO2ALLPROBES to a list
    > xx <- as.list(mogene20stprobesetGO2ALLPROBES)
    Killed
    ```

## In both

*   checking installed package size ... NOTE
    ```
      installed size is 78.2Mb
      sub-directories of 1Mb or more:
        extdata  78.0Mb
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
    Package in Depends field not imported from: ‘org.Mm.eg.db’
      These packages need to be imported from (in the NAMESPACE file)
      for when this namespace is loaded but not attached.
    Unexported objects imported by ':::' calls:
      ‘AnnotationDbi:::annoStartupMessages’ ‘AnnotationDbi:::dbObjectName’
      See the note in ?`:::` about the use of this operator.
    ```

*   checking R code for possible problems ... NOTE
    ```
    File ‘mogene20stprobeset.db/R/zzz.R’:
      .onLoad calls:
        packageStartupMessage(AnnotationDbi:::annoStartupMessages("mogene20stprobeset.db"))
    
    See section ‘Good practice’ in '?.onAttach'.
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
# PartheenMetaData.db

<details>

* Version: 3.2.3
* Source code: https://github.com/cran/PartheenMetaData.db
* Number of recursive dependencies: 32

Run `revdep_details(,"PartheenMetaData.db")` for more info

</details>

## Newly broken

*   checking examples ... ERROR
    ```
    ...
    +     got[[1]][["Ontology"]]
    +     got[[1]][["Evidence"]]
    + }
    [1] "TAS"
    > # For the reverse map:
    > # Convert to a list
    > xx <- as.list(PartheenMetaDataGO2PROBE)
    > if(length(xx) > 0){
    +     # Gets the manufacturer ids for the top 2nd and 3nd GO identifiers
    +     goids <- xx[2:3]
    +     # Gets the manufacturer ids for the first element of goids
    +     goids[[1]]
    +     # Evidence code for the mappings
    +     names(goids[[1]])
    + }
    [1] "IEP" "IEP" "IEP"
    > # Convert PartheenMetaDataGO2ALLPROBES to a list
    > xx <- as.list(PartheenMetaDataGO2ALLPROBES)
    Error: memory exhausted (limit reached?)
    Execution halted
    Warning: system call failed: Cannot allocate memory
    ```

## In both

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
    ```

*   checking R code for possible problems ... NOTE
    ```
    File ‘PartheenMetaData.db/R/zzz.R’:
      .onLoad calls:
        packageStartupMessage(AnnotationDbi:::annoStartupMessages("PartheenMetaData.db"))
    
    See section ‘Good practice’ in '?.onAttach'.
    ```

# ragene10stprobeset.db

<details>

* Version: 8.7.0
* Source code: https://github.com/cran/ragene10stprobeset.db
* Number of recursive dependencies: 32

Run `revdep_details(,"ragene10stprobeset.db")` for more info

</details>

## Newly broken

*   checking tests ...
    ```
     ERROR
    Running the tests in ‘tests/runalltests.R’ failed.
    Complete output:
      Error: .onLoad failed in loadNamespace() for 'utils', details:
        call: system(paste(which, shQuote(names[i])), intern = TRUE, ignore.stderr = TRUE)
        error: cannot popen '/usr/bin/which 'uname' 2>/dev/null', probable reason 'Cannot allocate memory'
      Execution halted
      Warning message:
      system call failed: Cannot allocate memory 
    ```

## In both

*   checking examples ... ERROR
    ```
    ...
    > ### Keywords: datasets
    > 
    > ### ** Examples
    > 
    > ## select() interface:
    > ## Objects in this package can be accessed using the select() interface
    > ## from the AnnotationDbi package. See ?select for details.
    > 
    > ## Bimap interface:
    > x <- ragene10stprobesetGO
    > # Get the manufacturer identifiers that are mapped to a GO ID
    > mapped_genes <- mappedkeys(x)
    > # Convert to a list
    > xx <- as.list(x[mapped_genes])
    Error: out of memory
    Execution halted
    Error in dyn.load(file, DLLpath = DLLpath, ...) : 
      unable to load shared object '/usr/local/lib/R/library/tools/libs/tools.so':
      /usr/local/lib/R/library/tools/libs/tools.so: failed to map segment from shared object
    Calls: <Anonymous> ... getNamespace -> loadNamespace -> library.dynam -> dyn.load
    Warning: system call failed: Cannot allocate memory
    ```

*   checking installed package size ... NOTE
    ```
      installed size is 48.0Mb
      sub-directories of 1Mb or more:
        extdata  47.9Mb
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
    Package in Depends field not imported from: ‘org.Rn.eg.db’
      These packages need to be imported from (in the NAMESPACE file)
      for when this namespace is loaded but not attached.
    Unexported objects imported by ':::' calls:
      ‘AnnotationDbi:::annoStartupMessages’ ‘AnnotationDbi:::dbObjectName’
      See the note in ?`:::` about the use of this operator.
    ```

*   checking R code for possible problems ... NOTE
    ```
    File ‘ragene10stprobeset.db/R/zzz.R’:
      .onLoad calls:
        packageStartupMessage(AnnotationDbi:::annoStartupMessages("ragene10stprobeset.db"))
    
    See section ‘Good practice’ in '?.onAttach'.
    ```

# ragene11stprobeset.db

<details>

* Version: 8.7.0
* Source code: https://github.com/cran/ragene11stprobeset.db
* Number of recursive dependencies: 32

Run `revdep_details(,"ragene11stprobeset.db")` for more info

</details>

## Newly broken

*   checking examples ... ERROR
    ```
    ...
    > ### Keywords: datasets
    > 
    > ### ** Examples
    > 
    > ## select() interface:
    > ## Objects in this package can be accessed using the select() interface
    > ## from the AnnotationDbi package. See ?select for details.
    > 
    > ## Bimap interface:
    > x <- ragene11stprobesetGO
    > # Get the manufacturer identifiers that are mapped to a GO ID
    > mapped_genes <- mappedkeys(x)
    > # Convert to a list
    > xx <- as.list(x[mapped_genes])
    Error: cannot allocate vector of size 18.3 Mb
    Execution halted
    Error in dyn.load(file, DLLpath = DLLpath, ...) : 
      unable to load shared object '/usr/local/lib/R/library/tools/libs/tools.so':
      /usr/local/lib/R/library/tools/libs/tools.so: failed to map segment from shared object
    Calls: <Anonymous> ... getNamespace -> loadNamespace -> library.dynam -> dyn.load
    Warning: system call failed: Cannot allocate memory
    ```

*   checking installed package size ... NOTE
    ```
      installed size is 48.0Mb
      sub-directories of 1Mb or more:
        extdata  47.9Mb
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
    Package in Depends field not imported from: ‘org.Rn.eg.db’
      These packages need to be imported from (in the NAMESPACE file)
      for when this namespace is loaded but not attached.
    Unexported objects imported by ':::' calls:
      ‘AnnotationDbi:::annoStartupMessages’ ‘AnnotationDbi:::dbObjectName’
      See the note in ?`:::` about the use of this operator.
    ```

*   checking R code for possible problems ... NOTE
    ```
    File ‘ragene11stprobeset.db/R/zzz.R’:
      .onLoad calls:
        packageStartupMessage(AnnotationDbi:::annoStartupMessages("ragene11stprobeset.db"))
    
    See section ‘Good practice’ in '?.onAttach'.
    ```

## Newly fixed

*   checking whether package ‘ragene11stprobeset.db’ can be installed ... ERROR
    ```
    Installation failed.
    See ‘/home/rstudio/DBI/revdep/checks/ragene11stprobeset.db/old/ragene11stprobeset.db.Rcheck/00install.out’ for details.
    ```

# ragene20stprobeset.db

<details>

* Version: 8.7.0
* Source code: https://github.com/cran/ragene20stprobeset.db
* Number of recursive dependencies: 32

Run `revdep_details(,"ragene20stprobeset.db")` for more info

</details>

## Newly broken

*   checking Rd contents ... WARNING
    ```
    Warning: system call failed: Cannot allocate memory
    ```

*   checking Rd \usage sections ... NOTE
    ```
    Warning: system call failed: Cannot allocate memory
    The \usage entries for S3 methods should use the \method markup and not
    their full name.
    See chapter ‘Writing R documentation files’ in the ‘Writing R
    Extensions’ manual.
    ```

## Newly fixed

*   checking tests ...
    ```
     ERROR
    Running the tests in ‘tests/runalltests.R’ failed.
    Last 13 lines of output:
      
       *** caught segfault ***
      address (nil), cause 'memory not mapped'
      
      Traceback:
       1: readRDS(mapfile)
       2: ..lazyLoad(basedb, baseenv())
       3: NULL
      An irrecoverable exception occurred. R is aborting now ...
      
       *** caught segfault ***
      address 0x7f1d67c05010, cause 'memory not mapped'
      Error: cannot allocate vector of size 0 Kb
      Segmentation fault (core dumped)
    ```

## In both

*   checking examples ... ERROR
    ```
    ...
    Type 'q()' to quit R.
    
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
    > pkgname <- "ragene20stprobeset.db"
    > source(file.path(R.home("share"), "R", "examples-header.R"))
    Error: .onLoad failed in loadNamespace() for 'utils', details:
      call: system(paste(which, shQuote(names[i])), intern = TRUE, ignore.stderr = TRUE)
      error: cannot popen '/usr/bin/which 'uname' 2>/dev/null', probable reason 'Cannot allocate memory'
    Execution halted
    Warning message:
    system call failed: Cannot allocate memory 
    ```

*   checking installed package size ... NOTE
    ```
      installed size is 46.7Mb
      sub-directories of 1Mb or more:
        extdata  46.6Mb
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
    Package in Depends field not imported from: ‘org.Rn.eg.db’
      These packages need to be imported from (in the NAMESPACE file)
      for when this namespace is loaded but not attached.
    Unexported objects imported by ':::' calls:
      ‘AnnotationDbi:::annoStartupMessages’ ‘AnnotationDbi:::dbObjectName’
      See the note in ?`:::` about the use of this operator.
    ```

*   checking R code for possible problems ... NOTE
    ```
    File ‘ragene20stprobeset.db/R/zzz.R’:
      .onLoad calls:
        packageStartupMessage(AnnotationDbi:::annoStartupMessages("ragene20stprobeset.db"))
    
    See section ‘Good practice’ in '?.onAttach'.
    ```

# rat2302.db

<details>

* Version: 3.2.3
* Source code: https://github.com/cran/rat2302.db
* Number of recursive dependencies: 32

Run `revdep_details(,"rat2302.db")` for more info

</details>

## Newly broken

*   checking examples ... ERROR
    ```
    ...
    > # For the reverse map:
    > # Convert to a list
    > xx <- as.list(rat2302GO2PROBE)
    > if(length(xx) > 0){
    +     # Gets the manufacturer ids for the top 2nd and 3nd GO identifiers
    +     goids <- xx[2:3]
    +     # Gets the manufacturer ids for the first element of goids
    +     goids[[1]]
    +     # Evidence code for the mappings
    +     names(goids[[1]])
    + }
    [1] "ISO" "ISS" "IBA" "ISO" "ISS" "IBA" "IBA" "ISO" "ISS"
    > # Convert rat2302GO2ALLPROBES to a list
    > xx <- as.list(rat2302GO2ALLPROBES)
    Error: cannot allocate vector of size 64.0 Mb
    Execution halted
    Error in dyn.load(file, DLLpath = DLLpath, ...) : 
      unable to load shared object '/usr/local/lib/R/library/tools/libs/tools.so':
      /usr/local/lib/R/library/tools/libs/tools.so: failed to map segment from shared object
    Calls: <Anonymous> ... getNamespace -> loadNamespace -> library.dynam -> dyn.load
    Warning: system call failed: Cannot allocate memory
    ```

## In both

*   checking DESCRIPTION meta-information ... NOTE
    ```
    Malformed Description field: should contain one or more complete sentences.
    Packages listed in more than one of Depends, Imports, Suggests, Enhances:
      ‘methods’ ‘AnnotationDbi’
    A package should be listed in only one of these fields.
    ```

*   checking dependencies in R code ... NOTE
    ```
    Package in Depends field not imported from: ‘org.Rn.eg.db’
      These packages need to be imported from (in the NAMESPACE file)
      for when this namespace is loaded but not attached.
    ```

*   checking R code for possible problems ... NOTE
    ```
    File ‘rat2302.db/R/zzz.R’:
      .onLoad calls:
        packageStartupMessage(AnnotationDbi:::annoStartupMessages("rat2302.db"))
    
    See section ‘Good practice’ in '?.onAttach'.
    ```

# restfulSE

<details>

* Version: 1.6.1
* Source code: https://github.com/cran/restfulSE
* Date/Publication: 2019-08-19
* Number of recursive dependencies: 105

Run `revdep_details(,"restfulSE")` for more info

</details>

## Newly broken

*   checking foreign function calls ... NOTE
    ```
    Error: package ‘S4Vectors’ could not be loaded
    Call sequence:
    7: stop(gettextf("package %s could not be loaded", sQuote(pkg)), 
           call. = FALSE, domain = NA)
    6: .getRequiredPackages2(pkgInfo, quietly = quietly)
    5: library(pkg, character.only = TRUE, logical.return = TRUE, lib.loc = lib.loc, 
           quietly = quietly)
    4: .getRequiredPackages2(pkgInfo, quietly = quietly)
    3: library(pkg, character.only = TRUE, logical.return = TRUE, lib.loc = lib.loc, 
           quietly = quietly)
    2: .getRequiredPackages2(pkgInfo, quietly = quietly)
    1: library(package, lib.loc = lib.loc, character.only = TRUE, verbose = FALSE)
    Execution halted
    Warning: system call failed: Cannot allocate memory
    See chapter ‘System and foreign language interfaces’ in the ‘Writing R
    Extensions’ manual.
    ```

## Newly fixed

*   checking for missing documentation entries ... ERROR
    ```
    ...
    Error: package or namespace load failed for ‘stats’:
     .onLoad failed in loadNamespace() for 'utils', details:
      call: system(paste(which, shQuote(names[i])), intern = TRUE, ignore.stderr = TRUE)
      error: cannot popen '/usr/bin/which 'uname' 2>/dev/null', probable reason 'Cannot allocate memory'
    During startup - Warning messages:
    1: package ‘utils’ in options("defaultPackages") was not found 
    2: package ‘stats’ in options("defaultPackages") was not found 
    Error: package ‘stats4’ could not be loaded
    Call sequence:
    7: stop(gettextf("package %s could not be loaded", sQuote(pkg)), 
           call. = FALSE, domain = NA)
    6: .getRequiredPackages2(pkgInfo, quietly = quietly)
    5: library(pkg, character.only = TRUE, logical.return = TRUE, lib.loc = lib.loc, 
           quietly = quietly)
    4: .getRequiredPackages2(pkgInfo, quietly = quietly)
    3: library(pkg, character.only = TRUE, logical.return = TRUE, lib.loc = lib.loc, 
           quietly = quietly)
    2: .getRequiredPackages2(pkgInfo, quietly = quietly)
    1: library(package, lib.loc = lib.loc, character.only = TRUE, verbose = FALSE)
    Execution halted
    Warning: system call failed: Cannot allocate memory
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

*   checking Rd cross-references ... WARNING
    ```
    Warning: system call failed: Cannot allocate memory
    ```

*   checking for code/documentation mismatches ... WARNING
    ```
    ...
    Error: package or namespace load failed for ‘stats’:
     .onLoad failed in loadNamespace() for 'utils', details:
      call: system(paste(which, shQuote(names[i])), intern = TRUE, ignore.stderr = TRUE)
      error: cannot popen '/usr/bin/which 'uname' 2>/dev/null', probable reason 'Cannot allocate memory'
    During startup - Warning messages:
    1: package ‘utils’ in options("defaultPackages") was not found 
    2: package ‘stats’ in options("defaultPackages") was not found 
    Error: package ‘stats4’ could not be loaded
    Call sequence:
    7: stop(gettextf("package %s could not be loaded", sQuote(pkg)), 
           call. = FALSE, domain = NA)
    6: .getRequiredPackages2(pkgInfo, quietly = quietly)
    5: library(pkg, character.only = TRUE, logical.return = TRUE, lib.loc = lib.loc, 
           quietly = quietly)
    4: .getRequiredPackages2(pkgInfo, quietly = quietly)
    3: library(pkg, character.only = TRUE, logical.return = TRUE, lib.loc = lib.loc, 
           quietly = quietly)
    2: .getRequiredPackages2(pkgInfo, quietly = quietly)
    1: library(package, lib.loc = lib.loc, character.only = TRUE, verbose = FALSE)
    Execution halted
    Warning: system call failed: Cannot allocate memory
    ```

*   checking R code for possible problems ... NOTE
    ```
    Error in dyn.load(file, DLLpath = DLLpath, ...) : 
      unable to load shared object '/home/rstudio/DBI/revdep/library/restfulSE/bitops/libs/bitops.so':
      /home/rstudio/DBI/revdep/library/restfulSE/bitops/libs/bitops.so: failed to map segment from shared object
    Calls: <Anonymous>
    Execution halted
    Warning: system call failed: Cannot allocate memory
    ```

# rnaSeqMap

<details>

* Version: 2.42.0
* Source code: https://github.com/cran/rnaSeqMap
* Date/Publication: 2019-05-02
* Number of recursive dependencies: 59

Run `revdep_details(,"rnaSeqMap")` for more info

</details>

## Newly broken

*   checking Rd \usage sections ... WARNING
    ```
    ...
    During startup - Warning messages:
    1: package ‘utils’ in options("defaultPackages") was not found 
    2: package ‘stats’ in options("defaultPackages") was not found 
    Error: package ‘utils’ could not be loaded
    Call sequence:
    7: stop(gettextf("package %s could not be loaded", sQuote(pkg)), 
           call. = FALSE, domain = NA)
    6: .getRequiredPackages2(pkgInfo, quietly = quietly)
    5: library(pkg, character.only = TRUE, logical.return = TRUE, lib.loc = lib.loc, 
           quietly = quietly)
    4: .getRequiredPackages2(pkgInfo, quietly = quietly)
    3: library(pkg, character.only = TRUE, logical.return = TRUE, lib.loc = lib.loc, 
           quietly = quietly)
    2: .getRequiredPackages2(pkgInfo, quietly = quietly)
    1: library(package, lib.loc = lib.loc, character.only = TRUE, verbose = FALSE)
    Execution halted
    Warning: system call failed: Cannot allocate memory
    The \usage entries for S3 methods should use the \method markup and not
    their full name.
    See chapter ‘Writing R documentation files’ in the ‘Writing R
    Extensions’ manual.
    ```

*   checking Rd contents ... WARNING
    ```
    Warning: system call failed: Cannot allocate memory
    ```

*   checking for unstated dependencies in examples ... WARNING
    ```
    Warning: system call failed: Cannot allocate memory
    ```

## Newly fixed

*   checking for missing documentation entries ... WARNING
    ```
    Warning: system call failed: Cannot allocate memory
    All user-level objects in a package should have documentation entries.
    See chapter ‘Writing R documentation files’ in the ‘Writing R
    Extensions’ manual.
    ```

## In both

*   checking whether the namespace can be loaded with stated dependencies ... WARNING
    ```
    Error in setClass("rowROC", representation(data = "matrix", ranks = "matrix",  : 
      could not find function "setClass"
    Error: unable to load R code in package ‘genefilter’
    Execution halted
    
    A namespace must be able to be loaded with just the base namespace
    loaded: otherwise if the namespace gets loaded by a saved object, the
    session will be unable to start.
    
    Probably some imports need to be declared in the NAMESPACE file.
    ```

*   checking for code/documentation mismatches ... WARNING
    ```
    Error in FUN(X[[i]], ...) : 
      could not allocate memory (0 Mb) in C function 'R_AllocStringBuffer'
    Calls: <Anonymous> -> .load_package_quietly -> .try_quietly
    Execution halted
    Warning: system call failed: Cannot allocate memory
    ```

*   checking DESCRIPTION meta-information ... NOTE
    ```
    Malformed Description field: should contain one or more complete sentences.
    ```

*   checking dependencies in R code ... NOTE
    ```
    Namespace in Imports field not imported from: ‘DBI’
      All declared Imports should be used.
    There are ::: calls to the package's namespace in its code. A package
      almost never needs to use ::: for its own objects:
      ‘.chr.convert’ ‘.countz’ ‘.munion’ ‘.tunion’ ‘.wytnij’ ‘getBamData’
      ‘newSeqReads’
    ```

*   checking R code for possible problems ... NOTE
    ```
    Error in setClass("rowROC", representation(data = "matrix", ranks = "matrix",  : 
      could not find function "setClass"
    Error: unable to load R code in package ‘genefilter’
    Execution halted
    ```

# RSQLite

<details>

* Version: 2.1.2
* Source code: https://github.com/cran/RSQLite
* URL: https://github.com/r-dbi/RSQLite
* BugReports: https://github.com/r-dbi/RSQLite/issues
* Date/Publication: 2019-07-24 10:20:02 UTC
* Number of recursive dependencies: 43

Run `revdep_details(,"RSQLite")` for more info

</details>

## Newly broken

*   checking tests ...
    ```
     ERROR
    Running the tests in ‘tests/testthat.R’ failed.
    Last 13 lines of output:
             use.names = use.names, ...)
      9: all.equal.list(target, current, ...)
      10: all.equal(target[[i]], current[[i]], check.attributes = check.attributes, use.names = use.names, 
             ...)
      11: all.equal.raw(target[[i]], current[[i]], check.attributes = check.attributes, use.names = use.names, 
             ...)
      
      ══ testthat results  ═══════════════════════════════════════════════════════════
      [ OK: 554 | SKIPPED: 4 | WARNINGS: 3 | FAILED: 1 ]
      1. Error: adding large blob to table survives valgrind check (#192) (@test-blob.R#15) 
      
      Error: testthat unit tests failed
      In addition: Warning message:
      call dbDisconnect() when finished working with a connection 
      Execution halted
    ```

## In both

*   checking installed package size ... NOTE
    ```
      installed size is 11.3Mb
      sub-directories of 1Mb or more:
        libs  10.4Mb
    ```

*   checking dependencies in R code ... NOTE
    ```
    Namespace in Imports field not imported from: ‘pkgconfig’
      All declared Imports should be used.
    ```

# rta10probeset.db

<details>

* Version: 8.7.0
* Source code: https://github.com/cran/rta10probeset.db
* Number of recursive dependencies: 32

Run `revdep_details(,"rta10probeset.db")` for more info

</details>

## Newly broken

*   checking tests ...
    ```
     ERROR
    Running the tests in ‘tests/runalltests.R’ failed.
    Last 13 lines of output:
      70: checkTrue(getProbes() > 0, msg = paste(strwrap(msg, exdent = 2),     collapse = "\n"))
      71: eval(exprs[i], envir)
      72: eval(exprs[i], envir)
      73: sys.source(absTestFileName, envir = sandbox)
      74: doTryCatch(return(expr), name, parentenv, handler)
      75: tryCatchOne(expr, names, parentenv, handlers[[1L]])
      76: tryCatchList(expr, classes, parentenv, handlers)
      77: tryCatch(expr, error = function(e) {    call <- conditionCall(e)    if (!is.null(call)) {        if (identical(call[[1L]], quote(doTryCatch)))             call <- sys.call(-4L)        dcall <- deparse(call)[1L]        prefix <- paste("Error in", dcall, ": ")        LONG <- 75L        sm <- strsplit(conditionMessage(e), "\n")[[1L]]        w <- 14L + nchar(dcall, type = "w") + nchar(sm[1L], type = "w")        if (is.na(w))             w <- 14L + nchar(dcall, type = "b") + nchar(sm[1L],                 type = "b")        if (w > LONG)             prefix <- paste0(prefix, "\n  ")    }    else prefix <- "Error : "    msg <- paste0(prefix, conditionMessage(e), "\n")    .Internal(seterrmessage(msg[1L]))    if (!silent && isTRUE(getOption("show.error.messages"))) {        cat(msg, file = outFile)        .Internal(printDeferredWarnings())    }    invisible(structure(msg, class = "try-error", condition = e))})
      78: try(sys.source(absTestFileName, envir = sandbox))
      79: .sourceTestFile(testFile, testSuite$testFuncRegexp)
      80: runTestSuite(allSuite)
      An irrecoverable exception occurred. R is aborting now ...
      Warning in grep("^\\.\\.[0-9]+$", as.character(name)) :
        system call failed: Cannot allocate memory
      Segmentation fault (core dumped)
    ```

## In both

*   checking examples ... ERROR
    ```
    ...
    > ### Keywords: datasets
    > 
    > ### ** Examples
    > 
    > ## select() interface:
    > ## Objects in this package can be accessed using the select() interface
    > ## from the AnnotationDbi package. See ?select for details.
    > 
    > ## Bimap interface:
    > x <- rta10probesetGENENAME
    > # Get the probe identifiers that are mapped to a gene name
    > mapped_probes <- mappedkeys(x)
    > # Convert to a list
    > xx <- as.list(x[mapped_probes])
    Error: out of memory
    Execution halted
    Error in dyn.load(file, DLLpath = DLLpath, ...) : 
      unable to load shared object '/usr/local/lib/R/library/tools/libs/tools.so':
      /usr/local/lib/R/library/tools/libs/tools.so: failed to map segment from shared object
    Calls: <Anonymous> ... getNamespace -> loadNamespace -> library.dynam -> dyn.load
    Warning: system call failed: Cannot allocate memory
    ```

*   checking installed package size ... NOTE
    ```
      installed size is 99.4Mb
      sub-directories of 1Mb or more:
        extdata  99.2Mb
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
    Package in Depends field not imported from: ‘org.Rn.eg.db’
      These packages need to be imported from (in the NAMESPACE file)
      for when this namespace is loaded but not attached.
    Unexported objects imported by ':::' calls:
      ‘AnnotationDbi:::annoStartupMessages’ ‘AnnotationDbi:::dbObjectName’
      See the note in ?`:::` about the use of this operator.
    ```

*   checking R code for possible problems ... NOTE
    ```
    File ‘rta10probeset.db/R/zzz.R’:
      .onLoad calls:
        packageStartupMessage(AnnotationDbi:::annoStartupMessages("rta10probeset.db"))
    
    See section ‘Good practice’ in '?.onAttach'.
    ```

# SEERaBomb

<details>

* Version: 2019.1
* Source code: https://github.com/cran/SEERaBomb
* URL: http://epbi-radivot.cwru.edu/SEERaBomb/SEERaBomb.html
* Date/Publication: 2019-05-07 18:50:03 UTC
* Number of recursive dependencies: 135

Run `revdep_details(,"SEERaBomb")` for more info

</details>

## Newly broken

*   checking R code for possible problems ... ERROR
    ```
    Incorrect (un)loading of package shared object.
    Warning: system call failed: Cannot allocate memory
    The system-specific extension for shared objects must not be added.
    See ?library.dynam.
    
    ```

## Newly fixed

*   checking for missing documentation entries ... ERROR
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
    Error: package ‘dplyr’ could not be loaded
    Call sequence:
    3: stop(gettextf("package %s could not be loaded", sQuote(pkg)), 
           call. = FALSE, domain = NA)
    2: .getRequiredPackages2(pkgInfo, quietly = quietly)
    1: library(package, lib.loc = lib.loc, character.only = TRUE, verbose = FALSE)
    Execution halted
    Warning: system call failed: Cannot allocate memory
    ```

*   checking Rd files ... WARNING
    ```
    Warning: system call failed: Cannot allocate memory
    ```

*   checking Rd metadata ... WARNING
    ```
    Warning: system call failed: Cannot allocate memory
    ```

*   checking Rd cross-references ... WARNING
    ```
    Warning: system call failed: Cannot allocate memory
    ```

*   checking R code for possible problems ... NOTE
    ```
    Error: .onLoad failed in loadNamespace() for 'rgl', details:
      call: system("uname", intern = TRUE)
      error: cannot popen 'uname', probable reason 'Cannot allocate memory'
    Execution halted
    Warning: system call failed: Cannot allocate memory
    ```

## In both

*   checking foreign function calls ... NOTE
    ```
    Error in file(open = "w+", encoding = "UTF-8") : 
      unsupported conversion from 'UTF-8' to ''
    Calls: <Anonymous> -> .load_package_quietly -> .try_quietly
    Execution halted
    Warning: system call failed: Cannot allocate memory
    See chapter ‘System and foreign language interfaces’ in the ‘Writing R
    Extensions’ manual.
    ```

# SHDZ.db

<details>

* Version: 3.2.3
* Source code: https://github.com/cran/SHDZ.db
* Number of recursive dependencies: 32

Run `revdep_details(,"SHDZ.db")` for more info

</details>

## Newly broken

*   checking examples ... ERROR
    ```
    ...
    +     got[[1]][["Ontology"]]
    +     got[[1]][["Evidence"]]
    + }
    [1] "NAS"
    > # For the reverse map:
    > # Convert to a list
    > xx <- as.list(SHDZGO2PROBE)
    > if(length(xx) > 0){
    +     # Gets the manufacturer ids for the top 2nd and 3nd GO identifiers
    +     goids <- xx[2:3]
    +     # Gets the manufacturer ids for the first element of goids
    +     goids[[1]]
    +     # Evidence code for the mappings
    +     names(goids[[1]])
    + }
    [1] "IEP" "IEP" "IEP" "IEP"
    > # Convert SHDZGO2ALLPROBES to a list
    > xx <- as.list(SHDZGO2ALLPROBES)
    Error: memory exhausted (limit reached?)
    Execution halted
    Warning: system call failed: Cannot allocate memory
    ```

## In both

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
    ```

*   checking R code for possible problems ... NOTE
    ```
    File ‘SHDZ.db/R/zzz.R’:
      .onLoad calls:
        packageStartupMessage(AnnotationDbi:::annoStartupMessages("SHDZ.db"))
    
    See section ‘Good practice’ in '?.onAttach'.
    ```

# sqldf

<details>

* Version: 0.4-11
* Source code: https://github.com/cran/sqldf
* URL: https://github.com/ggrothendieck/sqldf, https://groups.google.com/group/sqldf
* BugReports: https://github.com/ggrothendieck/sqldf/issues
* Date/Publication: 2017-06-28 06:43:10 UTC
* Number of recursive dependencies: 30

Run `revdep_details(,"sqldf")` for more info

</details>

## Newly broken

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

*   checking Rd cross-references ... WARNING
    ```
    Warning: system call failed: Cannot allocate memory
    ```

*   checking for missing documentation entries ... WARNING
    ```
    Segmentation fault (core dumped)
    All user-level objects in a package should have documentation entries.
    See chapter ‘Writing R documentation files’ in the ‘Writing R
    Extensions’ manual.
    ```

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
    Error: package ‘proto’ could not be loaded
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

*   checking foreign function calls ... NOTE
    ```
    Error: memory exhausted (limit reached?)
    Execution halted
    Error: cannot allocate vector of size 21 Kb
    Fatal error: error during cleanup
    
    See chapter ‘System and foreign language interfaces’ in the ‘Writing R
    Extensions’ manual.
    ```

*   checking R code for possible problems ... NOTE
    ```
    Found the following possibly unsafe calls:
    Warning: system call failed: Cannot allocate memory
    
    Error: .onLoad failed in loadNamespace() for 'utils', details:
      call: system(paste(which, shQuote(names[i])), intern = TRUE, ignore.stderr = TRUE)
      error: cannot popen '/usr/bin/which 'uname' 2>/dev/null', probable reason 'Cannot allocate memory'
    Execution halted
    Warning: system call failed: Cannot allocate memory
    ```

## In both

*   checking whether package ‘sqldf’ can be installed ... WARNING
    ```
    Found the following significant warnings:
      Warning: no DISPLAY variable so Tk is not available
    See ‘/home/rstudio/DBI/revdep/checks/sqldf/new/sqldf.Rcheck/00install.out’ for details.
    ```

# stream

<details>

* Version: 1.3-1
* Source code: https://github.com/cran/stream
* URL: https://github.com/mhahsler/stream
* BugReports: https://github.com/mhahsler/stream/issues
* Date/Publication: 2019-06-08 04:50:02 UTC
* Number of recursive dependencies: 50

Run `revdep_details(,"stream")` for more info

</details>

## Newly broken

*   checking whether the namespace can be loaded with stated dependencies ... WARNING
    ```
    Error in signature("psi_func") : could not find function "signature"
    Error: unable to load R code in package ‘robustbase’
    Execution halted
    
    A namespace must be able to be loaded with just the base namespace
    loaded: otherwise if the namespace gets loaded by a saved object, the
    session will be unable to start.
    
    Probably some imports need to be declared in the NAMESPACE file.
    ```

*   checking installed package size ... NOTE
    ```
      installed size is 13.6Mb
      sub-directories of 1Mb or more:
        doc    1.6Mb
        libs  11.1Mb
    ```

*   checking R code for possible problems ... NOTE
    ```
    Error in signature("psi_func") : could not find function "signature"
    Error: unable to load R code in package ‘robustbase’
    Execution halted
    ```

## Newly fixed

*   checking whether package ‘stream’ can be installed ... ERROR
    ```
    Installation failed.
    See ‘/home/rstudio/DBI/revdep/checks/stream/old/stream.Rcheck/00install.out’ for details.
    ```

# u133x3p.db

<details>

* Version: 3.2.3
* Source code: https://github.com/cran/u133x3p.db
* Number of recursive dependencies: 32

Run `revdep_details(,"u133x3p.db")` for more info

</details>

## Newly broken

*   checking examples ... ERROR
    ```
    ...
    +     got[[1]][["GOID"]]
    +     got[[1]][["Ontology"]]
    +     got[[1]][["Evidence"]]
    + }
    [1] "TAS"
    > # For the reverse map:
    > # Convert to a list
    > xx <- as.list(u133x3pGO2PROBE)
    > if(length(xx) > 0){
    +     # Gets the manufacturer ids for the top 2nd and 3nd GO identifiers
    +     goids <- xx[2:3]
    +     # Gets the manufacturer ids for the first element of goids
    +     goids[[1]]
    +     # Evidence code for the mappings
    +     names(goids[[1]])
    + }
    [1] "IEP"
    > # Convert u133x3pGO2ALLPROBES to a list
    > xx <- as.list(u133x3pGO2ALLPROBES)
    Error: memory exhausted (limit reached?)
    Execution halted
    ```

## In both

*   checking installed package size ... NOTE
    ```
      installed size is  8.7Mb
      sub-directories of 1Mb or more:
        extdata   8.5Mb
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
    ```

*   checking R code for possible problems ... NOTE
    ```
    File ‘u133x3p.db/R/zzz.R’:
      .onLoad calls:
        packageStartupMessage(AnnotationDbi:::annoStartupMessages("u133x3p.db"))
    
    See section ‘Good practice’ in '?.onAttach'.
    ```

# vmsbase

<details>

* Version: 2.2.0
* Source code: https://github.com/cran/vmsbase
* URL: https://github.com/vmsbase/R-vmsbase
* Date/Publication: 2018-12-03 14:40:03 UTC
* Number of recursive dependencies: 101

Run `revdep_details(,"vmsbase")` for more info

</details>

## Newly broken

*   checking loading without being on the library search path ... WARNING
    ```
    ...
    Loading required package: ggmap
    Loading required package: ggplot2
    Google's Terms of Service: https://cloud.google.com/maps-platform/terms/.
    Please cite ggmap if you use it! See citation("ggmap") for details.
    Loading required package: mapdata
    Loading required package: maps
    R session is headless; GTK+ not initialized.
    
    (R:47086): Gtk-WARNING **: gtk_disable_setlocale() must be called before gtk_init()
    R session is headless; GTK+ not initialized.
    Error: package or namespace load failed for ‘vmsbase’ in dyn.load(file, DLLpath = DLLpath, ...):
     unable to load shared object '/home/rstudio/DBI/revdep/library/vmsbase/ncdf4/libs/ncdf4.so':
      libnetcdf.so.11: cannot map zero-fill pages
    In addition: Warning message:
    no DISPLAY variable so Tk is not available 
    Execution halted
    Warning message:
    system call failed: Cannot allocate memory 
    
    It looks like this package has a loading problem when not on .libPaths:
    see the messages for details.
    ```

*   checking dependencies in R code ... NOTE
    ```
    Error: package ‘proto’ could not be loaded
    Call sequence:
    7: stop(gettextf("package %s could not be loaded", sQuote(pkg)), 
           call. = FALSE, domain = NA)
    6: .getRequiredPackages2(pkgInfo, quietly = quietly)
    5: library(pkg, character.only = TRUE, logical.return = TRUE, lib.loc = lib.loc, 
           quietly = quietly)
    4: .getRequiredPackages2(pkgInfo, quietly = quietly)
    3: library(pkg, character.only = TRUE, logical.return = TRUE, lib.loc = lib.loc, 
           quietly = quietly)
    2: .getRequiredPackages2(pkgInfo, quietly = quietly)
    1: library(package, lib.loc = lib.loc, character.only = TRUE, verbose = FALSE)
    Execution halted
    Warning: system call failed: Cannot allocate memory
    ```

## In both

*   checking whether package ‘vmsbase’ can be installed ... WARNING
    ```
    Found the following significant warnings:
      Warning: no DISPLAY variable so Tk is not available
    See ‘/home/rstudio/DBI/revdep/checks/vmsbase/new/vmsbase.Rcheck/00install.out’ for details.
    ```

*   checking whether the package can be unloaded cleanly ... WARNING
    ```
    
    (R:46830): Gtk-WARNING **: gtk_disable_setlocale() must be called before gtk_init()
    Error in read.csv(textConnection("altitudes,colours\n10000,#FBFBFB\n4000,#864747\n3900,#7E4B11\n2000,#9B8411\n1900,#BD8D15\n300,#F0CF9F\n0,#307424\n-1,#AFDCF4\n-12000,#090B6A\n"),  : 
      could not find function "read.csv"
    In addition: Warning message:
    no DISPLAY variable so Tk is not available 
    Error: package or namespace load failed for ‘vmsbase’:
     unable to load R code in package ‘marmap’
    Execution halted
    ```

*   checking whether the namespace can be loaded with stated dependencies ... WARNING
    ```
    
    (R:46923): Gtk-WARNING **: gtk_disable_setlocale() must be called before gtk_init()
    Error in read.csv(textConnection("altitudes,colours\n10000,#FBFBFB\n4000,#864747\n3900,#7E4B11\n2000,#9B8411\n1900,#BD8D15\n300,#F0CF9F\n0,#307424\n-1,#AFDCF4\n-12000,#090B6A\n"),  : 
      could not find function "read.csv"
    Error: unable to load R code in package ‘marmap’
    Execution halted
    
    A namespace must be able to be loaded with just the base namespace
    loaded: otherwise if the namespace gets loaded by a saved object, the
    session will be unable to start.
    
    Probably some imports need to be declared in the NAMESPACE file.
    ```

