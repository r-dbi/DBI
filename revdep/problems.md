# afmToolkit

Version: 0.0.1

## In both

*   checking dependencies in R code ... NOTE
    ```
    Namespaces in Imports field not imported from:
      ‘DBI’ ‘assertthat’ ‘tibble’
      All declared Imports should be used.
    ```

# ag.db

Version: 3.2.3

## In both

*   checking for missing documentation entries ... WARNING
    ```
    Undocumented code objects:
      ‘agENTREZID’
    All user-level objects in a package should have documentation entries.
    See chapter ‘Writing R documentation files’ in the ‘Writing R
    Extensions’ manual.
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
    Package in Depends field not imported from: ‘org.At.tair.db’
      These packages need to be imported from (in the NAMESPACE file)
      for when this namespace is loaded but not attached.
    ```

*   checking R code for possible problems ... NOTE
    ```
    File ‘ag.db/R/zzz.R’:
      .onLoad calls:
        packageStartupMessage(AnnotationDbi:::annoStartupMessages("ag.db"))
    
    See section ‘Good practice’ in '?.onAttach'.
    ```

# anamiR

Version: 1.4.2

## In both

*   checking re-building of vignette outputs ... WARNING
    ```
    Error in re-building vignettes:
      ...
    Error: processing vignette 'IntroductionToanamiR.Rmd' failed with diagnostics:
    there is no package called ‘BiocStyle’
    Execution halted
    ```

*   checking installed package size ... NOTE
    ```
      installed size is 22.0Mb
      sub-directories of 1Mb or more:
        data      1.8Mb
        extdata  19.6Mb
    ```

*   checking DESCRIPTION meta-information ... NOTE
    ```
    Package listed in more than one of Depends, Imports, Suggests, Enhances:
      ‘SummarizedExperiment’
    A package should be listed in only one of these fields.
    ```

*   checking R code for possible problems ... NOTE
    ```
    GSEA_ana: no visible binding for global variable ‘msigdb.gs’
    Undefined global functions or variables:
      msigdb.gs
    ```

# annaffy

Version: 1.48.0

## In both

*   checking dependencies in R code ... NOTE
    ```
    'library' or 'require' call to ‘methods’ which was already attached by Depends.
      Please remove these calls from your code.
    'library' or 'require' call to ‘tcltk’ in package code.
      Please use :: or requireNamespace() instead.
      See section 'Suggested packages' in the 'Writing R Extensions' manual.
    Packages in Depends field not imported from:
      ‘GO.db’ ‘KEGG.db’ ‘methods’
      These packages need to be imported from (in the NAMESPACE file)
      for when this namespace is loaded but not attached.
    Missing object imported by a ':::' call: ‘Biobase:::biocReposList’
    ```

*   checking R code for possible problems ... NOTE
    ```
    ...
    selectorWidget: no visible global function definition for ‘tkbutton’
    selectorWidget: no visible global function definition for ‘tkinsert’
    selectorWidget : <anonymous>: no visible global function definition for
      ‘tkdestroy’
    selectorWidget: no visible global function definition for ‘tkbind’
    selectorWidget: no visible global function definition for
      ‘tkwait.window’
    getHTML,aafUniGene: no visible binding for global variable ‘text’
    saveHTML,aafTable: no visible global function definition for
      ‘browseURL’
    Undefined global functions or variables:
      GOTERM GO_dbfile KEGGPATHID2NAME available.packages browseURL
      contrib.url exprs featureNames install.packages sampleNames tclvalue
      text tkbind tkbutton tkcurselection tkdelete tkdestroy tkframe tkget
      tkgrid tkinsert tklabel tklistbox tkscrollbar tkselection.clear tkset
      tktoplevel tkwait.window tkwm.resizable tkwm.title tkyview userQuery
    Consider adding
      importFrom("graphics", "text")
      importFrom("utils", "available.packages", "browseURL", "contrib.url",
                 "install.packages")
    to your NAMESPACE file.
    ```

# annmap

Version: 1.18.0

## In both

*   checking Rd cross-references ... WARNING
    ```
    Missing link or links in documentation object 'plot.ngs.Rd':
      ‘[IRanges]{Rle}’
    
    See section 'Cross-references' in the 'Writing R Extensions' manual.
    ```

*   checking re-building of vignette outputs ... WARNING
    ```
    ...
    Type  H <return>  for immediate help.
     ...                                              
                                                      
    l.134         Or turn off auto-pst-pdf.}
                                            %
    ? 
    /usr/share/texlive/texmf-dist/tex/latex/auto-pst-pdf/auto-pst-pdf.sty:134: Emer
    gency stop.
     ...                                              
                                                      
    l.134         Or turn off auto-pst-pdf.}
                                            %
    /usr/share/texlive/texmf-dist/tex/latex/auto-pst-pdf/auto-pst-pdf.sty:134:  ==>
     Fatal error occurred, no output PDF file produced!
    Transcript written on annmap.log.
    /usr/bin/texi2dvi: pdflatex exited with bad status, quitting.
    Makefile:7: recipe for target 'pdf' failed
    make: *** [pdf] Error 1
    Error in buildVignettes(dir = "/home/muelleki/git/R/DBI/revdep/checks/annmap/new/annmap.Rcheck/vign_test/annmap") : 
      running 'make' failed
    Execution halted
    ```

*   checking for hidden files and directories ... NOTE
    ```
    Found the following hidden files and directories:
      .BBSoptions
    These were most likely included in error. See section ‘Package
    structure’ in the ‘Writing R Extensions’ manual.
    ```

*   checking DESCRIPTION meta-information ... NOTE
    ```
    Malformed Title field: should not end in a period.
    ```

*   checking dependencies in R code ... NOTE
    ```
    'library' or 'require' call to ‘rjson’ in package code.
      Please use :: or requireNamespace() instead.
      See section 'Suggested packages' in the 'Writing R Extensions' manual.
    There are ::: calls to the package's namespace in its code. A package
      almost never needs to use ::: for its own objects:
      ‘.make.hash’
    ```

*   checking R code for possible problems ... NOTE
    ```
    ...
    genomicPlot : <anonymous>: no visible global function definition for
      ‘rgb’
    genomicPlot: no visible global function definition for ‘rgb’
    ngsTracePlotter : local.draw: no visible global function definition for
      ‘runValue’
    ngsTracePlotter: no visible global function definition for ‘modifyList’
    ngsTraceScale : <anonymous>: no visible global function definition for
      ‘runValue’
    seqnameMapping: no visible global function definition for ‘seqlevels<-’
    seqnameMapping: no visible global function definition for ‘seqlevels’
    Undefined global functions or variables:
      GeneRegionTrack Rle flush.console fromJSON install.packages k menu
      modifyList rainbow read.table rgb runValue seqlevels seqlevels<-
      setNames strwidth tail v write.table
    Consider adding
      importFrom("grDevices", "rainbow", "rgb")
      importFrom("graphics", "strwidth")
      importFrom("stats", "setNames")
      importFrom("utils", "flush.console", "install.packages", "menu",
                 "modifyList", "read.table", "tail", "write.table")
    to your NAMESPACE file.
    ```

# AnnotationDbi

Version: 1.38.2

## In both

*   checking for unstated dependencies in ‘tests’ ... WARNING
    ```
    'library' or 'require' call not declared from: ‘org.testing.db’
    ```

*   checking re-building of vignette outputs ... WARNING
    ```
    Error in re-building vignettes:
      ...
    Quitting from lines 366-382 (IntroToAnnotationPackages.Rnw) 
    Error: processing vignette 'IntroToAnnotationPackages.Rnw' failed with diagnostics:
    invalid class "AnnotationFilterList" object: superclass "vectorORfactor" not defined in the environment of the object's class
    Execution halted
    ```

*   checking installed package size ... NOTE
    ```
      installed size is  8.2Mb
      sub-directories of 1Mb or more:
        extdata   6.0Mb
    ```

*   checking DESCRIPTION meta-information ... NOTE
    ```
    Packages listed in more than one of Depends, Imports, Suggests, Enhances:
      ‘methods’ ‘utils’ ‘stats4’ ‘BiocGenerics’ ‘Biobase’ ‘IRanges’ ‘DBI’ ‘RSQLite’
    A package should be listed in only one of these fields.
    ```

*   checking dependencies in R code ... NOTE
    ```
    'library' or 'require' calls in package code:
      ‘GO.db’ ‘KEGG.db’ ‘RSQLite’ ‘graph’
      Please use :: or requireNamespace() instead.
      See section 'Suggested packages' in the 'Writing R Extensions' manual.
    ```

*   checking R code for possible problems ... NOTE
    ```
    .selectInp8: no visible global function definition for ‘.resort’
    annotMessage: no visible binding for global variable ‘pkgName’
    createORGANISMSeeds: no visible global function definition for
      ‘makeAnnDbMapSeeds’
    makeGOGraph: no visible binding for global variable ‘GOBPPARENTS’
    makeGOGraph: no visible binding for global variable ‘GOMFPARENTS’
    makeGOGraph: no visible binding for global variable ‘GOCCPARENTS’
    makeGOGraph: no visible global function definition for ‘ftM2graphNEL’
    Undefined global functions or variables:
      .resort GOBPPARENTS GOCCPARENTS GOMFPARENTS ftM2graphNEL
      makeAnnDbMapSeeds pkgName
    ```

# AnnotationForge

Version: 1.18.2

## In both

*   checking tests ...
    ```
     ERROR
    Running the tests in ‘tests/AnnotationForge_unit_tests.R’ failed.
    Last 13 lines of output:
      Loading required package: IRanges
      Loading required package: S4Vectors
      
      Attaching package: 'S4Vectors'
      
      The following object is masked from 'package:base':
      
          expand.grid
      
      [1] TRUE
      > AnnotationForge:::.test()
      Error in library("RUnit", quietly = TRUE) : 
        there is no package called 'RUnit'
      Calls: <Anonymous> -> <Anonymous> -> library
      Execution halted
    ```

*   checking installed package size ... NOTE
    ```
      installed size is  6.0Mb
      sub-directories of 1Mb or more:
        AnnDbPkg-templates   1.7Mb
        extdata              3.3Mb
    ```

# AnnotationFuncs

Version: 1.26.0

## In both

*   checking DESCRIPTION meta-information ... NOTE
    ```
    BugReports field should not be empty
    ```

*   checking dependencies in R code ... NOTE
    ```
    Package in Depends field not imported from: ‘AnnotationDbi’
      These packages need to be imported from (in the NAMESPACE file)
      for when this namespace is loaded but not attached.
    ```

*   checking R code for possible problems ... NOTE
    ```
    getOrthologs: no visible global function definition for ‘dbmeta’
    getOrthologs: no visible global function definition for ‘dbconn’
    getOrthologs: no visible global function definition for ‘dbfile’
    getOrthologs: no visible global function definition for ‘direction’
    translate: no visible global function definition for ‘dbmeta’
    translate: no visible global function definition for ‘dbconn’
    translate: no visible global function definition for ‘stack’
    Undefined global functions or variables:
      dbconn dbfile dbmeta direction stack
    Consider adding
      importFrom("utils", "stack")
    to your NAMESPACE file.
    ```

# AnnotationHubData

Version: 1.6.2

## Newly fixed

*   checking tests ...
    ```
     ERROR
    Running the tests in ‘tests/AnnotationHubData_unit_tests.R’ failed.
    Last 13 lines of output:
      
       
      1 Test Suite : 
      AnnotationHubData RUnit Tests - 21 test functions, 1 error, 0 failures
      ERROR in test_getGenomeAbbrevs: Error in function (type, msg, asError = TRUE)  : Access denied: 530
      
      Test files with failing tests
      
         test_webAccessFunctions.R 
           test_getGenomeAbbrevs 
      
      
      Error in BiocGenerics:::testPackage("AnnotationHubData") : 
        unit tests failed for package AnnotationHubData
      Execution halted
    ```

## In both

*   checking for code/documentation mismatches ... WARNING
    ```
    Functions or methods with usage in documentation object 'AnnotationHubMetadata-class' but not in code:
      jsonPath constructAnnotationHubMetadataFromSourceFilePath
      constructMetadataFromJsonPath
    ```

*   checking re-building of vignette outputs ... WARNING
    ```
    Error in re-building vignettes:
      ...
    Error: processing vignette 'IntroductionToAnnotationHubData.Rmd' failed with diagnostics:
    path for html_dependency not found: 
    Execution halted
    ```

*   checking DESCRIPTION meta-information ... NOTE
    ```
    Package listed in more than one of Depends, Imports, Suggests, Enhances:
      ‘BiocInstaller’
    A package should be listed in only one of these fields.
    ```

*   checking dependencies in R code ... NOTE
    ```
    'library' or 'require' call to ‘BiocInstaller’ in package code.
      Please use :: or requireNamespace() instead.
      See section 'Suggested packages' in the 'Writing R Extensions' manual.
    Missing object imported by a ':::' call: ‘AnnotationHub:::.db_connection’
    Unexported object imported by a ':::' call: ‘OrganismDbi:::.packageTaxIds’
      See the note in ?`:::` about the use of this operator.
    ```

*   checking R code for possible problems ... NOTE
    ```
    ...
    test_BioPaxImportPreparer_recipe: no visible binding for global
      variable ‘ahroot’
    test_BioPaxImportPreparer_recipe: no visible binding for global
      variable ‘BiocVersion’
    test_BioPaxImportPreparer_recipe: no visible global function definition
      for ‘checkTrue’
    test_Inparanoid8ImportPreparer_recipe: no visible global function
      definition for ‘suppresWarnings’
    test_Inparanoid8ImportPreparer_recipe: no visible binding for global
      variable ‘ahroot’
    test_Inparanoid8ImportPreparer_recipe: no visible binding for global
      variable ‘BiocVersion’
    test_Inparanoid8ImportPreparer_recipe: no visible global function
      definition for ‘checkTrue’
    trackWithAuxiliaryTablesToGRanges: no visible binding for global
      variable ‘seqname’
    Undefined global functions or variables:
      BiocVersion Coordinate_1_based DataProvider Description DispatchClass
      Genome Location_Prefix Maintainer RDataClass RDataDateAdded RDataPath
      SourceType SourceUrl SourceVersion Species TaxonomyId Title ahroot
      checkTrue results seqname specData suppresWarnings
    ```

# archivist

Version: 2.1.2

## In both

*   checking package dependencies ... NOTE
    ```
    Package which this enhances but not available for checking: ‘archivist.github’
    ```

*   checking Rd cross-references ... NOTE
    ```
    Packages unavailable to check Rd xrefs: ‘rmarkdown’, ‘archivist.github’
    ```

# ath1121501.db

Version: 3.2.3

## In both

*   checking for missing documentation entries ... WARNING
    ```
    Undocumented code objects:
      ‘ath1121501ENTREZID’
    All user-level objects in a package should have documentation entries.
    See chapter ‘Writing R documentation files’ in the ‘Writing R
    Extensions’ manual.
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
    Package in Depends field not imported from: ‘org.At.tair.db’
      These packages need to be imported from (in the NAMESPACE file)
      for when this namespace is loaded but not attached.
    ```

*   checking R code for possible problems ... NOTE
    ```
    File ‘ath1121501.db/R/zzz.R’:
      .onLoad calls:
        packageStartupMessage(AnnotationDbi:::annoStartupMessages("ath1121501.db"))
    
    See section ‘Good practice’ in '?.onAttach'.
    ```

# BatchExperiments

Version: 1.4.1

## In both

*   checking dependencies in R code ... NOTE
    ```
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

*   checking R code for possible problems ... NOTE
    ```
    ...
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

# biglm

Version: 0.9-1

## In both

*   checking package dependencies ... NOTE
    ```
    Package which this enhances but not available for checking: ‘leaps’
    ```

*   checking DESCRIPTION meta-information ... NOTE
    ```
    Malformed Description field: should contain one or more complete sentences.
    ```

*   checking dependencies in R code ... NOTE
    ```
    Packages in Depends field not imported from:
      ‘DBI’ ‘methods’
      These packages need to be imported from (in the NAMESPACE file)
      for when this namespace is loaded but not attached.
    ```

*   checking foreign function calls ... NOTE
    ```
    Call with DUP:
       .Fortran("regcf", as.integer(p), as.integer(p * p/2), bigQR$D, 
           bigQR$rbar, bigQR$thetab, bigQR$tol, beta = numeric(p), nreq = as.integer(nvar), 
           ier = integer(1), DUP = FALSE)
    DUP is no longer supported and will be ignored.
    ```

*   checking R code for possible problems ... NOTE
    ```
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
    ```

# bikedata

Version: 0.1.0

## In both

*   checking installed package size ... NOTE
    ```
      installed size is  9.1Mb
      sub-directories of 1Mb or more:
        doc    2.6Mb
        libs   5.8Mb
    ```

# BiocFileCache

Version: 1.0.1

## In both

*   checking re-building of vignette outputs ... WARNING
    ```
    ...
    Auto-disconnecting SQLiteConnection
    Auto-disconnecting SQLiteConnection
    Auto-disconnecting SQLiteConnection
    Auto-disconnecting SQLiteConnection
    Auto-disconnecting SQLiteConnection
    Auto-disconnecting SQLiteConnection
    Auto-disconnecting SQLiteConnection
    Auto-disconnecting SQLiteConnection
    Auto-disconnecting SQLiteConnection
    Auto-disconnecting SQLiteConnection
    Auto-disconnecting SQLiteConnection
    Auto-disconnecting SQLiteConnection
    Auto-disconnecting SQLiteConnection
    Auto-disconnecting SQLiteConnection
    Auto-disconnecting SQLiteConnection
    Auto-disconnecting SQLiteConnection
    Auto-disconnecting SQLiteConnection
    Auto-disconnecting SQLiteConnection
    Error: processing vignette 'BiocFileCache.Rmd' failed with diagnostics:
    path for html_dependency not found: 
    Execution halted
    ```

# bovine.db

Version: 3.2.3

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
    Package in Depends field not imported from: ‘org.Bt.eg.db’
      These packages need to be imported from (in the NAMESPACE file)
      for when this namespace is loaded but not attached.
    ```

*   checking R code for possible problems ... NOTE
    ```
    File ‘bovine.db/R/zzz.R’:
      .onLoad calls:
        packageStartupMessage(AnnotationDbi:::annoStartupMessages("bovine.db"))
    
    See section ‘Good practice’ in '?.onAttach'.
    ```

# canine.db

Version: 3.2.3

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
    Package in Depends field not imported from: ‘org.Cf.eg.db’
      These packages need to be imported from (in the NAMESPACE file)
      for when this namespace is loaded but not attached.
    ```

*   checking R code for possible problems ... NOTE
    ```
    File ‘canine.db/R/zzz.R’:
      .onLoad calls:
        packageStartupMessage(AnnotationDbi:::annoStartupMessages("canine.db"))
    
    See section ‘Good practice’ in '?.onAttach'.
    ```

# canine2.db

Version: 3.2.3

## In both

*   checking installed package size ... NOTE
    ```
      installed size is  6.3Mb
      sub-directories of 1Mb or more:
        extdata   6.1Mb
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
    Package in Depends field not imported from: ‘org.Cf.eg.db’
      These packages need to be imported from (in the NAMESPACE file)
      for when this namespace is loaded but not attached.
    ```

*   checking R code for possible problems ... NOTE
    ```
    File ‘canine2.db/R/zzz.R’:
      .onLoad calls:
        packageStartupMessage(AnnotationDbi:::annoStartupMessages("canine2.db"))
    
    See section ‘Good practice’ in '?.onAttach'.
    ```

# Category

Version: 2.42.1

## In both

*   checking R code for possible problems ... NOTE
    ```
    .linearMTestInternal: no visible global function definition for
      ‘setNames’
    Undefined global functions or variables:
      setNames
    Consider adding
      importFrom("stats", "setNames")
    to your NAMESPACE file.
    ```

# celegans.db

Version: 3.2.3

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
    Package in Depends field not imported from: ‘org.Ce.eg.db’
      These packages need to be imported from (in the NAMESPACE file)
      for when this namespace is loaded but not attached.
    ```

*   checking R code for possible problems ... NOTE
    ```
    File ‘celegans.db/R/zzz.R’:
      .onLoad calls:
        packageStartupMessage(AnnotationDbi:::annoStartupMessages("celegans.db"))
    
    See section ‘Good practice’ in '?.onAttach'.
    ```

# ChemmineR

Version: 2.28.3

## In both

*   checking DESCRIPTION meta-information ... NOTE
    ```
    Package listed in more than one of Depends, Imports, Suggests, Enhances:
      ‘ChemmineOB’
    A package should be listed in only one of these fields.
    ```

*   checking dependencies in R code ... NOTE
    ```
    'library' or 'require' calls in package code:
      ‘ChemmineDrugs’ ‘ChemmineOB’ ‘RPostgreSQL’ ‘RSQLite’ ‘fmcsR’ ‘png’
      ‘snow’
      Please use :: or requireNamespace() instead.
      See section 'Suggested packages' in the 'Writing R Extensions' manual.
    Namespace in Imports field not imported from: ‘BiocGenerics’
      All declared Imports should be used.
    ```

*   checking R code for possible problems ... NOTE
    ```
    ...
    smartsSearchOB: no visible global function definition for
      ‘smartsSearch_OB’
    smile2sdfFile: no visible global function definition for
      ‘convertFormatFile’
    smiles2sdf: no visible global function definition for ‘convertFormat’
    smiles2sdfOB: no visible global function definition for ‘convertFormat’
    write.SMI: no visible global function definition for ‘write.table’
    Undefined global functions or variables:
      AW C1 C1.1 C2 C2.1 browseURL canonicalNumbering_OB clusterApplyLB
      clusterExport combn convertFormat convertFormatFile data dev.off
      error exactMass_OB fingerprint_OB fmcs forEachMol pdf
      postgresqlCopyInDataframe postgresqlQuoteId postgresqlTableRef
      postgresqlgetResult postgresqlpqExec postscript prop_OB rainbow
      read.delim read.table readPNG rgb smartsSearch_OB str string
      write.table
    Consider adding
      importFrom("grDevices", "dev.off", "pdf", "postscript", "rainbow",
                 "rgb")
      importFrom("utils", "browseURL", "combn", "data", "read.delim",
                 "read.table", "str", "write.table")
    to your NAMESPACE file.
    ```

*   checking compiled code ... NOTE
    ```
    File ‘ChemmineR/libs/ChemmineR.so’:
      Found ‘_ZSt4cerr’, possibly from ‘std::cerr’ (C++)
        Objects: ‘desc.o’, ‘formats.o’, ‘script.o’
      Found ‘_ZSt4cout’, possibly from ‘std::cout’ (C++)
        Object: ‘cluster.o’
    
    Compiled code should not call entry points which might terminate R nor
    write to stdout/stderr instead of to the console, nor the system RNG.
    
    See ‘Writing portable packages’ in the ‘Writing R Extensions’ manual.
    ```

# chicken.db

Version: 3.2.3

## In both

*   checking installed package size ... NOTE
    ```
      installed size is  5.5Mb
      sub-directories of 1Mb or more:
        extdata   5.4Mb
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
    Package in Depends field not imported from: ‘org.Gg.eg.db’
      These packages need to be imported from (in the NAMESPACE file)
      for when this namespace is loaded but not attached.
    ```

*   checking R code for possible problems ... NOTE
    ```
    File ‘chicken.db/R/zzz.R’:
      .onLoad calls:
        packageStartupMessage(AnnotationDbi:::annoStartupMessages("chicken.db"))
    
    See section ‘Good practice’ in '?.onAttach'.
    ```

# ChIPpeakAnno

Version: 3.10.2

## In both

*   checking examples ... ERROR
    ```
    ...
    > 
    > ### ** Examples
    > 
    >     library(EnsDb.Hsapiens.v75)
    Loading required package: ensembldb
    Loading required package: GenomicFeatures
    Loading required package: AnnotationDbi
    Loading required package: Biobase
    Welcome to Bioconductor
    
        Vignettes contain introductory material; view with
        'browseVignettes()'. To cite Bioconductor, see
        'citation("Biobase")', and for packages 'citation("pkgname")'.
    
    Loading required package: AnnotationFilter
    >     data("myPeakList")
    >     annoGR <- toGRanges(EnsDb.Hsapiens.v75)
    Error in validObject(.Object) : 
      invalid class "AnnotationFilterList" object: superclass "vectorORfactor" not defined in the environment of the object's class
    Calls: toGRanges ... .AnnotationFilterList -> new -> initialize -> initialize -> validObject
    Execution halted
    ```

*   checking tests ...
    ```
     ERROR
    Running the tests in ‘tests/runTests.R’ failed.
    Last 13 lines of output:
      12: new(structure("AnnotationFilterList", package = "AnnotationFilter"), ...)
      13: initialize(value, ...)
      14: initialize(value, ...)
      15: validObject(.Object)
      16: stop(msg, ": ", errors, domain = NA)
      
      testthat results ================================================================
      OK: 187 SKIPPED: 0 FAILED: 2
      1. Error: binOverFeature works not correct (@test_binOverFeature.R#26) 
      2. Error: toGRanges works not correct (@test_toGRanges.R#46) 
      
      Error: testthat unit tests failed
      In addition: Warning message:
      call dbDisconnect() when finished working with a connection 
      Execution halted
    ```

*   checking re-building of vignette outputs ... WARNING
    ```
    Error in re-building vignettes:
      ...
    duplicated or NA names found. Rename all the names by numbers.
    Missing totalTest! totalTest is required for HyperG test. 
    If totalTest is missing, pvalue will be calculated by estimating 
    the total binding sites of encoding region of human.
    totalTest = humanGenomeSize * (2%(codingDNA) + 
                 1%(regulationRegion)) / ( 2 * averagePeakWidth )
              = 3.3e+9 * 0.03 / ( 2 * averagePeakWidth)
              = 5e+7 /averagePeakWidth
    Quitting from lines 143-160 (ChIPpeakAnno.Rmd) 
    Error: processing vignette 'ChIPpeakAnno.Rmd' failed with diagnostics:
    invalid class "AnnotationFilterList" object: superclass "vectorORfactor" not defined in the environment of the object's class
    Execution halted
    ```

*   checking package dependencies ... NOTE
    ```
    Depends: includes the non-default packages:
      ‘grid’ ‘IRanges’ ‘Biostrings’ ‘GenomicRanges’ ‘S4Vectors’
      ‘VennDiagram’
    Adding so many packages to the search path is excessive and importing
    selectively is preferable.
    ```

*   checking installed package size ... NOTE
    ```
      installed size is 19.6Mb
      sub-directories of 1Mb or more:
        data     12.7Mb
        doc       1.1Mb
        extdata   5.2Mb
    ```

*   checking DESCRIPTION meta-information ... NOTE
    ```
    Package listed in more than one of Depends, Imports, Suggests, Enhances:
      ‘BiocStyle’
    A package should be listed in only one of these fields.
    ```

# clariomdhumanprobeset.db

Version: 8.6.0

## Newly fixed

*   checking examples ... ERROR
    ```
    ...
    +     got <- xx[[1]]           
    +     got[[1]][["GOID"]]
    +     got[[1]][["Ontology"]]
    +     got[[1]][["Evidence"]]
    + }
    [1] "IBA"
    > # For the reverse map:
    > # Convert to a list
    > xx <- as.list(clariomdhumanprobesetGO2PROBE)
    > if(length(xx) > 0){
    +     # Gets the manufacturer ids for the top 2nd and 3nd GO identifiers
    +     goids <- xx[2:3]
    +     # Gets the manufacturer ids for the first element of goids
    +     goids[[1]]
    +     # Evidence code for the mappings
    +     names(goids[[1]])
    + }
    [1] "IEP" "IEP" "IEP" "IEP" "IEP"
    > # Convert clariomdhumanprobesetGO2ALLPROBES to a list
    > xx <- as.list(clariomdhumanprobesetGO2ALLPROBES)
    Killed
    ```

## In both

*   checking installed package size ... NOTE
    ```
      installed size is 295.9Mb
      sub-directories of 1Mb or more:
        extdata  295.8Mb
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

# clariomdhumantranscriptcluster.db

Version: 8.6.0

## In both

*   checking installed package size ... NOTE
    ```
      installed size is 22.2Mb
      sub-directories of 1Mb or more:
        extdata  22.1Mb
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
    File ‘clariomdhumantranscriptcluster.db/R/zzz.R’:
      .onLoad calls:
        packageStartupMessage(AnnotationDbi:::annoStartupMessages("clariomdhumantranscriptcluster.db"))
    
    See section ‘Good practice’ in '?.onAttach'.
    ```

# clariomshumanhttranscriptcluster.db

Version: 8.6.0

## In both

*   checking installed package size ... NOTE
    ```
      installed size is  6.6Mb
      sub-directories of 1Mb or more:
        extdata   6.4Mb
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
    File ‘clariomshumanhttranscriptcluster.db/R/zzz.R’:
      .onLoad calls:
        packageStartupMessage(AnnotationDbi:::annoStartupMessages("clariomshumanhttranscriptcluster.db"))
    
    See section ‘Good practice’ in '?.onAttach'.
    ```

# clariomshumantranscriptcluster.db

Version: 8.6.0

## In both

*   checking installed package size ... NOTE
    ```
      installed size is  6.6Mb
      sub-directories of 1Mb or more:
        extdata   6.4Mb
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
    File ‘clariomshumantranscriptcluster.db/R/zzz.R’:
      .onLoad calls:
        packageStartupMessage(AnnotationDbi:::annoStartupMessages("clariomshumantranscriptcluster.db"))
    
    See section ‘Good practice’ in '?.onAttach'.
    ```

# clariomsmousehttranscriptcluster.db

Version: 8.6.0

## In both

*   checking installed package size ... NOTE
    ```
      installed size is  6.1Mb
      sub-directories of 1Mb or more:
        extdata   5.9Mb
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
    File ‘clariomsmousehttranscriptcluster.db/R/zzz.R’:
      .onLoad calls:
        packageStartupMessage(AnnotationDbi:::annoStartupMessages("clariomsmousehttranscriptcluster.db"))
    
    See section ‘Good practice’ in '?.onAttach'.
    ```

# clariomsmousetranscriptcluster.db

Version: 8.6.0

## In both

*   checking installed package size ... NOTE
    ```
      installed size is  6.1Mb
      sub-directories of 1Mb or more:
        extdata   5.9Mb
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
    File ‘clariomsmousetranscriptcluster.db/R/zzz.R’:
      .onLoad calls:
        packageStartupMessage(AnnotationDbi:::annoStartupMessages("clariomsmousetranscriptcluster.db"))
    
    See section ‘Good practice’ in '?.onAttach'.
    ```

# clariomsrathttranscriptcluster.db

Version: 8.6.0

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
    Unexported objects imported by ':::' calls:
      ‘AnnotationDbi:::annoStartupMessages’ ‘AnnotationDbi:::dbObjectName’
      See the note in ?`:::` about the use of this operator.
    ```

*   checking R code for possible problems ... NOTE
    ```
    File ‘clariomsrathttranscriptcluster.db/R/zzz.R’:
      .onLoad calls:
        packageStartupMessage(AnnotationDbi:::annoStartupMessages("clariomsrathttranscriptcluster.db"))
    
    See section ‘Good practice’ in '?.onAttach'.
    ```

# clariomsrattranscriptcluster.db

Version: 8.6.0

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
    Unexported objects imported by ':::' calls:
      ‘AnnotationDbi:::annoStartupMessages’ ‘AnnotationDbi:::dbObjectName’
      See the note in ?`:::` about the use of this operator.
    ```

*   checking R code for possible problems ... NOTE
    ```
    File ‘clariomsrattranscriptcluster.db/R/zzz.R’:
      .onLoad calls:
        packageStartupMessage(AnnotationDbi:::annoStartupMessages("clariomsrattranscriptcluster.db"))
    
    See section ‘Good practice’ in '?.onAttach'.
    ```

# cn.farms

Version: 1.24.0

## In both

*   checking R code for possible problems ... NOTE
    ```
    ...
    summarizeFarmsVariational: no visible global function definition for
      ‘var’
    Undefined global functions or variables:
      abline approx as.dendrogram assignInNamespace axis dendrapply
      densCols density dev.off getFromNamespace hclust head
      installed.packages is.leaf isPackageLoaded legend lines loess lowess
      matlines matplot median mtext na.omit nclass.Sturges order.dendrogram
      packageDescription pairs par pchisq pdf plot points rect rgb rnorm
      runif sd smoothScatter text var
    Consider adding
      importFrom("grDevices", "densCols", "dev.off", "nclass.Sturges", "pdf",
                 "rgb")
      importFrom("graphics", "abline", "axis", "legend", "lines", "matlines",
                 "matplot", "mtext", "pairs", "par", "plot", "points",
                 "rect", "smoothScatter", "text")
      importFrom("stats", "approx", "as.dendrogram", "dendrapply", "density",
                 "hclust", "is.leaf", "loess", "lowess", "median", "na.omit",
                 "order.dendrogram", "pchisq", "rnorm", "runif", "sd", "var")
      importFrom("utils", "assignInNamespace", "getFromNamespace", "head",
                 "installed.packages", "packageDescription")
    to your NAMESPACE file.
    ```

# CNEr

Version: 1.12.1

## In both

*   checking compiled code ... WARNING
    ```
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
    write to stdout/stderr instead of to the console, nor the system RNG.
    
    See ‘Writing portable packages’ in the ‘Writing R Extensions’ manual.
    ```

*   checking re-building of vignette outputs ... WARNING
    ```
    ...
    Loading required package: IRanges
    Loading required package: GenomeInfoDb
    Loading required package: GenomicRanges
    Loading required package: Biostrings
    Loading required package: XVector
    
    Attaching package: 'Biostrings'
    
    The following object is masked from 'package:CNEr':
    
        N50
    
    The following object is masked from 'package:base':
    
        strsplit
    
    Loading required package: rtracklayer
    Loading required package: grid
    Error: processing vignette 'CNEr.Rmd' failed with diagnostics:
    path for html_dependency not found: 
    Execution halted
    ```

*   checking installed package size ... NOTE
    ```
      installed size is 18.3Mb
      sub-directories of 1Mb or more:
        extdata  15.9Mb
        libs      1.1Mb
    ```

*   checking dependencies in R code ... NOTE
    ```
    Unexported objects imported by ':::' calls:
      ‘BiocGenerics:::replaceSlots’ ‘S4Vectors:::make_zero_col_DataFrame’
      See the note in ?`:::` about the use of this operator.
    ```

# dartR

Version: 0.93

## In both

*   checking dependencies in R code ... NOTE
    ```
    Namespaces in Imports field not imported from:
      ‘DBI’ ‘Demerelate’ ‘misc3d’ ‘plotly’ ‘quadprog’ ‘rgl’
      All declared Imports should be used.
    ```

# DBItest

Version: 1.5

## In both

*   checking dependencies in R code ... NOTE
    ```
    Namespace in Imports field not imported from: ‘desc’
      All declared Imports should be used.
    ```

# dbplyr

Version: 1.1.0

## In both

*   checking dependencies in R code ... NOTE
    ```
    Namespace in Imports field not imported from: ‘tibble’
      All declared Imports should be used.
    ```

# DECIPHER

Version: 2.4.0

## In both

*   checking installed package size ... NOTE
    ```
      installed size is  9.1Mb
      sub-directories of 1Mb or more:
        data      2.5Mb
        doc       3.8Mb
        extdata   1.4Mb
    ```

*   checking R code for possible problems ... NOTE
    ```
    DesignSignatures: no visible binding for global variable ‘deltaHrules’
    Undefined global functions or variables:
      deltaHrules
    ```

# dexter

Version: 0.5.1

## In both

*   checking data for non-ASCII characters ... NOTE
    ```
      Note: found 109 marked UTF-8 strings
    ```

# dplyr

Version: 0.7.4

## In both

*   checking installed package size ... NOTE
    ```
      installed size is 32.9Mb
      sub-directories of 1Mb or more:
        libs  31.0Mb
    ```

*   checking data for non-ASCII characters ... NOTE
    ```
      Note: found 4 marked UTF-8 strings
    ```

# drosgenome1.db

Version: 3.2.3

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
    Package in Depends field not imported from: ‘org.Dm.eg.db’
      These packages need to be imported from (in the NAMESPACE file)
      for when this namespace is loaded but not attached.
    ```

*   checking R code for possible problems ... NOTE
    ```
    File ‘drosgenome1.db/R/zzz.R’:
      .onLoad calls:
        packageStartupMessage(AnnotationDbi:::annoStartupMessages("drosgenome1.db"))
    
    See section ‘Good practice’ in '?.onAttach'.
    ```

# drosophila2.db

Version: 3.2.3

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
    Package in Depends field not imported from: ‘org.Dm.eg.db’
      These packages need to be imported from (in the NAMESPACE file)
      for when this namespace is loaded but not attached.
    ```

*   checking R code for possible problems ... NOTE
    ```
    File ‘drosophila2.db/R/zzz.R’:
      .onLoad calls:
        packageStartupMessage(AnnotationDbi:::annoStartupMessages("drosophila2.db"))
    
    See section ‘Good practice’ in '?.onAttach'.
    ```

# ecoli2.db

Version: 3.2.3

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
    Package in Depends field not imported from: ‘org.EcK12.eg.db’
      These packages need to be imported from (in the NAMESPACE file)
      for when this namespace is loaded but not attached.
    ```

*   checking R code for possible problems ... NOTE
    ```
    File ‘ecoli2.db/R/zzz.R’:
      .onLoad calls:
        packageStartupMessage(AnnotationDbi:::annoStartupMessages("ecoli2.db"))
    
    See section ‘Good practice’ in '?.onAttach'.
    ```

# eiR

Version: 1.16.2

## In both

*   checking re-building of vignette outputs ... WARNING
    ```
    Error in re-building vignettes:
      ...
    Warning: call dbDisconnect() when finished working with a connection
    Error: processing vignette 'eiR.Rmd' failed with diagnostics:
    path for html_dependency not found: 
    Execution halted
    ```

*   checking for hidden files and directories ... NOTE
    ```
    Found the following hidden files and directories:
      .BBSoptions
    These were most likely included in error. See section ‘Package
    structure’ in the ‘Writing R Extensions’ manual.
    ```

*   checking DESCRIPTION meta-information ... NOTE
    ```
    Packages listed in more than one of Depends, Imports, Suggests, Enhances:
      ‘methods’ ‘ChemmineR’
    A package should be listed in only one of these fields.
    ```

*   checking top-level files ... NOTE
    ```
    File
      LICENSE
    is not mentioned in the DESCRIPTION file.
    ```

*   checking dependencies in R code ... NOTE
    ```
    Namespaces in Imports field not imported from:
      ‘BiocGenerics’ ‘RCurl’ ‘RUnit’
      All declared Imports should be used.
    ```

*   checking R code for possible problems ... NOTE
    ```
    ...
    getCoords: no visible global function definition for ‘read.table’
    getEmbeddedDescriptors: no visible global function definition for
      ‘aggregate’
    insertEmbeddedDescriptors: no visible global function definition for
      ‘postgresqlWriteTable’
    insertEmbeddedDescriptorsByCompoundId: no visible global function
      definition for ‘postgresqlWriteTable’
    insertGroupMembers: no visible global function definition for
      ‘postgresqlWriteTable’
    newEmbed: no visible global function definition for ‘optim’
    toFile : write: no visible global function definition for ‘write.table’
    toFile : writePart: no visible global function definition for
      ‘write.table’
    writeIddbFile: no visible global function definition for ‘write.table’
    Undefined global functions or variables:
      aggregate cmdscale head optim postgresqlWriteTable read.table str
      write.table
    Consider adding
      importFrom("stats", "aggregate", "cmdscale", "optim")
      importFrom("utils", "head", "read.table", "str", "write.table")
    to your NAMESPACE file.
    ```

# eisa

Version: 1.28.0

## In both

*   checking dependencies in R code ... NOTE
    ```
    'library' or 'require' calls in package code:
      ‘GO.db’ ‘KEGG.db’ ‘MASS’ ‘biclust’ ‘igraph’ ‘xtable’
      Please use :: or requireNamespace() instead.
      See section 'Suggested packages' in the 'Writing R Extensions' manual.
    Unexported objects imported by ':::' calls:
      ‘Category:::getDataEnv’ ‘Category:::getKeggToProbeMap’
      ‘Category:::probeToEntrezMapHelper’
      See the note in ?`:::` about the use of this operator.
    ```

*   checking R code for possible problems ... NOTE
    ```
    ...
      ‘Matrix’
    htmlReport,GOListHyperGResult: no visible binding for global variable
      ‘GOTERM’
    htmlReport,KEGGListHyperGResult: no visible binding for global variable
      ‘KEGGPATHID2NAME’
    Undefined global functions or variables:
      E E<- GOTERM GO_dbconn IQR KEGGPATHID2NAME Matrix V V<- abline as_ids
      axis barplot cor dev.cur dev.off ecount graph.adjacency
      graph.data.frame graph.empty gray hcl heatmap image induced_subgraph
      isoMDS layout layout.drl layout.fruchterman.reingold layout.norm
      layout.reingold.tilford lines neighborhood p.adjust par png points
      read.delim remove.vertex.attribute sd segments text title
      topological.sort unfold.tree var vcount xtable xy.coords
    Consider adding
      importFrom("grDevices", "dev.cur", "dev.off", "gray", "hcl", "png",
                 "xy.coords")
      importFrom("graphics", "abline", "axis", "barplot", "image", "layout",
                 "lines", "par", "points", "segments", "text", "title")
      importFrom("stats", "IQR", "cor", "heatmap", "p.adjust", "sd", "var")
      importFrom("utils", "read.delim")
    to your NAMESPACE file.
    ```

# ensembldb

Version: 2.0.4

## In both

*   checking examples ... ERROR
    ```
    ...
    > ## List /real/ database column names.
    > listColumns(edb)
     [1] "seq_name"              "seq_length"            "is_circular"          
     [4] "exon_id"               "exon_seq_start"        "exon_seq_end"         
     [7] "gene_id"               "gene_name"             "entrezid"             
    [10] "gene_biotype"          "gene_seq_start"        "gene_seq_end"         
    [13] "seq_strand"            "seq_coord_system"      "symbol"               
    [16] "name"                  "value"                 "tx_id"                
    [19] "protein_id"            "protein_sequence"      "protein_domain_id"    
    [22] "protein_domain_source" "interpro_accession"    "prot_dom_start"       
    [25] "prot_dom_end"          "tx_biotype"            "tx_seq_start"         
    [28] "tx_seq_end"            "tx_cds_seq_start"      "tx_cds_seq_end"       
    [31] "tx_name"               "exon_idx"              "uniprot_id"           
    [34] "uniprot_db"            "uniprot_mapping_type" 
    > 
    > ## Retrieve all keys corresponding to transcript ids.
    > txids <- keys(edb, keytype = "TXID")
    Error in validObject(.Object) : 
      invalid class "AnnotationFilterList" object: superclass "vectorORfactor" not defined in the environment of the object's class
    Calls: keys ... .AnnotationFilterList -> new -> initialize -> initialize -> validObject
    Execution halted
    ```

*   checking tests ...
    ```
     ERROR
    Running the tests in ‘tests/testthat.R’ failed.
    Last 13 lines of output:
      OK: 480 SKIPPED: 0 FAILED: 75
      1. Error: ensDbQuery works (@test_Methods-Filter.R#143) 
      2. Error: ensDbQuery works for AnnotationFilterList (@test_Methods-Filter.R#209) 
      3. Error: ensDbColumn works with AnnotationFilterList (@test_Methods-Filter.R#381) 
      4. Error: returnFilterColumns works with_genes (@test_Methods-with-returnFilterColumns.R#20) 
      5. Error: returnFilterColumns works with_tx (@test_Methods-with-returnFilterColumns.R#58) 
      6. Error: returnFilterColumns works with exons (@test_Methods-with-returnFilterColumns.R#92) 
      7. Error: returnFilterColumns works with exonsBy (@test_Methods-with-returnFilterColumns.R#127) 
      8. Error: returnFilterColumns works with transcriptsBy (@test_Methods-with-returnFilterColumns.R#182) 
      9. Error: returnFilterColumns works with_cdsBy (@test_Methods-with-returnFilterColumns.R#213) 
      1. ...
      
      Error: testthat unit tests failed
      In addition: There were 17 warnings (use warnings() to see them)
      Execution halted
    ```

*   checking re-building of vignette outputs ... WARNING
    ```
    ...
    
    The following object is masked from 'package:base':
    
        expand.grid
    
    Loading required package: IRanges
    Loading required package: GenomeInfoDb
    Loading required package: GenomicFeatures
    Loading required package: AnnotationDbi
    Loading required package: Biobase
    Welcome to Bioconductor
    
        Vignettes contain introductory material; view with
        'browseVignettes()'. To cite Bioconductor, see
        'citation("Biobase")', and for packages 'citation("pkgname")'.
    
    Loading required package: AnnotationFilter
    Quitting from lines 181-183 (ensembldb.Rmd) 
    Error: processing vignette 'ensembldb.Rmd' failed with diagnostics:
    invalid class "AnnotationFilterList" object: superclass "vectorORfactor" not defined in the environment of the object's class
    Execution halted
    ```

*   checking package dependencies ... NOTE
    ```
    Package which this enhances but not available for checking: ‘RMySQL’
    ```

*   checking installed package size ... NOTE
    ```
      installed size is  5.4Mb
      sub-directories of 1Mb or more:
        doc   3.6Mb
    ```

# ExperimentHubData

Version: 1.2.0

## In both

*   checking re-building of vignette outputs ... WARNING
    ```
    Error in re-building vignettes:
      ...
    Error: processing vignette 'ExperimentHubData.Rmd' failed with diagnostics:
    path for html_dependency not found: 
    Execution halted
    ```

*   checking R code for possible problems ... NOTE
    ```
    ...
    makeExperimentHubMetadata : <anonymous>: no visible binding for global
      variable ‘Coordinate_1_based’
    makeExperimentHubMetadata : <anonymous>: no visible binding for global
      variable ‘DataProvider’
    makeExperimentHubMetadata : <anonymous>: no visible binding for global
      variable ‘Maintainer’
    makeExperimentHubMetadata : <anonymous>: no visible binding for global
      variable ‘RDataClass’
    makeExperimentHubMetadata : <anonymous>: no visible binding for global
      variable ‘RDataDateAdded’
    makeExperimentHubMetadata : <anonymous>: no visible binding for global
      variable ‘RDataPath’
    makeExperimentHubMetadata : <anonymous>: no visible binding for global
      variable ‘DispatchClass’
    makeExperimentHubMetadata : <anonymous>: no visible binding for global
      variable ‘PreparerClass’
    Undefined global functions or variables:
      BiocVersion Coordinate_1_based DataProvider Description DispatchClass
      Genome Maintainer PreparerClass RDataClass RDataDateAdded RDataPath
      SourceType SourceUrl SourceVersion Species TaxonomyId Title
      selectSome
    ```

# filehashSQLite

Version: 0.2-4

## In both

*   checking DESCRIPTION meta-information ... NOTE
    ```
    Malformed Description field: should contain one or more complete sentences.
    Packages listed in more than one of Depends, Imports, Suggests, Enhances:
      ‘filehash’ ‘DBI’
    A package should be listed in only one of these fields.
    ```

*   checking dependencies in R code ... NOTE
    ```
    Packages in Depends field not imported from:
      ‘RSQLite’ ‘methods’
      These packages need to be imported from (in the NAMESPACE file)
      for when this namespace is loaded but not attached.
    ```

*   checking R code for possible problems ... NOTE
    ```
    ...
    initializeSQLite: no visible global function definition for ‘dbDriver’
    initializeSQLite: no visible global function definition for ‘dbConnect’
    initializeSQLite: no visible global function definition for ‘new’
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
    Undefined global functions or variables:
      dbConnect dbDriver dbGetQuery dbUnloadDriver new
    Consider adding
      importFrom("methods", "new")
    to your NAMESPACE file (and ensure that your DESCRIPTION Imports field
    contains 'methods').
    ```

# frma

Version: 1.28.0

## In both

*   checking DESCRIPTION meta-information ... NOTE
    ```
    Package listed in more than one of Depends, Imports, Suggests, Enhances:
      ‘Biobase’
    A package should be listed in only one of these fields.
    ```

*   checking R code for possible problems ... NOTE
    ```
    ...
      definition for ‘slot<-’
    coerce<-,frmaExpressionSet-ExpressionSet: no visible global function
      definition for ‘slot’
    randomeffects<-,frmaExpressionSet: no visible global function
      definition for ‘validObject’
    residuals<-,frmaExpressionSet: no visible global function definition
      for ‘validObject’
    se.exprs<-,ExpressionSet: no visible global function definition for
      ‘validObject’
    se.exprs<-,frmaExpressionSet: no visible global function definition for
      ‘validObject’
    weights<-,frmaExpressionSet: no visible global function definition for
      ‘validObject’
    Undefined global functions or variables:
      boxplot median pnorm quantile slot slot<- validObject
    Consider adding
      importFrom("graphics", "boxplot")
      importFrom("methods", "slot", "slot<-", "validObject")
      importFrom("stats", "median", "pnorm", "quantile")
    to your NAMESPACE file (and ensure that your DESCRIPTION Imports field
    contains 'methods').
    ```

# frmaTools

Version: 1.28.0

## In both

*   checking for hidden files and directories ... NOTE
    ```
    Found the following hidden files and directories:
      inst/VectorPkg-template/data/.dummy.txt
    These were most likely included in error. See section ‘Package
    structure’ in the ‘Writing R Extensions’ manual.
    ```

*   checking dependencies in R code ... NOTE
    ```
    'library' or 'require' call to ‘oligo’ in package code.
      Please use :: or requireNamespace() instead.
      See section 'Suggested packages' in the 'Writing R Extensions' manual.
    Package in Depends field not imported from: ‘affy’
      These packages need to be imported from (in the NAMESPACE file)
      for when this namespace is loaded but not attached.
    ```

*   checking R code for possible problems ... NOTE
    ```
    ...
    makeVectorsAffyBatch: no visible global function definition for
      ‘ReadAffy’
    makeVectorsAffyBatch: no visible global function definition for
      ‘bg.correct.rma’
    makeVectorsAffyBatch: no visible global function definition for ‘pm’
    makeVectorsAffyBatch: no visible global function definition for
      ‘probeNames’
    makeVectorsAffyBatch: no visible global function definition for
      ‘pmindex’
    makeVectorsAffyBatch: no visible global function definition for
      ‘packageVersion’
    makeVectorsFeatureSet: no visible global function definition for
      ‘read.celfiles’
    makeVectorsFeatureSet: no visible global function definition for
      ‘backgroundCorrect’
    Undefined global functions or variables:
      ReadAffy backgroundCorrect bg.correct.rma cdfName cleancdfname db
      packageVersion pm pmindex probeNames read.celfiles xy2indices
    Consider adding
      importFrom("utils", "packageVersion")
    to your NAMESPACE file.
    ```

# gcbd

Version: 0.2.6

## In both

*   checking re-building of vignette outputs ... NOTE
    ```
    Error in re-building vignettes:
      ...
    Warning in packageDescription("getopt") : no package 'getopt' was found
    Error: processing vignette 'gcbd.Rnw' failed with diagnostics:
    at gcbd.Rnw:863, subscript out of bounds
    Execution halted
    ```

# GenomicFeatures

Version: 1.28.5

## In both

*   checking for missing documentation entries ... WARNING
    ```
    Undocumented code objects:
      ‘exonicParts’ ‘intronicParts’
    All user-level objects in a package should have documentation entries.
    See chapter ‘Writing R documentation files’ in the ‘Writing R
    Extensions’ manual.
    ```

*   checking package dependencies ... NOTE
    ```
    Depends: includes the non-default packages:
      ‘BiocGenerics’ ‘S4Vectors’ ‘IRanges’ ‘GenomeInfoDb’ ‘GenomicRanges’
      ‘AnnotationDbi’
    Adding so many packages to the search path is excessive and importing
    selectively is preferable.
    ```

*   checking dependencies in R code ... NOTE
    ```
    Unexported objects imported by ':::' calls:
      ‘biomaRt:::martBM’ ‘biomaRt:::martDataset’ ‘biomaRt:::martHost’
      ‘rtracklayer:::resourceDescription’ ‘rtracklayer:::ucscTableOutputs’
      See the note in ?`:::` about the use of this operator.
    ```

*   checking R code for possible problems ... NOTE
    ```
    .writeMetadataFeatureTable: no visible global function definition for
      ‘packageDescription’
    .write_metadata_table: no visible global function definition for
      ‘packageDescription’
    Undefined global functions or variables:
      packageDescription
    Consider adding
      importFrom("utils", "packageDescription")
    to your NAMESPACE file.
    ```

# Genominator

Version: 1.30.0

## In both

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

*   checking R code for possible problems ... NOTE
    ```
    ...
      function definition for ‘makeGenericArray’
    makeRegionPlotter : <anonymous>: no visible global function definition
      for ‘makeGenomeAxis’
    makeRegionPlotter : <anonymous>: no visible global function definition
      for ‘gdPlot’
    plot.genominator.goodness.of.fit : <anonymous>: no visible global
      function definition for ‘qchisq’
    plot.genominator.goodness.of.fit : <anonymous>: no visible global
      function definition for ‘ppoints’
    plot.genominator.goodness.of.fit : <anonymous>: no visible global
      function definition for ‘qunif’
    plot.genominator.goodness.of.fit : <anonymous>: no visible global
      function definition for ‘qqplot’
    Undefined global functions or variables:
      AlignedDataFrame DisplayPars alignData chromosome gdPlot
      geneRegionBiomart makeAnnotationTrack makeBaseTrack makeGenericArray
      makeGenomeAxis mkAllStrings pData position ppoints qchisq qqplot
      qunif readAligned sread subseq tables varLabels varMetadata
    Consider adding
      importFrom("stats", "ppoints", "qchisq", "qqplot", "qunif")
    to your NAMESPACE file.
    ```

# GenVisR

Version: 1.6.3

## In both

*   checking re-building of vignette outputs ... WARNING
    ```
    ...
    
    Obtaining CDS Coordinates
    'select()' returned 1:many mapping between keys and columns
    Obtaining UTR Coordinates
    'select()' returned 1:many mapping between keys and columns
    Calculating transform
    Warning in block_exec(params) :
      failed to tidy R code in chunk <unnamed-chunk-25>
    reason: Error in loadNamespace(name) : there is no package called 'formatR'
    
    Warning in block_exec(params) :
      failed to tidy R code in chunk <unnamed-chunk-26>
    reason: Error in loadNamespace(name) : there is no package called 'formatR'
    
    Warning in block_exec(params) :
      failed to tidy R code in chunk <unnamed-chunk-27>
    reason: Error in loadNamespace(name) : there is no package called 'formatR'
    
    Error: processing vignette 'GenVisR_intro.Rmd' failed with diagnostics:
    path for html_dependency not found: 
    Execution halted
    ```

*   checking R code for possible problems ... NOTE
    ```
    waterfall: warning in waterfall_align(genes = gene_plot, heatmap =
      heatmap, burden = burden_plot, clinical = clinical_plot, proportion =
      proportions_plot, section_heights = section_heights): partial
      argument match of 'proportion' to 'proportions'
    waterfall: warning in waterfall_align(genes = gene_plot, heatmap =
      heatmap, burden = burden_plot, proportion = proportions_plot,
      section_heights = section_heights): partial argument match of
      'proportion' to 'proportions'
    ```

# ggraptR

Version: 1.0

## In both

*   checking tests ...
    ```
     ERROR
    Running the tests in ‘tests/testthat.R’ failed.
    Last 13 lines of output:
      > 
      > if (Sys.getenv("NOT_CRAN") == "true") {  # like global skip_on_cran
      +   Sys.setenv("R_TESTS" = "")  # accroding to https://github.com/hadley/testthat/issues/144
      +   test_check("ggraptR")
      + }
      
      Initial plotError in file(filename, "r", encoding = encoding) : 
        cannot open the connection
      Calls: test_check ... source -> withVisible -> eval -> eval -> source -> file
      In addition: Warning message:
      In file(filename, "r", encoding = encoding) :
        cannot open file '../../inst/ggraptR/functions/helper.R': No such file or directory
      testthat results ================================================================
      OK: 0 SKIPPED: 0 FAILED: 0
      Execution halted
    ```

*   checking dependencies in R code ... NOTE
    ```
    Namespaces in Imports field not imported from:
      ‘DBI’ ‘GGally’ ‘RColorBrewer’ ‘Rcpp’ ‘assertthat’ ‘backports’
      ‘colorspace’ ‘colourpicker’ ‘evaluate’ ‘futile.options’ ‘gdtools’
      ‘gtable’ ‘htmltools’ ‘htmlwidgets’ ‘httpuv’ ‘labeling’ ‘lambda.r’
      ‘lazyeval’ ‘magrittr’ ‘miniUI’ ‘munsell’ ‘plyr’ ‘reshape’ ‘rprojroot’
      ‘scales’ ‘stringi’ ‘stringr’ ‘svglite’ ‘tibble’ ‘xtable’ ‘yaml’
      All declared Imports should be used.
    ```

# GO.db

Version: 3.4.1

## In both

*   checking installed package size ... NOTE
    ```
      installed size is 95.9Mb
      sub-directories of 1Mb or more:
        extdata  95.7Mb
    ```

*   checking DESCRIPTION meta-information ... NOTE
    ```
    Malformed Description field: should contain one or more complete sentences.
    Packages listed in more than one of Depends, Imports, Suggests, Enhances:
      ‘methods’ ‘AnnotationDbi’
    A package should be listed in only one of these fields.
    ```

*   checking R code for possible problems ... NOTE
    ```
    File ‘GO.db/R/zzz.R’:
      .onLoad calls:
        packageStartupMessage(AnnotationDbi:::annoStartupMessages("GO.db"))
    
    See section ‘Good practice’ in '?.onAttach'.
    ```

# GOFunction

Version: 1.24.0

## In both

*   checking examples ... ERROR
    ```
    Running examples in ‘GOFunction-Ex.R’ failed
    The error most likely occurred in:
    
    > ### Name: GOFunction
    > ### Title: main function of the GO-function package
    > ### Aliases: GOFunction
    > ### Keywords: methods
    > 
    > ### ** Examples
    > 
    >        
    >        data(exampledata)
    >        sigTerm <- GOFunction(interestGenes, refGenes, organism = "org.Hs.eg.db", ontology= "BP", fdrmethod = "BY", 
    +        fdrth = 0.05, ppth = 0.05, pcth = 0.05, poth = 0.05, peth = 0.05, bmpSize = 2000, filename="sigTerm")
    Loading required package: org.Hs.eg.db
    Warning in library(package, lib.loc = lib.loc, character.only = TRUE, logical.return = TRUE,  :
      there is no package called ‘org.Hs.eg.db’
    Error in GOFunction(interestGenes, refGenes, organism = "org.Hs.eg.db",  : 
      package org.Hs.eg.db is required
    Execution halted
    ```

*   checking package dependencies ... NOTE
    ```
    Depends: includes the non-default packages:
      ‘Biobase’ ‘graph’ ‘Rgraphviz’ ‘GO.db’ ‘AnnotationDbi’ ‘SparseM’
    Adding so many packages to the search path is excessive and importing
    selectively is preferable.
    ```

*   checking DESCRIPTION meta-information ... NOTE
    ```
    Packages listed in more than one of Depends, Imports, Suggests, Enhances:
      ‘methods’ ‘Biobase’ ‘graph’ ‘Rgraphviz’ ‘GO.db’ ‘AnnotationDbi’ ‘SparseM’
    A package should be listed in only one of these fields.
    ```

*   checking dependencies in R code ... NOTE
    ```
    'library' or 'require' calls to packages already attached by Depends:
      ‘GO.db’ ‘Rgraphviz’ ‘SparseM’ ‘graph’ ‘methods’
      Please remove these calls from your code.
    Namespaces in Imports field not imported from:
      ‘GO.db’ ‘Rgraphviz’ ‘graph’
      All declared Imports should be used.
    Packages in Depends field not imported from:
      ‘GO.db’ ‘Rgraphviz’ ‘graph’
      These packages need to be imported from (in the NAMESPACE file)
      for when this namespace is loaded but not attached.
    ```

*   checking R code for possible problems ... NOTE
    ```
    ...
      ‘p.adjust’
    globalRedundancy : calculateEachTerm : calculateExtraTerm: no visible
      global function definition for ‘phyper’
    localRedundancy: no visible global function definition for ‘phyper’
    showSigNodes: no visible global function definition for
      ‘getDefaultAttrs’
    showSigNodes: no visible global function definition for ‘heat.colors’
    showSigNodes: no visible global function definition for ‘edgeWeights’
    showSigNodes: no visible global function definition for ‘nodes’
    showSigNodes: no visible global function definition for ‘bmp’
    showSigNodes: no visible global function definition for ‘plot’
    showSigNodes: no visible global function definition for ‘dev.off’
    Undefined global functions or variables:
      bmp dev.off edgeWeights getDefaultAttrs graph2SparseM heat.colors
      nodes p.adjust phyper plot sparseM2Graph write.csv
    Consider adding
      importFrom("grDevices", "bmp", "dev.off", "heat.colors")
      importFrom("graphics", "plot")
      importFrom("stats", "p.adjust", "phyper")
      importFrom("utils", "write.csv")
    to your NAMESPACE file.
    ```

*   checking re-building of vignette outputs ... NOTE
    ```
    ...
    
        expand.grid
    
    
    Loading required package: SparseM
    
    Attaching package: ‘SparseM’
    
    The following object is masked from ‘package:base’:
    
        backsolve
    
    Loading required package: org.Hs.eg.db
    Warning in library(package, lib.loc = lib.loc, character.only = TRUE, logical.return = TRUE,  :
      there is no package called ‘org.Hs.eg.db’
    
    Error: processing vignette 'GOFunction.Rnw' failed with diagnostics:
     chunk 1 (label = Example) 
    Error in GOFunction(interestGenes, refGenes, organism = "org.Hs.eg.db",  : 
      package org.Hs.eg.db is required
    Execution halted
    ```

# hcg110.db

Version: 3.2.3

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
    File ‘hcg110.db/R/zzz.R’:
      .onLoad calls:
        packageStartupMessage(AnnotationDbi:::annoStartupMessages("hcg110.db"))
    
    See section ‘Good practice’ in '?.onAttach'.
    ```

# hgfocus.db

Version: 3.2.3

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
    File ‘hgfocus.db/R/zzz.R’:
      .onLoad calls:
        packageStartupMessage(AnnotationDbi:::annoStartupMessages("hgfocus.db"))
    
    See section ‘Good practice’ in '?.onAttach'.
    ```

# hgu133a.db

Version: 3.2.3

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
    File ‘hgu133a.db/R/zzz.R’:
      .onLoad calls:
        packageStartupMessage(AnnotationDbi:::annoStartupMessages("hgu133a.db"))
    
    See section ‘Good practice’ in '?.onAttach'.
    ```

# hgu133a2.db

Version: 3.2.3

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
    File ‘hgu133a2.db/R/zzz.R’:
      .onLoad calls:
        packageStartupMessage(AnnotationDbi:::annoStartupMessages("hgu133a2.db"))
    
    See section ‘Good practice’ in '?.onAttach'.
    ```

# hgu133b.db

Version: 3.2.3

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
    File ‘hgu133b.db/R/zzz.R’:
      .onLoad calls:
        packageStartupMessage(AnnotationDbi:::annoStartupMessages("hgu133b.db"))
    
    See section ‘Good practice’ in '?.onAttach'.
    ```

# hgu133plus2.db

Version: 3.2.3

## In both

*   checking installed package size ... NOTE
    ```
      installed size is  5.7Mb
      sub-directories of 1Mb or more:
        extdata   5.6Mb
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
    File ‘hgu133plus2.db/R/zzz.R’:
      .onLoad calls:
        packageStartupMessage(AnnotationDbi:::annoStartupMessages("hgu133plus2.db"))
    
    See section ‘Good practice’ in '?.onAttach'.
    ```

# hgu219.db

Version: 3.2.3

## In both

*   checking installed package size ... NOTE
    ```
      installed size is  5.9Mb
      sub-directories of 1Mb or more:
        extdata   5.7Mb
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
    File ‘hgu219.db/R/zzz.R’:
      .onLoad calls:
        packageStartupMessage(AnnotationDbi:::annoStartupMessages("hgu219.db"))
    
    See section ‘Good practice’ in '?.onAttach'.
    ```

# hgu95a.db

Version: 3.2.3

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
    File ‘hgu95a.db/R/zzz.R’:
      .onLoad calls:
        packageStartupMessage(AnnotationDbi:::annoStartupMessages("hgu95a.db"))
    
    See section ‘Good practice’ in '?.onAttach'.
    ```

# hgu95av2.db

Version: 3.2.3

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
    File ‘hgu95av2.db/R/zzz.R’:
      .onLoad calls:
        packageStartupMessage(AnnotationDbi:::annoStartupMessages("hgu95av2.db"))
    
    See section ‘Good practice’ in '?.onAttach'.
    ```

# hgu95b.db

Version: 3.2.3

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
    File ‘hgu95b.db/R/zzz.R’:
      .onLoad calls:
        packageStartupMessage(AnnotationDbi:::annoStartupMessages("hgu95b.db"))
    
    See section ‘Good practice’ in '?.onAttach'.
    ```

# hgu95c.db

Version: 3.2.3

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
    File ‘hgu95c.db/R/zzz.R’:
      .onLoad calls:
        packageStartupMessage(AnnotationDbi:::annoStartupMessages("hgu95c.db"))
    
    See section ‘Good practice’ in '?.onAttach'.
    ```

# hgu95d.db

Version: 3.2.3

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
    File ‘hgu95d.db/R/zzz.R’:
      .onLoad calls:
        packageStartupMessage(AnnotationDbi:::annoStartupMessages("hgu95d.db"))
    
    See section ‘Good practice’ in '?.onAttach'.
    ```

# hgu95e.db

Version: 3.2.3

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
    File ‘hgu95e.db/R/zzz.R’:
      .onLoad calls:
        packageStartupMessage(AnnotationDbi:::annoStartupMessages("hgu95e.db"))
    
    See section ‘Good practice’ in '?.onAttach'.
    ```

# hguatlas13k.db

Version: 3.2.3

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
    File ‘hguatlas13k.db/R/zzz.R’:
      .onLoad calls:
        packageStartupMessage(AnnotationDbi:::annoStartupMessages("hguatlas13k.db"))
    
    See section ‘Good practice’ in '?.onAttach'.
    ```

# hgubeta7.db

Version: 3.2.3

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
    File ‘hgubeta7.db/R/zzz.R’:
      .onLoad calls:
        packageStartupMessage(AnnotationDbi:::annoStartupMessages("hgubeta7.db"))
    
    See section ‘Good practice’ in '?.onAttach'.
    ```

# hguDKFZ31.db

Version: 3.2.3

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
    File ‘hguDKFZ31.db/R/zzz.R’:
      .onLoad calls:
        packageStartupMessage(AnnotationDbi:::annoStartupMessages("hguDKFZ31.db"))
    
    See section ‘Good practice’ in '?.onAttach'.
    ```

# hgug4100a.db

Version: 3.2.3

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
    File ‘hgug4100a.db/R/zzz.R’:
      .onLoad calls:
        packageStartupMessage(AnnotationDbi:::annoStartupMessages("hgug4100a.db"))
    
    See section ‘Good practice’ in '?.onAttach'.
    ```

# hgug4101a.db

Version: 3.2.3

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
    File ‘hgug4101a.db/R/zzz.R’:
      .onLoad calls:
        packageStartupMessage(AnnotationDbi:::annoStartupMessages("hgug4101a.db"))
    
    See section ‘Good practice’ in '?.onAttach'.
    ```

# hgug4110b.db

Version: 3.2.3

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
    File ‘hgug4110b.db/R/zzz.R’:
      .onLoad calls:
        packageStartupMessage(AnnotationDbi:::annoStartupMessages("hgug4110b.db"))
    
    See section ‘Good practice’ in '?.onAttach'.
    ```

# hgug4111a.db

Version: 3.2.3

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
    File ‘hgug4111a.db/R/zzz.R’:
      .onLoad calls:
        packageStartupMessage(AnnotationDbi:::annoStartupMessages("hgug4111a.db"))
    
    See section ‘Good practice’ in '?.onAttach'.
    ```

# hgug4112a.db

Version: 3.2.3

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
    File ‘hgug4112a.db/R/zzz.R’:
      .onLoad calls:
        packageStartupMessage(AnnotationDbi:::annoStartupMessages("hgug4112a.db"))
    
    See section ‘Good practice’ in '?.onAttach'.
    ```

# hguqiagenv3.db

Version: 3.2.3

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
    File ‘hguqiagenv3.db/R/zzz.R’:
      .onLoad calls:
        packageStartupMessage(AnnotationDbi:::annoStartupMessages("hguqiagenv3.db"))
    
    See section ‘Good practice’ in '?.onAttach'.
    ```

# Hs6UG171.db

Version: 3.2.3

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
    File ‘Hs6UG171.db/R/zzz.R’:
      .onLoad calls:
        packageStartupMessage(AnnotationDbi:::annoStartupMessages("Hs6UG171.db"))
    
    See section ‘Good practice’ in '?.onAttach'.
    ```

# HsAgilentDesign026652.db

Version: 3.2.3

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
    File ‘HsAgilentDesign026652.db/R/zzz.R’:
      .onLoad calls:
        packageStartupMessage(AnnotationDbi:::annoStartupMessages("HsAgilentDesign026652.db"))
    
    See section ‘Good practice’ in '?.onAttach'.
    ```

# hta20probeset.db

Version: 8.6.0

## In both

*   checking installed package size ... NOTE
    ```
      installed size is 302.3Mb
      sub-directories of 1Mb or more:
        extdata  302.1Mb
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

# hta20transcriptcluster.db

Version: 8.6.0

## In both

*   checking installed package size ... NOTE
    ```
      installed size is 12.4Mb
      sub-directories of 1Mb or more:
        extdata  12.2Mb
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
    File ‘hta20transcriptcluster.db/R/zzz.R’:
      .onLoad calls:
        packageStartupMessage(AnnotationDbi:::annoStartupMessages("hta20transcriptcluster.db"))
    
    See section ‘Good practice’ in '?.onAttach'.
    ```

# hthgu133a.db

Version: 3.2.3

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
    File ‘hthgu133a.db/R/zzz.R’:
      .onLoad calls:
        packageStartupMessage(AnnotationDbi:::annoStartupMessages("hthgu133a.db"))
    
    See section ‘Good practice’ in '?.onAttach'.
    ```

# hthgu133b.db

Version: 3.2.3

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
    File ‘hthgu133b.db/R/zzz.R’:
      .onLoad calls:
        packageStartupMessage(AnnotationDbi:::annoStartupMessages("hthgu133b.db"))
    
    See section ‘Good practice’ in '?.onAttach'.
    ```

# hu35ksuba.db

Version: 3.2.3

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
    File ‘hu35ksuba.db/R/zzz.R’:
      .onLoad calls:
        packageStartupMessage(AnnotationDbi:::annoStartupMessages("hu35ksuba.db"))
    
    See section ‘Good practice’ in '?.onAttach'.
    ```

# hu35ksubb.db

Version: 3.2.3

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
    File ‘hu35ksubb.db/R/zzz.R’:
      .onLoad calls:
        packageStartupMessage(AnnotationDbi:::annoStartupMessages("hu35ksubb.db"))
    
    See section ‘Good practice’ in '?.onAttach'.
    ```

# hu35ksubc.db

Version: 3.2.3

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
    File ‘hu35ksubc.db/R/zzz.R’:
      .onLoad calls:
        packageStartupMessage(AnnotationDbi:::annoStartupMessages("hu35ksubc.db"))
    
    See section ‘Good practice’ in '?.onAttach'.
    ```

# hu35ksubd.db

Version: 3.2.3

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
    File ‘hu35ksubd.db/R/zzz.R’:
      .onLoad calls:
        packageStartupMessage(AnnotationDbi:::annoStartupMessages("hu35ksubd.db"))
    
    See section ‘Good practice’ in '?.onAttach'.
    ```

# hu6800.db

Version: 3.2.3

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
    File ‘hu6800.db/R/zzz.R’:
      .onLoad calls:
        packageStartupMessage(AnnotationDbi:::annoStartupMessages("hu6800.db"))
    
    See section ‘Good practice’ in '?.onAttach'.
    ```

# huex10stprobeset.db

Version: 8.6.0

## Newly broken

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
      installed size is 260.0Mb
      sub-directories of 1Mb or more:
        extdata  259.9Mb
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

# huex10sttranscriptcluster.db

Version: 8.6.0

## In both

*   checking installed package size ... NOTE
    ```
      installed size is 40.0Mb
      sub-directories of 1Mb or more:
        extdata  39.8Mb
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
    File ‘huex10sttranscriptcluster.db/R/zzz.R’:
      .onLoad calls:
        packageStartupMessage(AnnotationDbi:::annoStartupMessages("huex10sttranscriptcluster.db"))
    
    See section ‘Good practice’ in '?.onAttach'.
    ```

# hugene10stprobeset.db

Version: 8.6.0

## In both

*   checking examples ... ERROR
    ```
    ...
    +     got <- xx[[1]]           
    +     got[[1]][["GOID"]]
    +     got[[1]][["Ontology"]]
    +     got[[1]][["Evidence"]]
    + }
    [1] "IBA"
    > # For the reverse map:
    > # Convert to a list
    > xx <- as.list(hugene10stprobesetGO2PROBE)
    > if(length(xx) > 0){
    +     # Gets the manufacturer ids for the top 2nd and 3nd GO identifiers
    +     goids <- xx[2:3]
    +     # Gets the manufacturer ids for the first element of goids
    +     goids[[1]]
    +     # Evidence code for the mappings
    +     names(goids[[1]])
    + }
    [1] "IEP" "IEP"
    > # Convert hugene10stprobesetGO2ALLPROBES to a list
    > xx <- as.list(hugene10stprobesetGO2ALLPROBES)
    Killed
    ```

*   checking installed package size ... NOTE
    ```
      installed size is 118.4Mb
      sub-directories of 1Mb or more:
        extdata  118.3Mb
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
    File ‘hugene10stprobeset.db/R/zzz.R’:
      .onLoad calls:
        packageStartupMessage(AnnotationDbi:::annoStartupMessages("hugene10stprobeset.db"))
    
    See section ‘Good practice’ in '?.onAttach'.
    ```

# hugene10sttranscriptcluster.db

Version: 8.6.0

## In both

*   checking installed package size ... NOTE
    ```
      installed size is 12.4Mb
      sub-directories of 1Mb or more:
        extdata  12.3Mb
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
    File ‘hugene10sttranscriptcluster.db/R/zzz.R’:
      .onLoad calls:
        packageStartupMessage(AnnotationDbi:::annoStartupMessages("hugene10sttranscriptcluster.db"))
    
    See section ‘Good practice’ in '?.onAttach'.
    ```

# hugene11stprobeset.db

Version: 8.6.0

## In both

*   checking examples ... ERROR
    ```
    ...
    +     got <- xx[[1]]           
    +     got[[1]][["GOID"]]
    +     got[[1]][["Ontology"]]
    +     got[[1]][["Evidence"]]
    + }
    [1] "IBA"
    > # For the reverse map:
    > # Convert to a list
    > xx <- as.list(hugene11stprobesetGO2PROBE)
    > if(length(xx) > 0){
    +     # Gets the manufacturer ids for the top 2nd and 3nd GO identifiers
    +     goids <- xx[2:3]
    +     # Gets the manufacturer ids for the first element of goids
    +     goids[[1]]
    +     # Evidence code for the mappings
    +     names(goids[[1]])
    + }
    [1] "IEP" "IEP"
    > # Convert hugene11stprobesetGO2ALLPROBES to a list
    > xx <- as.list(hugene11stprobesetGO2ALLPROBES)
    Killed
    ```

*   checking installed package size ... NOTE
    ```
      installed size is 118.4Mb
      sub-directories of 1Mb or more:
        extdata  118.3Mb
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
    File ‘hugene11stprobeset.db/R/zzz.R’:
      .onLoad calls:
        packageStartupMessage(AnnotationDbi:::annoStartupMessages("hugene11stprobeset.db"))
    
    See section ‘Good practice’ in '?.onAttach'.
    ```

# hugene11sttranscriptcluster.db

Version: 8.6.0

## In both

*   checking installed package size ... NOTE
    ```
      installed size is 12.4Mb
      sub-directories of 1Mb or more:
        extdata  12.3Mb
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
    File ‘hugene11sttranscriptcluster.db/R/zzz.R’:
      .onLoad calls:
        packageStartupMessage(AnnotationDbi:::annoStartupMessages("hugene11sttranscriptcluster.db"))
    
    See section ‘Good practice’ in '?.onAttach'.
    ```

# hugene20stprobeset.db

Version: 8.6.0

## In both

*   checking installed package size ... NOTE
    ```
      installed size is 127.6Mb
      sub-directories of 1Mb or more:
        extdata  127.4Mb
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
    File ‘hugene20stprobeset.db/R/zzz.R’:
      .onLoad calls:
        packageStartupMessage(AnnotationDbi:::annoStartupMessages("hugene20stprobeset.db"))
    
    See section ‘Good practice’ in '?.onAttach'.
    ```

# hugene20sttranscriptcluster.db

Version: 8.6.0

## In both

*   checking installed package size ... NOTE
    ```
      installed size is 16.3Mb
      sub-directories of 1Mb or more:
        extdata  16.1Mb
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
    File ‘hugene20sttranscriptcluster.db/R/zzz.R’:
      .onLoad calls:
        packageStartupMessage(AnnotationDbi:::annoStartupMessages("hugene20sttranscriptcluster.db"))
    
    See section ‘Good practice’ in '?.onAttach'.
    ```

# hugene21stprobeset.db

Version: 8.6.0

## In both

*   checking examples ... ERROR
    ```
    ...
    +     got <- xx[[1]]           
    +     got[[1]][["GOID"]]
    +     got[[1]][["Ontology"]]
    +     got[[1]][["Evidence"]]
    + }
    [1] "IBA"
    > # For the reverse map:
    > # Convert to a list
    > xx <- as.list(hugene21stprobesetGO2PROBE)
    > if(length(xx) > 0){
    +     # Gets the manufacturer ids for the top 2nd and 3nd GO identifiers
    +     goids <- xx[2:3]
    +     # Gets the manufacturer ids for the first element of goids
    +     goids[[1]]
    +     # Evidence code for the mappings
    +     names(goids[[1]])
    + }
    [1] "IEP" "IEP"
    > # Convert hugene21stprobesetGO2ALLPROBES to a list
    > xx <- as.list(hugene21stprobesetGO2ALLPROBES)
    Killed
    ```

*   checking installed package size ... NOTE
    ```
      installed size is 127.6Mb
      sub-directories of 1Mb or more:
        extdata  127.4Mb
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
    File ‘hugene21stprobeset.db/R/zzz.R’:
      .onLoad calls:
        packageStartupMessage(AnnotationDbi:::annoStartupMessages("hugene21stprobeset.db"))
    
    See section ‘Good practice’ in '?.onAttach'.
    ```

# hugene21sttranscriptcluster.db

Version: 8.6.0

## In both

*   checking installed package size ... NOTE
    ```
      installed size is 16.3Mb
      sub-directories of 1Mb or more:
        extdata  16.1Mb
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
    File ‘hugene21sttranscriptcluster.db/R/zzz.R’:
      .onLoad calls:
        packageStartupMessage(AnnotationDbi:::annoStartupMessages("hugene21sttranscriptcluster.db"))
    
    See section ‘Good practice’ in '?.onAttach'.
    ```

# HuO22.db

Version: 3.2.3

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
    File ‘HuO22.db/R/zzz.R’:
      .onLoad calls:
        packageStartupMessage(AnnotationDbi:::annoStartupMessages("HuO22.db"))
    
    See section ‘Good practice’ in '?.onAttach'.
    ```

# imputeMulti

Version: 0.6.4

## In both

*   checking dependencies in R code ... NOTE
    ```
    Namespace in Imports field not imported from: ‘DBI’
      All declared Imports should be used.
    There are ::: calls to the package's namespace in its code. A package
      almost never needs to use ::: for its own objects:
      ‘count_compare’
    ```

# indac.db

Version: 3.2.3

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
    Package in Depends field not imported from: ‘org.Dm.eg.db’
      These packages need to be imported from (in the NAMESPACE file)
      for when this namespace is loaded but not attached.
    ```

*   checking R code for possible problems ... NOTE
    ```
    File ‘indac.db/R/zzz.R’:
      .onLoad calls:
        packageStartupMessage(AnnotationDbi:::annoStartupMessages("indac.db"))
    
    See section ‘Good practice’ in '?.onAttach'.
    ```

# InterpretMSSpectrum

Version: 1.1

## In both

*   checking whether package ‘InterpretMSSpectrum’ can be installed ... ERROR
    ```
    Installation failed.
    See ‘/home/muelleki/git/R/DBI/revdep/checks/InterpretMSSpectrum/new/InterpretMSSpectrum.Rcheck/00install.out’ for details.
    ```

## Installation

### Devel

```
* installing *source* package ‘InterpretMSSpectrum’ ...
** package ‘InterpretMSSpectrum’ successfully unpacked and MD5 sums checked
** R
** data
** preparing package for lazy loading
Error in dyn.load(file, DLLpath = DLLpath, ...) : 
  unable to load shared object '/home/muelleki/git/R/DBI/revdep/library/InterpretMSSpectrum/Rdisop/libs/Rdisop.so':
  libRcppClassic.so: cannot open shared object file: No such file or directory
ERROR: lazy loading failed for package ‘InterpretMSSpectrum’
* removing ‘/home/muelleki/git/R/DBI/revdep/checks/InterpretMSSpectrum/new/InterpretMSSpectrum.Rcheck/InterpretMSSpectrum’

```
### CRAN

```
* installing *source* package ‘InterpretMSSpectrum’ ...
** package ‘InterpretMSSpectrum’ successfully unpacked and MD5 sums checked
** R
** data
** preparing package for lazy loading
Error in dyn.load(file, DLLpath = DLLpath, ...) : 
  unable to load shared object '/home/muelleki/git/R/DBI/revdep/library/InterpretMSSpectrum/Rdisop/libs/Rdisop.so':
  libRcppClassic.so: cannot open shared object file: No such file or directory
ERROR: lazy loading failed for package ‘InterpretMSSpectrum’
* removing ‘/home/muelleki/git/R/DBI/revdep/checks/InterpretMSSpectrum/old/InterpretMSSpectrum.Rcheck/InterpretMSSpectrum’

```
# isobar

Version: 1.22.0

## In both

*   checking dependencies in R code ... NOTE
    ```
    There are ::: calls to the package's namespace in its code. A package
      almost never needs to use ::: for its own objects:
      ‘.as.matrix’ ‘.as.vect’ ‘.convertPeptideModif’
      ‘.proteinGroupAsConciseDataFrame’ ‘.read.idfile’ ‘.sum.bool’
    ```

*   checking R code for possible problems ... NOTE
    ```
    ...
    coerce,IBSpectra-MSnSet: no visible binding for global variable ‘o’
    coerce,MSnSet-IBSpectra: no visible global function definition for
      ‘qual’
    df,Tlsd: no visible global function definition for ‘param’
    estimateRatio,IBSpectra-ANY-missing-missing-character-missing: no
      visible binding for global variable ‘i’
    estimateRatio,IBSpectra-ANY-missing-missing-missing-character: no
      visible binding for global variable ‘i’
    estimateRatioNumeric,numeric-numeric-NoiseModel: no visible binding for
      global variable ‘center.var’
    location,Tlsd: no visible global function definition for ‘param’
    plotRatio,IBSpectra-character-character-character: no visible binding
      for global variable ‘pch’
    plotRatio,IBSpectra-character-character-character: no visible binding
      for global variable ‘noise.model.col’
    plotRatio,IBSpectra-character-character-character: no visible binding
      for global variable ‘pch.p’
    scale,Tlsd: no visible global function definition for ‘param’
    Undefined global functions or variables:
      center.var d g i mz name noise.model.col o param pch pch.p peptide
      qual ratio type
    ```

# ITALICS

Version: 2.36.0

## In both

*   checking DESCRIPTION meta-information ... NOTE
    ```
    Malformed Description field: should contain one or more complete sentences.
    Packages listed in more than one of Depends, Imports, Suggests, Enhances:
      ‘affxparser’ ‘GLAD’ ‘oligo’
    A package should be listed in only one of these fields.
    ```

*   checking dependencies in R code ... NOTE
    ```
    Packages in Depends field not imported from:
      ‘ITALICSData’ ‘pd.mapping50k.xba240’
      These packages need to be imported from (in the NAMESPACE file)
      for when this namespace is loaded but not attached.
    ```

*   checking R code for possible problems ... NOTE
    ```
    trainITALICS: warning in list.files(dir, full.name = TRUE): partial
      argument match of 'full.name' to 'full.names'
    ```

*   checking Rd files ... NOTE
    ```
    prepare_Rd: GLAD.GLAD.Rd:33: Dropping empty section \keyword
    prepare_Rd: ITALICSNew.Rd:82: Dropping empty section \keyword
    prepare_Rd: ITALICSTrain.Rd:43: Dropping empty section \keyword
    prepare_Rd: Model.GetConfDat.Rd:23: Dropping empty section \keyword
    prepare_Rd: Model.GetCorrection.Rd:20: Dropping empty section \keyword
    prepare_Rd: Model.GetEffet.Rd:20: Dropping empty section \keyword
    prepare_Rd: Model.GetModel.Rd:21: Dropping empty section \keyword
    prepare_Rd: Model.GetResidu.Rd:18: Dropping empty section \keyword
    prepare_Rd: New.AddInfo.Rd:24: Dropping empty section \keyword
    prepare_Rd: New.fromQuartetToSnp.Rd:31: Dropping empty section \keyword
    prepare_Rd: New.fromQuartetToSnp.Rd:25: Dropping empty section \examples
    prepare_Rd: New.fromSnpToQuartet.Rd:25: Dropping empty section \keyword
    prepare_Rd: New.getQuartet.Rd:27: Dropping empty section \keyword
    prepare_Rd: New.getSnpInfo.Rd:25: Dropping empty section \keyword
    prepare_Rd: New.readQuartetCopyNb.Rd:23: Dropping empty section \keyword
    ```

# JazaeriMetaData.db

Version: 3.2.3

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
    File ‘JazaeriMetaData.db/R/zzz.R’:
      .onLoad calls:
        packageStartupMessage(AnnotationDbi:::annoStartupMessages("JazaeriMetaData.db"))
    
    See section ‘Good practice’ in '?.onAttach'.
    ```

# KEGG.db

Version: 3.2.3

## In both

*   checking examples ... ERROR
    ```
    Running examples in ‘KEGG.db-Ex.R’ failed
    The error most likely occurred in:
    
    > ### Name: KEGG.db
    > ### Title: Bioconductor annotation data package
    > ### Aliases: KEGG.db KEGG
    > ### Keywords: datasets
    > 
    > ### ** Examples
    > 
    > ## select() interface:
    > ## Objects in this package can be accessed using the select() interface
    > ## from the AnnotationDbi package. See ?select for details.
    > columns(KEGG.db)
    Error in columns(KEGG.db) : object 'KEGG.db' not found
    Execution halted
    ```

*   checking installed package size ... NOTE
    ```
      installed size is  7.4Mb
      sub-directories of 1Mb or more:
        extdata   7.3Mb
    ```

*   checking DESCRIPTION meta-information ... NOTE
    ```
    Malformed Description field: should contain one or more complete sentences.
    Packages listed in more than one of Depends, Imports, Suggests, Enhances:
      ‘methods’ ‘AnnotationDbi’
    A package should be listed in only one of these fields.
    ```

*   checking R code for possible problems ... NOTE
    ```
    File ‘KEGG.db/R/zzz.R’:
      .onLoad calls:
        packageStartupMessage(AnnotationDbi:::annoStartupMessages("KEGG.db"))
    
    See section ‘Good practice’ in '?.onAttach'.
    ```

# keggorthology

Version: 2.28.0

## In both

*   checking DESCRIPTION meta-information ... NOTE
    ```
    Packages listed in more than one of Depends, Imports, Suggests, Enhances:
      ‘graph’ ‘stats’
    A package should be listed in only one of these fields.
    ```

*   checking dependencies in R code ... NOTE
    ```
    Namespace in Imports field not imported from: ‘DBI’
      All declared Imports should be used.
    Package in Depends field not imported from: ‘hgu95av2.db’
      These packages need to be imported from (in the NAMESPACE file)
      for when this namespace is loaded but not attached.
    ```

*   checking R code for possible problems ... NOTE
    ```
    getKOprobes: no visible binding for global variable ‘KOgraph’
    getKOtags: no visible binding for global variable ‘KOgraph’
    Undefined global functions or variables:
      KOgraph
    ```

# LAPOINTE.db

Version: 3.2.3

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
    File ‘LAPOINTE.db/R/zzz.R’:
      .onLoad calls:
        packageStartupMessage(AnnotationDbi:::annoStartupMessages("LAPOINTE.db"))
    
    See section ‘Good practice’ in '?.onAttach'.
    ```

# lumi

Version: 2.28.0

## In both

*   checking dependencies in R code ... WARNING
    ```
    '::' or ':::' imports not declared from:
      ‘IRanges’ ‘bigmemoryExtras’
    ```

*   checking files in ‘vignettes’ ... WARNING
    ```
    Files in the 'vignettes' directory but no files in 'inst/doc':
      ‘IlluminaAnnotation.R’, ‘IlluminaAnnotation.pdf’, ‘lumi.R’,
        ‘lumi.pdf’, ‘lumi_VST_evaluation.R’, ‘lumi_VST_evaluation.pdf’,
        ‘methylationAnalysis.R’, ‘methylationAnalysis.pdf’
    Package has no Sweave vignette sources and no VignetteBuilder field.
    ```

*   checking Rd cross-references ... NOTE
    ```
    Packages unavailable to check Rd xrefs: ‘bigmemoryExtras’, ‘hdrcde’
    ```

# lumiHumanIDMapping

Version: 1.10.1

## In both

*   checking installed package size ... NOTE
    ```
      installed size is 52.4Mb
      sub-directories of 1Mb or more:
        extdata  52.3Mb
    ```

*   checking DESCRIPTION meta-information ... NOTE
    ```
    Non-standard license specification:
      The Artistic License, Version 2.0
    Standardizable: TRUE
    Standardized license specification:
      Artistic-2.0
    Packages listed in more than one of Depends, Imports, Suggests, Enhances:
      ‘methods’ ‘AnnotationDbi’
    A package should be listed in only one of these fields.
    ```

*   checking dependencies in R code ... NOTE
    ```
    'library' or 'require' call to ‘methods’ which was already attached by Depends.
      Please remove these calls from your code.
    ```

*   checking R code for possible problems ... NOTE
    ```
    File ‘lumiHumanIDMapping/R/zzz.R’:
      .onLoad calls:
        require("methods", quietly = TRUE)
    
    Package startup functions should not change the search path.
    See section ‘Good practice’ in '?.onAttach'.
    ```

*   checking Rd files ... NOTE
    ```
    prepare_Rd: lumiHumanIDMapping_dbconn.Rd:21-23: Dropping empty section \arguments
    prepare_Rd: lumiHumanIDMapping_nuID.Rd:15-16: Dropping empty section \arguments
    prepare_Rd: lumiHumanIDMapping_nuID.Rd:44-46: Dropping empty section \seealso
    ```

# macleish

Version: 0.3.1

## In both

*   checking dependencies in R code ... NOTE
    ```
    Namespace in Imports field not imported from: ‘DBI’
      All declared Imports should be used.
    ```

# marmap

Version: 0.9.6

## In both

*   checking Rd cross-references ... NOTE
    ```
    Package unavailable to check Rd xrefs: ‘maptools’
    ```

# mdgsa

Version: 1.8.0

## In both

*   checking DESCRIPTION meta-information ... NOTE
    ```
    Malformed Title field: should not end in a period.
    ```

*   checking R code for possible problems ... NOTE
    ```
    ...
    plotMdGsa: no visible global function definition for ‘cov’
    plotMdGsa: no visible global function definition for ‘qchisq’
    plotMdGsa: no visible global function definition for ‘lines’
    plotMdGsa: no visible global function definition for ‘abline’
    propagateGO.matrix: no visible global function definition for
      ‘packageDescription’
    splitOntologies: no visible global function definition for
      ‘packageDescription’
    uvGsa: no visible global function definition for ‘quasibinomial’
    uvGsa: no visible global function definition for ‘glm.fit’
    uvGsa: no visible global function definition for ‘summary.glm’
    uvGsa: no visible global function definition for ‘p.adjust’
    Undefined global functions or variables:
      abline cov glm.fit lines p.adjust packageDescription plot points
      qchisq qqnorm quasibinomial read.table sd summary.glm
    Consider adding
      importFrom("graphics", "abline", "lines", "plot", "points")
      importFrom("stats", "cov", "glm.fit", "p.adjust", "qchisq", "qqnorm",
                 "quasibinomial", "sd", "summary.glm")
      importFrom("utils", "packageDescription", "read.table")
    to your NAMESPACE file.
    ```

# mdsr

Version: 0.1.4

## In both

*   checking installed package size ... NOTE
    ```
      installed size is  5.5Mb
      sub-directories of 1Mb or more:
        data   5.4Mb
    ```

*   checking dependencies in R code ... NOTE
    ```
    Namespace in Imports field not imported from: ‘tidyverse’
      All declared Imports should be used.
    ```

*   checking data for non-ASCII characters ... NOTE
    ```
      Note: found 2698 marked UTF-8 strings
    ```

# MetaIntegrator

Version: 1.0.3

## In both

*   checking re-building of vignette outputs ... WARNING
    ```
    Error in re-building vignettes:
      ...
    Setting options('download.file.method.GEOquery'='auto')
    Setting options('GEOquery.inmemory.gpl'=FALSE)
    Error: processing vignette 'MetaIntegrator.Rmd' failed with diagnostics:
    path for html_dependency not found: 
    Execution halted
    ```

# mgsa

Version: 1.24.0

## In both

*   checking for GNU extensions in Makefiles ... WARNING
    ```
    Found the following file(s) containing GNU extensions:
      src/Makevars
      src/Makevars.in
    Portable Makefiles do not use GNU extensions such as +=, :=, $(shell),
    $(wildcard), ifeq ... endif. See section ‘Writing portable packages’ in
    the ‘Writing R Extensions’ manual.
    ```

*   checking whether the namespace can be loaded with stated dependencies ... NOTE
    ```
    Warning: no function found corresponding to methods exports from ‘mgsa’ for: ‘show’
    
    A namespace must be able to be loaded with just the base namespace
    loaded: otherwise if the namespace gets loaded by a saved object, the
    session will be unable to start.
    
    Probably some imports need to be declared in the NAMESPACE file.
    ```

*   checking dependencies in R code ... NOTE
    ```
    'library' or 'require' call to ‘gplots’ which was already attached by Depends.
      Please remove these calls from your code.
    'library' or 'require' calls in package code:
      ‘DBI’ ‘GO.db’ ‘RSQLite’
      Please use :: or requireNamespace() instead.
      See section 'Suggested packages' in the 'Writing R Extensions' manual.
    Namespaces in Imports field not imported from:
      ‘stats’ ‘utils’
      All declared Imports should be used.
    Packages in Depends field not imported from:
      ‘gplots’ ‘methods’
      These packages need to be imported from (in the NAMESPACE file)
      for when this namespace is loaded but not attached.
    ```

*   checking R code for possible problems ... NOTE
    ```
    ...
      ‘callNextMethod’
    initialize,MgsaSets: no visible global function definition for ‘relist’
    mgsa,character-MgsaSets: no visible global function definition for
      ‘na.omit’
    plot,MgsaResults: no visible global function definition for
      ‘split.screen’
    plot,MgsaResults: no visible global function definition for ‘screen’
    plot,MgsaResults: no visible global function definition for ‘par’
    plot,MgsaResults: no visible global function definition for ‘barplot2’
    plot,MgsaResults: no visible global function definition for
      ‘close.screen’
    Undefined global functions or variables:
      barplot2 callNextMethod close.screen na.omit new par read.delim
      relist screen sd split.screen str
    Consider adding
      importFrom("graphics", "close.screen", "par", "screen", "split.screen")
      importFrom("methods", "callNextMethod", "new")
      importFrom("stats", "na.omit", "sd")
      importFrom("utils", "read.delim", "relist", "str")
    to your NAMESPACE file (and ensure that your DESCRIPTION Imports field
    contains 'methods').
    ```

# mgu74a.db

Version: 3.2.3

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
    Package in Depends field not imported from: ‘org.Mm.eg.db’
      These packages need to be imported from (in the NAMESPACE file)
      for when this namespace is loaded but not attached.
    ```

*   checking R code for possible problems ... NOTE
    ```
    File ‘mgu74a.db/R/zzz.R’:
      .onLoad calls:
        packageStartupMessage(AnnotationDbi:::annoStartupMessages("mgu74a.db"))
    
    See section ‘Good practice’ in '?.onAttach'.
    ```

# mgu74av2.db

Version: 3.2.3

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
    Package in Depends field not imported from: ‘org.Mm.eg.db’
      These packages need to be imported from (in the NAMESPACE file)
      for when this namespace is loaded but not attached.
    ```

*   checking R code for possible problems ... NOTE
    ```
    File ‘mgu74av2.db/R/zzz.R’:
      .onLoad calls:
        packageStartupMessage(AnnotationDbi:::annoStartupMessages("mgu74av2.db"))
    
    See section ‘Good practice’ in '?.onAttach'.
    ```

# mgu74b.db

Version: 3.2.3

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
    Package in Depends field not imported from: ‘org.Mm.eg.db’
      These packages need to be imported from (in the NAMESPACE file)
      for when this namespace is loaded but not attached.
    ```

*   checking R code for possible problems ... NOTE
    ```
    File ‘mgu74b.db/R/zzz.R’:
      .onLoad calls:
        packageStartupMessage(AnnotationDbi:::annoStartupMessages("mgu74b.db"))
    
    See section ‘Good practice’ in '?.onAttach'.
    ```

# mgu74bv2.db

Version: 3.2.3

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
    Package in Depends field not imported from: ‘org.Mm.eg.db’
      These packages need to be imported from (in the NAMESPACE file)
      for when this namespace is loaded but not attached.
    ```

*   checking R code for possible problems ... NOTE
    ```
    File ‘mgu74bv2.db/R/zzz.R’:
      .onLoad calls:
        packageStartupMessage(AnnotationDbi:::annoStartupMessages("mgu74bv2.db"))
    
    See section ‘Good practice’ in '?.onAttach'.
    ```

# mgu74c.db

Version: 3.2.3

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
    Package in Depends field not imported from: ‘org.Mm.eg.db’
      These packages need to be imported from (in the NAMESPACE file)
      for when this namespace is loaded but not attached.
    ```

*   checking R code for possible problems ... NOTE
    ```
    File ‘mgu74c.db/R/zzz.R’:
      .onLoad calls:
        packageStartupMessage(AnnotationDbi:::annoStartupMessages("mgu74c.db"))
    
    See section ‘Good practice’ in '?.onAttach'.
    ```

# mgu74cv2.db

Version: 3.2.3

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
    Package in Depends field not imported from: ‘org.Mm.eg.db’
      These packages need to be imported from (in the NAMESPACE file)
      for when this namespace is loaded but not attached.
    ```

*   checking R code for possible problems ... NOTE
    ```
    File ‘mgu74cv2.db/R/zzz.R’:
      .onLoad calls:
        packageStartupMessage(AnnotationDbi:::annoStartupMessages("mgu74cv2.db"))
    
    See section ‘Good practice’ in '?.onAttach'.
    ```

# mguatlas5k.db

Version: 3.2.3

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
    Package in Depends field not imported from: ‘org.Mm.eg.db’
      These packages need to be imported from (in the NAMESPACE file)
      for when this namespace is loaded but not attached.
    ```

*   checking R code for possible problems ... NOTE
    ```
    File ‘mguatlas5k.db/R/zzz.R’:
      .onLoad calls:
        packageStartupMessage(AnnotationDbi:::annoStartupMessages("mguatlas5k.db"))
    
    See section ‘Good practice’ in '?.onAttach'.
    ```

# mgug4104a.db

Version: 3.2.3

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
    Package in Depends field not imported from: ‘org.Mm.eg.db’
      These packages need to be imported from (in the NAMESPACE file)
      for when this namespace is loaded but not attached.
    ```

*   checking R code for possible problems ... NOTE
    ```
    File ‘mgug4104a.db/R/zzz.R’:
      .onLoad calls:
        packageStartupMessage(AnnotationDbi:::annoStartupMessages("mgug4104a.db"))
    
    See section ‘Good practice’ in '?.onAttach'.
    ```

# mgug4120a.db

Version: 3.2.3

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
    Package in Depends field not imported from: ‘org.Mm.eg.db’
      These packages need to be imported from (in the NAMESPACE file)
      for when this namespace is loaded but not attached.
    ```

*   checking R code for possible problems ... NOTE
    ```
    File ‘mgug4120a.db/R/zzz.R’:
      .onLoad calls:
        packageStartupMessage(AnnotationDbi:::annoStartupMessages("mgug4120a.db"))
    
    See section ‘Good practice’ in '?.onAttach'.
    ```

# mgug4121a.db

Version: 3.2.3

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
    Package in Depends field not imported from: ‘org.Mm.eg.db’
      These packages need to be imported from (in the NAMESPACE file)
      for when this namespace is loaded but not attached.
    ```

*   checking R code for possible problems ... NOTE
    ```
    File ‘mgug4121a.db/R/zzz.R’:
      .onLoad calls:
        packageStartupMessage(AnnotationDbi:::annoStartupMessages("mgug4121a.db"))
    
    See section ‘Good practice’ in '?.onAttach'.
    ```

# mgug4122a.db

Version: 3.2.3

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
    Package in Depends field not imported from: ‘org.Mm.eg.db’
      These packages need to be imported from (in the NAMESPACE file)
      for when this namespace is loaded but not attached.
    ```

*   checking R code for possible problems ... NOTE
    ```
    File ‘mgug4122a.db/R/zzz.R’:
      .onLoad calls:
        packageStartupMessage(AnnotationDbi:::annoStartupMessages("mgug4122a.db"))
    
    See section ‘Good practice’ in '?.onAttach'.
    ```

# mimager

Version: 1.0.0

## In both

*   checking tests ...
    ```
     ERROR
    Running the tests in ‘tests/testthat.R’ failed.
    Last 13 lines of output:
        ^~~
      tests/testthat/test-methods.R:13:1: style: lines should not be more than 80 characters.
        objects <- mget(symbols, env = asNamespace("DBI"), mode = "function", ifnotfound = rep(list(NULL), length(symbols)))
      ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
      tests/testthat/test-methods.R:14:1: style: lines should not be more than 80 characters.
        is_method <- vapply(objects, inherits, "standardGeneric", FUN.VALUE = logical(1L))
      ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
      
      
      testthat results ================================================================
      OK: 43 SKIPPED: 0 FAILED: 1
      1. Failure: lint free (@test-style.r#4) 
      
      Error: testthat unit tests failed
      Execution halted
    ```

*   checking re-building of vignette outputs ... WARNING
    ```
    ...
        is.unsorted, lapply, lengths, mapply, match, mget, order,
        paste, pmax, pmax.int, pmin, pmin.int, rank, rbind, rowMeans,
        rowSums, rownames, sapply, setdiff, sort, table, tapply,
        union, unique, unsplit, which, which.max, which.min
    
    Welcome to Bioconductor
    
        Vignettes contain introductory material; view with
        'browseVignettes()'. To cite Bioconductor, see
        'citation("Biobase")', and for packages 'citation("pkgname")'.
    
    No methods found in "RSQLite" for requests: dbGetQuery
    Loading required package: affy
    Warning: replacing previous import 'AnnotationDbi::tail' by 'utils::tail' when loading 'hgu95av2cdf'
    Warning: replacing previous import 'AnnotationDbi::head' by 'utils::head' when loading 'hgu95av2cdf'
    
    Loading required package: gcrma
    Loading required package: preprocessCore
    Error: processing vignette 'introduction.Rmd' failed with diagnostics:
    path for html_dependency not found: 
    Execution halted
    ```

# miRBaseVersions.db

Version: 0.99.5

## In both

*   checking installed package size ... NOTE
    ```
      installed size is 43.3Mb
      sub-directories of 1Mb or more:
        extdata  43.0Mb
    ```

*   checking dependencies in R code ... NOTE
    ```
    Unexported object imported by a ':::' call: ‘AnnotationDbi:::dbObjectName’
      See the note in ?`:::` about the use of this operator.
    ```

# miRNAmeConverter

Version: 1.4.0

## In both

*   checking R code for possible problems ... NOTE
    ```
    MiRNANameConverter,ANY: no visible global function definition for ‘new’
    Undefined global functions or variables:
      new
    Consider adding
      importFrom("methods", "new")
    to your NAMESPACE file (and ensure that your DESCRIPTION Imports field
    contains 'methods').
    ```

# miRNAtap

Version: 1.10.0

## In both

*   checking dependencies in R code ... NOTE
    ```
    'library' or 'require' call to ‘miRNAtap.db’ in package code.
      Please use :: or requireNamespace() instead.
      See section 'Suggested packages' in the 'Writing R Extensions' manual.
    ```

*   checking R code for possible problems ... NOTE
    ```
    getTargetsFromSource: no visible binding for global variable
      ‘miRNAtap.db’
    getTargetsFromSource : <anonymous>: no visible binding for global
      variable ‘miRNAtap.db’
    translate: no visible binding for global variable ‘miRNAtap.db’
    Undefined global functions or variables:
      miRNAtap.db
    ```

# miRNAtap.db

Version: 0.99.10

## In both

*   checking installed package size ... NOTE
    ```
      installed size is 295.9Mb
      sub-directories of 1Mb or more:
        extdata  295.7Mb
    ```

*   checking DESCRIPTION meta-information ... NOTE
    ```
    Package listed in more than one of Depends, Imports, Suggests, Enhances:
      ‘miRNAtap’
    A package should be listed in only one of these fields.
    ```

*   checking dependencies in R code ... NOTE
    ```
    Unexported object imported by a ':::' call: ‘AnnotationDbi:::dbObjectName’
      See the note in ?`:::` about the use of this operator.
    ```

# mitools

Version: 2.3

## In both

*   checking R code for possible problems ... NOTE
    ```
    ...
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

# MmAgilentDesign026655.db

Version: 3.2.3

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
    Package in Depends field not imported from: ‘org.Mm.eg.db’
      These packages need to be imported from (in the NAMESPACE file)
      for when this namespace is loaded but not attached.
    ```

*   checking R code for possible problems ... NOTE
    ```
    File ‘MmAgilentDesign026655.db/R/zzz.R’:
      .onLoad calls:
        packageStartupMessage(AnnotationDbi:::annoStartupMessages("MmAgilentDesign026655.db"))
    
    See section ‘Good practice’ in '?.onAttach'.
    ```

# MmPalateMiRNA

Version: 1.26.0

## In both

*   checking package dependencies ... NOTE
    ```
    Depends: includes the non-default packages:
      ‘Biobase’ ‘xtable’ ‘limma’ ‘statmod’ ‘lattice’ ‘vsn’
    Adding so many packages to the search path is excessive and importing
    selectively is preferable.
    ```

*   checking DESCRIPTION meta-information ... NOTE
    ```
    Packages listed in more than one of Depends, Imports, Suggests, Enhances:
      ‘limma’ ‘lattice’ ‘Biobase’
    A package should be listed in only one of these fields.
    ```

*   checking dependencies in R code ... NOTE
    ```
    Packages in Depends field not imported from:
      ‘methods’ ‘statmod’ ‘vsn’ ‘xtable’
      These packages need to be imported from (in the NAMESPACE file)
      for when this namespace is loaded but not attached.
    ```

*   checking R code for possible problems ... NOTE
    ```
    ...
      definition for ‘pData’
    densityplot,list-missing : <anonymous>: no visible global function
      definition for ‘featureData’
    densityplot,list-missing: no visible global function definition for
      ‘as.formula’
    levelplot,RGList-missing: no visible global function definition for
      ‘median’
    levelplot,list-missing : <anonymous>: no visible global function
      definition for ‘RG.MA’
    levelplot,list-missing : <anonymous>: no visible global function
      definition for ‘assayData’
    levelplot,list-missing: no visible global function definition for
      ‘median’
    Undefined global functions or variables:
      RG.MA as.formula assayData axis cor featureData legend lines mad
      median pData par plot sd stack
    Consider adding
      importFrom("graphics", "axis", "legend", "lines", "par", "plot")
      importFrom("stats", "as.formula", "cor", "mad", "median", "sd")
      importFrom("utils", "stack")
    to your NAMESPACE file.
    ```

# moe430a.db

Version: 3.2.3

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
    Package in Depends field not imported from: ‘org.Mm.eg.db’
      These packages need to be imported from (in the NAMESPACE file)
      for when this namespace is loaded but not attached.
    ```

*   checking R code for possible problems ... NOTE
    ```
    File ‘moe430a.db/R/zzz.R’:
      .onLoad calls:
        packageStartupMessage(AnnotationDbi:::annoStartupMessages("moe430a.db"))
    
    See section ‘Good practice’ in '?.onAttach'.
    ```

# moe430b.db

Version: 3.2.3

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
    Package in Depends field not imported from: ‘org.Mm.eg.db’
      These packages need to be imported from (in the NAMESPACE file)
      for when this namespace is loaded but not attached.
    ```

*   checking R code for possible problems ... NOTE
    ```
    File ‘moe430b.db/R/zzz.R’:
      .onLoad calls:
        packageStartupMessage(AnnotationDbi:::annoStartupMessages("moe430b.db"))
    
    See section ‘Good practice’ in '?.onAttach'.
    ```

# moex10stprobeset.db

Version: 8.6.0

## In both

*   checking installed package size ... NOTE
    ```
      installed size is 179.4Mb
      sub-directories of 1Mb or more:
        extdata  179.3Mb
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
    File ‘moex10stprobeset.db/R/zzz.R’:
      .onLoad calls:
        packageStartupMessage(AnnotationDbi:::annoStartupMessages("moex10stprobeset.db"))
    
    See section ‘Good practice’ in '?.onAttach'.
    ```

# moex10sttranscriptcluster.db

Version: 8.6.0

## In both

*   checking installed package size ... NOTE
    ```
      installed size is 32.1Mb
      sub-directories of 1Mb or more:
        extdata  32.0Mb
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
    File ‘moex10sttranscriptcluster.db/R/zzz.R’:
      .onLoad calls:
        packageStartupMessage(AnnotationDbi:::annoStartupMessages("moex10sttranscriptcluster.db"))
    
    See section ‘Good practice’ in '?.onAttach'.
    ```

# mogene10stprobeset.db

Version: 8.6.0

## In both

*   checking installed package size ... NOTE
    ```
      installed size is 82.3Mb
      sub-directories of 1Mb or more:
        extdata  82.2Mb
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
    File ‘mogene10stprobeset.db/R/zzz.R’:
      .onLoad calls:
        packageStartupMessage(AnnotationDbi:::annoStartupMessages("mogene10stprobeset.db"))
    
    See section ‘Good practice’ in '?.onAttach'.
    ```

# mogene10sttranscriptcluster.db

Version: 8.6.0

## In both

*   checking installed package size ... NOTE
    ```
      installed size is 10.7Mb
      sub-directories of 1Mb or more:
        extdata  10.5Mb
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
    File ‘mogene10sttranscriptcluster.db/R/zzz.R’:
      .onLoad calls:
        packageStartupMessage(AnnotationDbi:::annoStartupMessages("mogene10sttranscriptcluster.db"))
    
    See section ‘Good practice’ in '?.onAttach'.
    ```

# mogene11stprobeset.db

Version: 8.6.0

## In both

*   checking installed package size ... NOTE
    ```
      installed size is 82.3Mb
      sub-directories of 1Mb or more:
        extdata  82.2Mb
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
    File ‘mogene11stprobeset.db/R/zzz.R’:
      .onLoad calls:
        packageStartupMessage(AnnotationDbi:::annoStartupMessages("mogene11stprobeset.db"))
    
    See section ‘Good practice’ in '?.onAttach'.
    ```

# mogene11sttranscriptcluster.db

Version: 8.6.0

## In both

*   checking installed package size ... NOTE
    ```
      installed size is 10.7Mb
      sub-directories of 1Mb or more:
        extdata  10.5Mb
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
    File ‘mogene11sttranscriptcluster.db/R/zzz.R’:
      .onLoad calls:
        packageStartupMessage(AnnotationDbi:::annoStartupMessages("mogene11sttranscriptcluster.db"))
    
    See section ‘Good practice’ in '?.onAttach'.
    ```

# mogene20stprobeset.db

Version: 8.6.0

## In both

*   checking installed package size ... NOTE
    ```
      installed size is 79.8Mb
      sub-directories of 1Mb or more:
        extdata  79.7Mb
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

# mogene20sttranscriptcluster.db

Version: 8.6.0

## In both

*   checking installed package size ... NOTE
    ```
      installed size is 10.3Mb
      sub-directories of 1Mb or more:
        extdata  10.2Mb
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
    File ‘mogene20sttranscriptcluster.db/R/zzz.R’:
      .onLoad calls:
        packageStartupMessage(AnnotationDbi:::annoStartupMessages("mogene20sttranscriptcluster.db"))
    
    See section ‘Good practice’ in '?.onAttach'.
    ```

# mogene21stprobeset.db

Version: 8.6.0

## In both

*   checking installed package size ... NOTE
    ```
      installed size is 79.8Mb
      sub-directories of 1Mb or more:
        extdata  79.7Mb
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
    File ‘mogene21stprobeset.db/R/zzz.R’:
      .onLoad calls:
        packageStartupMessage(AnnotationDbi:::annoStartupMessages("mogene21stprobeset.db"))
    
    See section ‘Good practice’ in '?.onAttach'.
    ```

# mogene21sttranscriptcluster.db

Version: 8.6.0

## In both

*   checking installed package size ... NOTE
    ```
      installed size is 10.3Mb
      sub-directories of 1Mb or more:
        extdata  10.2Mb
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
    File ‘mogene21sttranscriptcluster.db/R/zzz.R’:
      .onLoad calls:
        packageStartupMessage(AnnotationDbi:::annoStartupMessages("mogene21sttranscriptcluster.db"))
    
    See section ‘Good practice’ in '?.onAttach'.
    ```

# MonetDB.R

Version: 1.0.1

## In both

*   checking package dependencies ... NOTE
    ```
    Packages which this enhances but not available for checking:
      ‘dplyr’ ‘MonetDBLite’
    ```

# MonetDBLite

Version: 0.5.0

## In both

*   checking installed package size ... NOTE
    ```
      installed size is 18.9Mb
      sub-directories of 1Mb or more:
        libs  18.6Mb
    ```

*   checking for GNU extensions in Makefiles ... NOTE
    ```
    GNU make is a SystemRequirements.
    ```

# mouse4302.db

Version: 3.2.3

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
    Package in Depends field not imported from: ‘org.Mm.eg.db’
      These packages need to be imported from (in the NAMESPACE file)
      for when this namespace is loaded but not attached.
    ```

*   checking R code for possible problems ... NOTE
    ```
    File ‘mouse4302.db/R/zzz.R’:
      .onLoad calls:
        packageStartupMessage(AnnotationDbi:::annoStartupMessages("mouse4302.db"))
    
    See section ‘Good practice’ in '?.onAttach'.
    ```

# mouse430a2.db

Version: 3.2.3

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
    Package in Depends field not imported from: ‘org.Mm.eg.db’
      These packages need to be imported from (in the NAMESPACE file)
      for when this namespace is loaded but not attached.
    ```

*   checking R code for possible problems ... NOTE
    ```
    File ‘mouse430a2.db/R/zzz.R’:
      .onLoad calls:
        packageStartupMessage(AnnotationDbi:::annoStartupMessages("mouse430a2.db"))
    
    See section ‘Good practice’ in '?.onAttach'.
    ```

# mpedbarray.db

Version: 3.2.3

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
    Package in Depends field not imported from: ‘org.Mm.eg.db’
      These packages need to be imported from (in the NAMESPACE file)
      for when this namespace is loaded but not attached.
    ```

*   checking R code for possible problems ... NOTE
    ```
    File ‘mpedbarray.db/R/zzz.R’:
      .onLoad calls:
        packageStartupMessage(AnnotationDbi:::annoStartupMessages("mpedbarray.db"))
    
    See section ‘Good practice’ in '?.onAttach'.
    ```

# mta10probeset.db

Version: 8.6.0

## In both

*   checking installed package size ... NOTE
    ```
      installed size is 146.2Mb
      sub-directories of 1Mb or more:
        extdata  146.0Mb
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
    File ‘mta10probeset.db/R/zzz.R’:
      .onLoad calls:
        packageStartupMessage(AnnotationDbi:::annoStartupMessages("mta10probeset.db"))
    
    See section ‘Good practice’ in '?.onAttach'.
    ```

# mta10transcriptcluster.db

Version: 8.6.0

## In both

*   checking installed package size ... NOTE
    ```
      installed size is 11.1Mb
      sub-directories of 1Mb or more:
        extdata  11.0Mb
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
    File ‘mta10transcriptcluster.db/R/zzz.R’:
      .onLoad calls:
        packageStartupMessage(AnnotationDbi:::annoStartupMessages("mta10transcriptcluster.db"))
    
    See section ‘Good practice’ in '?.onAttach'.
    ```

# mu11ksuba.db

Version: 3.2.3

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
    Package in Depends field not imported from: ‘org.Mm.eg.db’
      These packages need to be imported from (in the NAMESPACE file)
      for when this namespace is loaded but not attached.
    ```

*   checking R code for possible problems ... NOTE
    ```
    File ‘mu11ksuba.db/R/zzz.R’:
      .onLoad calls:
        packageStartupMessage(AnnotationDbi:::annoStartupMessages("mu11ksuba.db"))
    
    See section ‘Good practice’ in '?.onAttach'.
    ```

# mu11ksubb.db

Version: 3.2.3

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
    Package in Depends field not imported from: ‘org.Mm.eg.db’
      These packages need to be imported from (in the NAMESPACE file)
      for when this namespace is loaded but not attached.
    ```

*   checking R code for possible problems ... NOTE
    ```
    File ‘mu11ksubb.db/R/zzz.R’:
      .onLoad calls:
        packageStartupMessage(AnnotationDbi:::annoStartupMessages("mu11ksubb.db"))
    
    See section ‘Good practice’ in '?.onAttach'.
    ```

# Mu15v1.db

Version: 3.2.3

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
    Package in Depends field not imported from: ‘org.Mm.eg.db’
      These packages need to be imported from (in the NAMESPACE file)
      for when this namespace is loaded but not attached.
    ```

*   checking R code for possible problems ... NOTE
    ```
    File ‘Mu15v1.db/R/zzz.R’:
      .onLoad calls:
        packageStartupMessage(AnnotationDbi:::annoStartupMessages("Mu15v1.db"))
    
    See section ‘Good practice’ in '?.onAttach'.
    ```

# mu19ksuba.db

Version: 3.2.3

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
    Package in Depends field not imported from: ‘org.Mm.eg.db’
      These packages need to be imported from (in the NAMESPACE file)
      for when this namespace is loaded but not attached.
    ```

*   checking R code for possible problems ... NOTE
    ```
    File ‘mu19ksuba.db/R/zzz.R’:
      .onLoad calls:
        packageStartupMessage(AnnotationDbi:::annoStartupMessages("mu19ksuba.db"))
    
    See section ‘Good practice’ in '?.onAttach'.
    ```

# mu19ksubb.db

Version: 3.2.3

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
    Package in Depends field not imported from: ‘org.Mm.eg.db’
      These packages need to be imported from (in the NAMESPACE file)
      for when this namespace is loaded but not attached.
    ```

*   checking R code for possible problems ... NOTE
    ```
    File ‘mu19ksubb.db/R/zzz.R’:
      .onLoad calls:
        packageStartupMessage(AnnotationDbi:::annoStartupMessages("mu19ksubb.db"))
    
    See section ‘Good practice’ in '?.onAttach'.
    ```

# mu19ksubc.db

Version: 3.2.3

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
    Package in Depends field not imported from: ‘org.Mm.eg.db’
      These packages need to be imported from (in the NAMESPACE file)
      for when this namespace is loaded but not attached.
    ```

*   checking R code for possible problems ... NOTE
    ```
    File ‘mu19ksubc.db/R/zzz.R’:
      .onLoad calls:
        packageStartupMessage(AnnotationDbi:::annoStartupMessages("mu19ksubc.db"))
    
    See section ‘Good practice’ in '?.onAttach'.
    ```

# Mu22v3.db

Version: 3.2.3

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
    Package in Depends field not imported from: ‘org.Mm.eg.db’
      These packages need to be imported from (in the NAMESPACE file)
      for when this namespace is loaded but not attached.
    ```

*   checking R code for possible problems ... NOTE
    ```
    File ‘Mu22v3.db/R/zzz.R’:
      .onLoad calls:
        packageStartupMessage(AnnotationDbi:::annoStartupMessages("Mu22v3.db"))
    
    See section ‘Good practice’ in '?.onAttach'.
    ```

# Norway981.db

Version: 3.2.3

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
    File ‘Norway981.db/R/zzz.R’:
      .onLoad calls:
        packageStartupMessage(AnnotationDbi:::annoStartupMessages("Norway981.db"))
    
    See section ‘Good practice’ in '?.onAttach'.
    ```

# oai

Version: 0.2.2

## In both

*   checking tests ...
    ```
     ERROR
    Running the tests in ‘tests/test-all.R’ failed.
    Last 13 lines of output:
      
      testthat results ================================================================
      OK: 109 SKIPPED: 0 FAILED: 9
      1. Error: count_identifiers - basic functionality (@test-count_identifiers.R#6) 
      2. Error: count_identifiers - works with many input urls (@test-count_identifiers.R#17) 
      3. Error: count_identifiers - prefix param works (@test-count_identifiers.R#32) 
      4. Failure: badArgument is triggered (@test-handle_errors.R#28) 
      5. Error: list_identifiers - from (@test-list_identifiers.R#6) 
      6. Error: list_identifiers - from & until (@test-list_identifiers.R#18) 
      7. Error: list_identifiers - set (@test-list_identifiers.R#30) 
      8. Error: list_metadataformats - no formats avail. vs. avail (@test-list_metadataformats.R#19) 
      9. Error: list_records works (@test-list_records.R#6) 
      
      Error: testthat unit tests failed
      Execution halted
    ```

# oce

Version: 0.9-22

## In both

*   checking examples ... ERROR
    ```
    Running examples in ‘oce-Ex.R’ failed
    The error most likely occurred in:
    
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
    ```

*   checking installed package size ... NOTE
    ```
      installed size is  5.6Mb
      sub-directories of 1Mb or more:
        help   2.2Mb
    ```

# ODB

Version: 1.1.1

## In both

*   checking dependencies in R code ... NOTE
    ```
    Packages in Depends field not imported from:
      ‘DBI’ ‘RJDBC’ ‘methods’
      These packages need to be imported from (in the NAMESPACE file)
      for when this namespace is loaded but not attached.
    ```

*   checking R code for possible problems ... NOTE
    ```
    ...
    odb.tables: no visible global function definition for ‘validObject’
    odb.tables: no visible global function definition for ‘dbListTables’
    odb.tables: no visible global function definition for ‘dbSendQuery’
    odb.tables: no visible global function definition for ‘dbColumnInfo’
    odb.write: no visible global function definition for ‘is’
    odb.write: no visible global function definition for ‘validObject’
    odb.write: no visible global function definition for ‘new’
    odb.write: no visible global function definition for ‘dbSendUpdate’
    set,progress.console: no visible global function definition for ‘tail’
    set,progress.console: no visible global function definition for
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

# odbc

Version: 1.1.3

## In both

*   checking tests ...
    ```
     ERROR
    Running the tests in ‘tests/testthat.R’ failed.
    Last 13 lines of output:
      1. Failure: odbcListDrivers() returns available drivers (@test-drivers.R#7) ----
      nrow(res) >= 1 isn't true.
      
      
      2. Failure: odbcListDataSources() returns available data sources (@test-drivers.R#14) 
      nrow(res) >= 1 isn't true.
      
      
      testthat results ================================================================
      OK: 5 SKIPPED: 3 FAILED: 2
      1. Failure: odbcListDrivers() returns available drivers (@test-drivers.R#7) 
      2. Failure: odbcListDataSources() returns available data sources (@test-drivers.R#14) 
      
      Error: testthat unit tests failed
      Execution halted
    ```

*   checking installed package size ... NOTE
    ```
      installed size is  6.0Mb
      sub-directories of 1Mb or more:
        libs   5.7Mb
    ```

# oligo

Version: 1.40.2

## In both

*   checking for code/documentation mismatches ... WARNING
    ```
    ...
        Position: 5 Code: target Docs: ...
    
    Codoc mismatches from documentation object 'hist':
    \S4method{hist}{FeatureSet}
      Code: function(x, transfo = log2, which = c("pm", "mm", "bg", "both",
                     "all"), nsample = 10000, target = "mps1", ...)
      Docs: function(x, transfo = log2, which = c("pm", "mm", "bg", "both",
                     "all"), nsample = 10000, ...)
      Argument names in code not in docs:
        target
      Mismatches in argument names:
        Position: 5 Code: target Docs: ...
    
    S4 class codoc mismatches from documentation object 'oligoPLM-class':
    Slots for class 'oligoPLM'
      Code: annotation chip.coefs description geometry manufacturer method
            narrays nprobes nprobesets phenoData probe.coefs protocolData
            residualSE residuals se.chip.coefs se.probe.coefs weights
      Docs: annotation chip.coefs geometry manufacturer method narrays
            nprobes nprobesets probe.coefs residualSE residuals
            se.chip.coefs se.probe.coefs weights
    ```

*   checking files in ‘vignettes’ ... WARNING
    ```
    Files in the 'vignettes' directory newer than all files in 'inst/doc':
      ‘Makefile’
    ```

*   checking package dependencies ... NOTE
    ```
    Packages which this enhances but not available for checking: ‘doMC’ ‘doMPI’
    ```

*   checking installed package size ... NOTE
    ```
      installed size is 29.6Mb
      sub-directories of 1Mb or more:
        doc      12.9Mb
        scripts  15.7Mb
    ```

*   checking DESCRIPTION meta-information ... NOTE
    ```
    Packages listed in more than one of Depends, Imports, Suggests, Enhances:
      ‘biomaRt’ ‘AnnotationDbi’ ‘GenomeGraphs’ ‘RCurl’ ‘ff’
    A package should be listed in only one of these fields.
    ```

*   checking whether the namespace can be loaded with stated dependencies ... NOTE
    ```
    Warning: no function found corresponding to methods exports from ‘oligo’ for: ‘show’
    
    A namespace must be able to be loaded with just the base namespace
    loaded: otherwise if the namespace gets loaded by a saved object, the
    session will be unable to start.
    
    Probably some imports need to be declared in the NAMESPACE file.
    ```

*   checking dependencies in R code ... NOTE
    ```
    Unexported object imported by a ':::' call: ‘Biobase:::annotatedDataFrameFromMatrix’
      See the note in ?`:::` about the use of this operator.
    ```

*   checking foreign function calls ... NOTE
    ```
    Foreign function calls to a different package:
      .Call("ReadHeader", ..., PACKAGE = "affyio")
      .Call("read_abatch", ..., PACKAGE = "affyio")
    See chapter ‘System and foreign language interfaces’ in the ‘Writing R
    Extensions’ manual.
    ```

*   checking R code for possible problems ... NOTE
    ```
    ...
      ‘smoothScatter’
    MAplot,TilingFeatureSet: no visible global function definition for
      ‘rnorm’
    MAplot,matrix: no visible binding for global variable ‘smoothScatter’
    backgroundCorrect,matrix: no visible binding for global variable
      ‘intensities’
    pmFragmentLength,AffySNPPDInfo: no visible global function definition
      for ‘complete.cases’
    pmindex,GenericPDInfo: no visible binding for global variable
      ‘man_fsetid’
    Undefined global functions or variables:
      IQR abline aggregate approx complete.cases data frame intensities
      loess man_fsetid mtext predict rnorm smooth.spline smoothScatter
      splinefun text
    Consider adding
      importFrom("graphics", "abline", "frame", "mtext", "smoothScatter",
                 "text")
      importFrom("stats", "IQR", "aggregate", "approx", "complete.cases",
                 "loess", "predict", "rnorm", "smooth.spline", "splinefun")
      importFrom("utils", "data")
    to your NAMESPACE file.
    ```

# OperonHumanV3.db

Version: 3.2.3

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
    File ‘OperonHumanV3.db/R/zzz.R’:
      .onLoad calls:
        packageStartupMessage(AnnotationDbi:::annoStartupMessages("OperonHumanV3.db"))
    
    See section ‘Good practice’ in '?.onAttach'.
    ```

# ora

Version: 2.0-1

## In both

*   checking package dependencies ... ERROR
    ```
    Package required but not available: ‘ROracle’
    
    See section ‘The DESCRIPTION file’ in the ‘Writing R Extensions’
    manual.
    ```

# org.Ag.eg.db

Version: 3.4.1

## In both

*   checking installed package size ... NOTE
    ```
      installed size is  7.8Mb
      sub-directories of 1Mb or more:
        extdata   7.6Mb
    ```

*   checking DESCRIPTION meta-information ... NOTE
    ```
    Packages listed in more than one of Depends, Imports, Suggests, Enhances:
      ‘methods’ ‘AnnotationDbi’
    A package should be listed in only one of these fields.
    ```

*   checking R code for possible problems ... NOTE
    ```
    File ‘org.Ag.eg.db/R/zzz.R’:
      .onLoad calls:
        packageStartupMessage(AnnotationDbi:::annoStartupMessages("org.Ag.eg"))
    
    See section ‘Good practice’ in '?.onAttach'.
    ```

# org.At.tair.db

Version: 3.4.1

## In both

*   checking installed package size ... NOTE
    ```
      installed size is 228.7Mb
      sub-directories of 1Mb or more:
        extdata  228.6Mb
    ```

*   checking DESCRIPTION meta-information ... NOTE
    ```
    Packages listed in more than one of Depends, Imports, Suggests, Enhances:
      ‘methods’ ‘AnnotationDbi’
    A package should be listed in only one of these fields.
    ```

*   checking R code for possible problems ... NOTE
    ```
    File ‘org.At.tair.db/R/zzz.R’:
      .onLoad calls:
        packageStartupMessage(AnnotationDbi:::annoStartupMessages("org.At.tair.db"))
    
    See section ‘Good practice’ in '?.onAttach'.
    ```

# org.Bt.eg.db

Version: 3.4.1

## In both

*   checking installed package size ... NOTE
    ```
      installed size is 64.1Mb
      sub-directories of 1Mb or more:
        extdata  64.0Mb
    ```

*   checking DESCRIPTION meta-information ... NOTE
    ```
    Packages listed in more than one of Depends, Imports, Suggests, Enhances:
      ‘methods’ ‘AnnotationDbi’
    A package should be listed in only one of these fields.
    ```

*   checking R code for possible problems ... NOTE
    ```
    File ‘org.Bt.eg.db/R/zzz.R’:
      .onLoad calls:
        packageStartupMessage(AnnotationDbi:::annoStartupMessages("org.Bt.eg"))
    
    See section ‘Good practice’ in '?.onAttach'.
    ```

# org.Ce.eg.db

Version: 3.4.1

## In both

*   checking installed package size ... NOTE
    ```
      installed size is 72.6Mb
      sub-directories of 1Mb or more:
        extdata  72.5Mb
    ```

*   checking DESCRIPTION meta-information ... NOTE
    ```
    Packages listed in more than one of Depends, Imports, Suggests, Enhances:
      ‘methods’ ‘AnnotationDbi’
    A package should be listed in only one of these fields.
    ```

*   checking R code for possible problems ... NOTE
    ```
    File ‘org.Ce.eg.db/R/zzz.R’:
      .onLoad calls:
        packageStartupMessage(AnnotationDbi:::annoStartupMessages("org.Ce.eg"))
    
    See section ‘Good practice’ in '?.onAttach'.
    ```

# org.Cf.eg.db

Version: 3.4.1

## In both

*   checking installed package size ... NOTE
    ```
      installed size is 62.5Mb
      sub-directories of 1Mb or more:
        extdata  62.3Mb
    ```

*   checking DESCRIPTION meta-information ... NOTE
    ```
    Packages listed in more than one of Depends, Imports, Suggests, Enhances:
      ‘methods’ ‘AnnotationDbi’
    A package should be listed in only one of these fields.
    ```

*   checking R code for possible problems ... NOTE
    ```
    File ‘org.Cf.eg.db/R/zzz.R’:
      .onLoad calls:
        packageStartupMessage(AnnotationDbi:::annoStartupMessages("org.Cf.eg"))
    
    See section ‘Good practice’ in '?.onAttach'.
    ```

# org.Dm.eg.db

Version: 3.4.1

## In both

*   checking installed package size ... NOTE
    ```
      installed size is 87.7Mb
      sub-directories of 1Mb or more:
        extdata  87.5Mb
    ```

*   checking DESCRIPTION meta-information ... NOTE
    ```
    Packages listed in more than one of Depends, Imports, Suggests, Enhances:
      ‘methods’ ‘AnnotationDbi’
    A package should be listed in only one of these fields.
    ```

*   checking R code for possible problems ... NOTE
    ```
    File ‘org.Dm.eg.db/R/zzz.R’:
      .onLoad calls:
        packageStartupMessage(AnnotationDbi:::annoStartupMessages("org.Dm.eg"))
    
    See section ‘Good practice’ in '?.onAttach'.
    ```

# org.Dr.eg.db

Version: 3.4.1

## In both

*   checking installed package size ... NOTE
    ```
      installed size is 101.5Mb
      sub-directories of 1Mb or more:
        extdata  101.4Mb
    ```

*   checking DESCRIPTION meta-information ... NOTE
    ```
    Packages listed in more than one of Depends, Imports, Suggests, Enhances:
      ‘methods’ ‘AnnotationDbi’
    A package should be listed in only one of these fields.
    ```

*   checking R code for possible problems ... NOTE
    ```
    File ‘org.Dr.eg.db/R/zzz.R’:
      .onLoad calls:
        packageStartupMessage(AnnotationDbi:::annoStartupMessages("org.Dr.eg"))
    
    See section ‘Good practice’ in '?.onAttach'.
    ```

# org.EcK12.eg.db

Version: 3.4.1

## In both

*   checking installed package size ... NOTE
    ```
      installed size is 14.0Mb
      sub-directories of 1Mb or more:
        extdata  13.9Mb
    ```

*   checking DESCRIPTION meta-information ... NOTE
    ```
    Packages listed in more than one of Depends, Imports, Suggests, Enhances:
      ‘methods’ ‘AnnotationDbi’
    A package should be listed in only one of these fields.
    ```

*   checking R code for possible problems ... NOTE
    ```
    File ‘org.EcK12.eg.db/R/zzz.R’:
      .onLoad calls:
        packageStartupMessage(AnnotationDbi:::annoStartupMessages("org.EcK12.eg"))
    
    See section ‘Good practice’ in '?.onAttach'.
    ```

# org.EcSakai.eg.db

Version: 3.4.1

## In both

*   checking DESCRIPTION meta-information ... NOTE
    ```
    Packages listed in more than one of Depends, Imports, Suggests, Enhances:
      ‘methods’ ‘AnnotationDbi’
    A package should be listed in only one of these fields.
    ```

*   checking R code for possible problems ... NOTE
    ```
    File ‘org.EcSakai.eg.db/R/zzz.R’:
      .onLoad calls:
        packageStartupMessage(AnnotationDbi:::annoStartupMessages("org.EcSakai.eg"))
    
    See section ‘Good practice’ in '?.onAttach'.
    ```

# org.Gg.eg.db

Version: 3.4.1

## In both

*   checking installed package size ... NOTE
    ```
      installed size is 35.7Mb
      sub-directories of 1Mb or more:
        extdata  35.6Mb
    ```

*   checking DESCRIPTION meta-information ... NOTE
    ```
    Packages listed in more than one of Depends, Imports, Suggests, Enhances:
      ‘methods’ ‘AnnotationDbi’
    A package should be listed in only one of these fields.
    ```

*   checking R code for possible problems ... NOTE
    ```
    File ‘org.Gg.eg.db/R/zzz.R’:
      .onLoad calls:
        packageStartupMessage(AnnotationDbi:::annoStartupMessages("org.Gg.eg"))
    
    See section ‘Good practice’ in '?.onAttach'.
    ```

# org.Hs.eg.db

Version: 3.4.1

## In both

*   checking installed package size ... NOTE
    ```
      installed size is 277.5Mb
      sub-directories of 1Mb or more:
        extdata  277.4Mb
    ```

*   checking DESCRIPTION meta-information ... NOTE
    ```
    Packages listed in more than one of Depends, Imports, Suggests, Enhances:
      ‘methods’ ‘AnnotationDbi’
    A package should be listed in only one of these fields.
    ```

*   checking R code for possible problems ... NOTE
    ```
    File ‘org.Hs.eg.db/R/zzz.R’:
      .onLoad calls:
        packageStartupMessage(AnnotationDbi:::annoStartupMessages("org.Hs.eg"))
    
    See section ‘Good practice’ in '?.onAttach'.
    ```

# org.Mm.eg.db

Version: 3.4.1

## In both

*   checking installed package size ... NOTE
    ```
      installed size is 254.7Mb
      sub-directories of 1Mb or more:
        extdata  254.5Mb
    ```

*   checking DESCRIPTION meta-information ... NOTE
    ```
    Packages listed in more than one of Depends, Imports, Suggests, Enhances:
      ‘methods’ ‘AnnotationDbi’
    A package should be listed in only one of these fields.
    ```

*   checking R code for possible problems ... NOTE
    ```
    File ‘org.Mm.eg.db/R/zzz.R’:
      .onLoad calls:
        packageStartupMessage(AnnotationDbi:::annoStartupMessages("org.Mm.eg"))
    
    See section ‘Good practice’ in '?.onAttach'.
    ```

# org.Mmu.eg.db

Version: 3.4.1

## In both

*   checking installed package size ... NOTE
    ```
      installed size is 81.7Mb
      sub-directories of 1Mb or more:
        extdata  81.6Mb
    ```

*   checking DESCRIPTION meta-information ... NOTE
    ```
    Packages listed in more than one of Depends, Imports, Suggests, Enhances:
      ‘methods’ ‘AnnotationDbi’
    A package should be listed in only one of these fields.
    ```

*   checking R code for possible problems ... NOTE
    ```
    File ‘org.Mmu.eg.db/R/zzz.R’:
      .onLoad calls:
        packageStartupMessage(AnnotationDbi:::annoStartupMessages("org.Mmu.eg"))
    
    See section ‘Good practice’ in '?.onAttach'.
    ```

# org.Pf.plasmo.db

Version: 3.4.1

## In both

*   checking installed package size ... NOTE
    ```
      installed size is 15.8Mb
      sub-directories of 1Mb or more:
        extdata  15.7Mb
    ```

*   checking DESCRIPTION meta-information ... NOTE
    ```
    Packages listed in more than one of Depends, Imports, Suggests, Enhances:
      ‘methods’ ‘AnnotationDbi’
    A package should be listed in only one of these fields.
    ```

*   checking R code for possible problems ... NOTE
    ```
    File ‘org.Pf.plasmo.db/R/zzz.R’:
      .onLoad calls:
        packageStartupMessage(AnnotationDbi:::annoStartupMessages("org.Pf.plasmo.db"))
    
    See section ‘Good practice’ in '?.onAttach'.
    ```

# org.Pt.eg.db

Version: 3.4.1

## In both

*   checking installed package size ... NOTE
    ```
      installed size is 80.9Mb
      sub-directories of 1Mb or more:
        extdata  80.7Mb
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

# org.Rn.eg.db

Version: 3.4.1

## In both

*   checking installed package size ... NOTE
    ```
      installed size is 253.2Mb
      sub-directories of 1Mb or more:
        extdata  253.0Mb
    ```

*   checking DESCRIPTION meta-information ... NOTE
    ```
    Packages listed in more than one of Depends, Imports, Suggests, Enhances:
      ‘methods’ ‘AnnotationDbi’
    A package should be listed in only one of these fields.
    ```

*   checking R code for possible problems ... NOTE
    ```
    File ‘org.Rn.eg.db/R/zzz.R’:
      .onLoad calls:
        packageStartupMessage(AnnotationDbi:::annoStartupMessages("org.Rn.eg"))
    
    See section ‘Good practice’ in '?.onAttach'.
    ```

# org.Sc.sgd.db

Version: 3.4.1

## In both

*   checking for missing documentation entries ... WARNING
    ```
    Undocumented code objects:
      ‘org.Sc.sgdPFAM’
    All user-level objects in a package should have documentation entries.
    See chapter ‘Writing R documentation files’ in the ‘Writing R
    Extensions’ manual.
    ```

*   checking installed package size ... NOTE
    ```
      installed size is 88.7Mb
      sub-directories of 1Mb or more:
        extdata  88.6Mb
    ```

*   checking DESCRIPTION meta-information ... NOTE
    ```
    Packages listed in more than one of Depends, Imports, Suggests, Enhances:
      ‘methods’ ‘AnnotationDbi’
    A package should be listed in only one of these fields.
    ```

*   checking R code for possible problems ... NOTE
    ```
    File ‘org.Sc.sgd.db/R/zzz.R’:
      .onLoad calls:
        packageStartupMessage(AnnotationDbi:::annoStartupMessages("org.Sc.sgd.db"))
    
    See section ‘Good practice’ in '?.onAttach'.
    ```

# org.Ss.eg.db

Version: 3.4.1

## In both

*   checking installed package size ... NOTE
    ```
      installed size is 53.8Mb
      sub-directories of 1Mb or more:
        extdata  53.6Mb
    ```

*   checking DESCRIPTION meta-information ... NOTE
    ```
    Packages listed in more than one of Depends, Imports, Suggests, Enhances:
      ‘methods’ ‘AnnotationDbi’
    A package should be listed in only one of these fields.
    ```

*   checking R code for possible problems ... NOTE
    ```
    File ‘org.Ss.eg.db/R/zzz.R’:
      .onLoad calls:
        packageStartupMessage(AnnotationDbi:::annoStartupMessages("org.Ss.eg"))
    
    See section ‘Good practice’ in '?.onAttach'.
    ```

# org.Xl.eg.db

Version: 3.4.1

## In both

*   checking installed package size ... NOTE
    ```
      installed size is 39.7Mb
      sub-directories of 1Mb or more:
        extdata  39.6Mb
    ```

*   checking DESCRIPTION meta-information ... NOTE
    ```
    Packages listed in more than one of Depends, Imports, Suggests, Enhances:
      ‘methods’ ‘AnnotationDbi’
    A package should be listed in only one of these fields.
    ```

*   checking R code for possible problems ... NOTE
    ```
    File ‘org.Xl.eg.db/R/zzz.R’:
      .onLoad calls:
        packageStartupMessage(AnnotationDbi:::annoStartupMessages("org.Xl.eg"))
    
    See section ‘Good practice’ in '?.onAttach'.
    ```

# Organism.dplyr

Version: 1.2.2

## In both

*   checking re-building of vignette outputs ... WARNING
    ```
    Error in re-building vignettes:
      ...
    Error: processing vignette 'Organism.dplyr.Rmd' failed with diagnostics:
    path for html_dependency not found: 
    Execution halted
    ```

*   checking dependencies in R code ... NOTE
    ```
    Unexported objects imported by ':::' calls:
      ‘AnnotationDbi:::smartKeys’ ‘GenomicFeatures:::.exons_with_3utr’
      ‘GenomicFeatures:::.exons_with_5utr’
      ‘GenomicFeatures:::get_TxDb_seqinfo0’
      ‘S4Vectors:::extract_data_frame_rows’
      See the note in ?`:::` about the use of this operator.
    ```

# OrganismDbi

Version: 1.18.1

## In both

*   checking examples ... ERROR
    ```
    ...
    +     "uc009uzf.1",
    +     "uc009uzg.1",
    +     "uc009uzh.1",
    +     "uc009uzi.1",
    +     "uc009uzj.1"
    + )
    > txdbMouse <- makeTxDbFromUCSC(genome="mm9", tablename="knownGene",
    +                           transcript_ids=transcript_ids)
    Download the knownGene table ... OK
    Download the knownToLocusLink table ... OK
    Extract the 'transcripts' data frame ... OK
    Extract the 'splicings' data frame ... OK
    Download and preprocess the 'chrominfo' data frame ... OK
    Prepare the 'metadata' data frame ... OK
    Make the TxDb object ... OK
    > 
    > ## Using that, we can call our function to promote it to an OrgDb object:
    > odb <- makeOrganismDbFromTxDb(txdb=txdbMouse)
    Error in loadNamespace(pkg) : there is no package called ‘org.Mm.eg.db’
    Calls: makeOrganismDbFromTxDb -> <Anonymous> -> loadNamespace
    Execution halted
    ```

*   checking tests ...
    ```
     ERROR
    Running the tests in ‘tests/OrganismDbi_unit_tests.R’ failed.
    Last 13 lines of output:
       
      1 Test Suite : 
      OrganismDbi RUnit Tests - 42 test functions, 1 error, 0 failures
      ERROR in test_microRNAs: Error in loadNamespace("mirbase.db") : 
        there is no package called 'mirbase.db'
      
      Test files with failing tests
      
         test_wrappedFuns.R 
           test_microRNAs 
      
      
      Error in BiocGenerics:::testPackage("OrganismDbi") : 
        unit tests failed for package OrganismDbi
      Execution halted
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

# PAnnBuilder

Version: 1.40.0

## In both

*   checking DESCRIPTION meta-information ... NOTE
    ```
    Packages listed in more than one of Depends, Imports, Suggests, Enhances:
      ‘methods’ ‘utils’ ‘Biobase’ ‘RSQLite’ ‘AnnotationDbi’
    A package should be listed in only one of these fields.
    ```

*   checking dependencies in R code ... NOTE
    ```
    'library' or 'require' call to ‘Biobase’ which was already attached by Depends.
      Please remove these calls from your code.
    ':::' calls which should be '::':
      ‘AnnotationDbi:::as.list’ ‘base:::get’ ‘tools:::list_files_with_type’
      See the note in ?`:::` about the use of this operator.
    Unexported objects imported by ':::' calls:
      ‘AnnotationDbi:::createAnnDbBimaps’
      ‘AnnotationDbi:::prefixAnnObjNames’ ‘tools:::makeLazyLoadDB’
      See the note in ?`:::` about the use of this operator.
    There are ::: calls to the package's namespace in its code. A package
      almost never needs to use ::: for its own objects:
      ‘getShortSciName’ ‘twoStepSplit’
    ```

*   checking R code for possible problems ... NOTE
    ```
    File ‘PAnnBuilder/R/zzz.R’:
      .onLoad calls:
        require(Biobase)
    
    Package startup functions should not change the search path.
    See section ‘Good practice’ in '?.onAttach'.
    ```

*   checking re-building of vignette outputs ... NOTE
    ```
    ...
    Content type 'text/html; charset=iso-8859-1' length 5062 bytes
    ==================================================
    downloaded 5062 bytes
    
    Warning: Closing open result set, pending rows
    Warning: Closing open result set, pending rows
    Warning: Closing open result set, pending rows
    Warning: Closing open result set, pending rows
    Warning: Closing open result set, pending rows
    Warning: Closing open result set, pending rows
    Warning in rsqlite_disconnect(conn@ptr) :
      There are 1 result in use. The connection will be released when they are closed
    Error in texi2dvi(file = file, pdf = TRUE, clean = clean, quiet = quiet,  : 
      Running 'texi2dvi' on 'PAnnBuilder.tex' failed.
    LaTeX errors:
    ! Package auto-pst-pdf Error: 
        "shell escape" (or "write18") is not enabled:
        auto-pst-pdf will not work!
    .
    Calls: buildVignettes -> texi2pdf -> texi2dvi
    Execution halted
    ```

# PartheenMetaData.db

Version: 3.2.3

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

# pd.081229.hg18.promoter.medip.hx1

Version: 0.99.4

## In both

*   checking package dependencies ... ERROR
    ```
    Namespace dependency not required: ‘S4Vectors’
    
    See section ‘The DESCRIPTION file’ in the ‘Writing R Extensions’
    manual.
    ```

# pd.2006.07.18.hg18.refseq.promoter

Version: 1.8.1

## In both

*   checking package dependencies ... ERROR
    ```
    Namespace dependency not required: ‘S4Vectors’
    
    See section ‘The DESCRIPTION file’ in the ‘Writing R Extensions’
    manual.
    ```

# pd.2006.07.18.mm8.refseq.promoter

Version: 0.99.3

## In both

*   checking package dependencies ... ERROR
    ```
    Namespace dependency not required: ‘S4Vectors’
    
    See section ‘The DESCRIPTION file’ in the ‘Writing R Extensions’
    manual.
    ```

# pd.2006.10.31.rn34.refseq.promoter

Version: 0.99.3

## In both

*   checking package dependencies ... ERROR
    ```
    Namespace dependency not required: ‘S4Vectors’
    
    See section ‘The DESCRIPTION file’ in the ‘Writing R Extensions’
    manual.
    ```

# pd.ag

Version: 3.12.0

## In both

*   checking whether package ‘pd.ag’ can be installed ... WARNING
    ```
    Found the following significant warnings:
      Warning: call dbDisconnect() when finished working with a connection
    See ‘/home/muelleki/git/R/DBI/revdep/checks/pd.ag/new/pd.ag.Rcheck/00install.out’ for details.
    ```

*   checking whether the namespace can be unloaded cleanly ... WARNING
    ```
    ---- unloading
    Warning message:
    .onUnload failed in unloadNamespace() for 'pd.ag', details:
      call: rsqlite_connection_valid(dbObj@ptr)
      error: external pointer is not valid 
    ```

*   checking package dependencies ... NOTE
    ```
    Depends: includes the non-default packages:
      ‘Biostrings’ ‘RSQLite’ ‘oligoClasses’ ‘oligo’ ‘DBI’ ‘IRanges’
      ‘S4Vectors’
    Adding so many packages to the search path is excessive and importing
    selectively is preferable.
    ```

*   checking installed package size ... NOTE
    ```
      installed size is  9.0Mb
      sub-directories of 1Mb or more:
        extdata   8.1Mb
    ```

*   checking DESCRIPTION meta-information ... NOTE
    ```
    Malformed Description field: should contain one or more complete sentences.
    ```

*   checking dependencies in R code ... NOTE
    ```
    Packages in Depends field not imported from:
      ‘IRanges’ ‘methods’ ‘oligo’ ‘oligoClasses’
      These packages need to be imported from (in the NAMESPACE file)
      for when this namespace is loaded but not attached.
    ```

# pd.aragene.1.0.st

Version: 3.12.0

## In both

*   checking whether the namespace can be unloaded cleanly ... WARNING
    ```
    ---- unloading
    Warning message:
    .onUnload failed in unloadNamespace() for 'pd.aragene.1.0.st', details:
      call: rsqlite_connection_valid(dbObj@ptr)
      error: external pointer is not valid 
    ```

*   checking package dependencies ... NOTE
    ```
    Depends: includes the non-default packages:
      ‘Biostrings’ ‘RSQLite’ ‘oligoClasses’ ‘oligo’ ‘DBI’ ‘IRanges’
      ‘S4Vectors’
    Adding so many packages to the search path is excessive and importing
    selectively is preferable.
    ```

*   checking installed package size ... NOTE
    ```
      installed size is 65.1Mb
      sub-directories of 1Mb or more:
        data      4.6Mb
        extdata  60.3Mb
    ```

*   checking DESCRIPTION meta-information ... NOTE
    ```
    Malformed Description field: should contain one or more complete sentences.
    ```

*   checking dependencies in R code ... NOTE
    ```
    Packages in Depends field not imported from:
      ‘IRanges’ ‘methods’ ‘oligo’ ‘oligoClasses’
      These packages need to be imported from (in the NAMESPACE file)
      for when this namespace is loaded but not attached.
    ```

# pd.aragene.1.1.st

Version: 3.12.0

## In both

*   checking whether the namespace can be unloaded cleanly ... WARNING
    ```
    ---- unloading
    Warning message:
    .onUnload failed in unloadNamespace() for 'pd.aragene.1.1.st', details:
      call: rsqlite_connection_valid(dbObj@ptr)
      error: external pointer is not valid 
    ```

*   checking package dependencies ... NOTE
    ```
    Depends: includes the non-default packages:
      ‘Biostrings’ ‘RSQLite’ ‘oligoClasses’ ‘oligo’ ‘DBI’ ‘IRanges’
      ‘S4Vectors’
    Adding so many packages to the search path is excessive and importing
    selectively is preferable.
    ```

*   checking installed package size ... NOTE
    ```
      installed size is 64.9Mb
      sub-directories of 1Mb or more:
        data      4.4Mb
        extdata  60.3Mb
    ```

*   checking DESCRIPTION meta-information ... NOTE
    ```
    Malformed Description field: should contain one or more complete sentences.
    ```

*   checking dependencies in R code ... NOTE
    ```
    Packages in Depends field not imported from:
      ‘IRanges’ ‘methods’ ‘oligo’ ‘oligoClasses’
      These packages need to be imported from (in the NAMESPACE file)
      for when this namespace is loaded but not attached.
    ```

# pd.atdschip.tiling

Version: 0.14.0

## In both

*   checking for GNU extensions in Makefiles ... WARNING
    ```
    Found the following file(s) containing GNU extensions:
      inst/UnitTests/Makefile
    Portable Makefiles do not use GNU extensions such as +=, :=, $(shell),
    $(wildcard), ifeq ... endif. See section ‘Writing portable packages’ in
    the ‘Writing R Extensions’ manual.
    ```

*   checking installed package size ... NOTE
    ```
      installed size is 256.4Mb
      sub-directories of 1Mb or more:
        data      43.3Mb
        extdata  213.0Mb
    ```

*   checking DESCRIPTION meta-information ... NOTE
    ```
    Malformed Description field: should contain one or more complete sentences.
    ```

*   checking dependencies in R code ... NOTE
    ```
    'library' or 'require' call to ‘RSQLite’ which was already attached by Depends.
      Please remove these calls from your code.
    Namespace in Imports field not imported from: ‘IRanges’
      All declared Imports should be used.
    Packages in Depends field not imported from:
      ‘methods’ ‘oligo’ ‘oligoClasses’
      These packages need to be imported from (in the NAMESPACE file)
      for when this namespace is loaded but not attached.
    ```

*   checking R code for possible problems ... NOTE
    ```
    File ‘pd.atdschip.tiling/R/all.R’:
      .onLoad calls:
        require(RSQLite, quietly = TRUE)
    
    Package startup functions should not change the search path.
    See section ‘Good practice’ in '?.onAttach'.
    ```

# pd.ath1.121501

Version: 3.12.0

## In both

*   checking whether the namespace can be unloaded cleanly ... WARNING
    ```
    ---- unloading
    Warning message:
    .onUnload failed in unloadNamespace() for 'pd.ath1.121501', details:
      call: rsqlite_connection_valid(dbObj@ptr)
      error: external pointer is not valid 
    ```

*   checking package dependencies ... NOTE
    ```
    Depends: includes the non-default packages:
      ‘Biostrings’ ‘RSQLite’ ‘oligoClasses’ ‘oligo’ ‘DBI’ ‘IRanges’
      ‘S4Vectors’
    Adding so many packages to the search path is excessive and importing
    selectively is preferable.
    ```

*   checking installed package size ... NOTE
    ```
      installed size is 17.0Mb
      sub-directories of 1Mb or more:
        data      1.6Mb
        extdata  15.3Mb
    ```

*   checking DESCRIPTION meta-information ... NOTE
    ```
    Malformed Description field: should contain one or more complete sentences.
    ```

*   checking dependencies in R code ... NOTE
    ```
    Packages in Depends field not imported from:
      ‘IRanges’ ‘methods’ ‘oligo’ ‘oligoClasses’
      These packages need to be imported from (in the NAMESPACE file)
      for when this namespace is loaded but not attached.
    ```

# pd.barley1

Version: 3.12.0

## In both

*   checking whether the namespace can be unloaded cleanly ... WARNING
    ```
    ---- unloading
    Warning message:
    .onUnload failed in unloadNamespace() for 'pd.barley1', details:
      call: rsqlite_connection_valid(dbObj@ptr)
      error: external pointer is not valid 
    ```

*   checking package dependencies ... NOTE
    ```
    Depends: includes the non-default packages:
      ‘Biostrings’ ‘RSQLite’ ‘oligoClasses’ ‘oligo’ ‘DBI’ ‘IRanges’
      ‘S4Vectors’
    Adding so many packages to the search path is excessive and importing
    selectively is preferable.
    ```

*   checking installed package size ... NOTE
    ```
      installed size is 17.2Mb
      sub-directories of 1Mb or more:
        data      1.6Mb
        extdata  15.4Mb
    ```

*   checking DESCRIPTION meta-information ... NOTE
    ```
    Malformed Description field: should contain one or more complete sentences.
    ```

*   checking dependencies in R code ... NOTE
    ```
    Packages in Depends field not imported from:
      ‘IRanges’ ‘methods’ ‘oligo’ ‘oligoClasses’
      These packages need to be imported from (in the NAMESPACE file)
      for when this namespace is loaded but not attached.
    ```

# pd.bovgene.1.0.st

Version: 3.12.0

## In both

*   checking whether the namespace can be unloaded cleanly ... WARNING
    ```
    ---- unloading
    Warning message:
    .onUnload failed in unloadNamespace() for 'pd.bovgene.1.0.st', details:
      call: rsqlite_connection_valid(dbObj@ptr)
      error: external pointer is not valid 
    ```

*   checking package dependencies ... NOTE
    ```
    Depends: includes the non-default packages:
      ‘Biostrings’ ‘RSQLite’ ‘oligoClasses’ ‘oligo’ ‘DBI’ ‘IRanges’
      ‘S4Vectors’
    Adding so many packages to the search path is excessive and importing
    selectively is preferable.
    ```

*   checking installed package size ... NOTE
    ```
      installed size is 64.4Mb
      sub-directories of 1Mb or more:
        data      4.0Mb
        extdata  60.3Mb
    ```

*   checking DESCRIPTION meta-information ... NOTE
    ```
    Malformed Description field: should contain one or more complete sentences.
    ```

*   checking dependencies in R code ... NOTE
    ```
    Packages in Depends field not imported from:
      ‘IRanges’ ‘methods’ ‘oligo’ ‘oligoClasses’
      These packages need to be imported from (in the NAMESPACE file)
      for when this namespace is loaded but not attached.
    ```

# pd.bovgene.1.1.st

Version: 3.12.0

## In both

*   checking whether the namespace can be unloaded cleanly ... WARNING
    ```
    ---- unloading
    Warning message:
    .onUnload failed in unloadNamespace() for 'pd.bovgene.1.1.st', details:
      call: rsqlite_connection_valid(dbObj@ptr)
      error: external pointer is not valid 
    ```

*   checking package dependencies ... NOTE
    ```
    Depends: includes the non-default packages:
      ‘Biostrings’ ‘RSQLite’ ‘oligoClasses’ ‘oligo’ ‘DBI’ ‘IRanges’
      ‘S4Vectors’
    Adding so many packages to the search path is excessive and importing
    selectively is preferable.
    ```

*   checking installed package size ... NOTE
    ```
      installed size is 64.4Mb
      sub-directories of 1Mb or more:
        data      4.0Mb
        extdata  60.3Mb
    ```

*   checking DESCRIPTION meta-information ... NOTE
    ```
    Malformed Description field: should contain one or more complete sentences.
    ```

*   checking dependencies in R code ... NOTE
    ```
    Packages in Depends field not imported from:
      ‘IRanges’ ‘methods’ ‘oligo’ ‘oligoClasses’
      These packages need to be imported from (in the NAMESPACE file)
      for when this namespace is loaded but not attached.
    ```

# pd.bovine

Version: 3.12.0

## In both

*   checking whether the namespace can be unloaded cleanly ... WARNING
    ```
    ---- unloading
    Warning message:
    .onUnload failed in unloadNamespace() for 'pd.bovine', details:
      call: rsqlite_connection_valid(dbObj@ptr)
      error: external pointer is not valid 
    ```

*   checking package dependencies ... NOTE
    ```
    Depends: includes the non-default packages:
      ‘Biostrings’ ‘RSQLite’ ‘oligoClasses’ ‘oligo’ ‘DBI’ ‘IRanges’
      ‘S4Vectors’
    Adding so many packages to the search path is excessive and importing
    selectively is preferable.
    ```

*   checking installed package size ... NOTE
    ```
      installed size is 18.2Mb
      sub-directories of 1Mb or more:
        data      1.7Mb
        extdata  16.3Mb
    ```

*   checking DESCRIPTION meta-information ... NOTE
    ```
    Malformed Description field: should contain one or more complete sentences.
    ```

*   checking dependencies in R code ... NOTE
    ```
    Packages in Depends field not imported from:
      ‘IRanges’ ‘methods’ ‘oligo’ ‘oligoClasses’
      These packages need to be imported from (in the NAMESPACE file)
      for when this namespace is loaded but not attached.
    ```

# pd.bsubtilis

Version: 3.12.0

## In both

*   checking whether package ‘pd.bsubtilis’ can be installed ... WARNING
    ```
    Found the following significant warnings:
      Warning: call dbDisconnect() when finished working with a connection
    See ‘/home/muelleki/git/R/DBI/revdep/checks/pd.bsubtilis/new/pd.bsubtilis.Rcheck/00install.out’ for details.
    ```

*   checking whether the namespace can be unloaded cleanly ... WARNING
    ```
    ---- unloading
    Warning message:
    .onUnload failed in unloadNamespace() for 'pd.bsubtilis', details:
      call: rsqlite_connection_valid(dbObj@ptr)
      error: external pointer is not valid 
    ```

*   checking package dependencies ... NOTE
    ```
    Depends: includes the non-default packages:
      ‘Biostrings’ ‘RSQLite’ ‘oligoClasses’ ‘oligo’ ‘DBI’ ‘IRanges’
      ‘S4Vectors’
    Adding so many packages to the search path is excessive and importing
    selectively is preferable.
    ```

*   checking installed package size ... NOTE
    ```
      installed size is  6.9Mb
      sub-directories of 1Mb or more:
        extdata   6.2Mb
    ```

*   checking DESCRIPTION meta-information ... NOTE
    ```
    Malformed Description field: should contain one or more complete sentences.
    ```

*   checking dependencies in R code ... NOTE
    ```
    Packages in Depends field not imported from:
      ‘IRanges’ ‘methods’ ‘oligo’ ‘oligoClasses’
      These packages need to be imported from (in the NAMESPACE file)
      for when this namespace is loaded but not attached.
    ```

# pd.cangene.1.0.st

Version: 3.12.0

## In both

*   checking whether the namespace can be unloaded cleanly ... WARNING
    ```
    ---- unloading
    Warning message:
    .onUnload failed in unloadNamespace() for 'pd.cangene.1.0.st', details:
      call: rsqlite_connection_valid(dbObj@ptr)
      error: external pointer is not valid 
    ```

*   checking package dependencies ... NOTE
    ```
    Depends: includes the non-default packages:
      ‘Biostrings’ ‘RSQLite’ ‘oligoClasses’ ‘oligo’ ‘DBI’ ‘IRanges’
      ‘S4Vectors’
    Adding so many packages to the search path is excessive and importing
    selectively is preferable.
    ```

*   checking installed package size ... NOTE
    ```
      installed size is 60.8Mb
      sub-directories of 1Mb or more:
        data      4.5Mb
        extdata  56.2Mb
    ```

*   checking DESCRIPTION meta-information ... NOTE
    ```
    Malformed Description field: should contain one or more complete sentences.
    ```

*   checking dependencies in R code ... NOTE
    ```
    Packages in Depends field not imported from:
      ‘IRanges’ ‘methods’ ‘oligo’ ‘oligoClasses’
      These packages need to be imported from (in the NAMESPACE file)
      for when this namespace is loaded but not attached.
    ```

# pd.cangene.1.1.st

Version: 3.12.0

## In both

*   checking whether the namespace can be unloaded cleanly ... WARNING
    ```
    ---- unloading
    Warning message:
    .onUnload failed in unloadNamespace() for 'pd.cangene.1.1.st', details:
      call: rsqlite_connection_valid(dbObj@ptr)
      error: external pointer is not valid 
    ```

*   checking package dependencies ... NOTE
    ```
    Depends: includes the non-default packages:
      ‘Biostrings’ ‘RSQLite’ ‘oligoClasses’ ‘oligo’ ‘DBI’ ‘IRanges’
      ‘S4Vectors’
    Adding so many packages to the search path is excessive and importing
    selectively is preferable.
    ```

*   checking installed package size ... NOTE
    ```
      installed size is 60.7Mb
      sub-directories of 1Mb or more:
        data      4.4Mb
        extdata  56.2Mb
    ```

*   checking DESCRIPTION meta-information ... NOTE
    ```
    Malformed Description field: should contain one or more complete sentences.
    ```

*   checking dependencies in R code ... NOTE
    ```
    Packages in Depends field not imported from:
      ‘IRanges’ ‘methods’ ‘oligo’ ‘oligoClasses’
      These packages need to be imported from (in the NAMESPACE file)
      for when this namespace is loaded but not attached.
    ```

# pd.canine

Version: 3.12.0

## In both

*   checking whether the namespace can be unloaded cleanly ... WARNING
    ```
    ---- unloading
    Warning message:
    .onUnload failed in unloadNamespace() for 'pd.canine', details:
      call: rsqlite_connection_valid(dbObj@ptr)
      error: external pointer is not valid 
    ```

*   checking package dependencies ... NOTE
    ```
    Depends: includes the non-default packages:
      ‘Biostrings’ ‘RSQLite’ ‘oligoClasses’ ‘oligo’ ‘DBI’ ‘IRanges’
      ‘S4Vectors’
    Adding so many packages to the search path is excessive and importing
    selectively is preferable.
    ```

*   checking installed package size ... NOTE
    ```
      installed size is 17.9Mb
      sub-directories of 1Mb or more:
        data      1.7Mb
        extdata  16.1Mb
    ```

*   checking DESCRIPTION meta-information ... NOTE
    ```
    Malformed Description field: should contain one or more complete sentences.
    ```

*   checking dependencies in R code ... NOTE
    ```
    Packages in Depends field not imported from:
      ‘IRanges’ ‘methods’ ‘oligo’ ‘oligoClasses’
      These packages need to be imported from (in the NAMESPACE file)
      for when this namespace is loaded but not attached.
    ```

# pd.canine.2

Version: 3.12.0

## In both

*   checking whether the namespace can be unloaded cleanly ... WARNING
    ```
    ---- unloading
    Warning message:
    .onUnload failed in unloadNamespace() for 'pd.canine.2', details:
      call: rsqlite_connection_valid(dbObj@ptr)
      error: external pointer is not valid 
    ```

*   checking package dependencies ... NOTE
    ```
    Depends: includes the non-default packages:
      ‘Biostrings’ ‘RSQLite’ ‘oligoClasses’ ‘oligo’ ‘DBI’ ‘IRanges’
      ‘S4Vectors’
    Adding so many packages to the search path is excessive and importing
    selectively is preferable.
    ```

*   checking installed package size ... NOTE
    ```
      installed size is 32.5Mb
      sub-directories of 1Mb or more:
        data      2.8Mb
        extdata  29.5Mb
    ```

*   checking DESCRIPTION meta-information ... NOTE
    ```
    Malformed Description field: should contain one or more complete sentences.
    ```

*   checking dependencies in R code ... NOTE
    ```
    Packages in Depends field not imported from:
      ‘IRanges’ ‘methods’ ‘oligo’ ‘oligoClasses’
      These packages need to be imported from (in the NAMESPACE file)
      for when this namespace is loaded but not attached.
    ```

# pd.celegans

Version: 3.12.0

## In both

*   checking whether the namespace can be unloaded cleanly ... WARNING
    ```
    ---- unloading
    Warning message:
    .onUnload failed in unloadNamespace() for 'pd.celegans', details:
      call: rsqlite_connection_valid(dbObj@ptr)
      error: external pointer is not valid 
    ```

*   checking package dependencies ... NOTE
    ```
    Depends: includes the non-default packages:
      ‘Biostrings’ ‘RSQLite’ ‘oligoClasses’ ‘oligo’ ‘DBI’ ‘IRanges’
      ‘S4Vectors’
    Adding so many packages to the search path is excessive and importing
    selectively is preferable.
    ```

*   checking installed package size ... NOTE
    ```
      installed size is 17.0Mb
      sub-directories of 1Mb or more:
        data      1.6Mb
        extdata  15.3Mb
    ```

*   checking DESCRIPTION meta-information ... NOTE
    ```
    Malformed Description field: should contain one or more complete sentences.
    ```

*   checking dependencies in R code ... NOTE
    ```
    Packages in Depends field not imported from:
      ‘IRanges’ ‘methods’ ‘oligo’ ‘oligoClasses’
      These packages need to be imported from (in the NAMESPACE file)
      for when this namespace is loaded but not attached.
    ```

# pd.charm.hg18.example

Version: 0.99.4

## In both

*   checking package dependencies ... ERROR
    ```
    Namespace dependency not required: ‘S4Vectors’
    
    See section ‘The DESCRIPTION file’ in the ‘Writing R Extensions’
    manual.
    ```

# pd.chicken

Version: 3.12.0

## In both

*   checking whether the namespace can be unloaded cleanly ... WARNING
    ```
    ---- unloading
    Warning message:
    .onUnload failed in unloadNamespace() for 'pd.chicken', details:
      call: rsqlite_connection_valid(dbObj@ptr)
      error: external pointer is not valid 
    ```

*   checking package dependencies ... NOTE
    ```
    Depends: includes the non-default packages:
      ‘Biostrings’ ‘RSQLite’ ‘oligoClasses’ ‘oligo’ ‘DBI’ ‘IRanges’
      ‘S4Vectors’
    Adding so many packages to the search path is excessive and importing
    selectively is preferable.
    ```

*   checking installed package size ... NOTE
    ```
      installed size is 29.1Mb
      sub-directories of 1Mb or more:
        data      2.6Mb
        extdata  26.3Mb
    ```

*   checking DESCRIPTION meta-information ... NOTE
    ```
    Malformed Description field: should contain one or more complete sentences.
    ```

*   checking dependencies in R code ... NOTE
    ```
    Packages in Depends field not imported from:
      ‘IRanges’ ‘methods’ ‘oligo’ ‘oligoClasses’
      These packages need to be imported from (in the NAMESPACE file)
      for when this namespace is loaded but not attached.
    ```

# pd.chigene.1.0.st

Version: 3.12.0

## In both

*   checking whether the namespace can be unloaded cleanly ... WARNING
    ```
    ---- unloading
    Warning message:
    .onUnload failed in unloadNamespace() for 'pd.chigene.1.0.st', details:
      call: rsqlite_connection_valid(dbObj@ptr)
      error: external pointer is not valid 
    ```

*   checking package dependencies ... NOTE
    ```
    Depends: includes the non-default packages:
      ‘Biostrings’ ‘RSQLite’ ‘oligoClasses’ ‘oligo’ ‘DBI’ ‘IRanges’
      ‘S4Vectors’
    Adding so many packages to the search path is excessive and importing
    selectively is preferable.
    ```

*   checking installed package size ... NOTE
    ```
      installed size is 45.6Mb
      sub-directories of 1Mb or more:
        data      3.4Mb
        extdata  42.1Mb
    ```

*   checking DESCRIPTION meta-information ... NOTE
    ```
    Malformed Description field: should contain one or more complete sentences.
    ```

*   checking dependencies in R code ... NOTE
    ```
    Packages in Depends field not imported from:
      ‘IRanges’ ‘methods’ ‘oligo’ ‘oligoClasses’
      These packages need to be imported from (in the NAMESPACE file)
      for when this namespace is loaded but not attached.
    ```

# pd.chigene.1.1.st

Version: 3.12.0

## In both

*   checking whether the namespace can be unloaded cleanly ... WARNING
    ```
    ---- unloading
    Warning message:
    .onUnload failed in unloadNamespace() for 'pd.chigene.1.1.st', details:
      call: rsqlite_connection_valid(dbObj@ptr)
      error: external pointer is not valid 
    ```

*   checking package dependencies ... NOTE
    ```
    Depends: includes the non-default packages:
      ‘Biostrings’ ‘RSQLite’ ‘oligoClasses’ ‘oligo’ ‘DBI’ ‘IRanges’
      ‘S4Vectors’
    Adding so many packages to the search path is excessive and importing
    selectively is preferable.
    ```

*   checking installed package size ... NOTE
    ```
      installed size is 45.5Mb
      sub-directories of 1Mb or more:
        data      3.3Mb
        extdata  42.1Mb
    ```

*   checking DESCRIPTION meta-information ... NOTE
    ```
    Malformed Description field: should contain one or more complete sentences.
    ```

*   checking dependencies in R code ... NOTE
    ```
    Packages in Depends field not imported from:
      ‘IRanges’ ‘methods’ ‘oligo’ ‘oligoClasses’
      These packages need to be imported from (in the NAMESPACE file)
      for when this namespace is loaded but not attached.
    ```

# pd.chogene.2.0.st

Version: 3.12.0

## In both

*   checking whether the namespace can be unloaded cleanly ... WARNING
    ```
    ---- unloading
    Warning message:
    .onUnload failed in unloadNamespace() for 'pd.chogene.2.0.st', details:
      call: rsqlite_connection_valid(dbObj@ptr)
      error: external pointer is not valid 
    ```

*   checking package dependencies ... NOTE
    ```
    Depends: includes the non-default packages:
      ‘Biostrings’ ‘RSQLite’ ‘oligoClasses’ ‘oligo’ ‘DBI’ ‘IRanges’
      ‘S4Vectors’
    Adding so many packages to the search path is excessive and importing
    selectively is preferable.
    ```

*   checking installed package size ... NOTE
    ```
      installed size is 52.9Mb
      sub-directories of 1Mb or more:
        data      4.8Mb
        extdata  48.0Mb
    ```

*   checking DESCRIPTION meta-information ... NOTE
    ```
    Malformed Description field: should contain one or more complete sentences.
    ```

*   checking dependencies in R code ... NOTE
    ```
    Packages in Depends field not imported from:
      ‘IRanges’ ‘methods’ ‘oligo’ ‘oligoClasses’
      These packages need to be imported from (in the NAMESPACE file)
      for when this namespace is loaded but not attached.
    ```

# pd.chogene.2.1.st

Version: 3.12.0

## In both

*   checking whether the namespace can be unloaded cleanly ... WARNING
    ```
    ---- unloading
    Warning message:
    .onUnload failed in unloadNamespace() for 'pd.chogene.2.1.st', details:
      call: rsqlite_connection_valid(dbObj@ptr)
      error: external pointer is not valid 
    ```

*   checking package dependencies ... NOTE
    ```
    Depends: includes the non-default packages:
      ‘Biostrings’ ‘RSQLite’ ‘oligoClasses’ ‘oligo’ ‘DBI’ ‘IRanges’
      ‘S4Vectors’
    Adding so many packages to the search path is excessive and importing
    selectively is preferable.
    ```

*   checking installed package size ... NOTE
    ```
      installed size is 52.7Mb
      sub-directories of 1Mb or more:
        data      4.6Mb
        extdata  48.0Mb
    ```

*   checking DESCRIPTION meta-information ... NOTE
    ```
    Malformed Description field: should contain one or more complete sentences.
    ```

*   checking dependencies in R code ... NOTE
    ```
    Packages in Depends field not imported from:
      ‘IRanges’ ‘methods’ ‘oligo’ ‘oligoClasses’
      These packages need to be imported from (in the NAMESPACE file)
      for when this namespace is loaded but not attached.
    ```

# pd.citrus

Version: 3.12.0

## In both

*   checking whether the namespace can be unloaded cleanly ... WARNING
    ```
    ---- unloading
    Warning message:
    .onUnload failed in unloadNamespace() for 'pd.citrus', details:
      call: rsqlite_connection_valid(dbObj@ptr)
      error: external pointer is not valid 
    ```

*   checking package dependencies ... NOTE
    ```
    Depends: includes the non-default packages:
      ‘Biostrings’ ‘RSQLite’ ‘oligoClasses’ ‘oligo’ ‘DBI’ ‘IRanges’
      ‘S4Vectors’
    Adding so many packages to the search path is excessive and importing
    selectively is preferable.
    ```

*   checking installed package size ... NOTE
    ```
      installed size is 23.3Mb
      sub-directories of 1Mb or more:
        data      2.2Mb
        extdata  21.0Mb
    ```

*   checking DESCRIPTION meta-information ... NOTE
    ```
    Malformed Description field: should contain one or more complete sentences.
    ```

*   checking dependencies in R code ... NOTE
    ```
    Packages in Depends field not imported from:
      ‘IRanges’ ‘methods’ ‘oligo’ ‘oligoClasses’
      These packages need to be imported from (in the NAMESPACE file)
      for when this namespace is loaded but not attached.
    ```

# pd.clariom.d.human

Version: 3.14.1

## In both

*   checking whether the namespace can be unloaded cleanly ... WARNING
    ```
    ---- unloading
    Warning message:
    .onUnload failed in unloadNamespace() for 'pd.clariom.d.human', details:
      call: rsqlite_connection_valid(dbObj@ptr)
      error: external pointer is not valid 
    ```

*   checking package dependencies ... NOTE
    ```
    Depends: includes the non-default packages:
      ‘Biostrings’ ‘RSQLite’ ‘oligoClasses’ ‘oligo’ ‘DBI’ ‘IRanges’
      ‘S4Vectors’
    Adding so many packages to the search path is excessive and importing
    selectively is preferable.
    ```

*   checking installed package size ... NOTE
    ```
      installed size is 731.0Mb
      sub-directories of 1Mb or more:
        data      42.7Mb
        extdata  688.1Mb
    ```

*   checking DESCRIPTION meta-information ... NOTE
    ```
    Malformed Description field: should contain one or more complete sentences.
    ```

*   checking dependencies in R code ... NOTE
    ```
    Packages in Depends field not imported from:
      ‘IRanges’ ‘methods’ ‘oligo’ ‘oligoClasses’
      These packages need to be imported from (in the NAMESPACE file)
      for when this namespace is loaded but not attached.
    ```

# pd.clariom.s.human

Version: 3.14.1

## In both

*   checking whether the namespace can be unloaded cleanly ... WARNING
    ```
    ---- unloading
    Warning message:
    .onUnload failed in unloadNamespace() for 'pd.clariom.s.human', details:
      call: rsqlite_connection_valid(dbObj@ptr)
      error: external pointer is not valid 
    ```

*   checking package dependencies ... NOTE
    ```
    Depends: includes the non-default packages:
      ‘Biostrings’ ‘RSQLite’ ‘oligoClasses’ ‘oligo’ ‘DBI’ ‘IRanges’
      ‘S4Vectors’
    Adding so many packages to the search path is excessive and importing
    selectively is preferable.
    ```

*   checking installed package size ... NOTE
    ```
      installed size is 64.5Mb
      sub-directories of 1Mb or more:
        data      1.7Mb
        extdata  62.6Mb
    ```

*   checking DESCRIPTION meta-information ... NOTE
    ```
    Malformed Description field: should contain one or more complete sentences.
    ```

*   checking dependencies in R code ... NOTE
    ```
    Packages in Depends field not imported from:
      ‘IRanges’ ‘methods’ ‘oligo’ ‘oligoClasses’
      These packages need to be imported from (in the NAMESPACE file)
      for when this namespace is loaded but not attached.
    ```

# pd.clariom.s.human.ht

Version: 3.14.1

## In both

*   checking whether the namespace can be unloaded cleanly ... WARNING
    ```
    ---- unloading
    Warning message:
    .onUnload failed in unloadNamespace() for 'pd.clariom.s.human.ht', details:
      call: rsqlite_connection_valid(dbObj@ptr)
      error: external pointer is not valid 
    ```

*   checking package dependencies ... NOTE
    ```
    Depends: includes the non-default packages:
      ‘Biostrings’ ‘RSQLite’ ‘oligoClasses’ ‘oligo’ ‘DBI’ ‘IRanges’
      ‘S4Vectors’
    Adding so many packages to the search path is excessive and importing
    selectively is preferable.
    ```

*   checking installed package size ... NOTE
    ```
      installed size is 64.5Mb
      sub-directories of 1Mb or more:
        data      1.7Mb
        extdata  62.6Mb
    ```

*   checking DESCRIPTION meta-information ... NOTE
    ```
    Malformed Description field: should contain one or more complete sentences.
    ```

*   checking dependencies in R code ... NOTE
    ```
    Packages in Depends field not imported from:
      ‘IRanges’ ‘methods’ ‘oligo’ ‘oligoClasses’
      These packages need to be imported from (in the NAMESPACE file)
      for when this namespace is loaded but not attached.
    ```

# pd.clariom.s.mouse

Version: 3.14.1

## In both

*   checking whether the namespace can be unloaded cleanly ... WARNING
    ```
    ---- unloading
    Warning message:
    .onUnload failed in unloadNamespace() for 'pd.clariom.s.mouse', details:
      call: rsqlite_connection_valid(dbObj@ptr)
      error: external pointer is not valid 
    ```

*   checking package dependencies ... NOTE
    ```
    Depends: includes the non-default packages:
      ‘Biostrings’ ‘RSQLite’ ‘oligoClasses’ ‘oligo’ ‘DBI’ ‘IRanges’
      ‘S4Vectors’
    Adding so many packages to the search path is excessive and importing
    selectively is preferable.
    ```

*   checking installed package size ... NOTE
    ```
      installed size is 50.2Mb
      sub-directories of 1Mb or more:
        data      1.7Mb
        extdata  48.3Mb
    ```

*   checking DESCRIPTION meta-information ... NOTE
    ```
    Malformed Description field: should contain one or more complete sentences.
    ```

*   checking dependencies in R code ... NOTE
    ```
    Packages in Depends field not imported from:
      ‘IRanges’ ‘methods’ ‘oligo’ ‘oligoClasses’
      These packages need to be imported from (in the NAMESPACE file)
      for when this namespace is loaded but not attached.
    ```

# pd.clariom.s.mouse.ht

Version: 3.14.1

## In both

*   checking whether the namespace can be unloaded cleanly ... WARNING
    ```
    ---- unloading
    Warning message:
    .onUnload failed in unloadNamespace() for 'pd.clariom.s.mouse.ht', details:
      call: rsqlite_connection_valid(dbObj@ptr)
      error: external pointer is not valid 
    ```

*   checking package dependencies ... NOTE
    ```
    Depends: includes the non-default packages:
      ‘Biostrings’ ‘RSQLite’ ‘oligoClasses’ ‘oligo’ ‘DBI’ ‘IRanges’
      ‘S4Vectors’
    Adding so many packages to the search path is excessive and importing
    selectively is preferable.
    ```

*   checking installed package size ... NOTE
    ```
      installed size is 50.2Mb
      sub-directories of 1Mb or more:
        data      1.7Mb
        extdata  48.3Mb
    ```

*   checking DESCRIPTION meta-information ... NOTE
    ```
    Malformed Description field: should contain one or more complete sentences.
    ```

*   checking dependencies in R code ... NOTE
    ```
    Packages in Depends field not imported from:
      ‘IRanges’ ‘methods’ ‘oligo’ ‘oligoClasses’
      These packages need to be imported from (in the NAMESPACE file)
      for when this namespace is loaded but not attached.
    ```

# pd.clariom.s.rat

Version: 3.14.1

## In both

*   checking whether the namespace can be unloaded cleanly ... WARNING
    ```
    ---- unloading
    Warning message:
    .onUnload failed in unloadNamespace() for 'pd.clariom.s.rat', details:
      call: rsqlite_connection_valid(dbObj@ptr)
      error: external pointer is not valid 
    ```

*   checking package dependencies ... NOTE
    ```
    Depends: includes the non-default packages:
      ‘Biostrings’ ‘RSQLite’ ‘oligoClasses’ ‘oligo’ ‘DBI’ ‘IRanges’
      ‘S4Vectors’
    Adding so many packages to the search path is excessive and importing
    selectively is preferable.
    ```

*   checking installed package size ... NOTE
    ```
      installed size is 30.8Mb
      sub-directories of 1Mb or more:
        data      1.8Mb
        extdata  28.8Mb
    ```

*   checking DESCRIPTION meta-information ... NOTE
    ```
    Malformed Description field: should contain one or more complete sentences.
    ```

*   checking dependencies in R code ... NOTE
    ```
    Packages in Depends field not imported from:
      ‘IRanges’ ‘methods’ ‘oligo’ ‘oligoClasses’
      These packages need to be imported from (in the NAMESPACE file)
      for when this namespace is loaded but not attached.
    ```

# pd.clariom.s.rat.ht

Version: 3.14.1

## In both

*   checking whether the namespace can be unloaded cleanly ... WARNING
    ```
    ---- unloading
    Warning message:
    .onUnload failed in unloadNamespace() for 'pd.clariom.s.rat.ht', details:
      call: rsqlite_connection_valid(dbObj@ptr)
      error: external pointer is not valid 
    ```

*   checking package dependencies ... NOTE
    ```
    Depends: includes the non-default packages:
      ‘Biostrings’ ‘RSQLite’ ‘oligoClasses’ ‘oligo’ ‘DBI’ ‘IRanges’
      ‘S4Vectors’
    Adding so many packages to the search path is excessive and importing
    selectively is preferable.
    ```

*   checking installed package size ... NOTE
    ```
      installed size is 30.7Mb
      sub-directories of 1Mb or more:
        data      1.7Mb
        extdata  28.8Mb
    ```

*   checking DESCRIPTION meta-information ... NOTE
    ```
    Malformed Description field: should contain one or more complete sentences.
    ```

*   checking dependencies in R code ... NOTE
    ```
    Packages in Depends field not imported from:
      ‘IRanges’ ‘methods’ ‘oligo’ ‘oligoClasses’
      These packages need to be imported from (in the NAMESPACE file)
      for when this namespace is loaded but not attached.
    ```

# pd.cotton

Version: 3.12.0

## In both

*   checking whether the namespace can be unloaded cleanly ... WARNING
    ```
    ---- unloading
    Warning message:
    .onUnload failed in unloadNamespace() for 'pd.cotton', details:
      call: rsqlite_connection_valid(dbObj@ptr)
      error: external pointer is not valid 
    ```

*   checking package dependencies ... NOTE
    ```
    Depends: includes the non-default packages:
      ‘Biostrings’ ‘RSQLite’ ‘oligoClasses’ ‘oligo’ ‘DBI’ ‘IRanges’
      ‘S4Vectors’
    Adding so many packages to the search path is excessive and importing
    selectively is preferable.
    ```

*   checking installed package size ... NOTE
    ```
      installed size is 18.2Mb
      sub-directories of 1Mb or more:
        data      1.7Mb
        extdata  16.4Mb
    ```

*   checking DESCRIPTION meta-information ... NOTE
    ```
    Malformed Description field: should contain one or more complete sentences.
    ```

*   checking dependencies in R code ... NOTE
    ```
    Packages in Depends field not imported from:
      ‘IRanges’ ‘methods’ ‘oligo’ ‘oligoClasses’
      These packages need to be imported from (in the NAMESPACE file)
      for when this namespace is loaded but not attached.
    ```

# pd.cyngene.1.0.st

Version: 3.12.0

## In both

*   checking whether the namespace can be unloaded cleanly ... WARNING
    ```
    ---- unloading
    Warning message:
    .onUnload failed in unloadNamespace() for 'pd.cyngene.1.0.st', details:
      call: rsqlite_connection_valid(dbObj@ptr)
      error: external pointer is not valid 
    ```

*   checking package dependencies ... NOTE
    ```
    Depends: includes the non-default packages:
      ‘Biostrings’ ‘RSQLite’ ‘oligoClasses’ ‘oligo’ ‘DBI’ ‘IRanges’
      ‘S4Vectors’
    Adding so many packages to the search path is excessive and importing
    selectively is preferable.
    ```

*   checking installed package size ... NOTE
    ```
      installed size is 69.6Mb
      sub-directories of 1Mb or more:
        data      5.3Mb
        extdata  64.2Mb
    ```

*   checking DESCRIPTION meta-information ... NOTE
    ```
    Malformed Description field: should contain one or more complete sentences.
    ```

*   checking dependencies in R code ... NOTE
    ```
    Packages in Depends field not imported from:
      ‘IRanges’ ‘methods’ ‘oligo’ ‘oligoClasses’
      These packages need to be imported from (in the NAMESPACE file)
      for when this namespace is loaded but not attached.
    ```

# pd.cyngene.1.1.st

Version: 3.12.0

## In both

*   checking whether the namespace can be unloaded cleanly ... WARNING
    ```
    ---- unloading
    Warning message:
    .onUnload failed in unloadNamespace() for 'pd.cyngene.1.1.st', details:
      call: rsqlite_connection_valid(dbObj@ptr)
      error: external pointer is not valid 
    ```

*   checking package dependencies ... NOTE
    ```
    Depends: includes the non-default packages:
      ‘Biostrings’ ‘RSQLite’ ‘oligoClasses’ ‘oligo’ ‘DBI’ ‘IRanges’
      ‘S4Vectors’
    Adding so many packages to the search path is excessive and importing
    selectively is preferable.
    ```

*   checking installed package size ... NOTE
    ```
      installed size is 69.5Mb
      sub-directories of 1Mb or more:
        data      5.2Mb
        extdata  64.2Mb
    ```

*   checking DESCRIPTION meta-information ... NOTE
    ```
    Malformed Description field: should contain one or more complete sentences.
    ```

*   checking dependencies in R code ... NOTE
    ```
    Packages in Depends field not imported from:
      ‘IRanges’ ‘methods’ ‘oligo’ ‘oligoClasses’
      These packages need to be imported from (in the NAMESPACE file)
      for when this namespace is loaded but not attached.
    ```

# pd.cyrgene.1.0.st

Version: 3.12.0

## In both

*   checking whether the namespace can be unloaded cleanly ... WARNING
    ```
    ---- unloading
    Warning message:
    .onUnload failed in unloadNamespace() for 'pd.cyrgene.1.0.st', details:
      call: rsqlite_connection_valid(dbObj@ptr)
      error: external pointer is not valid 
    ```

*   checking package dependencies ... NOTE
    ```
    Depends: includes the non-default packages:
      ‘Biostrings’ ‘RSQLite’ ‘oligoClasses’ ‘oligo’ ‘DBI’ ‘IRanges’
      ‘S4Vectors’
    Adding so many packages to the search path is excessive and importing
    selectively is preferable.
    ```

*   checking installed package size ... NOTE
    ```
      installed size is 81.2Mb
      sub-directories of 1Mb or more:
        data      5.9Mb
        extdata  75.2Mb
    ```

*   checking DESCRIPTION meta-information ... NOTE
    ```
    Malformed Description field: should contain one or more complete sentences.
    ```

*   checking dependencies in R code ... NOTE
    ```
    Packages in Depends field not imported from:
      ‘IRanges’ ‘methods’ ‘oligo’ ‘oligoClasses’
      These packages need to be imported from (in the NAMESPACE file)
      for when this namespace is loaded but not attached.
    ```

# pd.cyrgene.1.1.st

Version: 3.12.0

## In both

*   checking whether the namespace can be unloaded cleanly ... WARNING
    ```
    ---- unloading
    Warning message:
    .onUnload failed in unloadNamespace() for 'pd.cyrgene.1.1.st', details:
      call: rsqlite_connection_valid(dbObj@ptr)
      error: external pointer is not valid 
    ```

*   checking package dependencies ... NOTE
    ```
    Depends: includes the non-default packages:
      ‘Biostrings’ ‘RSQLite’ ‘oligoClasses’ ‘oligo’ ‘DBI’ ‘IRanges’
      ‘S4Vectors’
    Adding so many packages to the search path is excessive and importing
    selectively is preferable.
    ```

*   checking installed package size ... NOTE
    ```
      installed size is 80.7Mb
      sub-directories of 1Mb or more:
        data      5.3Mb
        extdata  75.2Mb
    ```

*   checking DESCRIPTION meta-information ... NOTE
    ```
    Malformed Description field: should contain one or more complete sentences.
    ```

*   checking dependencies in R code ... NOTE
    ```
    Packages in Depends field not imported from:
      ‘IRanges’ ‘methods’ ‘oligo’ ‘oligoClasses’
      These packages need to be imported from (in the NAMESPACE file)
      for when this namespace is loaded but not attached.
    ```

# pd.cytogenetics.array

Version: 3.12.0

## In both

*   checking whether the namespace can be unloaded cleanly ... WARNING
    ```
    ---- unloading
    Warning message:
    .onUnload failed in unloadNamespace() for 'pd.cytogenetics.array', details:
      call: rsqlite_connection_valid(dbObj@ptr)
      error: external pointer is not valid 
    ```

*   checking for missing documentation entries ... WARNING
    ```
    Undocumented data sets:
      ‘pmSequenceCNV’
    All user-level objects in a package should have documentation entries.
    See chapter ‘Writing R documentation files’ in the ‘Writing R
    Extensions’ manual.
    ```

*   checking package dependencies ... NOTE
    ```
    Depends: includes the non-default packages:
      ‘Biostrings’ ‘RSQLite’ ‘oligoClasses’ ‘oligo’ ‘DBI’ ‘IRanges’
      ‘S4Vectors’
    Adding so many packages to the search path is excessive and importing
    selectively is preferable.
    ```

*   checking installed package size ... NOTE
    ```
      installed size is 311.6Mb
      sub-directories of 1Mb or more:
        data      40.4Mb
        extdata  271.0Mb
    ```

*   checking DESCRIPTION meta-information ... NOTE
    ```
    Malformed Description field: should contain one or more complete sentences.
    ```

*   checking dependencies in R code ... NOTE
    ```
    Packages in Depends field not imported from:
      ‘IRanges’ ‘methods’ ‘oligo’ ‘oligoClasses’
      These packages need to be imported from (in the NAMESPACE file)
      for when this namespace is loaded but not attached.
    ```

# pd.drogene.1.0.st

Version: 3.12.0

## In both

*   checking whether the namespace can be unloaded cleanly ... WARNING
    ```
    ---- unloading
    Warning message:
    .onUnload failed in unloadNamespace() for 'pd.drogene.1.0.st', details:
      call: rsqlite_connection_valid(dbObj@ptr)
      error: external pointer is not valid 
    ```

*   checking package dependencies ... NOTE
    ```
    Depends: includes the non-default packages:
      ‘Biostrings’ ‘RSQLite’ ‘oligoClasses’ ‘oligo’ ‘DBI’ ‘IRanges’
      ‘S4Vectors’
    Adding so many packages to the search path is excessive and importing
    selectively is preferable.
    ```

*   checking installed package size ... NOTE
    ```
      installed size is 77.5Mb
      sub-directories of 1Mb or more:
        data      4.8Mb
        extdata  72.5Mb
    ```

*   checking DESCRIPTION meta-information ... NOTE
    ```
    Malformed Description field: should contain one or more complete sentences.
    ```

*   checking dependencies in R code ... NOTE
    ```
    Packages in Depends field not imported from:
      ‘IRanges’ ‘methods’ ‘oligo’ ‘oligoClasses’
      These packages need to be imported from (in the NAMESPACE file)
      for when this namespace is loaded but not attached.
    ```

# pd.drogene.1.1.st

Version: 3.12.0

## In both

*   checking whether the namespace can be unloaded cleanly ... WARNING
    ```
    ---- unloading
    Warning message:
    .onUnload failed in unloadNamespace() for 'pd.drogene.1.1.st', details:
      call: rsqlite_connection_valid(dbObj@ptr)
      error: external pointer is not valid 
    ```

*   checking package dependencies ... NOTE
    ```
    Depends: includes the non-default packages:
      ‘Biostrings’ ‘RSQLite’ ‘oligoClasses’ ‘oligo’ ‘DBI’ ‘IRanges’
      ‘S4Vectors’
    Adding so many packages to the search path is excessive and importing
    selectively is preferable.
    ```

*   checking installed package size ... NOTE
    ```
      installed size is 77.4Mb
      sub-directories of 1Mb or more:
        data      4.8Mb
        extdata  72.5Mb
    ```

*   checking DESCRIPTION meta-information ... NOTE
    ```
    Malformed Description field: should contain one or more complete sentences.
    ```

*   checking dependencies in R code ... NOTE
    ```
    Packages in Depends field not imported from:
      ‘IRanges’ ‘methods’ ‘oligo’ ‘oligoClasses’
      These packages need to be imported from (in the NAMESPACE file)
      for when this namespace is loaded but not attached.
    ```

# pd.drosgenome1

Version: 3.12.0

## In both

*   checking whether the namespace can be unloaded cleanly ... WARNING
    ```
    ---- unloading
    Warning message:
    .onUnload failed in unloadNamespace() for 'pd.drosgenome1', details:
      call: rsqlite_connection_valid(dbObj@ptr)
      error: external pointer is not valid 
    ```

*   checking package dependencies ... NOTE
    ```
    Depends: includes the non-default packages:
      ‘Biostrings’ ‘RSQLite’ ‘oligoClasses’ ‘oligo’ ‘DBI’ ‘IRanges’
      ‘S4Vectors’
    Adding so many packages to the search path is excessive and importing
    selectively is preferable.
    ```

*   checking installed package size ... NOTE
    ```
      installed size is 13.3Mb
      sub-directories of 1Mb or more:
        data      1.3Mb
        extdata  11.9Mb
    ```

*   checking DESCRIPTION meta-information ... NOTE
    ```
    Malformed Description field: should contain one or more complete sentences.
    ```

*   checking dependencies in R code ... NOTE
    ```
    Packages in Depends field not imported from:
      ‘IRanges’ ‘methods’ ‘oligo’ ‘oligoClasses’
      These packages need to be imported from (in the NAMESPACE file)
      for when this namespace is loaded but not attached.
    ```

# pd.drosophila.2

Version: 3.12.0

## In both

*   checking whether the namespace can be unloaded cleanly ... WARNING
    ```
    ---- unloading
    Warning message:
    .onUnload failed in unloadNamespace() for 'pd.drosophila.2', details:
      call: rsqlite_connection_valid(dbObj@ptr)
      error: external pointer is not valid 
    ```

*   checking package dependencies ... NOTE
    ```
    Depends: includes the non-default packages:
      ‘Biostrings’ ‘RSQLite’ ‘oligoClasses’ ‘oligo’ ‘DBI’ ‘IRanges’
      ‘S4Vectors’
    Adding so many packages to the search path is excessive and importing
    selectively is preferable.
    ```

*   checking installed package size ... NOTE
    ```
      installed size is 17.9Mb
      sub-directories of 1Mb or more:
        data      1.7Mb
        extdata  16.1Mb
    ```

*   checking DESCRIPTION meta-information ... NOTE
    ```
    Malformed Description field: should contain one or more complete sentences.
    ```

*   checking dependencies in R code ... NOTE
    ```
    Packages in Depends field not imported from:
      ‘IRanges’ ‘methods’ ‘oligo’ ‘oligoClasses’
      These packages need to be imported from (in the NAMESPACE file)
      for when this namespace is loaded but not attached.
    ```

# pd.e.coli.2

Version: 3.12.0

## In both

*   checking whether package ‘pd.e.coli.2’ can be installed ... WARNING
    ```
    Found the following significant warnings:
      Warning: call dbDisconnect() when finished working with a connection
    See ‘/home/muelleki/git/R/DBI/revdep/checks/pd.e.coli.2/new/pd.e.coli.2.Rcheck/00install.out’ for details.
    ```

*   checking whether the namespace can be unloaded cleanly ... WARNING
    ```
    ---- unloading
    Warning message:
    .onUnload failed in unloadNamespace() for 'pd.e.coli.2', details:
      call: rsqlite_connection_valid(dbObj@ptr)
      error: external pointer is not valid 
    ```

*   checking package dependencies ... NOTE
    ```
    Depends: includes the non-default packages:
      ‘Biostrings’ ‘RSQLite’ ‘oligoClasses’ ‘oligo’ ‘DBI’ ‘IRanges’
      ‘S4Vectors’
    Adding so many packages to the search path is excessive and importing
    selectively is preferable.
    ```

*   checking installed package size ... NOTE
    ```
      installed size is  8.0Mb
      sub-directories of 1Mb or more:
        extdata   7.0Mb
    ```

*   checking DESCRIPTION meta-information ... NOTE
    ```
    Malformed Description field: should contain one or more complete sentences.
    ```

*   checking dependencies in R code ... NOTE
    ```
    Packages in Depends field not imported from:
      ‘IRanges’ ‘methods’ ‘oligo’ ‘oligoClasses’
      These packages need to be imported from (in the NAMESPACE file)
      for when this namespace is loaded but not attached.
    ```

# pd.ecoli

Version: 3.12.0

## In both

*   checking whether package ‘pd.ecoli’ can be installed ... WARNING
    ```
    Found the following significant warnings:
      Warning: call dbDisconnect() when finished working with a connection
    See ‘/home/muelleki/git/R/DBI/revdep/checks/pd.ecoli/new/pd.ecoli.Rcheck/00install.out’ for details.
    ```

*   checking whether the namespace can be unloaded cleanly ... WARNING
    ```
    ---- unloading
    Warning message:
    .onUnload failed in unloadNamespace() for 'pd.ecoli', details:
      call: rsqlite_connection_valid(dbObj@ptr)
      error: external pointer is not valid 
    ```

*   checking package dependencies ... NOTE
    ```
    Depends: includes the non-default packages:
      ‘Biostrings’ ‘RSQLite’ ‘oligoClasses’ ‘oligo’ ‘DBI’ ‘IRanges’
      ‘S4Vectors’
    Adding so many packages to the search path is excessive and importing
    selectively is preferable.
    ```

*   checking installed package size ... NOTE
    ```
      installed size is  9.6Mb
      sub-directories of 1Mb or more:
        extdata   8.7Mb
    ```

*   checking DESCRIPTION meta-information ... NOTE
    ```
    Malformed Description field: should contain one or more complete sentences.
    ```

*   checking dependencies in R code ... NOTE
    ```
    Packages in Depends field not imported from:
      ‘IRanges’ ‘methods’ ‘oligo’ ‘oligoClasses’
      These packages need to be imported from (in the NAMESPACE file)
      for when this namespace is loaded but not attached.
    ```

# pd.ecoli.asv2

Version: 3.12.0

## In both

*   checking whether package ‘pd.ecoli.asv2’ can be installed ... WARNING
    ```
    Found the following significant warnings:
      Warning: call dbDisconnect() when finished working with a connection
    See ‘/home/muelleki/git/R/DBI/revdep/checks/pd.ecoli.asv2/new/pd.ecoli.asv2.Rcheck/00install.out’ for details.
    ```

*   checking whether the namespace can be unloaded cleanly ... WARNING
    ```
    ---- unloading
    Warning message:
    .onUnload failed in unloadNamespace() for 'pd.ecoli.asv2', details:
      call: rsqlite_connection_valid(dbObj@ptr)
      error: external pointer is not valid 
    ```

*   checking package dependencies ... NOTE
    ```
    Depends: includes the non-default packages:
      ‘Biostrings’ ‘RSQLite’ ‘oligoClasses’ ‘oligo’ ‘DBI’ ‘IRanges’
      ‘S4Vectors’
    Adding so many packages to the search path is excessive and importing
    selectively is preferable.
    ```

*   checking installed package size ... NOTE
    ```
      installed size is  9.6Mb
      sub-directories of 1Mb or more:
        extdata   8.7Mb
    ```

*   checking DESCRIPTION meta-information ... NOTE
    ```
    Malformed Description field: should contain one or more complete sentences.
    ```

*   checking dependencies in R code ... NOTE
    ```
    Packages in Depends field not imported from:
      ‘IRanges’ ‘methods’ ‘oligo’ ‘oligoClasses’
      These packages need to be imported from (in the NAMESPACE file)
      for when this namespace is loaded but not attached.
    ```

# pd.elegene.1.0.st

Version: 3.12.0

## In both

*   checking whether the namespace can be unloaded cleanly ... WARNING
    ```
    ---- unloading
    Warning message:
    .onUnload failed in unloadNamespace() for 'pd.elegene.1.0.st', details:
      call: rsqlite_connection_valid(dbObj@ptr)
      error: external pointer is not valid 
    ```

*   checking package dependencies ... NOTE
    ```
    Depends: includes the non-default packages:
      ‘Biostrings’ ‘RSQLite’ ‘oligoClasses’ ‘oligo’ ‘DBI’ ‘IRanges’
      ‘S4Vectors’
    Adding so many packages to the search path is excessive and importing
    selectively is preferable.
    ```

*   checking installed package size ... NOTE
    ```
      installed size is 57.1Mb
      sub-directories of 1Mb or more:
        data      4.5Mb
        extdata  52.4Mb
    ```

*   checking DESCRIPTION meta-information ... NOTE
    ```
    Malformed Description field: should contain one or more complete sentences.
    ```

*   checking dependencies in R code ... NOTE
    ```
    Packages in Depends field not imported from:
      ‘IRanges’ ‘methods’ ‘oligo’ ‘oligoClasses’
      These packages need to be imported from (in the NAMESPACE file)
      for when this namespace is loaded but not attached.
    ```

# pd.elegene.1.1.st

Version: 3.12.0

## In both

*   checking whether the namespace can be unloaded cleanly ... WARNING
    ```
    ---- unloading
    Warning message:
    .onUnload failed in unloadNamespace() for 'pd.elegene.1.1.st', details:
      call: rsqlite_connection_valid(dbObj@ptr)
      error: external pointer is not valid 
    ```

*   checking package dependencies ... NOTE
    ```
    Depends: includes the non-default packages:
      ‘Biostrings’ ‘RSQLite’ ‘oligoClasses’ ‘oligo’ ‘DBI’ ‘IRanges’
      ‘S4Vectors’
    Adding so many packages to the search path is excessive and importing
    selectively is preferable.
    ```

*   checking installed package size ... NOTE
    ```
      installed size is 56.7Mb
      sub-directories of 1Mb or more:
        data      4.1Mb
        extdata  52.4Mb
    ```

*   checking DESCRIPTION meta-information ... NOTE
    ```
    Malformed Description field: should contain one or more complete sentences.
    ```

*   checking dependencies in R code ... NOTE
    ```
    Packages in Depends field not imported from:
      ‘IRanges’ ‘methods’ ‘oligo’ ‘oligoClasses’
      These packages need to be imported from (in the NAMESPACE file)
      for when this namespace is loaded but not attached.
    ```

# pd.equgene.1.0.st

Version: 3.12.0

## In both

*   checking whether the namespace can be unloaded cleanly ... WARNING
    ```
    ---- unloading
    Warning message:
    .onUnload failed in unloadNamespace() for 'pd.equgene.1.0.st', details:
      call: rsqlite_connection_valid(dbObj@ptr)
      error: external pointer is not valid 
    ```

*   checking package dependencies ... NOTE
    ```
    Depends: includes the non-default packages:
      ‘Biostrings’ ‘RSQLite’ ‘oligoClasses’ ‘oligo’ ‘DBI’ ‘IRanges’
      ‘S4Vectors’
    Adding so many packages to the search path is excessive and importing
    selectively is preferable.
    ```

*   checking installed package size ... NOTE
    ```
      installed size is 52.3Mb
      sub-directories of 1Mb or more:
        data      3.9Mb
        extdata  48.3Mb
    ```

*   checking DESCRIPTION meta-information ... NOTE
    ```
    Malformed Description field: should contain one or more complete sentences.
    ```

*   checking dependencies in R code ... NOTE
    ```
    Packages in Depends field not imported from:
      ‘IRanges’ ‘methods’ ‘oligo’ ‘oligoClasses’
      These packages need to be imported from (in the NAMESPACE file)
      for when this namespace is loaded but not attached.
    ```

# pd.equgene.1.1.st

Version: 3.12.0

## In both

*   checking whether the namespace can be unloaded cleanly ... WARNING
    ```
    ---- unloading
    Warning message:
    .onUnload failed in unloadNamespace() for 'pd.equgene.1.1.st', details:
      call: rsqlite_connection_valid(dbObj@ptr)
      error: external pointer is not valid 
    ```

*   checking package dependencies ... NOTE
    ```
    Depends: includes the non-default packages:
      ‘Biostrings’ ‘RSQLite’ ‘oligoClasses’ ‘oligo’ ‘DBI’ ‘IRanges’
      ‘S4Vectors’
    Adding so many packages to the search path is excessive and importing
    selectively is preferable.
    ```

*   checking installed package size ... NOTE
    ```
      installed size is 52.2Mb
      sub-directories of 1Mb or more:
        data      3.8Mb
        extdata  48.3Mb
    ```

*   checking DESCRIPTION meta-information ... NOTE
    ```
    Malformed Description field: should contain one or more complete sentences.
    ```

*   checking dependencies in R code ... NOTE
    ```
    Packages in Depends field not imported from:
      ‘IRanges’ ‘methods’ ‘oligo’ ‘oligoClasses’
      These packages need to be imported from (in the NAMESPACE file)
      for when this namespace is loaded but not attached.
    ```

# pd.feinberg.hg18.me.hx1

Version: 0.99.3

## In both

*   checking package dependencies ... ERROR
    ```
    Namespace dependency not required: ‘S4Vectors’
    
    See section ‘The DESCRIPTION file’ in the ‘Writing R Extensions’
    manual.
    ```

# pd.feinberg.mm8.me.hx1

Version: 0.99.3

## In both

*   checking package dependencies ... ERROR
    ```
    Namespace dependency not required: ‘S4Vectors’
    
    See section ‘The DESCRIPTION file’ in the ‘Writing R Extensions’
    manual.
    ```

# pd.felgene.1.0.st

Version: 3.12.0

## In both

*   checking whether the namespace can be unloaded cleanly ... WARNING
    ```
    ---- unloading
    Warning message:
    .onUnload failed in unloadNamespace() for 'pd.felgene.1.0.st', details:
      call: rsqlite_connection_valid(dbObj@ptr)
      error: external pointer is not valid 
    ```

*   checking package dependencies ... NOTE
    ```
    Depends: includes the non-default packages:
      ‘Biostrings’ ‘RSQLite’ ‘oligoClasses’ ‘oligo’ ‘DBI’ ‘IRanges’
      ‘S4Vectors’
    Adding so many packages to the search path is excessive and importing
    selectively is preferable.
    ```

*   checking installed package size ... NOTE
    ```
      installed size is 312.2Mb
      sub-directories of 1Mb or more:
        data       5.1Mb
        extdata  306.9Mb
    ```

*   checking DESCRIPTION meta-information ... NOTE
    ```
    Malformed Description field: should contain one or more complete sentences.
    ```

*   checking dependencies in R code ... NOTE
    ```
    Packages in Depends field not imported from:
      ‘IRanges’ ‘methods’ ‘oligo’ ‘oligoClasses’
      These packages need to be imported from (in the NAMESPACE file)
      for when this namespace is loaded but not attached.
    ```

# pd.felgene.1.1.st

Version: 3.12.0

## In both

*   checking whether the namespace can be unloaded cleanly ... WARNING
    ```
    ---- unloading
    Warning message:
    .onUnload failed in unloadNamespace() for 'pd.felgene.1.1.st', details:
      call: rsqlite_connection_valid(dbObj@ptr)
      error: external pointer is not valid 
    ```

*   checking package dependencies ... NOTE
    ```
    Depends: includes the non-default packages:
      ‘Biostrings’ ‘RSQLite’ ‘oligoClasses’ ‘oligo’ ‘DBI’ ‘IRanges’
      ‘S4Vectors’
    Adding so many packages to the search path is excessive and importing
    selectively is preferable.
    ```

*   checking installed package size ... NOTE
    ```
      installed size is 311.8Mb
      sub-directories of 1Mb or more:
        data       4.8Mb
        extdata  306.9Mb
    ```

*   checking DESCRIPTION meta-information ... NOTE
    ```
    Malformed Description field: should contain one or more complete sentences.
    ```

*   checking dependencies in R code ... NOTE
    ```
    Packages in Depends field not imported from:
      ‘IRanges’ ‘methods’ ‘oligo’ ‘oligoClasses’
      These packages need to be imported from (in the NAMESPACE file)
      for when this namespace is loaded but not attached.
    ```

# pd.fingene.1.0.st

Version: 3.12.0

## In both

*   checking whether the namespace can be unloaded cleanly ... WARNING
    ```
    ---- unloading
    Warning message:
    .onUnload failed in unloadNamespace() for 'pd.fingene.1.0.st', details:
      call: rsqlite_connection_valid(dbObj@ptr)
      error: external pointer is not valid 
    ```

*   checking package dependencies ... NOTE
    ```
    Depends: includes the non-default packages:
      ‘Biostrings’ ‘RSQLite’ ‘oligoClasses’ ‘oligo’ ‘DBI’ ‘IRanges’
      ‘S4Vectors’
    Adding so many packages to the search path is excessive and importing
    selectively is preferable.
    ```

*   checking installed package size ... NOTE
    ```
      installed size is 38.8Mb
      sub-directories of 1Mb or more:
        data      3.0Mb
        extdata  35.6Mb
    ```

*   checking DESCRIPTION meta-information ... NOTE
    ```
    Malformed Description field: should contain one or more complete sentences.
    ```

*   checking dependencies in R code ... NOTE
    ```
    Packages in Depends field not imported from:
      ‘IRanges’ ‘methods’ ‘oligo’ ‘oligoClasses’
      These packages need to be imported from (in the NAMESPACE file)
      for when this namespace is loaded but not attached.
    ```

# pd.fingene.1.1.st

Version: 3.12.0

## In both

*   checking whether the namespace can be unloaded cleanly ... WARNING
    ```
    ---- unloading
    Warning message:
    .onUnload failed in unloadNamespace() for 'pd.fingene.1.1.st', details:
      call: rsqlite_connection_valid(dbObj@ptr)
      error: external pointer is not valid 
    ```

*   checking package dependencies ... NOTE
    ```
    Depends: includes the non-default packages:
      ‘Biostrings’ ‘RSQLite’ ‘oligoClasses’ ‘oligo’ ‘DBI’ ‘IRanges’
      ‘S4Vectors’
    Adding so many packages to the search path is excessive and importing
    selectively is preferable.
    ```

*   checking installed package size ... NOTE
    ```
      installed size is 38.7Mb
      sub-directories of 1Mb or more:
        data      3.0Mb
        extdata  35.6Mb
    ```

*   checking DESCRIPTION meta-information ... NOTE
    ```
    Malformed Description field: should contain one or more complete sentences.
    ```

*   checking dependencies in R code ... NOTE
    ```
    Packages in Depends field not imported from:
      ‘IRanges’ ‘methods’ ‘oligo’ ‘oligoClasses’
      These packages need to be imported from (in the NAMESPACE file)
      for when this namespace is loaded but not attached.
    ```

# pd.genomewidesnp.5

Version: 3.14.1

## In both

*   checking whether the namespace can be unloaded cleanly ... WARNING
    ```
    ---- unloading
    Warning message:
    .onUnload failed in unloadNamespace() for 'pd.genomewidesnp.5', details:
      call: rsqlite_connection_valid(dbObj@ptr)
      error: external pointer is not valid 
    ```

*   checking package dependencies ... NOTE
    ```
    Depends: includes the non-default packages:
      ‘Biostrings’ ‘RSQLite’ ‘oligoClasses’ ‘oligo’ ‘DBI’ ‘IRanges’
      ‘S4Vectors’
    Adding so many packages to the search path is excessive and importing
    selectively is preferable.
    ```

*   checking installed package size ... NOTE
    ```
      installed size is 1223.5Mb
      sub-directories of 1Mb or more:
        extdata  1223.4Mb
    ```

*   checking DESCRIPTION meta-information ... NOTE
    ```
    Malformed Description field: should contain one or more complete sentences.
    ```

*   checking dependencies in R code ... NOTE
    ```
    Packages in Depends field not imported from:
      ‘IRanges’ ‘methods’ ‘oligo’ ‘oligoClasses’
      These packages need to be imported from (in the NAMESPACE file)
      for when this namespace is loaded but not attached.
    ```

# pd.genomewidesnp.6

Version: 3.14.1

## In both

*   checking whether the namespace can be unloaded cleanly ... WARNING
    ```
    ---- unloading
    Warning message:
    .onUnload failed in unloadNamespace() for 'pd.genomewidesnp.6', details:
      call: rsqlite_connection_valid(dbObj@ptr)
      error: external pointer is not valid 
    ```

*   checking package dependencies ... NOTE
    ```
    Depends: includes the non-default packages:
      ‘Biostrings’ ‘RSQLite’ ‘oligoClasses’ ‘oligo’ ‘DBI’ ‘IRanges’
      ‘S4Vectors’
    Adding so many packages to the search path is excessive and importing
    selectively is preferable.
    ```

*   checking installed package size ... NOTE
    ```
      installed size is 2509.5Mb
      sub-directories of 1Mb or more:
        extdata  2509.4Mb
    ```

*   checking DESCRIPTION meta-information ... NOTE
    ```
    Malformed Description field: should contain one or more complete sentences.
    ```

*   checking dependencies in R code ... NOTE
    ```
    Packages in Depends field not imported from:
      ‘IRanges’ ‘methods’ ‘oligo’ ‘oligoClasses’
      These packages need to be imported from (in the NAMESPACE file)
      for when this namespace is loaded but not attached.
    ```

# pd.guigene.1.0.st

Version: 3.12.0

## In both

*   checking whether the namespace can be unloaded cleanly ... WARNING
    ```
    ---- unloading
    Warning message:
    .onUnload failed in unloadNamespace() for 'pd.guigene.1.0.st', details:
      call: rsqlite_connection_valid(dbObj@ptr)
      error: external pointer is not valid 
    ```

*   checking package dependencies ... NOTE
    ```
    Depends: includes the non-default packages:
      ‘Biostrings’ ‘RSQLite’ ‘oligoClasses’ ‘oligo’ ‘DBI’ ‘IRanges’
      ‘S4Vectors’
    Adding so many packages to the search path is excessive and importing
    selectively is preferable.
    ```

*   checking installed package size ... NOTE
    ```
      installed size is 57.9Mb
      sub-directories of 1Mb or more:
        data      4.0Mb
        extdata  53.8Mb
    ```

*   checking DESCRIPTION meta-information ... NOTE
    ```
    Malformed Description field: should contain one or more complete sentences.
    ```

*   checking dependencies in R code ... NOTE
    ```
    Packages in Depends field not imported from:
      ‘IRanges’ ‘methods’ ‘oligo’ ‘oligoClasses’
      These packages need to be imported from (in the NAMESPACE file)
      for when this namespace is loaded but not attached.
    ```

# pd.guigene.1.1.st

Version: 3.12.0

## In both

*   checking whether the namespace can be unloaded cleanly ... WARNING
    ```
    ---- unloading
    Warning message:
    .onUnload failed in unloadNamespace() for 'pd.guigene.1.1.st', details:
      call: rsqlite_connection_valid(dbObj@ptr)
      error: external pointer is not valid 
    ```

*   checking package dependencies ... NOTE
    ```
    Depends: includes the non-default packages:
      ‘Biostrings’ ‘RSQLite’ ‘oligoClasses’ ‘oligo’ ‘DBI’ ‘IRanges’
      ‘S4Vectors’
    Adding so many packages to the search path is excessive and importing
    selectively is preferable.
    ```

*   checking installed package size ... NOTE
    ```
      installed size is 57.6Mb
      sub-directories of 1Mb or more:
        data      3.7Mb
        extdata  53.8Mb
    ```

*   checking DESCRIPTION meta-information ... NOTE
    ```
    Malformed Description field: should contain one or more complete sentences.
    ```

*   checking dependencies in R code ... NOTE
    ```
    Packages in Depends field not imported from:
      ‘IRanges’ ‘methods’ ‘oligo’ ‘oligoClasses’
      These packages need to be imported from (in the NAMESPACE file)
      for when this namespace is loaded but not attached.
    ```

# pd.hc.g110

Version: 3.12.0

## In both

*   checking whether the namespace can be unloaded cleanly ... WARNING
    ```
    ---- unloading
    Warning message:
    .onUnload failed in unloadNamespace() for 'pd.hc.g110', details:
      call: rsqlite_connection_valid(dbObj@ptr)
      error: external pointer is not valid 
    ```

*   checking package dependencies ... NOTE
    ```
    Depends: includes the non-default packages:
      ‘Biostrings’ ‘RSQLite’ ‘oligoClasses’ ‘oligo’ ‘DBI’ ‘IRanges’
      ‘S4Vectors’
    Adding so many packages to the search path is excessive and importing
    selectively is preferable.
    ```

*   checking DESCRIPTION meta-information ... NOTE
    ```
    Malformed Description field: should contain one or more complete sentences.
    ```

*   checking dependencies in R code ... NOTE
    ```
    Packages in Depends field not imported from:
      ‘IRanges’ ‘methods’ ‘oligo’ ‘oligoClasses’
      These packages need to be imported from (in the NAMESPACE file)
      for when this namespace is loaded but not attached.
    ```

# pd.hg.focus

Version: 3.12.0

## In both

*   checking whether package ‘pd.hg.focus’ can be installed ... WARNING
    ```
    Found the following significant warnings:
      Warning: call dbDisconnect() when finished working with a connection
    See ‘/home/muelleki/git/R/DBI/revdep/checks/pd.hg.focus/new/pd.hg.focus.Rcheck/00install.out’ for details.
    ```

*   checking whether the namespace can be unloaded cleanly ... WARNING
    ```
    ---- unloading
    Warning message:
    .onUnload failed in unloadNamespace() for 'pd.hg.focus', details:
      call: rsqlite_connection_valid(dbObj@ptr)
      error: external pointer is not valid 
    ```

*   checking package dependencies ... NOTE
    ```
    Depends: includes the non-default packages:
      ‘Biostrings’ ‘RSQLite’ ‘oligoClasses’ ‘oligo’ ‘DBI’ ‘IRanges’
      ‘S4Vectors’
    Adding so many packages to the search path is excessive and importing
    selectively is preferable.
    ```

*   checking installed package size ... NOTE
    ```
      installed size is  6.9Mb
      sub-directories of 1Mb or more:
        extdata   6.1Mb
    ```

*   checking DESCRIPTION meta-information ... NOTE
    ```
    Malformed Description field: should contain one or more complete sentences.
    ```

*   checking dependencies in R code ... NOTE
    ```
    Packages in Depends field not imported from:
      ‘IRanges’ ‘methods’ ‘oligo’ ‘oligoClasses’
      These packages need to be imported from (in the NAMESPACE file)
      for when this namespace is loaded but not attached.
    ```

# pd.hg.u133.plus.2

Version: 3.12.0

## In both

*   checking whether the namespace can be unloaded cleanly ... WARNING
    ```
    ---- unloading
    Warning message:
    .onUnload failed in unloadNamespace() for 'pd.hg.u133.plus.2', details:
      call: rsqlite_connection_valid(dbObj@ptr)
      error: external pointer is not valid 
    ```

*   checking package dependencies ... NOTE
    ```
    Depends: includes the non-default packages:
      ‘Biostrings’ ‘RSQLite’ ‘oligoClasses’ ‘oligo’ ‘DBI’ ‘IRanges’
      ‘S4Vectors’
    Adding so many packages to the search path is excessive and importing
    selectively is preferable.
    ```

*   checking installed package size ... NOTE
    ```
      installed size is 41.3Mb
      sub-directories of 1Mb or more:
        data      3.7Mb
        extdata  37.5Mb
    ```

*   checking DESCRIPTION meta-information ... NOTE
    ```
    Malformed Description field: should contain one or more complete sentences.
    ```

*   checking dependencies in R code ... NOTE
    ```
    Packages in Depends field not imported from:
      ‘IRanges’ ‘methods’ ‘oligo’ ‘oligoClasses’
      These packages need to be imported from (in the NAMESPACE file)
      for when this namespace is loaded but not attached.
    ```

# pd.hg.u133a

Version: 3.12.0

## In both

*   checking whether the namespace can be unloaded cleanly ... WARNING
    ```
    ---- unloading
    Warning message:
    .onUnload failed in unloadNamespace() for 'pd.hg.u133a', details:
      call: rsqlite_connection_valid(dbObj@ptr)
      error: external pointer is not valid 
    ```

*   checking package dependencies ... NOTE
    ```
    Depends: includes the non-default packages:
      ‘Biostrings’ ‘RSQLite’ ‘oligoClasses’ ‘oligo’ ‘DBI’ ‘IRanges’
      ‘S4Vectors’
    Adding so many packages to the search path is excessive and importing
    selectively is preferable.
    ```

*   checking installed package size ... NOTE
    ```
      installed size is 16.8Mb
      sub-directories of 1Mb or more:
        data      1.6Mb
        extdata  15.1Mb
    ```

*   checking DESCRIPTION meta-information ... NOTE
    ```
    Malformed Description field: should contain one or more complete sentences.
    ```

*   checking dependencies in R code ... NOTE
    ```
    Packages in Depends field not imported from:
      ‘IRanges’ ‘methods’ ‘oligo’ ‘oligoClasses’
      These packages need to be imported from (in the NAMESPACE file)
      for when this namespace is loaded but not attached.
    ```

# pd.hg.u133a.2

Version: 3.12.0

## In both

*   checking whether the namespace can be unloaded cleanly ... WARNING
    ```
    ---- unloading
    Warning message:
    .onUnload failed in unloadNamespace() for 'pd.hg.u133a.2', details:
      call: rsqlite_connection_valid(dbObj@ptr)
      error: external pointer is not valid 
    ```

*   checking package dependencies ... NOTE
    ```
    Depends: includes the non-default packages:
      ‘Biostrings’ ‘RSQLite’ ‘oligoClasses’ ‘oligo’ ‘DBI’ ‘IRanges’
      ‘S4Vectors’
    Adding so many packages to the search path is excessive and importing
    selectively is preferable.
    ```

*   checking installed package size ... NOTE
    ```
      installed size is 16.8Mb
      sub-directories of 1Mb or more:
        data      1.6Mb
        extdata  15.1Mb
    ```

*   checking DESCRIPTION meta-information ... NOTE
    ```
    Malformed Description field: should contain one or more complete sentences.
    ```

*   checking dependencies in R code ... NOTE
    ```
    Packages in Depends field not imported from:
      ‘IRanges’ ‘methods’ ‘oligo’ ‘oligoClasses’
      These packages need to be imported from (in the NAMESPACE file)
      for when this namespace is loaded but not attached.
    ```

# pd.hg.u133a.tag

Version: 3.12.0

## In both

*   checking whether the namespace can be unloaded cleanly ... WARNING
    ```
    ---- unloading
    Warning message:
    .onUnload failed in unloadNamespace() for 'pd.hg.u133a.tag', details:
      call: rsqlite_connection_valid(dbObj@ptr)
      error: external pointer is not valid 
    ```

*   checking package dependencies ... NOTE
    ```
    Depends: includes the non-default packages:
      ‘Biostrings’ ‘RSQLite’ ‘oligoClasses’ ‘oligo’ ‘DBI’ ‘IRanges’
      ‘S4Vectors’
    Adding so many packages to the search path is excessive and importing
    selectively is preferable.
    ```

*   checking installed package size ... NOTE
    ```
      installed size is 16.8Mb
      sub-directories of 1Mb or more:
        data      1.5Mb
        extdata  15.1Mb
    ```

*   checking DESCRIPTION meta-information ... NOTE
    ```
    Malformed Description field: should contain one or more complete sentences.
    ```

*   checking dependencies in R code ... NOTE
    ```
    Packages in Depends field not imported from:
      ‘IRanges’ ‘methods’ ‘oligo’ ‘oligoClasses’
      These packages need to be imported from (in the NAMESPACE file)
      for when this namespace is loaded but not attached.
    ```

# pd.hg.u133b

Version: 3.12.0

## In both

*   checking whether the namespace can be unloaded cleanly ... WARNING
    ```
    ---- unloading
    Warning message:
    .onUnload failed in unloadNamespace() for 'pd.hg.u133b', details:
      call: rsqlite_connection_valid(dbObj@ptr)
      error: external pointer is not valid 
    ```

*   checking package dependencies ... NOTE
    ```
    Depends: includes the non-default packages:
      ‘Biostrings’ ‘RSQLite’ ‘oligoClasses’ ‘oligo’ ‘DBI’ ‘IRanges’
      ‘S4Vectors’
    Adding so many packages to the search path is excessive and importing
    selectively is preferable.
    ```

*   checking installed package size ... NOTE
    ```
      installed size is 16.9Mb
      sub-directories of 1Mb or more:
        data      1.6Mb
        extdata  15.2Mb
    ```

*   checking DESCRIPTION meta-information ... NOTE
    ```
    Malformed Description field: should contain one or more complete sentences.
    ```

*   checking dependencies in R code ... NOTE
    ```
    Packages in Depends field not imported from:
      ‘IRanges’ ‘methods’ ‘oligo’ ‘oligoClasses’
      These packages need to be imported from (in the NAMESPACE file)
      for when this namespace is loaded but not attached.
    ```

# pd.hg.u219

Version: 3.12.0

## In both

*   checking whether the namespace can be unloaded cleanly ... WARNING
    ```
    ---- unloading
    Warning message:
    .onUnload failed in unloadNamespace() for 'pd.hg.u219', details:
      call: rsqlite_connection_valid(dbObj@ptr)
      error: external pointer is not valid 
    ```

*   checking package dependencies ... NOTE
    ```
    Depends: includes the non-default packages:
      ‘Biostrings’ ‘RSQLite’ ‘oligoClasses’ ‘oligo’ ‘DBI’ ‘IRanges’
      ‘S4Vectors’
    Adding so many packages to the search path is excessive and importing
    selectively is preferable.
    ```

*   checking installed package size ... NOTE
    ```
      installed size is 26.3Mb
      sub-directories of 1Mb or more:
        data      3.4Mb
        extdata  22.8Mb
    ```

*   checking DESCRIPTION meta-information ... NOTE
    ```
    Malformed Description field: should contain one or more complete sentences.
    ```

*   checking dependencies in R code ... NOTE
    ```
    Packages in Depends field not imported from:
      ‘IRanges’ ‘methods’ ‘oligo’ ‘oligoClasses’
      These packages need to be imported from (in the NAMESPACE file)
      for when this namespace is loaded but not attached.
    ```

# pd.hg.u95a

Version: 3.12.0

## In both

*   checking whether the namespace can be unloaded cleanly ... WARNING
    ```
    ---- unloading
    Warning message:
    .onUnload failed in unloadNamespace() for 'pd.hg.u95a', details:
      call: rsqlite_connection_valid(dbObj@ptr)
      error: external pointer is not valid 
    ```

*   checking package dependencies ... NOTE
    ```
    Depends: includes the non-default packages:
      ‘Biostrings’ ‘RSQLite’ ‘oligoClasses’ ‘oligo’ ‘DBI’ ‘IRanges’
      ‘S4Vectors’
    Adding so many packages to the search path is excessive and importing
    selectively is preferable.
    ```

*   checking installed package size ... NOTE
    ```
      installed size is 13.5Mb
      sub-directories of 1Mb or more:
        data      1.2Mb
        extdata  12.2Mb
    ```

*   checking DESCRIPTION meta-information ... NOTE
    ```
    Malformed Description field: should contain one or more complete sentences.
    ```

*   checking dependencies in R code ... NOTE
    ```
    Packages in Depends field not imported from:
      ‘IRanges’ ‘methods’ ‘oligo’ ‘oligoClasses’
      These packages need to be imported from (in the NAMESPACE file)
      for when this namespace is loaded but not attached.
    ```

# pd.hg.u95av2

Version: 3.12.0

## In both

*   checking whether the namespace can be unloaded cleanly ... WARNING
    ```
    ---- unloading
    Warning message:
    .onUnload failed in unloadNamespace() for 'pd.hg.u95av2', details:
      call: rsqlite_connection_valid(dbObj@ptr)
      error: external pointer is not valid 
    ```

*   checking package dependencies ... NOTE
    ```
    Depends: includes the non-default packages:
      ‘Biostrings’ ‘RSQLite’ ‘oligoClasses’ ‘oligo’ ‘DBI’ ‘IRanges’
      ‘S4Vectors’
    Adding so many packages to the search path is excessive and importing
    selectively is preferable.
    ```

*   checking installed package size ... NOTE
    ```
      installed size is 13.5Mb
      sub-directories of 1Mb or more:
        data      1.2Mb
        extdata  12.2Mb
    ```

*   checking DESCRIPTION meta-information ... NOTE
    ```
    Malformed Description field: should contain one or more complete sentences.
    ```

*   checking dependencies in R code ... NOTE
    ```
    Packages in Depends field not imported from:
      ‘IRanges’ ‘methods’ ‘oligo’ ‘oligoClasses’
      These packages need to be imported from (in the NAMESPACE file)
      for when this namespace is loaded but not attached.
    ```

# pd.hg.u95b

Version: 3.12.0

## In both

*   checking whether the namespace can be unloaded cleanly ... WARNING
    ```
    ---- unloading
    Warning message:
    .onUnload failed in unloadNamespace() for 'pd.hg.u95b', details:
      call: rsqlite_connection_valid(dbObj@ptr)
      error: external pointer is not valid 
    ```

*   checking package dependencies ... NOTE
    ```
    Depends: includes the non-default packages:
      ‘Biostrings’ ‘RSQLite’ ‘oligoClasses’ ‘oligo’ ‘DBI’ ‘IRanges’
      ‘S4Vectors’
    Adding so many packages to the search path is excessive and importing
    selectively is preferable.
    ```

*   checking installed package size ... NOTE
    ```
      installed size is 13.5Mb
      sub-directories of 1Mb or more:
        data      1.2Mb
        extdata  12.2Mb
    ```

*   checking DESCRIPTION meta-information ... NOTE
    ```
    Malformed Description field: should contain one or more complete sentences.
    ```

*   checking dependencies in R code ... NOTE
    ```
    Packages in Depends field not imported from:
      ‘IRanges’ ‘methods’ ‘oligo’ ‘oligoClasses’
      These packages need to be imported from (in the NAMESPACE file)
      for when this namespace is loaded but not attached.
    ```

# pd.hg.u95c

Version: 3.12.0

## In both

*   checking whether the namespace can be unloaded cleanly ... WARNING
    ```
    ---- unloading
    Warning message:
    .onUnload failed in unloadNamespace() for 'pd.hg.u95c', details:
      call: rsqlite_connection_valid(dbObj@ptr)
      error: external pointer is not valid 
    ```

*   checking package dependencies ... NOTE
    ```
    Depends: includes the non-default packages:
      ‘Biostrings’ ‘RSQLite’ ‘oligoClasses’ ‘oligo’ ‘DBI’ ‘IRanges’
      ‘S4Vectors’
    Adding so many packages to the search path is excessive and importing
    selectively is preferable.
    ```

*   checking installed package size ... NOTE
    ```
      installed size is 13.5Mb
      sub-directories of 1Mb or more:
        data      1.2Mb
        extdata  12.2Mb
    ```

*   checking DESCRIPTION meta-information ... NOTE
    ```
    Malformed Description field: should contain one or more complete sentences.
    ```

*   checking dependencies in R code ... NOTE
    ```
    Packages in Depends field not imported from:
      ‘IRanges’ ‘methods’ ‘oligo’ ‘oligoClasses’
      These packages need to be imported from (in the NAMESPACE file)
      for when this namespace is loaded but not attached.
    ```

# pd.hg.u95d

Version: 3.12.0

## In both

*   checking whether the namespace can be unloaded cleanly ... WARNING
    ```
    ---- unloading
    Warning message:
    .onUnload failed in unloadNamespace() for 'pd.hg.u95d', details:
      call: rsqlite_connection_valid(dbObj@ptr)
      error: external pointer is not valid 
    ```

*   checking package dependencies ... NOTE
    ```
    Depends: includes the non-default packages:
      ‘Biostrings’ ‘RSQLite’ ‘oligoClasses’ ‘oligo’ ‘DBI’ ‘IRanges’
      ‘S4Vectors’
    Adding so many packages to the search path is excessive and importing
    selectively is preferable.
    ```

*   checking installed package size ... NOTE
    ```
      installed size is 13.5Mb
      sub-directories of 1Mb or more:
        data      1.2Mb
        extdata  12.2Mb
    ```

*   checking DESCRIPTION meta-information ... NOTE
    ```
    Malformed Description field: should contain one or more complete sentences.
    ```

*   checking dependencies in R code ... NOTE
    ```
    Packages in Depends field not imported from:
      ‘IRanges’ ‘methods’ ‘oligo’ ‘oligoClasses’
      These packages need to be imported from (in the NAMESPACE file)
      for when this namespace is loaded but not attached.
    ```

# pd.hg.u95e

Version: 3.12.0

## In both

*   checking whether the namespace can be unloaded cleanly ... WARNING
    ```
    ---- unloading
    Warning message:
    .onUnload failed in unloadNamespace() for 'pd.hg.u95e', details:
      call: rsqlite_connection_valid(dbObj@ptr)
      error: external pointer is not valid 
    ```

*   checking package dependencies ... NOTE
    ```
    Depends: includes the non-default packages:
      ‘Biostrings’ ‘RSQLite’ ‘oligoClasses’ ‘oligo’ ‘DBI’ ‘IRanges’
      ‘S4Vectors’
    Adding so many packages to the search path is excessive and importing
    selectively is preferable.
    ```

*   checking installed package size ... NOTE
    ```
      installed size is 13.5Mb
      sub-directories of 1Mb or more:
        data      1.2Mb
        extdata  12.2Mb
    ```

*   checking DESCRIPTION meta-information ... NOTE
    ```
    Malformed Description field: should contain one or more complete sentences.
    ```

*   checking dependencies in R code ... NOTE
    ```
    Packages in Depends field not imported from:
      ‘IRanges’ ‘methods’ ‘oligo’ ‘oligoClasses’
      These packages need to be imported from (in the NAMESPACE file)
      for when this namespace is loaded but not attached.
    ```

# pd.hg18.60mer.expr

Version: 3.12.0

## In both

*   checking whether the namespace can be unloaded cleanly ... WARNING
    ```
    ---- unloading
    Warning message:
    .onUnload failed in unloadNamespace() for 'pd.hg18.60mer.expr', details:
      call: rsqlite_connection_valid(dbObj@ptr)
      error: external pointer is not valid 
    ```

*   checking package dependencies ... NOTE
    ```
    Depends: includes the non-default packages:
      ‘Biostrings’ ‘RSQLite’ ‘oligoClasses’ ‘oligo’ ‘DBI’ ‘IRanges’
      ‘S4Vectors’
    Adding so many packages to the search path is excessive and importing
    selectively is preferable.
    ```

*   checking DESCRIPTION meta-information ... NOTE
    ```
    Malformed Description field: should contain one or more complete sentences.
    ```

*   checking dependencies in R code ... NOTE
    ```
    Packages in Depends field not imported from:
      ‘IRanges’ ‘methods’ ‘oligo’ ‘oligoClasses’
      These packages need to be imported from (in the NAMESPACE file)
      for when this namespace is loaded but not attached.
    ```

# pd.ht.hg.u133.plus.pm

Version: 3.12.0

## In both

*   checking whether the namespace can be unloaded cleanly ... WARNING
    ```
    ---- unloading
    Warning message:
    .onUnload failed in unloadNamespace() for 'pd.ht.hg.u133.plus.pm', details:
      call: rsqlite_connection_valid(dbObj@ptr)
      error: external pointer is not valid 
    ```

*   checking package dependencies ... NOTE
    ```
    Depends: includes the non-default packages:
      ‘Biostrings’ ‘RSQLite’ ‘oligoClasses’ ‘oligo’ ‘DBI’ ‘IRanges’
      ‘S4Vectors’
    Adding so many packages to the search path is excessive and importing
    selectively is preferable.
    ```

*   checking installed package size ... NOTE
    ```
      installed size is 26.1Mb
      sub-directories of 1Mb or more:
        data      3.3Mb
        extdata  22.6Mb
    ```

*   checking DESCRIPTION meta-information ... NOTE
    ```
    Malformed Description field: should contain one or more complete sentences.
    ```

*   checking dependencies in R code ... NOTE
    ```
    Packages in Depends field not imported from:
      ‘IRanges’ ‘methods’ ‘oligo’ ‘oligoClasses’
      These packages need to be imported from (in the NAMESPACE file)
      for when this namespace is loaded but not attached.
    ```

# pd.ht.hg.u133a

Version: 3.12.0

## In both

*   checking whether the namespace can be unloaded cleanly ... WARNING
    ```
    ---- unloading
    Warning message:
    .onUnload failed in unloadNamespace() for 'pd.ht.hg.u133a', details:
      call: rsqlite_connection_valid(dbObj@ptr)
      error: external pointer is not valid 
    ```

*   checking package dependencies ... NOTE
    ```
    Depends: includes the non-default packages:
      ‘Biostrings’ ‘RSQLite’ ‘oligoClasses’ ‘oligo’ ‘DBI’ ‘IRanges’
      ‘S4Vectors’
    Adding so many packages to the search path is excessive and importing
    selectively is preferable.
    ```

*   checking installed package size ... NOTE
    ```
      installed size is 16.8Mb
      sub-directories of 1Mb or more:
        data      1.6Mb
        extdata  15.1Mb
    ```

*   checking DESCRIPTION meta-information ... NOTE
    ```
    Malformed Description field: should contain one or more complete sentences.
    ```

*   checking dependencies in R code ... NOTE
    ```
    Packages in Depends field not imported from:
      ‘IRanges’ ‘methods’ ‘oligo’ ‘oligoClasses’
      These packages need to be imported from (in the NAMESPACE file)
      for when this namespace is loaded but not attached.
    ```

# pd.ht.mg.430a

Version: 3.12.0

## In both

*   checking whether the namespace can be unloaded cleanly ... WARNING
    ```
    ---- unloading
    Warning message:
    .onUnload failed in unloadNamespace() for 'pd.ht.mg.430a', details:
      call: rsqlite_connection_valid(dbObj@ptr)
      error: external pointer is not valid 
    ```

*   checking package dependencies ... NOTE
    ```
    Depends: includes the non-default packages:
      ‘Biostrings’ ‘RSQLite’ ‘oligoClasses’ ‘oligo’ ‘DBI’ ‘IRanges’
      ‘S4Vectors’
    Adding so many packages to the search path is excessive and importing
    selectively is preferable.
    ```

*   checking installed package size ... NOTE
    ```
      installed size is 17.0Mb
      sub-directories of 1Mb or more:
        data      1.6Mb
        extdata  15.3Mb
    ```

*   checking DESCRIPTION meta-information ... NOTE
    ```
    Malformed Description field: should contain one or more complete sentences.
    ```

*   checking dependencies in R code ... NOTE
    ```
    Packages in Depends field not imported from:
      ‘IRanges’ ‘methods’ ‘oligo’ ‘oligoClasses’
      These packages need to be imported from (in the NAMESPACE file)
      for when this namespace is loaded but not attached.
    ```

# pd.hta.2.0

Version: 3.12.2

## In both

*   checking whether the namespace can be unloaded cleanly ... WARNING
    ```
    ---- unloading
    Warning message:
    .onUnload failed in unloadNamespace() for 'pd.hta.2.0', details:
      call: rsqlite_connection_valid(dbObj@ptr)
      error: external pointer is not valid 
    ```

*   checking package dependencies ... NOTE
    ```
    Depends: includes the non-default packages:
      ‘Biostrings’ ‘RSQLite’ ‘oligoClasses’ ‘oligo’ ‘DBI’ ‘IRanges’
      ‘S4Vectors’
    Adding so many packages to the search path is excessive and importing
    selectively is preferable.
    ```

*   checking installed package size ... NOTE
    ```
      installed size is 770.8Mb
      sub-directories of 1Mb or more:
        data      42.8Mb
        extdata  727.9Mb
    ```

*   checking DESCRIPTION meta-information ... NOTE
    ```
    Malformed Description field: should contain one or more complete sentences.
    ```

*   checking dependencies in R code ... NOTE
    ```
    Packages in Depends field not imported from:
      ‘IRanges’ ‘methods’ ‘oligo’ ‘oligoClasses’
      These packages need to be imported from (in the NAMESPACE file)
      for when this namespace is loaded but not attached.
    ```

# pd.hu6800

Version: 3.12.0

## In both

*   checking whether package ‘pd.hu6800’ can be installed ... WARNING
    ```
    Found the following significant warnings:
      Warning: call dbDisconnect() when finished working with a connection
    See ‘/home/muelleki/git/R/DBI/revdep/checks/pd.hu6800/new/pd.hu6800.Rcheck/00install.out’ for details.
    ```

*   checking whether the namespace can be unloaded cleanly ... WARNING
    ```
    ---- unloading
    Warning message:
    .onUnload failed in unloadNamespace() for 'pd.hu6800', details:
      call: rsqlite_connection_valid(dbObj@ptr)
      error: external pointer is not valid 
    ```

*   checking package dependencies ... NOTE
    ```
    Depends: includes the non-default packages:
      ‘Biostrings’ ‘RSQLite’ ‘oligoClasses’ ‘oligo’ ‘DBI’ ‘IRanges’
      ‘S4Vectors’
    Adding so many packages to the search path is excessive and importing
    selectively is preferable.
    ```

*   checking installed package size ... NOTE
    ```
      installed size is  9.4Mb
      sub-directories of 1Mb or more:
        extdata   8.5Mb
    ```

*   checking DESCRIPTION meta-information ... NOTE
    ```
    Malformed Description field: should contain one or more complete sentences.
    ```

*   checking dependencies in R code ... NOTE
    ```
    Packages in Depends field not imported from:
      ‘IRanges’ ‘methods’ ‘oligo’ ‘oligoClasses’
      These packages need to be imported from (in the NAMESPACE file)
      for when this namespace is loaded but not attached.
    ```

# pd.huex.1.0.st.v2

Version: 3.14.1

## In both

*   checking whether the namespace can be unloaded cleanly ... WARNING
    ```
    ---- unloading
    Warning message:
    .onUnload failed in unloadNamespace() for 'pd.huex.1.0.st.v2', details:
      call: rsqlite_connection_valid(dbObj@ptr)
      error: external pointer is not valid 
    ```

*   checking package dependencies ... NOTE
    ```
    Depends: includes the non-default packages:
      ‘Biostrings’ ‘RSQLite’ ‘oligoClasses’ ‘oligo’ ‘DBI’ ‘IRanges’
      ‘S4Vectors’
    Adding so many packages to the search path is excessive and importing
    selectively is preferable.
    ```

*   checking installed package size ... NOTE
    ```
      installed size is 482.6Mb
      sub-directories of 1Mb or more:
        data      34.4Mb
        extdata  448.1Mb
    ```

*   checking DESCRIPTION meta-information ... NOTE
    ```
    Malformed Description field: should contain one or more complete sentences.
    ```

*   checking dependencies in R code ... NOTE
    ```
    Packages in Depends field not imported from:
      ‘IRanges’ ‘methods’ ‘oligo’ ‘oligoClasses’
      These packages need to be imported from (in the NAMESPACE file)
      for when this namespace is loaded but not attached.
    ```

# pd.hugene.1.0.st.v1

Version: 3.14.1

## In both

*   checking whether the namespace can be unloaded cleanly ... WARNING
    ```
    ---- unloading
    Warning message:
    .onUnload failed in unloadNamespace() for 'pd.hugene.1.0.st.v1', details:
      call: rsqlite_connection_valid(dbObj@ptr)
      error: external pointer is not valid 
    ```

*   checking package dependencies ... NOTE
    ```
    Depends: includes the non-default packages:
      ‘Biostrings’ ‘RSQLite’ ‘oligoClasses’ ‘oligo’ ‘DBI’ ‘IRanges’
      ‘S4Vectors’
    Adding so many packages to the search path is excessive and importing
    selectively is preferable.
    ```

*   checking installed package size ... NOTE
    ```
      installed size is 108.7Mb
      sub-directories of 1Mb or more:
        data       5.2Mb
        extdata  103.3Mb
    ```

*   checking DESCRIPTION meta-information ... NOTE
    ```
    Malformed Description field: should contain one or more complete sentences.
    ```

*   checking dependencies in R code ... NOTE
    ```
    Packages in Depends field not imported from:
      ‘IRanges’ ‘methods’ ‘oligo’ ‘oligoClasses’
      These packages need to be imported from (in the NAMESPACE file)
      for when this namespace is loaded but not attached.
    ```

# pd.hugene.1.1.st.v1

Version: 3.14.1

## In both

*   checking whether the namespace can be unloaded cleanly ... WARNING
    ```
    ---- unloading
    Warning message:
    .onUnload failed in unloadNamespace() for 'pd.hugene.1.1.st.v1', details:
      call: rsqlite_connection_valid(dbObj@ptr)
      error: external pointer is not valid 
    ```

*   checking package dependencies ... NOTE
    ```
    Depends: includes the non-default packages:
      ‘Biostrings’ ‘RSQLite’ ‘oligoClasses’ ‘oligo’ ‘DBI’ ‘IRanges’
      ‘S4Vectors’
    Adding so many packages to the search path is excessive and importing
    selectively is preferable.
    ```

*   checking installed package size ... NOTE
    ```
      installed size is 108.5Mb
      sub-directories of 1Mb or more:
        data       5.1Mb
        extdata  103.3Mb
    ```

*   checking DESCRIPTION meta-information ... NOTE
    ```
    Malformed Description field: should contain one or more complete sentences.
    ```

*   checking dependencies in R code ... NOTE
    ```
    Packages in Depends field not imported from:
      ‘IRanges’ ‘methods’ ‘oligo’ ‘oligoClasses’
      These packages need to be imported from (in the NAMESPACE file)
      for when this namespace is loaded but not attached.
    ```

# pd.hugene.2.0.st

Version: 3.14.1

## In both

*   checking whether the namespace can be unloaded cleanly ... WARNING
    ```
    ---- unloading
    Warning message:
    .onUnload failed in unloadNamespace() for 'pd.hugene.2.0.st', details:
      call: rsqlite_connection_valid(dbObj@ptr)
      error: external pointer is not valid 
    ```

*   checking package dependencies ... NOTE
    ```
    Depends: includes the non-default packages:
      ‘Biostrings’ ‘RSQLite’ ‘oligoClasses’ ‘oligo’ ‘DBI’ ‘IRanges’
      ‘S4Vectors’
    Adding so many packages to the search path is excessive and importing
    selectively is preferable.
    ```

*   checking installed package size ... NOTE
    ```
      installed size is 139.0Mb
      sub-directories of 1Mb or more:
        data       6.6Mb
        extdata  132.3Mb
    ```

*   checking DESCRIPTION meta-information ... NOTE
    ```
    Malformed Description field: should contain one or more complete sentences.
    ```

*   checking dependencies in R code ... NOTE
    ```
    Packages in Depends field not imported from:
      ‘IRanges’ ‘methods’ ‘oligo’ ‘oligoClasses’
      These packages need to be imported from (in the NAMESPACE file)
      for when this namespace is loaded but not attached.
    ```

# pd.hugene.2.1.st

Version: 3.14.1

## In both

*   checking whether the namespace can be unloaded cleanly ... WARNING
    ```
    ---- unloading
    Warning message:
    .onUnload failed in unloadNamespace() for 'pd.hugene.2.1.st', details:
      call: rsqlite_connection_valid(dbObj@ptr)
      error: external pointer is not valid 
    ```

*   checking package dependencies ... NOTE
    ```
    Depends: includes the non-default packages:
      ‘Biostrings’ ‘RSQLite’ ‘oligoClasses’ ‘oligo’ ‘DBI’ ‘IRanges’
      ‘S4Vectors’
    Adding so many packages to the search path is excessive and importing
    selectively is preferable.
    ```

*   checking installed package size ... NOTE
    ```
      installed size is 138.5Mb
      sub-directories of 1Mb or more:
        data       6.1Mb
        extdata  132.3Mb
    ```

*   checking DESCRIPTION meta-information ... NOTE
    ```
    Malformed Description field: should contain one or more complete sentences.
    ```

*   checking dependencies in R code ... NOTE
    ```
    Packages in Depends field not imported from:
      ‘IRanges’ ‘methods’ ‘oligo’ ‘oligoClasses’
      These packages need to be imported from (in the NAMESPACE file)
      for when this namespace is loaded but not attached.
    ```

# pd.maize

Version: 3.12.0

## In both

*   checking whether the namespace can be unloaded cleanly ... WARNING
    ```
    ---- unloading
    Warning message:
    .onUnload failed in unloadNamespace() for 'pd.maize', details:
      call: rsqlite_connection_valid(dbObj@ptr)
      error: external pointer is not valid 
    ```

*   checking package dependencies ... NOTE
    ```
    Depends: includes the non-default packages:
      ‘Biostrings’ ‘RSQLite’ ‘oligoClasses’ ‘oligo’ ‘DBI’ ‘IRanges’
      ‘S4Vectors’
    Adding so many packages to the search path is excessive and importing
    selectively is preferable.
    ```

*   checking installed package size ... NOTE
    ```
      installed size is 17.9Mb
      sub-directories of 1Mb or more:
        data      1.7Mb
        extdata  16.1Mb
    ```

*   checking DESCRIPTION meta-information ... NOTE
    ```
    Malformed Description field: should contain one or more complete sentences.
    ```

*   checking dependencies in R code ... NOTE
    ```
    Packages in Depends field not imported from:
      ‘IRanges’ ‘methods’ ‘oligo’ ‘oligoClasses’
      These packages need to be imported from (in the NAMESPACE file)
      for when this namespace is loaded but not attached.
    ```

# pd.mapping250k.nsp

Version: 3.12.0

## In both

*   checking whether the namespace can be unloaded cleanly ... WARNING
    ```
    ---- unloading
    Warning message:
    .onUnload failed in unloadNamespace() for 'pd.mapping250k.nsp', details:
      call: rsqlite_connection_valid(dbObj@ptr)
      error: external pointer is not valid 
    ```

*   checking package dependencies ... NOTE
    ```
    Depends: includes the non-default packages:
      ‘Biostrings’ ‘RSQLite’ ‘oligoClasses’ ‘oligo’ ‘DBI’ ‘IRanges’
      ‘S4Vectors’
    Adding so many packages to the search path is excessive and importing
    selectively is preferable.
    ```

*   checking installed package size ... NOTE
    ```
      installed size is 867.4Mb
      sub-directories of 1Mb or more:
        extdata  867.3Mb
    ```

*   checking DESCRIPTION meta-information ... NOTE
    ```
    Malformed Description field: should contain one or more complete sentences.
    ```

*   checking dependencies in R code ... NOTE
    ```
    Packages in Depends field not imported from:
      ‘IRanges’ ‘methods’ ‘oligo’ ‘oligoClasses’
      These packages need to be imported from (in the NAMESPACE file)
      for when this namespace is loaded but not attached.
    ```

# pd.mapping250k.sty

Version: 3.12.0

## In both

*   checking whether the namespace can be unloaded cleanly ... WARNING
    ```
    ---- unloading
    Warning message:
    .onUnload failed in unloadNamespace() for 'pd.mapping250k.sty', details:
      call: rsqlite_connection_valid(dbObj@ptr)
      error: external pointer is not valid 
    ```

*   checking package dependencies ... NOTE
    ```
    Depends: includes the non-default packages:
      ‘Biostrings’ ‘RSQLite’ ‘oligoClasses’ ‘oligo’ ‘DBI’ ‘IRanges’
      ‘S4Vectors’
    Adding so many packages to the search path is excessive and importing
    selectively is preferable.
    ```

*   checking installed package size ... NOTE
    ```
      installed size is 846.3Mb
      sub-directories of 1Mb or more:
        extdata  846.2Mb
    ```

*   checking DESCRIPTION meta-information ... NOTE
    ```
    Malformed Description field: should contain one or more complete sentences.
    ```

*   checking dependencies in R code ... NOTE
    ```
    Packages in Depends field not imported from:
      ‘IRanges’ ‘methods’ ‘oligo’ ‘oligoClasses’
      These packages need to be imported from (in the NAMESPACE file)
      for when this namespace is loaded but not attached.
    ```

# pd.mapping50k.hind240

Version: 3.12.0

## In both

*   checking whether the namespace can be unloaded cleanly ... WARNING
    ```
    ---- unloading
    Warning message:
    .onUnload failed in unloadNamespace() for 'pd.mapping50k.hind240', details:
      call: rsqlite_connection_valid(dbObj@ptr)
      error: external pointer is not valid 
    ```

*   checking package dependencies ... NOTE
    ```
    Depends: includes the non-default packages:
      ‘Biostrings’ ‘RSQLite’ ‘oligoClasses’ ‘oligo’ ‘DBI’ ‘IRanges’
      ‘S4Vectors’
    Adding so many packages to the search path is excessive and importing
    selectively is preferable.
    ```

*   checking installed package size ... NOTE
    ```
      installed size is 269.3Mb
      sub-directories of 1Mb or more:
        extdata  269.2Mb
    ```

*   checking DESCRIPTION meta-information ... NOTE
    ```
    Malformed Description field: should contain one or more complete sentences.
    ```

*   checking dependencies in R code ... NOTE
    ```
    Packages in Depends field not imported from:
      ‘IRanges’ ‘methods’ ‘oligo’ ‘oligoClasses’
      These packages need to be imported from (in the NAMESPACE file)
      for when this namespace is loaded but not attached.
    ```

# pd.mapping50k.xba240

Version: 3.12.0

## In both

*   checking whether the namespace can be unloaded cleanly ... WARNING
    ```
    ---- unloading
    Warning message:
    .onUnload failed in unloadNamespace() for 'pd.mapping50k.xba240', details:
      call: rsqlite_connection_valid(dbObj@ptr)
      error: external pointer is not valid 
    ```

*   checking package dependencies ... NOTE
    ```
    Depends: includes the non-default packages:
      ‘Biostrings’ ‘RSQLite’ ‘oligoClasses’ ‘oligo’ ‘DBI’ ‘IRanges’
      ‘S4Vectors’
    Adding so many packages to the search path is excessive and importing
    selectively is preferable.
    ```

*   checking installed package size ... NOTE
    ```
      installed size is 276.8Mb
      sub-directories of 1Mb or more:
        extdata  276.7Mb
    ```

*   checking DESCRIPTION meta-information ... NOTE
    ```
    Malformed Description field: should contain one or more complete sentences.
    ```

*   checking dependencies in R code ... NOTE
    ```
    Packages in Depends field not imported from:
      ‘IRanges’ ‘methods’ ‘oligo’ ‘oligoClasses’
      These packages need to be imported from (in the NAMESPACE file)
      for when this namespace is loaded but not attached.
    ```

# pd.margene.1.0.st

Version: 3.12.0

## In both

*   checking whether the namespace can be unloaded cleanly ... WARNING
    ```
    ---- unloading
    Warning message:
    .onUnload failed in unloadNamespace() for 'pd.margene.1.0.st', details:
      call: rsqlite_connection_valid(dbObj@ptr)
      error: external pointer is not valid 
    ```

*   checking package dependencies ... NOTE
    ```
    Depends: includes the non-default packages:
      ‘Biostrings’ ‘RSQLite’ ‘oligoClasses’ ‘oligo’ ‘DBI’ ‘IRanges’
      ‘S4Vectors’
    Adding so many packages to the search path is excessive and importing
    selectively is preferable.
    ```

*   checking installed package size ... NOTE
    ```
      installed size is 67.9Mb
      sub-directories of 1Mb or more:
        data      4.8Mb
        extdata  62.9Mb
    ```

*   checking DESCRIPTION meta-information ... NOTE
    ```
    Malformed Description field: should contain one or more complete sentences.
    ```

*   checking dependencies in R code ... NOTE
    ```
    Packages in Depends field not imported from:
      ‘IRanges’ ‘methods’ ‘oligo’ ‘oligoClasses’
      These packages need to be imported from (in the NAMESPACE file)
      for when this namespace is loaded but not attached.
    ```

# pd.margene.1.1.st

Version: 3.12.0

## In both

*   checking whether the namespace can be unloaded cleanly ... WARNING
    ```
    ---- unloading
    Warning message:
    .onUnload failed in unloadNamespace() for 'pd.margene.1.1.st', details:
      call: rsqlite_connection_valid(dbObj@ptr)
      error: external pointer is not valid 
    ```

*   checking package dependencies ... NOTE
    ```
    Depends: includes the non-default packages:
      ‘Biostrings’ ‘RSQLite’ ‘oligoClasses’ ‘oligo’ ‘DBI’ ‘IRanges’
      ‘S4Vectors’
    Adding so many packages to the search path is excessive and importing
    selectively is preferable.
    ```

*   checking installed package size ... NOTE
    ```
      installed size is 67.8Mb
      sub-directories of 1Mb or more:
        data      4.7Mb
        extdata  62.9Mb
    ```

*   checking DESCRIPTION meta-information ... NOTE
    ```
    Malformed Description field: should contain one or more complete sentences.
    ```

*   checking dependencies in R code ... NOTE
    ```
    Packages in Depends field not imported from:
      ‘IRanges’ ‘methods’ ‘oligo’ ‘oligoClasses’
      These packages need to be imported from (in the NAMESPACE file)
      for when this namespace is loaded but not attached.
    ```

# pd.medgene.1.0.st

Version: 3.12.0

## In both

*   checking whether the namespace can be unloaded cleanly ... WARNING
    ```
    ---- unloading
    Warning message:
    .onUnload failed in unloadNamespace() for 'pd.medgene.1.0.st', details:
      call: rsqlite_connection_valid(dbObj@ptr)
      error: external pointer is not valid 
    ```

*   checking package dependencies ... NOTE
    ```
    Depends: includes the non-default packages:
      ‘Biostrings’ ‘RSQLite’ ‘oligoClasses’ ‘oligo’ ‘DBI’ ‘IRanges’
      ‘S4Vectors’
    Adding so many packages to the search path is excessive and importing
    selectively is preferable.
    ```

*   checking installed package size ... NOTE
    ```
      installed size is 54.5Mb
      sub-directories of 1Mb or more:
        data      4.7Mb
        extdata  49.7Mb
    ```

*   checking DESCRIPTION meta-information ... NOTE
    ```
    Malformed Description field: should contain one or more complete sentences.
    ```

*   checking dependencies in R code ... NOTE
    ```
    Packages in Depends field not imported from:
      ‘IRanges’ ‘methods’ ‘oligo’ ‘oligoClasses’
      These packages need to be imported from (in the NAMESPACE file)
      for when this namespace is loaded but not attached.
    ```

# pd.medgene.1.1.st

Version: 3.12.0

## In both

*   checking whether the namespace can be unloaded cleanly ... WARNING
    ```
    ---- unloading
    Warning message:
    .onUnload failed in unloadNamespace() for 'pd.medgene.1.1.st', details:
      call: rsqlite_connection_valid(dbObj@ptr)
      error: external pointer is not valid 
    ```

*   checking package dependencies ... NOTE
    ```
    Depends: includes the non-default packages:
      ‘Biostrings’ ‘RSQLite’ ‘oligoClasses’ ‘oligo’ ‘DBI’ ‘IRanges’
      ‘S4Vectors’
    Adding so many packages to the search path is excessive and importing
    selectively is preferable.
    ```

*   checking installed package size ... NOTE
    ```
      installed size is 54.4Mb
      sub-directories of 1Mb or more:
        data      4.6Mb
        extdata  49.7Mb
    ```

*   checking DESCRIPTION meta-information ... NOTE
    ```
    Malformed Description field: should contain one or more complete sentences.
    ```

*   checking dependencies in R code ... NOTE
    ```
    Packages in Depends field not imported from:
      ‘IRanges’ ‘methods’ ‘oligo’ ‘oligoClasses’
      These packages need to be imported from (in the NAMESPACE file)
      for when this namespace is loaded but not attached.
    ```

# pd.medicago

Version: 3.12.0

## In both

*   checking whether the namespace can be unloaded cleanly ... WARNING
    ```
    ---- unloading
    Warning message:
    .onUnload failed in unloadNamespace() for 'pd.medicago', details:
      call: rsqlite_connection_valid(dbObj@ptr)
      error: external pointer is not valid 
    ```

*   checking package dependencies ... NOTE
    ```
    Depends: includes the non-default packages:
      ‘Biostrings’ ‘RSQLite’ ‘oligoClasses’ ‘oligo’ ‘DBI’ ‘IRanges’
      ‘S4Vectors’
    Adding so many packages to the search path is excessive and importing
    selectively is preferable.
    ```

*   checking installed package size ... NOTE
    ```
      installed size is 46.5Mb
      sub-directories of 1Mb or more:
        data      4.1Mb
        extdata  42.3Mb
    ```

*   checking DESCRIPTION meta-information ... NOTE
    ```
    Malformed Description field: should contain one or more complete sentences.
    ```

*   checking dependencies in R code ... NOTE
    ```
    Packages in Depends field not imported from:
      ‘IRanges’ ‘methods’ ‘oligo’ ‘oligoClasses’
      These packages need to be imported from (in the NAMESPACE file)
      for when this namespace is loaded but not attached.
    ```

# pd.mg.u74a

Version: 3.12.0

## In both

*   checking whether the namespace can be unloaded cleanly ... WARNING
    ```
    ---- unloading
    Warning message:
    .onUnload failed in unloadNamespace() for 'pd.mg.u74a', details:
      call: rsqlite_connection_valid(dbObj@ptr)
      error: external pointer is not valid 
    ```

*   checking package dependencies ... NOTE
    ```
    Depends: includes the non-default packages:
      ‘Biostrings’ ‘RSQLite’ ‘oligoClasses’ ‘oligo’ ‘DBI’ ‘IRanges’
      ‘S4Vectors’
    Adding so many packages to the search path is excessive and importing
    selectively is preferable.
    ```

*   checking installed package size ... NOTE
    ```
      installed size is 13.6Mb
      sub-directories of 1Mb or more:
        data      1.2Mb
        extdata  12.2Mb
    ```

*   checking DESCRIPTION meta-information ... NOTE
    ```
    Malformed Description field: should contain one or more complete sentences.
    ```

*   checking dependencies in R code ... NOTE
    ```
    Packages in Depends field not imported from:
      ‘IRanges’ ‘methods’ ‘oligo’ ‘oligoClasses’
      These packages need to be imported from (in the NAMESPACE file)
      for when this namespace is loaded but not attached.
    ```

# pd.mg.u74av2

Version: 3.12.0

## In both

*   checking whether the namespace can be unloaded cleanly ... WARNING
    ```
    ---- unloading
    Warning message:
    .onUnload failed in unloadNamespace() for 'pd.mg.u74av2', details:
      call: rsqlite_connection_valid(dbObj@ptr)
      error: external pointer is not valid 
    ```

*   checking package dependencies ... NOTE
    ```
    Depends: includes the non-default packages:
      ‘Biostrings’ ‘RSQLite’ ‘oligoClasses’ ‘oligo’ ‘DBI’ ‘IRanges’
      ‘S4Vectors’
    Adding so many packages to the search path is excessive and importing
    selectively is preferable.
    ```

*   checking installed package size ... NOTE
    ```
      installed size is 13.3Mb
      sub-directories of 1Mb or more:
        data      1.2Mb
        extdata  11.9Mb
    ```

*   checking DESCRIPTION meta-information ... NOTE
    ```
    Malformed Description field: should contain one or more complete sentences.
    ```

*   checking dependencies in R code ... NOTE
    ```
    Packages in Depends field not imported from:
      ‘IRanges’ ‘methods’ ‘oligo’ ‘oligoClasses’
      These packages need to be imported from (in the NAMESPACE file)
      for when this namespace is loaded but not attached.
    ```

# pd.mg.u74b

Version: 3.12.0

## In both

*   checking whether the namespace can be unloaded cleanly ... WARNING
    ```
    ---- unloading
    Warning message:
    .onUnload failed in unloadNamespace() for 'pd.mg.u74b', details:
      call: rsqlite_connection_valid(dbObj@ptr)
      error: external pointer is not valid 
    ```

*   checking package dependencies ... NOTE
    ```
    Depends: includes the non-default packages:
      ‘Biostrings’ ‘RSQLite’ ‘oligoClasses’ ‘oligo’ ‘DBI’ ‘IRanges’
      ‘S4Vectors’
    Adding so many packages to the search path is excessive and importing
    selectively is preferable.
    ```

*   checking installed package size ... NOTE
    ```
      installed size is 13.6Mb
      sub-directories of 1Mb or more:
        data      1.3Mb
        extdata  12.3Mb
    ```

*   checking DESCRIPTION meta-information ... NOTE
    ```
    Malformed Description field: should contain one or more complete sentences.
    ```

*   checking dependencies in R code ... NOTE
    ```
    Packages in Depends field not imported from:
      ‘IRanges’ ‘methods’ ‘oligo’ ‘oligoClasses’
      These packages need to be imported from (in the NAMESPACE file)
      for when this namespace is loaded but not attached.
    ```

# pd.mg.u74bv2

Version: 3.12.0

## In both

*   checking whether the namespace can be unloaded cleanly ... WARNING
    ```
    ---- unloading
    Warning message:
    .onUnload failed in unloadNamespace() for 'pd.mg.u74bv2', details:
      call: rsqlite_connection_valid(dbObj@ptr)
      error: external pointer is not valid 
    ```

*   checking package dependencies ... NOTE
    ```
    Depends: includes the non-default packages:
      ‘Biostrings’ ‘RSQLite’ ‘oligoClasses’ ‘oligo’ ‘DBI’ ‘IRanges’
      ‘S4Vectors’
    Adding so many packages to the search path is excessive and importing
    selectively is preferable.
    ```

*   checking installed package size ... NOTE
    ```
      installed size is 13.2Mb
      sub-directories of 1Mb or more:
        data      1.2Mb
        extdata  11.9Mb
    ```

*   checking DESCRIPTION meta-information ... NOTE
    ```
    Malformed Description field: should contain one or more complete sentences.
    ```

*   checking dependencies in R code ... NOTE
    ```
    Packages in Depends field not imported from:
      ‘IRanges’ ‘methods’ ‘oligo’ ‘oligoClasses’
      These packages need to be imported from (in the NAMESPACE file)
      for when this namespace is loaded but not attached.
    ```

# pd.mg.u74c

Version: 3.12.0

## In both

*   checking whether the namespace can be unloaded cleanly ... WARNING
    ```
    ---- unloading
    Warning message:
    .onUnload failed in unloadNamespace() for 'pd.mg.u74c', details:
      call: rsqlite_connection_valid(dbObj@ptr)
      error: external pointer is not valid 
    ```

*   checking package dependencies ... NOTE
    ```
    Depends: includes the non-default packages:
      ‘Biostrings’ ‘RSQLite’ ‘oligoClasses’ ‘oligo’ ‘DBI’ ‘IRanges’
      ‘S4Vectors’
    Adding so many packages to the search path is excessive and importing
    selectively is preferable.
    ```

*   checking installed package size ... NOTE
    ```
      installed size is 13.5Mb
      sub-directories of 1Mb or more:
        data      1.1Mb
        extdata  12.3Mb
    ```

*   checking DESCRIPTION meta-information ... NOTE
    ```
    Malformed Description field: should contain one or more complete sentences.
    ```

*   checking dependencies in R code ... NOTE
    ```
    Packages in Depends field not imported from:
      ‘IRanges’ ‘methods’ ‘oligo’ ‘oligoClasses’
      These packages need to be imported from (in the NAMESPACE file)
      for when this namespace is loaded but not attached.
    ```

# pd.mg.u74cv2

Version: 3.12.0

## In both

*   checking whether the namespace can be unloaded cleanly ... WARNING
    ```
    ---- unloading
    Warning message:
    .onUnload failed in unloadNamespace() for 'pd.mg.u74cv2', details:
      call: rsqlite_connection_valid(dbObj@ptr)
      error: external pointer is not valid 
    ```

*   checking package dependencies ... NOTE
    ```
    Depends: includes the non-default packages:
      ‘Biostrings’ ‘RSQLite’ ‘oligoClasses’ ‘oligo’ ‘DBI’ ‘IRanges’
      ‘S4Vectors’
    Adding so many packages to the search path is excessive and importing
    selectively is preferable.
    ```

*   checking installed package size ... NOTE
    ```
      installed size is 12.3Mb
      sub-directories of 1Mb or more:
        data      1.1Mb
        extdata  11.1Mb
    ```

*   checking DESCRIPTION meta-information ... NOTE
    ```
    Malformed Description field: should contain one or more complete sentences.
    ```

*   checking dependencies in R code ... NOTE
    ```
    Packages in Depends field not imported from:
      ‘IRanges’ ‘methods’ ‘oligo’ ‘oligoClasses’
      These packages need to be imported from (in the NAMESPACE file)
      for when this namespace is loaded but not attached.
    ```

# pd.mirna.1.0

Version: 3.12.0

## In both

*   checking whether the namespace can be unloaded cleanly ... WARNING
    ```
    ---- unloading
    Warning message:
    .onUnload failed in unloadNamespace() for 'pd.mirna.1.0', details:
      call: rsqlite_connection_valid(dbObj@ptr)
      error: external pointer is not valid 
    ```

*   checking package dependencies ... NOTE
    ```
    Depends: includes the non-default packages:
      ‘Biostrings’ ‘RSQLite’ ‘oligoClasses’ ‘oligo’ ‘DBI’ ‘IRanges’
      ‘S4Vectors’
    Adding so many packages to the search path is excessive and importing
    selectively is preferable.
    ```

*   checking DESCRIPTION meta-information ... NOTE
    ```
    Malformed Description field: should contain one or more complete sentences.
    ```

*   checking dependencies in R code ... NOTE
    ```
    Packages in Depends field not imported from:
      ‘IRanges’ ‘methods’ ‘oligo’ ‘oligoClasses’
      These packages need to be imported from (in the NAMESPACE file)
      for when this namespace is loaded but not attached.
    ```

# pd.mirna.2.0

Version: 3.12.0

## In both

*   checking whether package ‘pd.mirna.2.0’ can be installed ... WARNING
    ```
    Found the following significant warnings:
      Warning: call dbDisconnect() when finished working with a connection
    See ‘/home/muelleki/git/R/DBI/revdep/checks/pd.mirna.2.0/new/pd.mirna.2.0.Rcheck/00install.out’ for details.
    ```

*   checking whether the namespace can be unloaded cleanly ... WARNING
    ```
    ---- unloading
    Warning message:
    .onUnload failed in unloadNamespace() for 'pd.mirna.2.0', details:
      call: rsqlite_connection_valid(dbObj@ptr)
      error: external pointer is not valid 
    ```

*   checking package dependencies ... NOTE
    ```
    Depends: includes the non-default packages:
      ‘Biostrings’ ‘RSQLite’ ‘oligoClasses’ ‘oligo’ ‘DBI’ ‘IRanges’
      ‘S4Vectors’
    Adding so many packages to the search path is excessive and importing
    selectively is preferable.
    ```

*   checking installed package size ... NOTE
    ```
      installed size is 16.4Mb
      sub-directories of 1Mb or more:
        extdata  15.4Mb
    ```

*   checking DESCRIPTION meta-information ... NOTE
    ```
    Malformed Description field: should contain one or more complete sentences.
    ```

*   checking dependencies in R code ... NOTE
    ```
    Packages in Depends field not imported from:
      ‘IRanges’ ‘methods’ ‘oligo’ ‘oligoClasses’
      These packages need to be imported from (in the NAMESPACE file)
      for when this namespace is loaded but not attached.
    ```

# pd.mirna.3.0

Version: 3.12.0

## In both

*   checking whether the namespace can be unloaded cleanly ... WARNING
    ```
    ---- unloading
    Warning message:
    .onUnload failed in unloadNamespace() for 'pd.mirna.3.0', details:
      call: rsqlite_connection_valid(dbObj@ptr)
      error: external pointer is not valid 
    ```

*   checking package dependencies ... NOTE
    ```
    Depends: includes the non-default packages:
      ‘Biostrings’ ‘RSQLite’ ‘oligoClasses’ ‘oligo’ ‘DBI’ ‘IRanges’
      ‘S4Vectors’
    Adding so many packages to the search path is excessive and importing
    selectively is preferable.
    ```

*   checking installed package size ... NOTE
    ```
      installed size is 19.9Mb
      sub-directories of 1Mb or more:
        data      1.1Mb
        extdata  18.7Mb
    ```

*   checking DESCRIPTION meta-information ... NOTE
    ```
    Malformed Description field: should contain one or more complete sentences.
    ```

*   checking dependencies in R code ... NOTE
    ```
    Packages in Depends field not imported from:
      ‘IRanges’ ‘methods’ ‘oligo’ ‘oligoClasses’
      These packages need to be imported from (in the NAMESPACE file)
      for when this namespace is loaded but not attached.
    ```

# pd.mirna.3.1

Version: 3.8.1

## In both

*   checking package dependencies ... ERROR
    ```
    Namespace dependency not required: ‘S4Vectors’
    
    See section ‘The DESCRIPTION file’ in the ‘Writing R Extensions’
    manual.
    ```

# pd.mirna.4.0

Version: 3.12.0

## In both

*   checking whether the namespace can be unloaded cleanly ... WARNING
    ```
    ---- unloading
    Warning message:
    .onUnload failed in unloadNamespace() for 'pd.mirna.4.0', details:
      call: rsqlite_connection_valid(dbObj@ptr)
      error: external pointer is not valid 
    ```

*   checking package dependencies ... NOTE
    ```
    Depends: includes the non-default packages:
      ‘Biostrings’ ‘RSQLite’ ‘oligoClasses’ ‘oligo’ ‘DBI’ ‘IRanges’
      ‘S4Vectors’
    Adding so many packages to the search path is excessive and importing
    selectively is preferable.
    ```

*   checking installed package size ... NOTE
    ```
      installed size is 19.7Mb
      sub-directories of 1Mb or more:
        data      1.4Mb
        extdata  18.2Mb
    ```

*   checking DESCRIPTION meta-information ... NOTE
    ```
    Malformed Description field: should contain one or more complete sentences.
    ```

*   checking dependencies in R code ... NOTE
    ```
    Packages in Depends field not imported from:
      ‘IRanges’ ‘methods’ ‘oligo’ ‘oligoClasses’
      These packages need to be imported from (in the NAMESPACE file)
      for when this namespace is loaded but not attached.
    ```

# pd.moe430a

Version: 3.12.0

## In both

*   checking whether the namespace can be unloaded cleanly ... WARNING
    ```
    ---- unloading
    Warning message:
    .onUnload failed in unloadNamespace() for 'pd.moe430a', details:
      call: rsqlite_connection_valid(dbObj@ptr)
      error: external pointer is not valid 
    ```

*   checking package dependencies ... NOTE
    ```
    Depends: includes the non-default packages:
      ‘Biostrings’ ‘RSQLite’ ‘oligoClasses’ ‘oligo’ ‘DBI’ ‘IRanges’
      ‘S4Vectors’
    Adding so many packages to the search path is excessive and importing
    selectively is preferable.
    ```

*   checking installed package size ... NOTE
    ```
      installed size is 17.0Mb
      sub-directories of 1Mb or more:
        data      1.6Mb
        extdata  15.3Mb
    ```

*   checking DESCRIPTION meta-information ... NOTE
    ```
    Malformed Description field: should contain one or more complete sentences.
    ```

*   checking dependencies in R code ... NOTE
    ```
    Packages in Depends field not imported from:
      ‘IRanges’ ‘methods’ ‘oligo’ ‘oligoClasses’
      These packages need to be imported from (in the NAMESPACE file)
      for when this namespace is loaded but not attached.
    ```

# pd.moe430b

Version: 3.12.0

## In both

*   checking whether the namespace can be unloaded cleanly ... WARNING
    ```
    ---- unloading
    Warning message:
    .onUnload failed in unloadNamespace() for 'pd.moe430b', details:
      call: rsqlite_connection_valid(dbObj@ptr)
      error: external pointer is not valid 
    ```

*   checking package dependencies ... NOTE
    ```
    Depends: includes the non-default packages:
      ‘Biostrings’ ‘RSQLite’ ‘oligoClasses’ ‘oligo’ ‘DBI’ ‘IRanges’
      ‘S4Vectors’
    Adding so many packages to the search path is excessive and importing
    selectively is preferable.
    ```

*   checking installed package size ... NOTE
    ```
      installed size is 16.9Mb
      sub-directories of 1Mb or more:
        data      1.6Mb
        extdata  15.2Mb
    ```

*   checking DESCRIPTION meta-information ... NOTE
    ```
    Malformed Description field: should contain one or more complete sentences.
    ```

*   checking dependencies in R code ... NOTE
    ```
    Packages in Depends field not imported from:
      ‘IRanges’ ‘methods’ ‘oligo’ ‘oligoClasses’
      These packages need to be imported from (in the NAMESPACE file)
      for when this namespace is loaded but not attached.
    ```

# pd.moex.1.0.st.v1

Version: 3.14.1

## In both

*   checking whether the namespace can be unloaded cleanly ... WARNING
    ```
    ---- unloading
    Warning message:
    .onUnload failed in unloadNamespace() for 'pd.moex.1.0.st.v1', details:
      call: rsqlite_connection_valid(dbObj@ptr)
      error: external pointer is not valid 
    ```

*   checking package dependencies ... NOTE
    ```
    Depends: includes the non-default packages:
      ‘Biostrings’ ‘RSQLite’ ‘oligoClasses’ ‘oligo’ ‘DBI’ ‘IRanges’
      ‘S4Vectors’
    Adding so many packages to the search path is excessive and importing
    selectively is preferable.
    ```

*   checking installed package size ... NOTE
    ```
      installed size is 433.4Mb
      sub-directories of 1Mb or more:
        data      31.2Mb
        extdata  402.1Mb
    ```

*   checking DESCRIPTION meta-information ... NOTE
    ```
    Malformed Description field: should contain one or more complete sentences.
    ```

*   checking dependencies in R code ... NOTE
    ```
    Packages in Depends field not imported from:
      ‘IRanges’ ‘methods’ ‘oligo’ ‘oligoClasses’
      These packages need to be imported from (in the NAMESPACE file)
      for when this namespace is loaded but not attached.
    ```

# pd.mogene.1.0.st.v1

Version: 3.14.1

## In both

*   checking whether the namespace can be unloaded cleanly ... WARNING
    ```
    ---- unloading
    Warning message:
    .onUnload failed in unloadNamespace() for 'pd.mogene.1.0.st.v1', details:
      call: rsqlite_connection_valid(dbObj@ptr)
      error: external pointer is not valid 
    ```

*   checking package dependencies ... NOTE
    ```
    Depends: includes the non-default packages:
      ‘Biostrings’ ‘RSQLite’ ‘oligoClasses’ ‘oligo’ ‘DBI’ ‘IRanges’
      ‘S4Vectors’
    Adding so many packages to the search path is excessive and importing
    selectively is preferable.
    ```

*   checking installed package size ... NOTE
    ```
      installed size is 102.2Mb
      sub-directories of 1Mb or more:
        data      5.4Mb
        extdata  96.6Mb
    ```

*   checking DESCRIPTION meta-information ... NOTE
    ```
    Malformed Description field: should contain one or more complete sentences.
    ```

*   checking dependencies in R code ... NOTE
    ```
    Packages in Depends field not imported from:
      ‘IRanges’ ‘methods’ ‘oligo’ ‘oligoClasses’
      These packages need to be imported from (in the NAMESPACE file)
      for when this namespace is loaded but not attached.
    ```

# pd.mogene.1.1.st.v1

Version: 3.14.1

## In both

*   checking whether the namespace can be unloaded cleanly ... WARNING
    ```
    ---- unloading
    Warning message:
    .onUnload failed in unloadNamespace() for 'pd.mogene.1.1.st.v1', details:
      call: rsqlite_connection_valid(dbObj@ptr)
      error: external pointer is not valid 
    ```

*   checking package dependencies ... NOTE
    ```
    Depends: includes the non-default packages:
      ‘Biostrings’ ‘RSQLite’ ‘oligoClasses’ ‘oligo’ ‘DBI’ ‘IRanges’
      ‘S4Vectors’
    Adding so many packages to the search path is excessive and importing
    selectively is preferable.
    ```

*   checking installed package size ... NOTE
    ```
      installed size is 102.6Mb
      sub-directories of 1Mb or more:
        data      5.9Mb
        extdata  96.7Mb
    ```

*   checking DESCRIPTION meta-information ... NOTE
    ```
    Malformed Description field: should contain one or more complete sentences.
    ```

*   checking dependencies in R code ... NOTE
    ```
    Packages in Depends field not imported from:
      ‘IRanges’ ‘methods’ ‘oligo’ ‘oligoClasses’
      These packages need to be imported from (in the NAMESPACE file)
      for when this namespace is loaded but not attached.
    ```

# pd.mogene.2.0.st

Version: 3.14.1

## In both

*   checking whether the namespace can be unloaded cleanly ... WARNING
    ```
    ---- unloading
    Warning message:
    .onUnload failed in unloadNamespace() for 'pd.mogene.2.0.st', details:
      call: rsqlite_connection_valid(dbObj@ptr)
      error: external pointer is not valid 
    ```

*   checking package dependencies ... NOTE
    ```
    Depends: includes the non-default packages:
      ‘Biostrings’ ‘RSQLite’ ‘oligoClasses’ ‘oligo’ ‘DBI’ ‘IRanges’
      ‘S4Vectors’
    Adding so many packages to the search path is excessive and importing
    selectively is preferable.
    ```

*   checking installed package size ... NOTE
    ```
      installed size is 96.8Mb
      sub-directories of 1Mb or more:
        data      5.5Mb
        extdata  91.2Mb
    ```

*   checking DESCRIPTION meta-information ... NOTE
    ```
    Malformed Description field: should contain one or more complete sentences.
    ```

*   checking dependencies in R code ... NOTE
    ```
    Packages in Depends field not imported from:
      ‘IRanges’ ‘methods’ ‘oligo’ ‘oligoClasses’
      These packages need to be imported from (in the NAMESPACE file)
      for when this namespace is loaded but not attached.
    ```

# pd.mogene.2.1.st

Version: 3.14.1

## In both

*   checking whether the namespace can be unloaded cleanly ... WARNING
    ```
    ---- unloading
    Warning message:
    .onUnload failed in unloadNamespace() for 'pd.mogene.2.1.st', details:
      call: rsqlite_connection_valid(dbObj@ptr)
      error: external pointer is not valid 
    ```

*   checking package dependencies ... NOTE
    ```
    Depends: includes the non-default packages:
      ‘Biostrings’ ‘RSQLite’ ‘oligoClasses’ ‘oligo’ ‘DBI’ ‘IRanges’
      ‘S4Vectors’
    Adding so many packages to the search path is excessive and importing
    selectively is preferable.
    ```

*   checking installed package size ... NOTE
    ```
      installed size is 96.1Mb
      sub-directories of 1Mb or more:
        data      4.7Mb
        extdata  91.2Mb
    ```

*   checking DESCRIPTION meta-information ... NOTE
    ```
    Malformed Description field: should contain one or more complete sentences.
    ```

*   checking dependencies in R code ... NOTE
    ```
    Packages in Depends field not imported from:
      ‘IRanges’ ‘methods’ ‘oligo’ ‘oligoClasses’
      These packages need to be imported from (in the NAMESPACE file)
      for when this namespace is loaded but not attached.
    ```

# pd.mouse430.2

Version: 3.12.0

## In both

*   checking whether the namespace can be unloaded cleanly ... WARNING
    ```
    ---- unloading
    Warning message:
    .onUnload failed in unloadNamespace() for 'pd.mouse430.2', details:
      call: rsqlite_connection_valid(dbObj@ptr)
      error: external pointer is not valid 
    ```

*   checking package dependencies ... NOTE
    ```
    Depends: includes the non-default packages:
      ‘Biostrings’ ‘RSQLite’ ‘oligoClasses’ ‘oligo’ ‘DBI’ ‘IRanges’
      ‘S4Vectors’
    Adding so many packages to the search path is excessive and importing
    selectively is preferable.
    ```

*   checking installed package size ... NOTE
    ```
      installed size is 33.8Mb
      sub-directories of 1Mb or more:
        data      3.0Mb
        extdata  30.6Mb
    ```

*   checking DESCRIPTION meta-information ... NOTE
    ```
    Malformed Description field: should contain one or more complete sentences.
    ```

*   checking dependencies in R code ... NOTE
    ```
    Packages in Depends field not imported from:
      ‘IRanges’ ‘methods’ ‘oligo’ ‘oligoClasses’
      These packages need to be imported from (in the NAMESPACE file)
      for when this namespace is loaded but not attached.
    ```

# pd.mouse430a.2

Version: 3.12.0

## In both

*   checking whether the namespace can be unloaded cleanly ... WARNING
    ```
    ---- unloading
    Warning message:
    .onUnload failed in unloadNamespace() for 'pd.mouse430a.2', details:
      call: rsqlite_connection_valid(dbObj@ptr)
      error: external pointer is not valid 
    ```

*   checking package dependencies ... NOTE
    ```
    Depends: includes the non-default packages:
      ‘Biostrings’ ‘RSQLite’ ‘oligoClasses’ ‘oligo’ ‘DBI’ ‘IRanges’
      ‘S4Vectors’
    Adding so many packages to the search path is excessive and importing
    selectively is preferable.
    ```

*   checking installed package size ... NOTE
    ```
      installed size is 17.0Mb
      sub-directories of 1Mb or more:
        data      1.6Mb
        extdata  15.3Mb
    ```

*   checking DESCRIPTION meta-information ... NOTE
    ```
    Malformed Description field: should contain one or more complete sentences.
    ```

*   checking dependencies in R code ... NOTE
    ```
    Packages in Depends field not imported from:
      ‘IRanges’ ‘methods’ ‘oligo’ ‘oligoClasses’
      These packages need to be imported from (in the NAMESPACE file)
      for when this namespace is loaded but not attached.
    ```

# pd.mta.1.0

Version: 3.12.0

## In both

*   checking whether the namespace can be unloaded cleanly ... WARNING
    ```
    ---- unloading
    Warning message:
    .onUnload failed in unloadNamespace() for 'pd.mta.1.0', details:
      call: rsqlite_connection_valid(dbObj@ptr)
      error: external pointer is not valid 
    ```

*   checking package dependencies ... NOTE
    ```
    Depends: includes the non-default packages:
      ‘Biostrings’ ‘RSQLite’ ‘oligoClasses’ ‘oligo’ ‘DBI’ ‘IRanges’
      ‘S4Vectors’
    Adding so many packages to the search path is excessive and importing
    selectively is preferable.
    ```

*   checking installed package size ... NOTE
    ```
      installed size is 495.2Mb
      sub-directories of 1Mb or more:
        data      40.9Mb
        extdata  454.2Mb
    ```

*   checking DESCRIPTION meta-information ... NOTE
    ```
    Malformed Description field: should contain one or more complete sentences.
    ```

*   checking dependencies in R code ... NOTE
    ```
    Packages in Depends field not imported from:
      ‘IRanges’ ‘methods’ ‘oligo’ ‘oligoClasses’
      These packages need to be imported from (in the NAMESPACE file)
      for when this namespace is loaded but not attached.
    ```

# pd.mu11ksuba

Version: 3.12.0

## In both

*   checking whether package ‘pd.mu11ksuba’ can be installed ... WARNING
    ```
    Found the following significant warnings:
      Warning: call dbDisconnect() when finished working with a connection
    See ‘/home/muelleki/git/R/DBI/revdep/checks/pd.mu11ksuba/new/pd.mu11ksuba.Rcheck/00install.out’ for details.
    ```

*   checking whether the namespace can be unloaded cleanly ... WARNING
    ```
    ---- unloading
    Warning message:
    .onUnload failed in unloadNamespace() for 'pd.mu11ksuba', details:
      call: rsqlite_connection_valid(dbObj@ptr)
      error: external pointer is not valid 
    ```

*   checking package dependencies ... NOTE
    ```
    Depends: includes the non-default packages:
      ‘Biostrings’ ‘RSQLite’ ‘oligoClasses’ ‘oligo’ ‘DBI’ ‘IRanges’
      ‘S4Vectors’
    Adding so many packages to the search path is excessive and importing
    selectively is preferable.
    ```

*   checking installed package size ... NOTE
    ```
      installed size is  8.9Mb
      sub-directories of 1Mb or more:
        extdata   8.0Mb
    ```

*   checking DESCRIPTION meta-information ... NOTE
    ```
    Malformed Description field: should contain one or more complete sentences.
    ```

*   checking dependencies in R code ... NOTE
    ```
    Packages in Depends field not imported from:
      ‘IRanges’ ‘methods’ ‘oligo’ ‘oligoClasses’
      These packages need to be imported from (in the NAMESPACE file)
      for when this namespace is loaded but not attached.
    ```

# pd.mu11ksubb

Version: 3.12.0

## In both

*   checking whether package ‘pd.mu11ksubb’ can be installed ... WARNING
    ```
    Found the following significant warnings:
      Warning: call dbDisconnect() when finished working with a connection
    See ‘/home/muelleki/git/R/DBI/revdep/checks/pd.mu11ksubb/new/pd.mu11ksubb.Rcheck/00install.out’ for details.
    ```

*   checking whether the namespace can be unloaded cleanly ... WARNING
    ```
    ---- unloading
    Warning message:
    .onUnload failed in unloadNamespace() for 'pd.mu11ksubb', details:
      call: rsqlite_connection_valid(dbObj@ptr)
      error: external pointer is not valid 
    ```

*   checking package dependencies ... NOTE
    ```
    Depends: includes the non-default packages:
      ‘Biostrings’ ‘RSQLite’ ‘oligoClasses’ ‘oligo’ ‘DBI’ ‘IRanges’
      ‘S4Vectors’
    Adding so many packages to the search path is excessive and importing
    selectively is preferable.
    ```

*   checking installed package size ... NOTE
    ```
      installed size is  8.8Mb
      sub-directories of 1Mb or more:
        extdata   8.0Mb
    ```

*   checking DESCRIPTION meta-information ... NOTE
    ```
    Malformed Description field: should contain one or more complete sentences.
    ```

*   checking dependencies in R code ... NOTE
    ```
    Packages in Depends field not imported from:
      ‘IRanges’ ‘methods’ ‘oligo’ ‘oligoClasses’
      These packages need to be imported from (in the NAMESPACE file)
      for when this namespace is loaded but not attached.
    ```

# pd.nugo.hs1a520180

Version: 3.4.0

## In both

*   checking whether the namespace can be unloaded cleanly ... WARNING
    ```
    ---- unloading
    Warning message:
    .onUnload failed in unloadNamespace() for 'pd.nugo.hs1a520180', details:
      call: rsqlite_connection_valid(dbObj@ptr)
      error: external pointer is not valid 
    ```

*   checking package dependencies ... NOTE
    ```
    Depends: includes the non-default packages:
      ‘Biostrings’ ‘RSQLite’ ‘oligoClasses’ ‘oligo’ ‘DBI’ ‘IRanges’
      ‘S4Vectors’
    Adding so many packages to the search path is excessive and importing
    selectively is preferable.
    ```

*   checking installed package size ... NOTE
    ```
      installed size is 18.1Mb
      sub-directories of 1Mb or more:
        data      1.7Mb
        extdata  16.3Mb
    ```

*   checking DESCRIPTION meta-information ... NOTE
    ```
    Malformed Description field: should contain one or more complete sentences.
    ```

*   checking dependencies in R code ... NOTE
    ```
    Packages in Depends field not imported from:
      ‘IRanges’ ‘methods’ ‘oligo’ ‘oligoClasses’
      These packages need to be imported from (in the NAMESPACE file)
      for when this namespace is loaded but not attached.
    ```

# pd.nugo.mm1a520177

Version: 3.4.0

## In both

*   checking whether the namespace can be unloaded cleanly ... WARNING
    ```
    ---- unloading
    Warning message:
    .onUnload failed in unloadNamespace() for 'pd.nugo.mm1a520177', details:
      call: rsqlite_connection_valid(dbObj@ptr)
      error: external pointer is not valid 
    ```

*   checking package dependencies ... NOTE
    ```
    Depends: includes the non-default packages:
      ‘Biostrings’ ‘RSQLite’ ‘oligoClasses’ ‘oligo’ ‘DBI’ ‘IRanges’
      ‘S4Vectors’
    Adding so many packages to the search path is excessive and importing
    selectively is preferable.
    ```

*   checking installed package size ... NOTE
    ```
      installed size is 17.9Mb
      sub-directories of 1Mb or more:
        data      1.7Mb
        extdata  16.1Mb
    ```

*   checking DESCRIPTION meta-information ... NOTE
    ```
    Malformed Description field: should contain one or more complete sentences.
    ```

*   checking dependencies in R code ... NOTE
    ```
    Packages in Depends field not imported from:
      ‘IRanges’ ‘methods’ ‘oligo’ ‘oligoClasses’
      These packages need to be imported from (in the NAMESPACE file)
      for when this namespace is loaded but not attached.
    ```

# pd.ovigene.1.0.st

Version: 3.12.0

## In both

*   checking whether the namespace can be unloaded cleanly ... WARNING
    ```
    ---- unloading
    Warning message:
    .onUnload failed in unloadNamespace() for 'pd.ovigene.1.0.st', details:
      call: rsqlite_connection_valid(dbObj@ptr)
      error: external pointer is not valid 
    ```

*   checking package dependencies ... NOTE
    ```
    Depends: includes the non-default packages:
      ‘Biostrings’ ‘RSQLite’ ‘oligoClasses’ ‘oligo’ ‘DBI’ ‘IRanges’
      ‘S4Vectors’
    Adding so many packages to the search path is excessive and importing
    selectively is preferable.
    ```

*   checking installed package size ... NOTE
    ```
      installed size is 57.4Mb
      sub-directories of 1Mb or more:
        data      3.9Mb
        extdata  53.4Mb
    ```

*   checking DESCRIPTION meta-information ... NOTE
    ```
    Malformed Description field: should contain one or more complete sentences.
    ```

*   checking dependencies in R code ... NOTE
    ```
    Packages in Depends field not imported from:
      ‘IRanges’ ‘methods’ ‘oligo’ ‘oligoClasses’
      These packages need to be imported from (in the NAMESPACE file)
      for when this namespace is loaded but not attached.
    ```

# pd.ovigene.1.1.st

Version: 3.12.0

## In both

*   checking whether the namespace can be unloaded cleanly ... WARNING
    ```
    ---- unloading
    Warning message:
    .onUnload failed in unloadNamespace() for 'pd.ovigene.1.1.st', details:
      call: rsqlite_connection_valid(dbObj@ptr)
      error: external pointer is not valid 
    ```

*   checking package dependencies ... NOTE
    ```
    Depends: includes the non-default packages:
      ‘Biostrings’ ‘RSQLite’ ‘oligoClasses’ ‘oligo’ ‘DBI’ ‘IRanges’
      ‘S4Vectors’
    Adding so many packages to the search path is excessive and importing
    selectively is preferable.
    ```

*   checking installed package size ... NOTE
    ```
      installed size is 57.3Mb
      sub-directories of 1Mb or more:
        data      3.8Mb
        extdata  53.4Mb
    ```

*   checking DESCRIPTION meta-information ... NOTE
    ```
    Malformed Description field: should contain one or more complete sentences.
    ```

*   checking dependencies in R code ... NOTE
    ```
    Packages in Depends field not imported from:
      ‘IRanges’ ‘methods’ ‘oligo’ ‘oligoClasses’
      These packages need to be imported from (in the NAMESPACE file)
      for when this namespace is loaded but not attached.
    ```

# pd.pae.g1a

Version: 3.12.0

## In both

*   checking whether package ‘pd.pae.g1a’ can be installed ... WARNING
    ```
    Found the following significant warnings:
      Warning: call dbDisconnect() when finished working with a connection
    See ‘/home/muelleki/git/R/DBI/revdep/checks/pd.pae.g1a/new/pd.pae.g1a.Rcheck/00install.out’ for details.
    ```

*   checking whether the namespace can be unloaded cleanly ... WARNING
    ```
    ---- unloading
    Warning message:
    .onUnload failed in unloadNamespace() for 'pd.pae.g1a', details:
      call: rsqlite_connection_valid(dbObj@ptr)
      error: external pointer is not valid 
    ```

*   checking package dependencies ... NOTE
    ```
    Depends: includes the non-default packages:
      ‘Biostrings’ ‘RSQLite’ ‘oligoClasses’ ‘oligo’ ‘DBI’ ‘IRanges’
      ‘S4Vectors’
    Adding so many packages to the search path is excessive and importing
    selectively is preferable.
    ```

*   checking installed package size ... NOTE
    ```
      installed size is  5.5Mb
      sub-directories of 1Mb or more:
        extdata   4.8Mb
    ```

*   checking DESCRIPTION meta-information ... NOTE
    ```
    Malformed Description field: should contain one or more complete sentences.
    ```

*   checking dependencies in R code ... NOTE
    ```
    Packages in Depends field not imported from:
      ‘IRanges’ ‘methods’ ‘oligo’ ‘oligoClasses’
      These packages need to be imported from (in the NAMESPACE file)
      for when this namespace is loaded but not attached.
    ```

# pd.plasmodium.anopheles

Version: 3.12.0

## In both

*   checking whether the namespace can be unloaded cleanly ... WARNING
    ```
    ---- unloading
    Warning message:
    .onUnload failed in unloadNamespace() for 'pd.plasmodium.anopheles', details:
      call: rsqlite_connection_valid(dbObj@ptr)
      error: external pointer is not valid 
    ```

*   checking package dependencies ... NOTE
    ```
    Depends: includes the non-default packages:
      ‘Biostrings’ ‘RSQLite’ ‘oligoClasses’ ‘oligo’ ‘DBI’ ‘IRanges’
      ‘S4Vectors’
    Adding so many packages to the search path is excessive and importing
    selectively is preferable.
    ```

*   checking installed package size ... NOTE
    ```
      installed size is 17.2Mb
      sub-directories of 1Mb or more:
        data      1.6Mb
        extdata  15.5Mb
    ```

*   checking DESCRIPTION meta-information ... NOTE
    ```
    Malformed Description field: should contain one or more complete sentences.
    ```

*   checking dependencies in R code ... NOTE
    ```
    Packages in Depends field not imported from:
      ‘IRanges’ ‘methods’ ‘oligo’ ‘oligoClasses’
      These packages need to be imported from (in the NAMESPACE file)
      for when this namespace is loaded but not attached.
    ```

# pd.poplar

Version: 3.12.0

## In both

*   checking whether the namespace can be unloaded cleanly ... WARNING
    ```
    ---- unloading
    Warning message:
    .onUnload failed in unloadNamespace() for 'pd.poplar', details:
      call: rsqlite_connection_valid(dbObj@ptr)
      error: external pointer is not valid 
    ```

*   checking package dependencies ... NOTE
    ```
    Depends: includes the non-default packages:
      ‘Biostrings’ ‘RSQLite’ ‘oligoClasses’ ‘oligo’ ‘DBI’ ‘IRanges’
      ‘S4Vectors’
    Adding so many packages to the search path is excessive and importing
    selectively is preferable.
    ```

*   checking installed package size ... NOTE
    ```
      installed size is 46.7Mb
      sub-directories of 1Mb or more:
        data      4.0Mb
        extdata  42.6Mb
    ```

*   checking DESCRIPTION meta-information ... NOTE
    ```
    Malformed Description field: should contain one or more complete sentences.
    ```

*   checking dependencies in R code ... NOTE
    ```
    Packages in Depends field not imported from:
      ‘IRanges’ ‘methods’ ‘oligo’ ‘oligoClasses’
      These packages need to be imported from (in the NAMESPACE file)
      for when this namespace is loaded but not attached.
    ```

# pd.porcine

Version: 3.12.0

## In both

*   checking whether the namespace can be unloaded cleanly ... WARNING
    ```
    ---- unloading
    Warning message:
    .onUnload failed in unloadNamespace() for 'pd.porcine', details:
      call: rsqlite_connection_valid(dbObj@ptr)
      error: external pointer is not valid 
    ```

*   checking package dependencies ... NOTE
    ```
    Depends: includes the non-default packages:
      ‘Biostrings’ ‘RSQLite’ ‘oligoClasses’ ‘oligo’ ‘DBI’ ‘IRanges’
      ‘S4Vectors’
    Adding so many packages to the search path is excessive and importing
    selectively is preferable.
    ```

*   checking installed package size ... NOTE
    ```
      installed size is 18.2Mb
      sub-directories of 1Mb or more:
        data      1.7Mb
        extdata  16.4Mb
    ```

*   checking DESCRIPTION meta-information ... NOTE
    ```
    Malformed Description field: should contain one or more complete sentences.
    ```

*   checking dependencies in R code ... NOTE
    ```
    Packages in Depends field not imported from:
      ‘IRanges’ ‘methods’ ‘oligo’ ‘oligoClasses’
      These packages need to be imported from (in the NAMESPACE file)
      for when this namespace is loaded but not attached.
    ```

# pd.porgene.1.0.st

Version: 3.12.0

## In both

*   checking whether the namespace can be unloaded cleanly ... WARNING
    ```
    ---- unloading
    Warning message:
    .onUnload failed in unloadNamespace() for 'pd.porgene.1.0.st', details:
      call: rsqlite_connection_valid(dbObj@ptr)
      error: external pointer is not valid 
    ```

*   checking package dependencies ... NOTE
    ```
    Depends: includes the non-default packages:
      ‘Biostrings’ ‘RSQLite’ ‘oligoClasses’ ‘oligo’ ‘DBI’ ‘IRanges’
      ‘S4Vectors’
    Adding so many packages to the search path is excessive and importing
    selectively is preferable.
    ```

*   checking installed package size ... NOTE
    ```
      installed size is 52.1Mb
      sub-directories of 1Mb or more:
        data      4.4Mb
        extdata  47.6Mb
    ```

*   checking DESCRIPTION meta-information ... NOTE
    ```
    Malformed Description field: should contain one or more complete sentences.
    ```

*   checking dependencies in R code ... NOTE
    ```
    Packages in Depends field not imported from:
      ‘IRanges’ ‘methods’ ‘oligo’ ‘oligoClasses’
      These packages need to be imported from (in the NAMESPACE file)
      for when this namespace is loaded but not attached.
    ```

# pd.porgene.1.1.st

Version: 3.12.0

## In both

*   checking whether the namespace can be unloaded cleanly ... WARNING
    ```
    ---- unloading
    Warning message:
    .onUnload failed in unloadNamespace() for 'pd.porgene.1.1.st', details:
      call: rsqlite_connection_valid(dbObj@ptr)
      error: external pointer is not valid 
    ```

*   checking package dependencies ... NOTE
    ```
    Depends: includes the non-default packages:
      ‘Biostrings’ ‘RSQLite’ ‘oligoClasses’ ‘oligo’ ‘DBI’ ‘IRanges’
      ‘S4Vectors’
    Adding so many packages to the search path is excessive and importing
    selectively is preferable.
    ```

*   checking installed package size ... NOTE
    ```
      installed size is 52.1Mb
      sub-directories of 1Mb or more:
        data      4.3Mb
        extdata  47.6Mb
    ```

*   checking DESCRIPTION meta-information ... NOTE
    ```
    Malformed Description field: should contain one or more complete sentences.
    ```

*   checking dependencies in R code ... NOTE
    ```
    Packages in Depends field not imported from:
      ‘IRanges’ ‘methods’ ‘oligo’ ‘oligoClasses’
      These packages need to be imported from (in the NAMESPACE file)
      for when this namespace is loaded but not attached.
    ```

# pd.rabgene.1.0.st

Version: 3.12.0

## In both

*   checking whether the namespace can be unloaded cleanly ... WARNING
    ```
    ---- unloading
    Warning message:
    .onUnload failed in unloadNamespace() for 'pd.rabgene.1.0.st', details:
      call: rsqlite_connection_valid(dbObj@ptr)
      error: external pointer is not valid 
    ```

*   checking package dependencies ... NOTE
    ```
    Depends: includes the non-default packages:
      ‘Biostrings’ ‘RSQLite’ ‘oligoClasses’ ‘oligo’ ‘DBI’ ‘IRanges’
      ‘S4Vectors’
    Adding so many packages to the search path is excessive and importing
    selectively is preferable.
    ```

*   checking installed package size ... NOTE
    ```
      installed size is 63.5Mb
      sub-directories of 1Mb or more:
        data      3.8Mb
        extdata  59.6Mb
    ```

*   checking DESCRIPTION meta-information ... NOTE
    ```
    Malformed Description field: should contain one or more complete sentences.
    ```

*   checking dependencies in R code ... NOTE
    ```
    Packages in Depends field not imported from:
      ‘IRanges’ ‘methods’ ‘oligo’ ‘oligoClasses’
      These packages need to be imported from (in the NAMESPACE file)
      for when this namespace is loaded but not attached.
    ```

# pd.raex.1.0.st.v1

Version: 3.14.1

## In both

*   checking whether the namespace can be unloaded cleanly ... WARNING
    ```
    ---- unloading
    Warning message:
    .onUnload failed in unloadNamespace() for 'pd.raex.1.0.st.v1', details:
      call: rsqlite_connection_valid(dbObj@ptr)
      error: external pointer is not valid 
    ```

*   checking package dependencies ... NOTE
    ```
    Depends: includes the non-default packages:
      ‘Biostrings’ ‘RSQLite’ ‘oligoClasses’ ‘oligo’ ‘DBI’ ‘IRanges’
      ‘S4Vectors’
    Adding so many packages to the search path is excessive and importing
    selectively is preferable.
    ```

*   checking installed package size ... NOTE
    ```
      installed size is 333.3Mb
      sub-directories of 1Mb or more:
        data      25.4Mb
        extdata  307.7Mb
    ```

*   checking DESCRIPTION meta-information ... NOTE
    ```
    Malformed Description field: should contain one or more complete sentences.
    ```

*   checking dependencies in R code ... NOTE
    ```
    Packages in Depends field not imported from:
      ‘IRanges’ ‘methods’ ‘oligo’ ‘oligoClasses’
      These packages need to be imported from (in the NAMESPACE file)
      for when this namespace is loaded but not attached.
    ```

# pd.ragene.1.1.st.v1

Version: 3.14.1

## In both

*   checking whether the namespace can be unloaded cleanly ... WARNING
    ```
    ---- unloading
    Warning message:
    .onUnload failed in unloadNamespace() for 'pd.ragene.1.1.st.v1', details:
      call: rsqlite_connection_valid(dbObj@ptr)
      error: external pointer is not valid 
    ```

*   checking package dependencies ... NOTE
    ```
    Depends: includes the non-default packages:
      ‘Biostrings’ ‘RSQLite’ ‘oligoClasses’ ‘oligo’ ‘DBI’ ‘IRanges’
      ‘S4Vectors’
    Adding so many packages to the search path is excessive and importing
    selectively is preferable.
    ```

*   checking installed package size ... NOTE
    ```
      installed size is 80.7Mb
      sub-directories of 1Mb or more:
        data      5.6Mb
        extdata  75.0Mb
    ```

*   checking DESCRIPTION meta-information ... NOTE
    ```
    Malformed Description field: should contain one or more complete sentences.
    ```

*   checking dependencies in R code ... NOTE
    ```
    Packages in Depends field not imported from:
      ‘IRanges’ ‘methods’ ‘oligo’ ‘oligoClasses’
      These packages need to be imported from (in the NAMESPACE file)
      for when this namespace is loaded but not attached.
    ```

# pd.ragene.2.0.st

Version: 3.14.1

## In both

*   checking whether the namespace can be unloaded cleanly ... WARNING
    ```
    ---- unloading
    Warning message:
    .onUnload failed in unloadNamespace() for 'pd.ragene.2.0.st', details:
      call: rsqlite_connection_valid(dbObj@ptr)
      error: external pointer is not valid 
    ```

*   checking package dependencies ... NOTE
    ```
    Depends: includes the non-default packages:
      ‘Biostrings’ ‘RSQLite’ ‘oligoClasses’ ‘oligo’ ‘DBI’ ‘IRanges’
      ‘S4Vectors’
    Adding so many packages to the search path is excessive and importing
    selectively is preferable.
    ```

*   checking installed package size ... NOTE
    ```
      installed size is 72.5Mb
      sub-directories of 1Mb or more:
        data      4.8Mb
        extdata  67.5Mb
    ```

*   checking DESCRIPTION meta-information ... NOTE
    ```
    Malformed Description field: should contain one or more complete sentences.
    ```

*   checking dependencies in R code ... NOTE
    ```
    Packages in Depends field not imported from:
      ‘IRanges’ ‘methods’ ‘oligo’ ‘oligoClasses’
      These packages need to be imported from (in the NAMESPACE file)
      for when this namespace is loaded but not attached.
    ```

# pd.ragene.2.1.st

Version: 3.14.1

## In both

*   checking whether the namespace can be unloaded cleanly ... WARNING
    ```
    ---- unloading
    Warning message:
    .onUnload failed in unloadNamespace() for 'pd.ragene.2.1.st', details:
      call: rsqlite_connection_valid(dbObj@ptr)
      error: external pointer is not valid 
    ```

*   checking package dependencies ... NOTE
    ```
    Depends: includes the non-default packages:
      ‘Biostrings’ ‘RSQLite’ ‘oligoClasses’ ‘oligo’ ‘DBI’ ‘IRanges’
      ‘S4Vectors’
    Adding so many packages to the search path is excessive and importing
    selectively is preferable.
    ```

*   checking installed package size ... NOTE
    ```
      installed size is 72.2Mb
      sub-directories of 1Mb or more:
        data      4.6Mb
        extdata  67.4Mb
    ```

*   checking DESCRIPTION meta-information ... NOTE
    ```
    Malformed Description field: should contain one or more complete sentences.
    ```

*   checking dependencies in R code ... NOTE
    ```
    Packages in Depends field not imported from:
      ‘IRanges’ ‘methods’ ‘oligo’ ‘oligoClasses’
      These packages need to be imported from (in the NAMESPACE file)
      for when this namespace is loaded but not attached.
    ```

# pd.rat230.2

Version: 3.12.0

## In both

*   checking whether the namespace can be unloaded cleanly ... WARNING
    ```
    ---- unloading
    Warning message:
    .onUnload failed in unloadNamespace() for 'pd.rat230.2', details:
      call: rsqlite_connection_valid(dbObj@ptr)
      error: external pointer is not valid 
    ```

*   checking package dependencies ... NOTE
    ```
    Depends: includes the non-default packages:
      ‘Biostrings’ ‘RSQLite’ ‘oligoClasses’ ‘oligo’ ‘DBI’ ‘IRanges’
      ‘S4Vectors’
    Adding so many packages to the search path is excessive and importing
    selectively is preferable.
    ```

*   checking installed package size ... NOTE
    ```
      installed size is 23.2Mb
      sub-directories of 1Mb or more:
        data      2.2Mb
        extdata  20.9Mb
    ```

*   checking DESCRIPTION meta-information ... NOTE
    ```
    Malformed Description field: should contain one or more complete sentences.
    ```

*   checking dependencies in R code ... NOTE
    ```
    Packages in Depends field not imported from:
      ‘IRanges’ ‘methods’ ‘oligo’ ‘oligoClasses’
      These packages need to be imported from (in the NAMESPACE file)
      for when this namespace is loaded but not attached.
    ```

# pd.rcngene.1.0.st

Version: 3.12.0

## In both

*   checking whether the namespace can be unloaded cleanly ... WARNING
    ```
    ---- unloading
    Warning message:
    .onUnload failed in unloadNamespace() for 'pd.rcngene.1.0.st', details:
      call: rsqlite_connection_valid(dbObj@ptr)
      error: external pointer is not valid 
    ```

*   checking package dependencies ... NOTE
    ```
    Depends: includes the non-default packages:
      ‘Biostrings’ ‘RSQLite’ ‘oligoClasses’ ‘oligo’ ‘DBI’ ‘IRanges’
      ‘S4Vectors’
    Adding so many packages to the search path is excessive and importing
    selectively is preferable.
    ```

*   checking installed package size ... NOTE
    ```
      installed size is 77.8Mb
      sub-directories of 1Mb or more:
        data      4.4Mb
        extdata  73.3Mb
    ```

*   checking DESCRIPTION meta-information ... NOTE
    ```
    Malformed Description field: should contain one or more complete sentences.
    ```

*   checking dependencies in R code ... NOTE
    ```
    Packages in Depends field not imported from:
      ‘IRanges’ ‘methods’ ‘oligo’ ‘oligoClasses’
      These packages need to be imported from (in the NAMESPACE file)
      for when this namespace is loaded but not attached.
    ```

# pd.rcngene.1.1.st

Version: 3.12.0

## In both

*   checking whether the namespace can be unloaded cleanly ... WARNING
    ```
    ---- unloading
    Warning message:
    .onUnload failed in unloadNamespace() for 'pd.rcngene.1.1.st', details:
      call: rsqlite_connection_valid(dbObj@ptr)
      error: external pointer is not valid 
    ```

*   checking package dependencies ... NOTE
    ```
    Depends: includes the non-default packages:
      ‘Biostrings’ ‘RSQLite’ ‘oligoClasses’ ‘oligo’ ‘DBI’ ‘IRanges’
      ‘S4Vectors’
    Adding so many packages to the search path is excessive and importing
    selectively is preferable.
    ```

*   checking installed package size ... NOTE
    ```
      installed size is 77.8Mb
      sub-directories of 1Mb or more:
        data      4.4Mb
        extdata  73.3Mb
    ```

*   checking DESCRIPTION meta-information ... NOTE
    ```
    Malformed Description field: should contain one or more complete sentences.
    ```

*   checking dependencies in R code ... NOTE
    ```
    Packages in Depends field not imported from:
      ‘IRanges’ ‘methods’ ‘oligo’ ‘oligoClasses’
      These packages need to be imported from (in the NAMESPACE file)
      for when this namespace is loaded but not attached.
    ```

# pd.rg.u34a

Version: 3.12.0

## In both

*   checking whether package ‘pd.rg.u34a’ can be installed ... WARNING
    ```
    Found the following significant warnings:
      Warning: call dbDisconnect() when finished working with a connection
    See ‘/home/muelleki/git/R/DBI/revdep/checks/pd.rg.u34a/new/pd.rg.u34a.Rcheck/00install.out’ for details.
    ```

*   checking whether the namespace can be unloaded cleanly ... WARNING
    ```
    ---- unloading
    Warning message:
    .onUnload failed in unloadNamespace() for 'pd.rg.u34a', details:
      call: rsqlite_connection_valid(dbObj@ptr)
      error: external pointer is not valid 
    ```

*   checking package dependencies ... NOTE
    ```
    Depends: includes the non-default packages:
      ‘Biostrings’ ‘RSQLite’ ‘oligoClasses’ ‘oligo’ ‘DBI’ ‘IRanges’
      ‘S4Vectors’
    Adding so many packages to the search path is excessive and importing
    selectively is preferable.
    ```

*   checking installed package size ... NOTE
    ```
      installed size is  9.5Mb
      sub-directories of 1Mb or more:
        extdata   8.6Mb
    ```

*   checking DESCRIPTION meta-information ... NOTE
    ```
    Malformed Description field: should contain one or more complete sentences.
    ```

*   checking dependencies in R code ... NOTE
    ```
    Packages in Depends field not imported from:
      ‘IRanges’ ‘methods’ ‘oligo’ ‘oligoClasses’
      These packages need to be imported from (in the NAMESPACE file)
      for when this namespace is loaded but not attached.
    ```

# pd.rg.u34b

Version: 3.12.0

## In both

*   checking whether package ‘pd.rg.u34b’ can be installed ... WARNING
    ```
    Found the following significant warnings:
      Warning: call dbDisconnect() when finished working with a connection
    See ‘/home/muelleki/git/R/DBI/revdep/checks/pd.rg.u34b/new/pd.rg.u34b.Rcheck/00install.out’ for details.
    ```

*   checking whether the namespace can be unloaded cleanly ... WARNING
    ```
    ---- unloading
    Warning message:
    .onUnload failed in unloadNamespace() for 'pd.rg.u34b', details:
      call: rsqlite_connection_valid(dbObj@ptr)
      error: external pointer is not valid 
    ```

*   checking package dependencies ... NOTE
    ```
    Depends: includes the non-default packages:
      ‘Biostrings’ ‘RSQLite’ ‘oligoClasses’ ‘oligo’ ‘DBI’ ‘IRanges’
      ‘S4Vectors’
    Adding so many packages to the search path is excessive and importing
    selectively is preferable.
    ```

*   checking installed package size ... NOTE
    ```
      installed size is  9.5Mb
      sub-directories of 1Mb or more:
        extdata   8.6Mb
    ```

*   checking DESCRIPTION meta-information ... NOTE
    ```
    Malformed Description field: should contain one or more complete sentences.
    ```

*   checking dependencies in R code ... NOTE
    ```
    Packages in Depends field not imported from:
      ‘IRanges’ ‘methods’ ‘oligo’ ‘oligoClasses’
      These packages need to be imported from (in the NAMESPACE file)
      for when this namespace is loaded but not attached.
    ```

# pd.rg.u34c

Version: 3.12.0

## In both

*   checking whether package ‘pd.rg.u34c’ can be installed ... WARNING
    ```
    Found the following significant warnings:
      Warning: call dbDisconnect() when finished working with a connection
    See ‘/home/muelleki/git/R/DBI/revdep/checks/pd.rg.u34c/new/pd.rg.u34c.Rcheck/00install.out’ for details.
    ```

*   checking whether the namespace can be unloaded cleanly ... WARNING
    ```
    ---- unloading
    Warning message:
    .onUnload failed in unloadNamespace() for 'pd.rg.u34c', details:
      call: rsqlite_connection_valid(dbObj@ptr)
      error: external pointer is not valid 
    ```

*   checking package dependencies ... NOTE
    ```
    Depends: includes the non-default packages:
      ‘Biostrings’ ‘RSQLite’ ‘oligoClasses’ ‘oligo’ ‘DBI’ ‘IRanges’
      ‘S4Vectors’
    Adding so many packages to the search path is excessive and importing
    selectively is preferable.
    ```

*   checking installed package size ... NOTE
    ```
      installed size is  9.5Mb
      sub-directories of 1Mb or more:
        extdata   8.6Mb
    ```

*   checking DESCRIPTION meta-information ... NOTE
    ```
    Malformed Description field: should contain one or more complete sentences.
    ```

*   checking dependencies in R code ... NOTE
    ```
    Packages in Depends field not imported from:
      ‘IRanges’ ‘methods’ ‘oligo’ ‘oligoClasses’
      These packages need to be imported from (in the NAMESPACE file)
      for when this namespace is loaded but not attached.
    ```

# pd.rhegene.1.0.st

Version: 3.12.0

## In both

*   checking whether the namespace can be unloaded cleanly ... WARNING
    ```
    ---- unloading
    Warning message:
    .onUnload failed in unloadNamespace() for 'pd.rhegene.1.0.st', details:
      call: rsqlite_connection_valid(dbObj@ptr)
      error: external pointer is not valid 
    ```

*   checking package dependencies ... NOTE
    ```
    Depends: includes the non-default packages:
      ‘Biostrings’ ‘RSQLite’ ‘oligoClasses’ ‘oligo’ ‘DBI’ ‘IRanges’
      ‘S4Vectors’
    Adding so many packages to the search path is excessive and importing
    selectively is preferable.
    ```

*   checking installed package size ... NOTE
    ```
      installed size is 72.3Mb
      sub-directories of 1Mb or more:
        data      5.4Mb
        extdata  66.7Mb
    ```

*   checking DESCRIPTION meta-information ... NOTE
    ```
    Malformed Description field: should contain one or more complete sentences.
    ```

*   checking dependencies in R code ... NOTE
    ```
    Packages in Depends field not imported from:
      ‘IRanges’ ‘methods’ ‘oligo’ ‘oligoClasses’
      These packages need to be imported from (in the NAMESPACE file)
      for when this namespace is loaded but not attached.
    ```

# pd.rhegene.1.1.st

Version: 3.12.0

## In both

*   checking whether the namespace can be unloaded cleanly ... WARNING
    ```
    ---- unloading
    Warning message:
    .onUnload failed in unloadNamespace() for 'pd.rhegene.1.1.st', details:
      call: rsqlite_connection_valid(dbObj@ptr)
      error: external pointer is not valid 
    ```

*   checking package dependencies ... NOTE
    ```
    Depends: includes the non-default packages:
      ‘Biostrings’ ‘RSQLite’ ‘oligoClasses’ ‘oligo’ ‘DBI’ ‘IRanges’
      ‘S4Vectors’
    Adding so many packages to the search path is excessive and importing
    selectively is preferable.
    ```

*   checking installed package size ... NOTE
    ```
      installed size is 71.6Mb
      sub-directories of 1Mb or more:
        data      4.8Mb
        extdata  66.7Mb
    ```

*   checking DESCRIPTION meta-information ... NOTE
    ```
    Malformed Description field: should contain one or more complete sentences.
    ```

*   checking dependencies in R code ... NOTE
    ```
    Packages in Depends field not imported from:
      ‘IRanges’ ‘methods’ ‘oligo’ ‘oligoClasses’
      These packages need to be imported from (in the NAMESPACE file)
      for when this namespace is loaded but not attached.
    ```

# pd.rhesus

Version: 3.12.0

## In both

*   checking whether the namespace can be unloaded cleanly ... WARNING
    ```
    ---- unloading
    Warning message:
    .onUnload failed in unloadNamespace() for 'pd.rhesus', details:
      call: rsqlite_connection_valid(dbObj@ptr)
      error: external pointer is not valid 
    ```

*   checking package dependencies ... NOTE
    ```
    Depends: includes the non-default packages:
      ‘Biostrings’ ‘RSQLite’ ‘oligoClasses’ ‘oligo’ ‘DBI’ ‘IRanges’
      ‘S4Vectors’
    Adding so many packages to the search path is excessive and importing
    selectively is preferable.
    ```

*   checking installed package size ... NOTE
    ```
      installed size is 46.1Mb
      sub-directories of 1Mb or more:
        data      4.1Mb
        extdata  41.8Mb
    ```

*   checking DESCRIPTION meta-information ... NOTE
    ```
    Malformed Description field: should contain one or more complete sentences.
    ```

*   checking dependencies in R code ... NOTE
    ```
    Packages in Depends field not imported from:
      ‘IRanges’ ‘methods’ ‘oligo’ ‘oligoClasses’
      These packages need to be imported from (in the NAMESPACE file)
      for when this namespace is loaded but not attached.
    ```

# pd.rice

Version: 3.12.0

## In both

*   checking whether the namespace can be unloaded cleanly ... WARNING
    ```
    ---- unloading
    Warning message:
    .onUnload failed in unloadNamespace() for 'pd.rice', details:
      call: rsqlite_connection_valid(dbObj@ptr)
      error: external pointer is not valid 
    ```

*   checking package dependencies ... NOTE
    ```
    Depends: includes the non-default packages:
      ‘Biostrings’ ‘RSQLite’ ‘oligoClasses’ ‘oligo’ ‘DBI’ ‘IRanges’
      ‘S4Vectors’
    Adding so many packages to the search path is excessive and importing
    selectively is preferable.
    ```

*   checking installed package size ... NOTE
    ```
      installed size is 43.6Mb
      sub-directories of 1Mb or more:
        data      3.8Mb
        extdata  39.6Mb
    ```

*   checking DESCRIPTION meta-information ... NOTE
    ```
    Malformed Description field: should contain one or more complete sentences.
    ```

*   checking dependencies in R code ... NOTE
    ```
    Packages in Depends field not imported from:
      ‘IRanges’ ‘methods’ ‘oligo’ ‘oligoClasses’
      These packages need to be imported from (in the NAMESPACE file)
      for when this namespace is loaded but not attached.
    ```

# pd.rjpgene.1.0.st

Version: 3.12.0

## In both

*   checking whether the namespace can be unloaded cleanly ... WARNING
    ```
    ---- unloading
    Warning message:
    .onUnload failed in unloadNamespace() for 'pd.rjpgene.1.0.st', details:
      call: rsqlite_connection_valid(dbObj@ptr)
      error: external pointer is not valid 
    ```

*   checking package dependencies ... NOTE
    ```
    Depends: includes the non-default packages:
      ‘Biostrings’ ‘RSQLite’ ‘oligoClasses’ ‘oligo’ ‘DBI’ ‘IRanges’
      ‘S4Vectors’
    Adding so many packages to the search path is excessive and importing
    selectively is preferable.
    ```

*   checking installed package size ... NOTE
    ```
      installed size is 58.2Mb
      sub-directories of 1Mb or more:
        data      4.1Mb
        extdata  54.0Mb
    ```

*   checking DESCRIPTION meta-information ... NOTE
    ```
    Malformed Description field: should contain one or more complete sentences.
    ```

*   checking dependencies in R code ... NOTE
    ```
    Packages in Depends field not imported from:
      ‘IRanges’ ‘methods’ ‘oligo’ ‘oligoClasses’
      These packages need to be imported from (in the NAMESPACE file)
      for when this namespace is loaded but not attached.
    ```

# pd.rjpgene.1.1.st

Version: 3.12.0

## In both

*   checking whether the namespace can be unloaded cleanly ... WARNING
    ```
    ---- unloading
    Warning message:
    .onUnload failed in unloadNamespace() for 'pd.rjpgene.1.1.st', details:
      call: rsqlite_connection_valid(dbObj@ptr)
      error: external pointer is not valid 
    ```

*   checking package dependencies ... NOTE
    ```
    Depends: includes the non-default packages:
      ‘Biostrings’ ‘RSQLite’ ‘oligoClasses’ ‘oligo’ ‘DBI’ ‘IRanges’
      ‘S4Vectors’
    Adding so many packages to the search path is excessive and importing
    selectively is preferable.
    ```

*   checking installed package size ... NOTE
    ```
      installed size is 58.2Mb
      sub-directories of 1Mb or more:
        data      4.0Mb
        extdata  54.0Mb
    ```

*   checking DESCRIPTION meta-information ... NOTE
    ```
    Malformed Description field: should contain one or more complete sentences.
    ```

*   checking dependencies in R code ... NOTE
    ```
    Packages in Depends field not imported from:
      ‘IRanges’ ‘methods’ ‘oligo’ ‘oligoClasses’
      These packages need to be imported from (in the NAMESPACE file)
      for when this namespace is loaded but not attached.
    ```

# pd.rn.u34

Version: 3.12.0

## In both

*   checking whether the namespace can be unloaded cleanly ... WARNING
    ```
    ---- unloading
    Warning message:
    .onUnload failed in unloadNamespace() for 'pd.rn.u34', details:
      call: rsqlite_connection_valid(dbObj@ptr)
      error: external pointer is not valid 
    ```

*   checking package dependencies ... NOTE
    ```
    Depends: includes the non-default packages:
      ‘Biostrings’ ‘RSQLite’ ‘oligoClasses’ ‘oligo’ ‘DBI’ ‘IRanges’
      ‘S4Vectors’
    Adding so many packages to the search path is excessive and importing
    selectively is preferable.
    ```

*   checking DESCRIPTION meta-information ... NOTE
    ```
    Malformed Description field: should contain one or more complete sentences.
    ```

*   checking dependencies in R code ... NOTE
    ```
    Packages in Depends field not imported from:
      ‘IRanges’ ‘methods’ ‘oligo’ ‘oligoClasses’
      These packages need to be imported from (in the NAMESPACE file)
      for when this namespace is loaded but not attached.
    ```

# pd.rta.1.0

Version: 3.12.2

## In both

*   checking whether the namespace can be unloaded cleanly ... WARNING
    ```
    ---- unloading
    Warning message:
    .onUnload failed in unloadNamespace() for 'pd.rta.1.0', details:
      call: rsqlite_connection_valid(dbObj@ptr)
      error: external pointer is not valid 
    ```

*   checking package dependencies ... NOTE
    ```
    Depends: includes the non-default packages:
      ‘Biostrings’ ‘RSQLite’ ‘oligoClasses’ ‘oligo’ ‘DBI’ ‘IRanges’
      ‘S4Vectors’
    Adding so many packages to the search path is excessive and importing
    selectively is preferable.
    ```

*   checking installed package size ... NOTE
    ```
      installed size is 492.6Mb
      sub-directories of 1Mb or more:
        data      36.5Mb
        extdata  456.0Mb
    ```

*   checking DESCRIPTION meta-information ... NOTE
    ```
    Malformed Description field: should contain one or more complete sentences.
    ```

*   checking dependencies in R code ... NOTE
    ```
    Packages in Depends field not imported from:
      ‘IRanges’ ‘methods’ ‘oligo’ ‘oligoClasses’
      These packages need to be imported from (in the NAMESPACE file)
      for when this namespace is loaded but not attached.
    ```

# pd.rusgene.1.0.st

Version: 3.12.0

## In both

*   checking whether the namespace can be unloaded cleanly ... WARNING
    ```
    ---- unloading
    Warning message:
    .onUnload failed in unloadNamespace() for 'pd.rusgene.1.0.st', details:
      call: rsqlite_connection_valid(dbObj@ptr)
      error: external pointer is not valid 
    ```

*   checking package dependencies ... NOTE
    ```
    Depends: includes the non-default packages:
      ‘Biostrings’ ‘RSQLite’ ‘oligoClasses’ ‘oligo’ ‘DBI’ ‘IRanges’
      ‘S4Vectors’
    Adding so many packages to the search path is excessive and importing
    selectively is preferable.
    ```

*   checking installed package size ... NOTE
    ```
      installed size is 76.1Mb
      sub-directories of 1Mb or more:
        data      5.5Mb
        extdata  70.5Mb
    ```

*   checking DESCRIPTION meta-information ... NOTE
    ```
    Malformed Description field: should contain one or more complete sentences.
    ```

*   checking dependencies in R code ... NOTE
    ```
    Packages in Depends field not imported from:
      ‘IRanges’ ‘methods’ ‘oligo’ ‘oligoClasses’
      These packages need to be imported from (in the NAMESPACE file)
      for when this namespace is loaded but not attached.
    ```

# pd.rusgene.1.1.st

Version: 3.12.0

## In both

*   checking whether the namespace can be unloaded cleanly ... WARNING
    ```
    ---- unloading
    Warning message:
    .onUnload failed in unloadNamespace() for 'pd.rusgene.1.1.st', details:
      call: rsqlite_connection_valid(dbObj@ptr)
      error: external pointer is not valid 
    ```

*   checking package dependencies ... NOTE
    ```
    Depends: includes the non-default packages:
      ‘Biostrings’ ‘RSQLite’ ‘oligoClasses’ ‘oligo’ ‘DBI’ ‘IRanges’
      ‘S4Vectors’
    Adding so many packages to the search path is excessive and importing
    selectively is preferable.
    ```

*   checking installed package size ... NOTE
    ```
      installed size is 76.5Mb
      sub-directories of 1Mb or more:
        data      5.9Mb
        extdata  70.4Mb
    ```

*   checking DESCRIPTION meta-information ... NOTE
    ```
    Malformed Description field: should contain one or more complete sentences.
    ```

*   checking dependencies in R code ... NOTE
    ```
    Packages in Depends field not imported from:
      ‘IRanges’ ‘methods’ ‘oligo’ ‘oligoClasses’
      These packages need to be imported from (in the NAMESPACE file)
      for when this namespace is loaded but not attached.
    ```

# pd.s.aureus

Version: 3.12.0

## In both

*   checking whether package ‘pd.s.aureus’ can be installed ... WARNING
    ```
    Found the following significant warnings:
      Warning: call dbDisconnect() when finished working with a connection
    See ‘/home/muelleki/git/R/DBI/revdep/checks/pd.s.aureus/new/pd.s.aureus.Rcheck/00install.out’ for details.
    ```

*   checking whether the namespace can be unloaded cleanly ... WARNING
    ```
    ---- unloading
    Warning message:
    .onUnload failed in unloadNamespace() for 'pd.s.aureus', details:
      call: rsqlite_connection_valid(dbObj@ptr)
      error: external pointer is not valid 
    ```

*   checking package dependencies ... NOTE
    ```
    Depends: includes the non-default packages:
      ‘Biostrings’ ‘RSQLite’ ‘oligoClasses’ ‘oligo’ ‘DBI’ ‘IRanges’
      ‘S4Vectors’
    Adding so many packages to the search path is excessive and importing
    selectively is preferable.
    ```

*   checking installed package size ... NOTE
    ```
      installed size is  8.4Mb
      sub-directories of 1Mb or more:
        extdata   7.6Mb
    ```

*   checking DESCRIPTION meta-information ... NOTE
    ```
    Malformed Description field: should contain one or more complete sentences.
    ```

*   checking dependencies in R code ... NOTE
    ```
    Packages in Depends field not imported from:
      ‘IRanges’ ‘methods’ ‘oligo’ ‘oligoClasses’
      These packages need to be imported from (in the NAMESPACE file)
      for when this namespace is loaded but not attached.
    ```

# pd.soybean

Version: 3.12.0

## In both

*   checking whether the namespace can be unloaded cleanly ... WARNING
    ```
    ---- unloading
    Warning message:
    .onUnload failed in unloadNamespace() for 'pd.soybean', details:
      call: rsqlite_connection_valid(dbObj@ptr)
      error: external pointer is not valid 
    ```

*   checking package dependencies ... NOTE
    ```
    Depends: includes the non-default packages:
      ‘Biostrings’ ‘RSQLite’ ‘oligoClasses’ ‘oligo’ ‘DBI’ ‘IRanges’
      ‘S4Vectors’
    Adding so many packages to the search path is excessive and importing
    selectively is preferable.
    ```

*   checking installed package size ... NOTE
    ```
      installed size is 46.6Mb
      sub-directories of 1Mb or more:
        data      4.1Mb
        extdata  42.3Mb
    ```

*   checking DESCRIPTION meta-information ... NOTE
    ```
    Malformed Description field: should contain one or more complete sentences.
    ```

*   checking dependencies in R code ... NOTE
    ```
    Packages in Depends field not imported from:
      ‘IRanges’ ‘methods’ ‘oligo’ ‘oligoClasses’
      These packages need to be imported from (in the NAMESPACE file)
      for when this namespace is loaded but not attached.
    ```

# pd.soygene.1.0.st

Version: 3.12.0

## In both

*   checking whether the namespace can be unloaded cleanly ... WARNING
    ```
    ---- unloading
    Warning message:
    .onUnload failed in unloadNamespace() for 'pd.soygene.1.0.st', details:
      call: rsqlite_connection_valid(dbObj@ptr)
      error: external pointer is not valid 
    ```

*   checking package dependencies ... NOTE
    ```
    Depends: includes the non-default packages:
      ‘Biostrings’ ‘RSQLite’ ‘oligoClasses’ ‘oligo’ ‘DBI’ ‘IRanges’
      ‘S4Vectors’
    Adding so many packages to the search path is excessive and importing
    selectively is preferable.
    ```

*   checking installed package size ... NOTE
    ```
      installed size is 108.4Mb
      sub-directories of 1Mb or more:
        data      8.6Mb
        extdata  99.7Mb
    ```

*   checking DESCRIPTION meta-information ... NOTE
    ```
    Malformed Description field: should contain one or more complete sentences.
    ```

*   checking dependencies in R code ... NOTE
    ```
    Packages in Depends field not imported from:
      ‘IRanges’ ‘methods’ ‘oligo’ ‘oligoClasses’
      These packages need to be imported from (in the NAMESPACE file)
      for when this namespace is loaded but not attached.
    ```

# pd.soygene.1.1.st

Version: 3.12.0

## In both

*   checking whether the namespace can be unloaded cleanly ... WARNING
    ```
    ---- unloading
    Warning message:
    .onUnload failed in unloadNamespace() for 'pd.soygene.1.1.st', details:
      call: rsqlite_connection_valid(dbObj@ptr)
      error: external pointer is not valid 
    ```

*   checking package dependencies ... NOTE
    ```
    Depends: includes the non-default packages:
      ‘Biostrings’ ‘RSQLite’ ‘oligoClasses’ ‘oligo’ ‘DBI’ ‘IRanges’
      ‘S4Vectors’
    Adding so many packages to the search path is excessive and importing
    selectively is preferable.
    ```

*   checking installed package size ... NOTE
    ```
      installed size is 100.2Mb
      sub-directories of 1Mb or more:
        data      7.2Mb
        extdata  92.9Mb
    ```

*   checking DESCRIPTION meta-information ... NOTE
    ```
    Malformed Description field: should contain one or more complete sentences.
    ```

*   checking dependencies in R code ... NOTE
    ```
    Packages in Depends field not imported from:
      ‘IRanges’ ‘methods’ ‘oligo’ ‘oligoClasses’
      These packages need to be imported from (in the NAMESPACE file)
      for when this namespace is loaded but not attached.
    ```

# pd.sugar.cane

Version: 3.12.0

## In both

*   checking whether package ‘pd.sugar.cane’ can be installed ... WARNING
    ```
    Found the following significant warnings:
      Warning: call dbDisconnect() when finished working with a connection
    See ‘/home/muelleki/git/R/DBI/revdep/checks/pd.sugar.cane/new/pd.sugar.cane.Rcheck/00install.out’ for details.
    ```

*   checking whether the namespace can be unloaded cleanly ... WARNING
    ```
    ---- unloading
    Warning message:
    .onUnload failed in unloadNamespace() for 'pd.sugar.cane', details:
      call: rsqlite_connection_valid(dbObj@ptr)
      error: external pointer is not valid 
    ```

*   checking package dependencies ... NOTE
    ```
    Depends: includes the non-default packages:
      ‘Biostrings’ ‘RSQLite’ ‘oligoClasses’ ‘oligo’ ‘DBI’ ‘IRanges’
      ‘S4Vectors’
    Adding so many packages to the search path is excessive and importing
    selectively is preferable.
    ```

*   checking installed package size ... NOTE
    ```
      installed size is  6.6Mb
      sub-directories of 1Mb or more:
        extdata   5.8Mb
    ```

*   checking DESCRIPTION meta-information ... NOTE
    ```
    Malformed Description field: should contain one or more complete sentences.
    ```

*   checking dependencies in R code ... NOTE
    ```
    Packages in Depends field not imported from:
      ‘IRanges’ ‘methods’ ‘oligo’ ‘oligoClasses’
      These packages need to be imported from (in the NAMESPACE file)
      for when this namespace is loaded but not attached.
    ```

# pd.tomato

Version: 3.12.0

## In both

*   checking whether package ‘pd.tomato’ can be installed ... WARNING
    ```
    Found the following significant warnings:
      Warning: call dbDisconnect() when finished working with a connection
    See ‘/home/muelleki/git/R/DBI/revdep/checks/pd.tomato/new/pd.tomato.Rcheck/00install.out’ for details.
    ```

*   checking whether the namespace can be unloaded cleanly ... WARNING
    ```
    ---- unloading
    Warning message:
    .onUnload failed in unloadNamespace() for 'pd.tomato', details:
      call: rsqlite_connection_valid(dbObj@ptr)
      error: external pointer is not valid 
    ```

*   checking package dependencies ... NOTE
    ```
    Depends: includes the non-default packages:
      ‘Biostrings’ ‘RSQLite’ ‘oligoClasses’ ‘oligo’ ‘DBI’ ‘IRanges’
      ‘S4Vectors’
    Adding so many packages to the search path is excessive and importing
    selectively is preferable.
    ```

*   checking installed package size ... NOTE
    ```
      installed size is  8.0Mb
      sub-directories of 1Mb or more:
        extdata   7.1Mb
    ```

*   checking DESCRIPTION meta-information ... NOTE
    ```
    Malformed Description field: should contain one or more complete sentences.
    ```

*   checking dependencies in R code ... NOTE
    ```
    Packages in Depends field not imported from:
      ‘IRanges’ ‘methods’ ‘oligo’ ‘oligoClasses’
      These packages need to be imported from (in the NAMESPACE file)
      for when this namespace is loaded but not attached.
    ```

# pd.u133.x3p

Version: 3.12.0

## In both

*   checking package dependencies ... ERROR
    ```
    Package required but not available: ‘RSQLite’
    
    Depends: includes the non-default packages:
      ‘Biostrings’ ‘RSQLite’ ‘oligoClasses’ ‘oligo’ ‘DBI’ ‘IRanges’
      ‘S4Vectors’
    Adding so many packages to the search path is excessive and importing
    selectively is preferable.
    
    See section ‘The DESCRIPTION file’ in the ‘Writing R Extensions’
    manual.
    ```

# pd.vitis.vinifera

Version: 3.12.0

## In both

*   checking whether the namespace can be unloaded cleanly ... WARNING
    ```
    ---- unloading
    Warning message:
    .onUnload failed in unloadNamespace() for 'pd.vitis.vinifera', details:
      call: rsqlite_connection_valid(dbObj@ptr)
      error: external pointer is not valid 
    ```

*   checking package dependencies ... NOTE
    ```
    Depends: includes the non-default packages:
      ‘Biostrings’ ‘RSQLite’ ‘oligoClasses’ ‘oligo’ ‘DBI’ ‘IRanges’
      ‘S4Vectors’
    Adding so many packages to the search path is excessive and importing
    selectively is preferable.
    ```

*   checking installed package size ... NOTE
    ```
      installed size is 17.7Mb
      sub-directories of 1Mb or more:
        data      1.6Mb
        extdata  15.9Mb
    ```

*   checking DESCRIPTION meta-information ... NOTE
    ```
    Malformed Description field: should contain one or more complete sentences.
    ```

*   checking dependencies in R code ... NOTE
    ```
    Packages in Depends field not imported from:
      ‘IRanges’ ‘methods’ ‘oligo’ ‘oligoClasses’
      These packages need to be imported from (in the NAMESPACE file)
      for when this namespace is loaded but not attached.
    ```

# pd.wheat

Version: 3.12.0

## In both

*   checking whether the namespace can be unloaded cleanly ... WARNING
    ```
    ---- unloading
    Warning message:
    .onUnload failed in unloadNamespace() for 'pd.wheat', details:
      call: rsqlite_connection_valid(dbObj@ptr)
      error: external pointer is not valid 
    ```

*   checking package dependencies ... NOTE
    ```
    Depends: includes the non-default packages:
      ‘Biostrings’ ‘RSQLite’ ‘oligoClasses’ ‘oligo’ ‘DBI’ ‘IRanges’
      ‘S4Vectors’
    Adding so many packages to the search path is excessive and importing
    selectively is preferable.
    ```

*   checking installed package size ... NOTE
    ```
      installed size is 46.5Mb
      sub-directories of 1Mb or more:
        data      4.0Mb
        extdata  42.4Mb
    ```

*   checking DESCRIPTION meta-information ... NOTE
    ```
    Malformed Description field: should contain one or more complete sentences.
    ```

*   checking dependencies in R code ... NOTE
    ```
    Packages in Depends field not imported from:
      ‘IRanges’ ‘methods’ ‘oligo’ ‘oligoClasses’
      These packages need to be imported from (in the NAMESPACE file)
      for when this namespace is loaded but not attached.
    ```

# pd.x.laevis.2

Version: 3.12.0

## In both

*   checking whether the namespace can be unloaded cleanly ... WARNING
    ```
    ---- unloading
    Warning message:
    .onUnload failed in unloadNamespace() for 'pd.x.laevis.2', details:
      call: rsqlite_connection_valid(dbObj@ptr)
      error: external pointer is not valid 
    ```

*   checking package dependencies ... NOTE
    ```
    Depends: includes the non-default packages:
      ‘Biostrings’ ‘RSQLite’ ‘oligoClasses’ ‘oligo’ ‘DBI’ ‘IRanges’
      ‘S4Vectors’
    Adding so many packages to the search path is excessive and importing
    selectively is preferable.
    ```

*   checking installed package size ... NOTE
    ```
      installed size is 30.6Mb
      sub-directories of 1Mb or more:
        data      2.8Mb
        extdata  27.7Mb
    ```

*   checking DESCRIPTION meta-information ... NOTE
    ```
    Malformed Description field: should contain one or more complete sentences.
    ```

*   checking dependencies in R code ... NOTE
    ```
    Packages in Depends field not imported from:
      ‘IRanges’ ‘methods’ ‘oligo’ ‘oligoClasses’
      These packages need to be imported from (in the NAMESPACE file)
      for when this namespace is loaded but not attached.
    ```

# pd.x.tropicalis

Version: 3.12.0

## In both

*   checking whether the namespace can be unloaded cleanly ... WARNING
    ```
    ---- unloading
    Warning message:
    .onUnload failed in unloadNamespace() for 'pd.x.tropicalis', details:
      call: rsqlite_connection_valid(dbObj@ptr)
      error: external pointer is not valid 
    ```

*   checking package dependencies ... NOTE
    ```
    Depends: includes the non-default packages:
      ‘Biostrings’ ‘RSQLite’ ‘oligoClasses’ ‘oligo’ ‘DBI’ ‘IRanges’
      ‘S4Vectors’
    Adding so many packages to the search path is excessive and importing
    selectively is preferable.
    ```

*   checking installed package size ... NOTE
    ```
      installed size is 44.7Mb
      sub-directories of 1Mb or more:
        data      3.8Mb
        extdata  40.8Mb
    ```

*   checking DESCRIPTION meta-information ... NOTE
    ```
    Malformed Description field: should contain one or more complete sentences.
    ```

*   checking dependencies in R code ... NOTE
    ```
    Packages in Depends field not imported from:
      ‘IRanges’ ‘methods’ ‘oligo’ ‘oligoClasses’
      These packages need to be imported from (in the NAMESPACE file)
      for when this namespace is loaded but not attached.
    ```

# pd.xenopus.laevis

Version: 3.12.0

## In both

*   checking whether the namespace can be unloaded cleanly ... WARNING
    ```
    ---- unloading
    Warning message:
    .onUnload failed in unloadNamespace() for 'pd.xenopus.laevis', details:
      call: rsqlite_connection_valid(dbObj@ptr)
      error: external pointer is not valid 
    ```

*   checking package dependencies ... NOTE
    ```
    Depends: includes the non-default packages:
      ‘Biostrings’ ‘RSQLite’ ‘oligoClasses’ ‘oligo’ ‘DBI’ ‘IRanges’
      ‘S4Vectors’
    Adding so many packages to the search path is excessive and importing
    selectively is preferable.
    ```

*   checking installed package size ... NOTE
    ```
      installed size is 16.8Mb
      sub-directories of 1Mb or more:
        data      1.5Mb
        extdata  15.1Mb
    ```

*   checking DESCRIPTION meta-information ... NOTE
    ```
    Malformed Description field: should contain one or more complete sentences.
    ```

*   checking dependencies in R code ... NOTE
    ```
    Packages in Depends field not imported from:
      ‘IRanges’ ‘methods’ ‘oligo’ ‘oligoClasses’
      These packages need to be imported from (in the NAMESPACE file)
      for when this namespace is loaded but not attached.
    ```

# pd.yeast.2

Version: 3.12.0

## In both

*   checking whether package ‘pd.yeast.2’ can be installed ... WARNING
    ```
    Found the following significant warnings:
      Warning: call dbDisconnect() when finished working with a connection
    See ‘/home/muelleki/git/R/DBI/revdep/checks/pd.yeast.2/new/pd.yeast.2.Rcheck/00install.out’ for details.
    ```

*   checking whether the namespace can be unloaded cleanly ... WARNING
    ```
    ---- unloading
    Warning message:
    .onUnload failed in unloadNamespace() for 'pd.yeast.2', details:
      call: rsqlite_connection_valid(dbObj@ptr)
      error: external pointer is not valid 
    ```

*   checking package dependencies ... NOTE
    ```
    Depends: includes the non-default packages:
      ‘Biostrings’ ‘RSQLite’ ‘oligoClasses’ ‘oligo’ ‘DBI’ ‘IRanges’
      ‘S4Vectors’
    Adding so many packages to the search path is excessive and importing
    selectively is preferable.
    ```

*   checking installed package size ... NOTE
    ```
      installed size is  8.5Mb
      sub-directories of 1Mb or more:
        extdata   7.5Mb
    ```

*   checking DESCRIPTION meta-information ... NOTE
    ```
    Malformed Description field: should contain one or more complete sentences.
    ```

*   checking dependencies in R code ... NOTE
    ```
    Packages in Depends field not imported from:
      ‘IRanges’ ‘methods’ ‘oligo’ ‘oligoClasses’
      These packages need to be imported from (in the NAMESPACE file)
      for when this namespace is loaded but not attached.
    ```

# pd.yg.s98

Version: 3.12.0

## In both

*   checking whether package ‘pd.yg.s98’ can be installed ... WARNING
    ```
    Found the following significant warnings:
      Warning: call dbDisconnect() when finished working with a connection
    See ‘/home/muelleki/git/R/DBI/revdep/checks/pd.yg.s98/new/pd.yg.s98.Rcheck/00install.out’ for details.
    ```

*   checking whether the namespace can be unloaded cleanly ... WARNING
    ```
    ---- unloading
    Warning message:
    .onUnload failed in unloadNamespace() for 'pd.yg.s98', details:
      call: rsqlite_connection_valid(dbObj@ptr)
      error: external pointer is not valid 
    ```

*   checking package dependencies ... NOTE
    ```
    Depends: includes the non-default packages:
      ‘Biostrings’ ‘RSQLite’ ‘oligoClasses’ ‘oligo’ ‘DBI’ ‘IRanges’
      ‘S4Vectors’
    Adding so many packages to the search path is excessive and importing
    selectively is preferable.
    ```

*   checking installed package size ... NOTE
    ```
      installed size is  9.3Mb
      sub-directories of 1Mb or more:
        extdata   8.4Mb
    ```

*   checking DESCRIPTION meta-information ... NOTE
    ```
    Malformed Description field: should contain one or more complete sentences.
    ```

*   checking dependencies in R code ... NOTE
    ```
    Packages in Depends field not imported from:
      ‘IRanges’ ‘methods’ ‘oligo’ ‘oligoClasses’
      These packages need to be imported from (in the NAMESPACE file)
      for when this namespace is loaded but not attached.
    ```

# pd.zebgene.1.0.st

Version: 3.12.0

## In both

*   checking whether the namespace can be unloaded cleanly ... WARNING
    ```
    ---- unloading
    Warning message:
    .onUnload failed in unloadNamespace() for 'pd.zebgene.1.0.st', details:
      call: rsqlite_connection_valid(dbObj@ptr)
      error: external pointer is not valid 
    ```

*   checking package dependencies ... NOTE
    ```
    Depends: includes the non-default packages:
      ‘Biostrings’ ‘RSQLite’ ‘oligoClasses’ ‘oligo’ ‘DBI’ ‘IRanges’
      ‘S4Vectors’
    Adding so many packages to the search path is excessive and importing
    selectively is preferable.
    ```

*   checking installed package size ... NOTE
    ```
      installed size is 110.2Mb
      sub-directories of 1Mb or more:
        data       8.0Mb
        extdata  102.1Mb
    ```

*   checking DESCRIPTION meta-information ... NOTE
    ```
    Malformed Description field: should contain one or more complete sentences.
    ```

*   checking dependencies in R code ... NOTE
    ```
    Packages in Depends field not imported from:
      ‘IRanges’ ‘methods’ ‘oligo’ ‘oligoClasses’
      These packages need to be imported from (in the NAMESPACE file)
      for when this namespace is loaded but not attached.
    ```

# pd.zebgene.1.1.st

Version: 3.12.0

## In both

*   checking whether the namespace can be unloaded cleanly ... WARNING
    ```
    ---- unloading
    Warning message:
    .onUnload failed in unloadNamespace() for 'pd.zebgene.1.1.st', details:
      call: rsqlite_connection_valid(dbObj@ptr)
      error: external pointer is not valid 
    ```

*   checking package dependencies ... NOTE
    ```
    Depends: includes the non-default packages:
      ‘Biostrings’ ‘RSQLite’ ‘oligoClasses’ ‘oligo’ ‘DBI’ ‘IRanges’
      ‘S4Vectors’
    Adding so many packages to the search path is excessive and importing
    selectively is preferable.
    ```

*   checking installed package size ... NOTE
    ```
      installed size is 104.0Mb
      sub-directories of 1Mb or more:
        data      8.2Mb
        extdata  95.6Mb
    ```

*   checking DESCRIPTION meta-information ... NOTE
    ```
    Malformed Description field: should contain one or more complete sentences.
    ```

*   checking dependencies in R code ... NOTE
    ```
    Packages in Depends field not imported from:
      ‘IRanges’ ‘methods’ ‘oligo’ ‘oligoClasses’
      These packages need to be imported from (in the NAMESPACE file)
      for when this namespace is loaded but not attached.
    ```

# pd.zebrafish

Version: 3.12.0

## In both

*   checking whether the namespace can be unloaded cleanly ... WARNING
    ```
    ---- unloading
    Warning message:
    .onUnload failed in unloadNamespace() for 'pd.zebrafish', details:
      call: rsqlite_connection_valid(dbObj@ptr)
      error: external pointer is not valid 
    ```

*   checking package dependencies ... NOTE
    ```
    Depends: includes the non-default packages:
      ‘Biostrings’ ‘RSQLite’ ‘oligoClasses’ ‘oligo’ ‘DBI’ ‘IRanges’
      ‘S4Vectors’
    Adding so many packages to the search path is excessive and importing
    selectively is preferable.
    ```

*   checking installed package size ... NOTE
    ```
      installed size is 16.8Mb
      sub-directories of 1Mb or more:
        data      1.6Mb
        extdata  15.1Mb
    ```

*   checking DESCRIPTION meta-information ... NOTE
    ```
    Malformed Description field: should contain one or more complete sentences.
    ```

*   checking dependencies in R code ... NOTE
    ```
    Packages in Depends field not imported from:
      ‘IRanges’ ‘methods’ ‘oligo’ ‘oligoClasses’
      These packages need to be imported from (in the NAMESPACE file)
      for when this namespace is loaded but not attached.
    ```

# pdInfoBuilder

Version: 1.40.0

## In both

*   checking dependencies in R code ... NOTE
    ```
    Namespaces in Imports field not imported from:
      ‘BiocGenerics’ ‘IRanges’ ‘oligoClasses’
      All declared Imports should be used.
    ```

*   checking R code for possible problems ... NOTE
    ```
    ...
      definition for ‘dbGetQuery’
    makePdInfoPackage,AffySNPCNVPDInfoPkgSeed2: no visible global function
      definition for ‘dbGetQuery’
    makePdInfoPackage,AffySNPPDInfoPkgSeed2: no visible global function
      definition for ‘dbGetQuery’
    makePdInfoPackage,AffySTPDInfoPkgSeed: no visible global function
      definition for ‘dbGetQuery’
    makePdInfoPackage,AffyTilingPDInfoPkgSeed: no visible global function
      definition for ‘dbGetQuery’
    makePdInfoPackage,GenericPDInfoPkgSeed: no visible global function
      definition for ‘dbGetQuery’
    makePdInfoPackage,NgsExpressionPDInfoPkgSeed: no visible global
      function definition for ‘dbGetQuery’
    makePdInfoPackage,NgsTilingPDInfoPkgSeed: no visible global function
      definition for ‘dbGetQuery’
    Undefined global functions or variables:
      %do% %dopar% aggregate dbGetQuery foreach getDoParWorkers i na.omit
      unitLst
    Consider adding
      importFrom("stats", "aggregate", "na.omit")
    to your NAMESPACE file.
    ```

# pedbarrayv10.db

Version: 3.2.3

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
    File ‘pedbarrayv10.db/R/zzz.R’:
      .onLoad calls:
        packageStartupMessage(AnnotationDbi:::annoStartupMessages("pedbarrayv10.db"))
    
    See section ‘Good practice’ in '?.onAttach'.
    ```

# pedbarrayv9.db

Version: 3.2.3

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
    File ‘pedbarrayv9.db/R/zzz.R’:
      .onLoad calls:
        packageStartupMessage(AnnotationDbi:::annoStartupMessages("pedbarrayv9.db"))
    
    See section ‘Good practice’ in '?.onAttach'.
    ```

# PFAM.db

Version: 3.4.1

## In both

*   checking installed package size ... NOTE
    ```
      installed size is 15.5Mb
      sub-directories of 1Mb or more:
        extdata  15.4Mb
    ```

*   checking DESCRIPTION meta-information ... NOTE
    ```
    Malformed Description field: should contain one or more complete sentences.
    Packages listed in more than one of Depends, Imports, Suggests, Enhances:
      ‘methods’ ‘AnnotationDbi’
    A package should be listed in only one of these fields.
    ```

*   checking R code for possible problems ... NOTE
    ```
    File ‘PFAM.db/R/zzz.R’:
      .onLoad calls:
        packageStartupMessage(AnnotationDbi:::annoStartupMessages("PFAM.db"))
    
    See section ‘Good practice’ in '?.onAttach'.
    ```

# pitchRx

Version: 1.8.2

## In both

*   checking package dependencies ... NOTE
    ```
    Package suggested but not available for checking: ‘ggsubplot’
    ```

# plethy

Version: 1.14.0

## In both

*   checking examples ... ERROR
    ```
    ...
    > count = c(NA,900, NA,150, 150, 110)
    > measure_break = c(FALSE, FALSE, TRUE, FALSE, FALSE,FALSE)
    > table_break = c(TRUE, rep(FALSE, length(samples)-1))
    > phase = rep("D1", length(samples))
    >     
    > err.dta <- data.frame(samples=samples, count=count, measure_break=measure_break, table_break=table_break, phase=phase, stringsAsFactors=FALSE)
    >     
    > sim.bux.lines <- plethy:::generate.sample.buxco(err.dta)
    >     
    > temp.file <- tempfile()
    > temp.db.file <- tempfile()
    > write(sim.bux.lines, file=temp.file)
    > test.bux.db <- parse.buxco(file.name=temp.file, db.name=temp.db.file, chunk.size=10000)
    Processing /home/muelleki/tmp/RtmpM7WPrJ/file2080370a0ce5 in chunks of 10000
    Starting chunk 1
    Reached breakpoint change
    Processing breakpoint 1
    Starting sample sample_1
    Error in if (sum(which.gt) > 0) { : missing value where TRUE/FALSE needed
    Calls: parse.buxco ... write.sample.breaks -> write.sample.db -> sanity.check.time
    Execution halted
    ```

*   checking tests ...
    ```
     ERROR
    Running the tests in ‘tests/runTests.R’ failed.
    Last 13 lines of output:
      Test files with failing tests
      
         test_check_helpers.R 
           test.add.labels.by.sample 
           test.dbImport 
           test.get.err.breaks 
           test.summaryMeasures 
      
      
      Error in BiocGenerics:::testPackage("plethy") : 
        unit tests failed for package plethy
      In addition: Warning message:
      In .Internal(gc(verbose, reset)) :
        closing unused connection 3 (/home/muelleki/tmp/Rtmpe6E1Rc/file29c91754c10f)
      Execution halted
    ```

*   checking dependencies in R code ... NOTE
    ```
    There are ::: calls to the package's namespace in its code. A package
      almost never needs to use ::: for its own objects:
      ‘csv.to.table’ ‘find.break.ranges.integer’ ‘fix.time’ ‘multi.grep’
    ```

*   checking R code for possible problems ... NOTE
    ```
    ...
    mvtsplot.data.frame: no visible global function definition for ‘bxp’
    mvtsplot.data.frame : <anonymous>: no visible binding for global
      variable ‘median’
    mvtsplot.data.frame: no visible global function definition for ‘lines’
    mvtsplot.data.frame: no visible global function definition for ‘Axis’
    mvtsplot.data.frame: no visible global function definition for ‘legend’
    retrieveMatrix,BuxcoDB: no visible global function definition for
      ‘terms’
    tsplot,BuxcoDB: no visible binding for global variable ‘Days’
    tsplot,BuxcoDB: no visible binding for global variable ‘Value’
    tsplot,BuxcoDB: no visible binding for global variable ‘Sample_Name’
    Undefined global functions or variables:
      Axis Days Sample_Name Value abline bxp colors layout legend lines
      median mtext packageDescription par plot rnorm strwidth terms
    Consider adding
      importFrom("grDevices", "colors")
      importFrom("graphics", "Axis", "abline", "bxp", "layout", "legend",
                 "lines", "mtext", "par", "plot", "strwidth")
      importFrom("stats", "median", "rnorm", "terms")
      importFrom("utils", "packageDescription")
    to your NAMESPACE file.
    ```

# POCRCannotation.db

Version: 3.2.3

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
    File ‘POCRCannotation.db/R/zzz.R’:
      .onLoad calls:
        packageStartupMessage(AnnotationDbi:::annoStartupMessages("POCRCannotation.db"))
    
    See section ‘Good practice’ in '?.onAttach'.
    ```

# pool

Version: 0.1.3

## Newly broken

*   checking for missing documentation entries ... WARNING
    ```
    Undocumented S4 methods:
      generic 'dbListFields' and siglist 'Pool,ANY'
    All user-level objects in a package (including S4 classes and methods)
    should have documentation entries.
    See chapter ‘Writing R documentation files’ in the ‘Writing R
    Extensions’ manual.
    ```

# porcine.db

Version: 3.2.3

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
    Package in Depends field not imported from: ‘org.Ss.eg.db’
      These packages need to be imported from (in the NAMESPACE file)
      for when this namespace is loaded but not attached.
    ```

*   checking R code for possible problems ... NOTE
    ```
    File ‘porcine.db/R/zzz.R’:
      .onLoad calls:
        packageStartupMessage(AnnotationDbi:::annoStartupMessages("porcine.db"))
    
    See section ‘Good practice’ in '?.onAttach'.
    ```

# rae230a.db

Version: 3.2.3

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
    File ‘rae230a.db/R/zzz.R’:
      .onLoad calls:
        packageStartupMessage(AnnotationDbi:::annoStartupMessages("rae230a.db"))
    
    See section ‘Good practice’ in '?.onAttach'.
    ```

# rae230b.db

Version: 3.2.3

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
    File ‘rae230b.db/R/zzz.R’:
      .onLoad calls:
        packageStartupMessage(AnnotationDbi:::annoStartupMessages("rae230b.db"))
    
    See section ‘Good practice’ in '?.onAttach'.
    ```

# raex10stprobeset.db

Version: 8.6.0

## In both

*   checking examples ... ERROR
    ```
    ...
    +     got[[1]][["Ontology"]]
    +     got[[1]][["Evidence"]]
    + }
    [1] "ISO"
    > # For the reverse map:
    > # Convert to a list
    > xx <- as.list(raex10stprobesetGO2PROBE)
    > if(length(xx) > 0){
    +     # Gets the manufacturer ids for the top 2nd and 3nd GO identifiers
    +     goids <- xx[2:3]
    +     # Gets the manufacturer ids for the first element of goids
    +     goids[[1]]
    +     # Evidence code for the mappings
    +     names(goids[[1]])
    + }
     [1] "ISO" "ISS" "ISO" "ISS" "ISO" "ISS" "NAS" "ISO" "ISS" "ISO" "ISS" "NAS"
    [13] "ISO" "ISS" "NAS" "ISO" "ISS" "ISO" "ISS" "NAS" "NAS" "NAS" "NAS" "ISO"
    [25] "ISS" "NAS" "ISO" "ISS" "ISO" "ISS" "ISO" "ISS"
    > # Convert raex10stprobesetGO2ALLPROBES to a list
    > xx <- as.list(raex10stprobesetGO2ALLPROBES)
    Killed
    ```

*   checking installed package size ... NOTE
    ```
      installed size is 121.9Mb
      sub-directories of 1Mb or more:
        extdata  121.8Mb
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
    File ‘raex10stprobeset.db/R/zzz.R’:
      .onLoad calls:
        packageStartupMessage(AnnotationDbi:::annoStartupMessages("raex10stprobeset.db"))
    
    See section ‘Good practice’ in '?.onAttach'.
    ```

# raex10sttranscriptcluster.db

Version: 8.6.0

## In both

*   checking installed package size ... NOTE
    ```
      installed size is 42.2Mb
      sub-directories of 1Mb or more:
        extdata  42.0Mb
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
    File ‘raex10sttranscriptcluster.db/R/zzz.R’:
      .onLoad calls:
        packageStartupMessage(AnnotationDbi:::annoStartupMessages("raex10sttranscriptcluster.db"))
    
    See section ‘Good practice’ in '?.onAttach'.
    ```

# ragene10stprobeset.db

Version: 8.6.0

## In both

*   checking installed package size ... NOTE
    ```
      installed size is 48.9Mb
      sub-directories of 1Mb or more:
        extdata  48.8Mb
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

# ragene10sttranscriptcluster.db

Version: 8.6.0

## In both

*   checking installed package size ... NOTE
    ```
      installed size is  6.3Mb
      sub-directories of 1Mb or more:
        extdata   6.1Mb
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
    File ‘ragene10sttranscriptcluster.db/R/zzz.R’:
      .onLoad calls:
        packageStartupMessage(AnnotationDbi:::annoStartupMessages("ragene10sttranscriptcluster.db"))
    
    See section ‘Good practice’ in '?.onAttach'.
    ```

# ragene11stprobeset.db

Version: 8.6.0

## Newly fixed

*   checking examples ... ERROR
    ```
    ...
    +     got[[1]][["GOID"]]
    +     got[[1]][["Ontology"]]
    +     got[[1]][["Evidence"]]
    + }
    [1] "IEA"
    > # For the reverse map:
    > # Convert to a list
    > xx <- as.list(ragene11stprobesetGO2PROBE)
    > if(length(xx) > 0){
    +     # Gets the manufacturer ids for the top 2nd and 3nd GO identifiers
    +     goids <- xx[2:3]
    +     # Gets the manufacturer ids for the first element of goids
    +     goids[[1]]
    +     # Evidence code for the mappings
    +     names(goids[[1]])
    + }
     [1] "NAS" "NAS" "NAS" "NAS" "ISO" "ISS" "ISO" "ISS" "ISO" "ISS" "ISO" "ISS"
    [13] "ISO" "ISS" "ISO" "ISS" "ISO" "ISS" "ISO" "ISS" "ISO" "ISS"
    > # Convert ragene11stprobesetGO2ALLPROBES to a list
    > xx <- as.list(ragene11stprobesetGO2ALLPROBES)
    Killed
    ```

## In both

*   checking installed package size ... NOTE
    ```
      installed size is 48.9Mb
      sub-directories of 1Mb or more:
        extdata  48.8Mb
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

# ragene11sttranscriptcluster.db

Version: 8.6.0

## In both

*   checking installed package size ... NOTE
    ```
      installed size is  6.3Mb
      sub-directories of 1Mb or more:
        extdata   6.1Mb
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
    File ‘ragene11sttranscriptcluster.db/R/zzz.R’:
      .onLoad calls:
        packageStartupMessage(AnnotationDbi:::annoStartupMessages("ragene11sttranscriptcluster.db"))
    
    See section ‘Good practice’ in '?.onAttach'.
    ```

# ragene20stprobeset.db

Version: 8.6.0

## In both

*   checking installed package size ... NOTE
    ```
      installed size is 47.6Mb
      sub-directories of 1Mb or more:
        extdata  47.5Mb
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

# ragene20sttranscriptcluster.db

Version: 8.6.0

## In both

*   checking installed package size ... NOTE
    ```
      installed size is  6.4Mb
      sub-directories of 1Mb or more:
        extdata   6.2Mb
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
    File ‘ragene20sttranscriptcluster.db/R/zzz.R’:
      .onLoad calls:
        packageStartupMessage(AnnotationDbi:::annoStartupMessages("ragene20sttranscriptcluster.db"))
    
    See section ‘Good practice’ in '?.onAttach'.
    ```

# ragene21stprobeset.db

Version: 8.6.0

## In both

*   checking installed package size ... NOTE
    ```
      installed size is 47.6Mb
      sub-directories of 1Mb or more:
        extdata  47.5Mb
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
    File ‘ragene21stprobeset.db/R/zzz.R’:
      .onLoad calls:
        packageStartupMessage(AnnotationDbi:::annoStartupMessages("ragene21stprobeset.db"))
    
    See section ‘Good practice’ in '?.onAttach'.
    ```

# ragene21sttranscriptcluster.db

Version: 8.6.0

## In both

*   checking installed package size ... NOTE
    ```
      installed size is  6.4Mb
      sub-directories of 1Mb or more:
        extdata   6.2Mb
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
    File ‘ragene21sttranscriptcluster.db/R/zzz.R’:
      .onLoad calls:
        packageStartupMessage(AnnotationDbi:::annoStartupMessages("ragene21sttranscriptcluster.db"))
    
    See section ‘Good practice’ in '?.onAttach'.
    ```

# rat2302.db

Version: 3.2.3

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

# redcapAPI

Version: 1.3

## In both

*   checking R code for possible problems ... NOTE
    ```
    ...
      definition for ‘read.csv’
    exportUsers.redcapApiConnection: no visible global function definition
      for ‘read.csv’
    importRecords.redcapApiConnection : <anonymous>: no visible global
      function definition for ‘capture.output’
    importRecords.redcapApiConnection : <anonymous>: no visible global
      function definition for ‘write.table’
    importRecords.redcapApiConnection: no visible global function
      definition for ‘capture.output’
    importRecords.redcapApiConnection: no visible global function
      definition for ‘write.table’
    validateImport : printLog: no visible global function definition for
      ‘write.table’
    validateImport: no visible binding for global variable ‘tail’
    validateImport: no visible binding for global variable ‘head’
    Undefined global functions or variables:
      capture.output head read.csv tail write.table
    Consider adding
      importFrom("utils", "capture.output", "head", "read.csv", "tail",
                 "write.table")
    to your NAMESPACE file.
    ```

# replyr

Version: 0.9.0

## In both

*   checking dependencies in R code ... NOTE
    ```
    Namespaces in Imports field not imported from:
      ‘RSQLite’ ‘dbplyr’
      All declared Imports should be used.
    ```

# rgu34a.db

Version: 3.2.3

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
    File ‘rgu34a.db/R/zzz.R’:
      .onLoad calls:
        packageStartupMessage(AnnotationDbi:::annoStartupMessages("rgu34a.db"))
    
    See section ‘Good practice’ in '?.onAttach'.
    ```

# rgu34b.db

Version: 3.2.3

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
    File ‘rgu34b.db/R/zzz.R’:
      .onLoad calls:
        packageStartupMessage(AnnotationDbi:::annoStartupMessages("rgu34b.db"))
    
    See section ‘Good practice’ in '?.onAttach'.
    ```

# rgu34c.db

Version: 3.2.3

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
    File ‘rgu34c.db/R/zzz.R’:
      .onLoad calls:
        packageStartupMessage(AnnotationDbi:::annoStartupMessages("rgu34c.db"))
    
    See section ‘Good practice’ in '?.onAttach'.
    ```

# rguatlas4k.db

Version: 3.2.3

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
    File ‘rguatlas4k.db/R/zzz.R’:
      .onLoad calls:
        packageStartupMessage(AnnotationDbi:::annoStartupMessages("rguatlas4k.db"))
    
    See section ‘Good practice’ in '?.onAttach'.
    ```

# rgug4105a.db

Version: 3.2.3

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
    File ‘rgug4105a.db/R/zzz.R’:
      .onLoad calls:
        packageStartupMessage(AnnotationDbi:::annoStartupMessages("rgug4105a.db"))
    
    See section ‘Good practice’ in '?.onAttach'.
    ```

# rgug4130a.db

Version: 3.2.3

## Newly fixed

*   checking replacement functions ... WARNING
    ```
    Warning: system call failed: Cannot allocate memory
    The argument of a replacement function which corresponds to the right
    hand side must be named ‘value’.
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
    File ‘rgug4130a.db/R/zzz.R’:
      .onLoad calls:
        packageStartupMessage(AnnotationDbi:::annoStartupMessages("rgug4130a.db"))
    
    See section ‘Good practice’ in '?.onAttach'.
    ```

# rgug4131a.db

Version: 3.2.3

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
    File ‘rgug4131a.db/R/zzz.R’:
      .onLoad calls:
        packageStartupMessage(AnnotationDbi:::annoStartupMessages("rgug4131a.db"))
    
    See section ‘Good practice’ in '?.onAttach'.
    ```

# RJDBC

Version: 0.2-5

## In both

*   checking for missing documentation entries ... WARNING
    ```
    Undocumented S4 methods:
      generic 'dbListFields' and siglist 'JDBCConnection,ANY'
      generic 'dbReadTable' and siglist 'JDBCConnection,ANY'
    All user-level objects in a package (including S4 classes and methods)
    should have documentation entries.
    See chapter ‘Writing R documentation files’ in the ‘Writing R
    Extensions’ manual.
    ```

# RMariaDB

Version: 1.0-2

## In both

*   checking tests ...
    ```
     ERROR
    Running the tests in ‘tests/testthat.R’ failed.
    Last 13 lines of output:
      1. Error: DBItest[RMariaDB]: Driver: can_connect 
      2. Error: DBItest[RMariaDB]: Connection: can_disconnect 
      3. Error: DBItest[RMariaDB]: Connection: cannot_forget_disconnect 
      4. Error: DBItest[RMariaDB]: Connection: disconnect_closed_connection 
      5. Error: DBItest[RMariaDB]: Connection: disconnect_invalid_connection 
      6. Error: DBItest[RMariaDB]: Connection: data_type_connection 
      7. Error: DBItest[RMariaDB]: Result: send_query_trivial 
      8. Error: DBItest[RMariaDB]: Result: send_query_closed_connection 
      9. Error: DBItest[RMariaDB]: Result: send_query_invalid_connection 
      1. ...
      
      Error: testthat unit tests failed
      In addition: Warning message:
      Unknown tweaks: list_temporary_tables 
      Execution halted
    ```

# RmiR

Version: 1.32.0

## In both

*   checking DESCRIPTION meta-information ... NOTE
    ```
    Malformed Description field: should contain one or more complete sentences.
    ```

*   checking dependencies in R code ... NOTE
    ```
    'library' or 'require' call to ‘RSVGTipsDevice’ which was already attached by Depends.
      Please remove these calls from your code.
    Packages in Depends field not imported from:
      ‘RSVGTipsDevice’ ‘RmiR.Hs.miRNA’
      These packages need to be imported from (in the NAMESPACE file)
      for when this namespace is loaded but not attached.
    ```

*   checking R code for possible problems ... NOTE
    ```
    plotRmiRtc: no visible global function definition for ‘devSVGTips’
    plotRmiRtc: no visible global function definition for ‘plot’
    plotRmiRtc: no visible global function definition for
      ‘setSVGShapeToolTip’
    plotRmiRtc: no visible global function definition for ‘setSVGShapeURL’
    plotRmiRtc: no visible global function definition for ‘points’
    plotRmiRtc: no visible global function definition for ‘lines’
    plotRmiRtc: no visible global function definition for ‘legend’
    plotRmiRtc: no visible global function definition for ‘dev.off’
    readRmiRtc: no visible global function definition for ‘write.table’
    Undefined global functions or variables:
      dev.off devSVGTips legend lines plot points setSVGShapeToolTip
      setSVGShapeURL write.table
    Consider adding
      importFrom("grDevices", "dev.off")
      importFrom("graphics", "legend", "lines", "plot", "points")
      importFrom("utils", "write.table")
    to your NAMESPACE file.
    ```

# RnAgilentDesign028282.db

Version: 3.2.3

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
    File ‘RnAgilentDesign028282.db/R/zzz.R’:
      .onLoad calls:
        packageStartupMessage(AnnotationDbi:::annoStartupMessages("RnAgilentDesign028282.db"))
    
    See section ‘Good practice’ in '?.onAttach'.
    ```

# rnaSeqMap

Version: 2.34.0

## In both

*   checking re-building of vignette outputs ... WARNING
    ```
    Error in re-building vignettes:
      ...
    Error in texi2dvi(file = file, pdf = TRUE, clean = clean, quiet = quiet,  : 
      Running 'texi2dvi' on 'rnaSeqMap.tex' failed.
    LaTeX errors:
    ! Package auto-pst-pdf Error: 
        "shell escape" (or "write18") is not enabled:
        auto-pst-pdf will not work!
    .
    Calls: buildVignettes -> texi2pdf -> texi2dvi
    Execution halted
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
    ...
    plotSI: no visible global function definition for ‘plot’
    plotSI: no visible global function definition for ‘lines’
    plotSI: no visible global function definition for ‘legend’
    qq_derivative_plot: no visible global function definition for ‘qqplot’
    qq_plot: no visible global function definition for ‘qqplot’
    setSpecies: no visible global function definition for ‘menu’
    simplePlot: no visible global function definition for ‘plot’
    simplePlot: no visible global function definition for ‘lines’
    spaceInChromosome: no visible binding for global variable ‘out’
    sumND: no visible global function definition for ‘Rle’
    Undefined global functions or variables:
      Rle dbGetQuery exon.details gene.details gene.to.exon
      gene.to.transcript ks.test legend lines menu out par phenoData
      phenoData<- plot qqplot read.table rect topo.colors
      transcript.to.exon write.table
    Consider adding
      importFrom("grDevices", "topo.colors")
      importFrom("graphics", "legend", "lines", "par", "plot", "rect")
      importFrom("stats", "ks.test", "qqplot")
      importFrom("utils", "menu", "read.table", "write.table")
    to your NAMESPACE file.
    ```

# rnu34.db

Version: 3.2.3

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
    File ‘rnu34.db/R/zzz.R’:
      .onLoad calls:
        packageStartupMessage(AnnotationDbi:::annoStartupMessages("rnu34.db"))
    
    See section ‘Good practice’ in '?.onAttach'.
    ```

# Roberts2005Annotation.db

Version: 3.2.3

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
    File ‘Roberts2005Annotation.db/R/zzz.R’:
      .onLoad calls:
        packageStartupMessage(AnnotationDbi:::annoStartupMessages("Roberts2005Annotation.db"))
    
    See section ‘Good practice’ in '?.onAttach'.
    ```

# RObsDat

Version: 16.03

## In both

*   checking package dependencies ... NOTE
    ```
    Package suggested but not available for checking: ‘SSOAP’
    ```

# RODBCDBI

Version: 0.1.1

## In both

*   checking tests ...
    ```
     ERROR
    Running the tests in ‘tests/testthat.R’ failed.
    Last 13 lines of output:
      testthat results ================================================================
      OK: 30 SKIPPED: 0 FAILED: 14
      1. Error: Connection should be established (@test-ODBCConnection.R#11) 
      2. Error: iris exists by dbExistsTable (@test-ODBCConnection.R#22) 
      3. Error: iris exists by dbListTables (@test-ODBCConnection.R#30) 
      4. Error: iris does not exists (@test-ODBCConnection.R#38) 
      5. Error: COlumn name should match (@test-ODBCConnection.R#45) 
      6. Error: COlumn name should match including rownames (@test-ODBCConnection.R#53) 
      7. Error: it should not behave like bringing any error (@test-ODBCConnection.R#62) 
      8. Error: iris table and raw iris data should be match (@test-ODBCConnection.R#69) 
      9. Error: DB source name should be test (@test-ODBCConnection.R#77) 
      1. ...
      
      Error: testthat unit tests failed
      Execution halted
    ```

# Roleswitch

Version: 1.14.0

## In both

*   checking package dependencies ... NOTE
    ```
    Depends: includes the non-default packages:
      ‘pracma’ ‘reshape’ ‘plotrix’ ‘microRNA’ ‘biomaRt’ ‘Biostrings’
      ‘Biobase’ ‘DBI’
    Adding so many packages to the search path is excessive and importing
    selectively is preferable.
    ```

*   checking R code for possible problems ... NOTE
    ```
    diagnosticPlot: no visible global function definition for ‘par’
    diagnosticPlot: no visible global function definition for ‘axis’
    diagnosticPlot: no visible global function definition for ‘plot’
    getSeedMatrix: no visible global function definition for ‘data’
    getTranscriptIDwithLongest3UTR: no visible global function definition
      for ‘aggregate’
    roleswitch: no visible global function definition for ‘aggregate’
    Undefined global functions or variables:
      aggregate axis data par plot
    Consider adding
      importFrom("graphics", "axis", "par", "plot")
      importFrom("stats", "aggregate")
      importFrom("utils", "data")
    to your NAMESPACE file.
    ```

*   checking re-building of vignette outputs ... NOTE
    ```
    ...
    3: max(p.x-p.x.prev)=0.00005
    4: max(p.x-p.x.prev)=0.00000
    
    Start roleswitch with 365 miRNA and 11016 mRNA
    1: max(p.x-p.x.prev)=0.12564
    2: max(p.x-p.x.prev)=0.00008
    3: max(p.x-p.x.prev)=0.00003
    4: max(p.x-p.x.prev)=0.00000
    Some genes or miRNA are left out in calculation
    b/c they have zero target sites or targets!
    Their probabilities are set to zero in the output matrices
    Loading required package: ggplot2
    Loading required package: hgu95av2.db
    Warning in library(package, lib.loc = lib.loc, character.only = TRUE, logical.return = TRUE,  :
      there is no package called ‘hgu95av2.db’
    
    Error: processing vignette 'Roleswitch.Rnw' failed with diagnostics:
     chunk 10 (label = eset) 
    Error in roleswitch(eset, mirna.expr) : 
      hgu95av2.db package must be installed
    Execution halted
    ```

# rpostgisLT

Version: 0.5.0

## In both

*   checking dependencies in R code ... NOTE
    ```
    Unexported objects imported by ':::' calls:
      ‘rpostgis:::dbBuildTableQuery’ ‘rpostgis:::dbConnCheck’
      ‘rpostgis:::dbExistsTable’ ‘rpostgis:::dbTableNameFix’
      See the note in ?`:::` about the use of this operator.
    ```

# RQDA

Version: 0.3-0

## In both

*   checking whether package ‘RQDA’ can be installed ... ERROR
    ```
    Installation failed.
    See ‘/home/muelleki/git/R/DBI/revdep/checks/RQDA/new/RQDA.Rcheck/00install.out’ for details.
    ```

*   checking package dependencies ... NOTE
    ```
    Packages which this enhances but not available for checking:
      ‘rjpod’ ‘d3Network’
    ```

## Installation

### Devel

```
* installing *source* package ‘RQDA’ ...
** package ‘RQDA’ successfully unpacked and MD5 sums checked
** R
** inst
** preparing package for lazy loading
R session is headless; GTK+ not initialized.

(R:39192): Gtk-WARNING **: gtk_disable_setlocale() must be called before gtk_init()
Error: package or namespace load failed for ‘cairoDevice’:
 .onLoad failed in loadNamespace() for 'cairoDevice', details:
  call: fun(libname, pkgname)
  error: GDK display not found - please make sure X11 is running
Error : package ‘cairoDevice’ could not be loaded
ERROR: lazy loading failed for package ‘RQDA’
* removing ‘/home/muelleki/git/R/DBI/revdep/checks/RQDA/new/RQDA.Rcheck/RQDA’

```
### CRAN

```
* installing *source* package ‘RQDA’ ...
** package ‘RQDA’ successfully unpacked and MD5 sums checked
** R
** inst
** preparing package for lazy loading
R session is headless; GTK+ not initialized.

(R:39178): Gtk-WARNING **: gtk_disable_setlocale() must be called before gtk_init()
Error: package or namespace load failed for ‘cairoDevice’:
 .onLoad failed in loadNamespace() for 'cairoDevice', details:
  call: fun(libname, pkgname)
  error: GDK display not found - please make sure X11 is running
Error : package ‘cairoDevice’ could not be loaded
ERROR: lazy loading failed for package ‘RQDA’
* removing ‘/home/muelleki/git/R/DBI/revdep/checks/RQDA/old/RQDA.Rcheck/RQDA’

```
# RSQLite

Version: 2.0

## In both

*   checking tests ...
    ```
     ERROR
    Running the tests in ‘tests/testthat.R’ failed.
    Last 13 lines of output:
      > library(RSQLite)
      > 
      > test_check("RSQLite")
      1. Failure: DBItest[RSQLite]: Connection: cannot_forget_disconnect -------------
      gc() showed 0 warnings
      
      
      testthat results ================================================================
      OK: 4255 SKIPPED: 15 FAILED: 1
      1. Failure: DBItest[RSQLite]: Connection: cannot_forget_disconnect 
      
      Error: testthat unit tests failed
      In addition: Warning message:
      call dbDisconnect() when finished working with a connection 
      Execution halted
    ```

*   checking installed package size ... NOTE
    ```
      installed size is  9.3Mb
      sub-directories of 1Mb or more:
        libs   8.8Mb
    ```

*   checking dependencies in R code ... NOTE
    ```
    Namespace in Imports field not imported from: ‘pkgconfig’
      All declared Imports should be used.
    ```

# rta10probeset.db

Version: 8.6.0

## In both

*   checking installed package size ... NOTE
    ```
      installed size is 101.7Mb
      sub-directories of 1Mb or more:
        extdata  101.5Mb
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

# rta10transcriptcluster.db

Version: 8.6.0

## In both

*   checking installed package size ... NOTE
    ```
      installed size is  8.9Mb
      sub-directories of 1Mb or more:
        extdata   8.8Mb
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
    File ‘rta10transcriptcluster.db/R/zzz.R’:
      .onLoad calls:
        packageStartupMessage(AnnotationDbi:::annoStartupMessages("rta10transcriptcluster.db"))
    
    See section ‘Good practice’ in '?.onAttach'.
    ```

# rtu34.db

Version: 3.2.3

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
    File ‘rtu34.db/R/zzz.R’:
      .onLoad calls:
        packageStartupMessage(AnnotationDbi:::annoStartupMessages("rtu34.db"))
    
    See section ‘Good practice’ in '?.onAttach'.
    ```

# sejmRP

Version: 1.3.4

## In both

*   checking dependencies in R code ... NOTE
    ```
    Namespaces in Imports field not imported from:
      ‘cluster’ ‘factoextra’ ‘tidyr’
      All declared Imports should be used.
    ```

# seplyr

Version: 0.1.6

## In both

*   checking re-building of vignette outputs ... WARNING
    ```
    Error in re-building vignettes:
      ...
    Quitting from lines 48-60 (mutate.Rmd) 
    Error: processing vignette 'mutate.Rmd' failed with diagnostics:
    object 'd' not found
    Execution halted
    ```

*   checking dependencies in R code ... NOTE
    ```
    Namespace in Imports field not imported from: ‘datasets’
      All declared Imports should be used.
    ```

# seqplots

Version: 1.14.1

## In both

*   checking re-building of vignette outputs ... WARNING
    ```
    Error in re-building vignettes:
      ...
    Error in rep("../", npos) : invalid 'times' argument
    Error: processing vignette 'QuickStart.Rmd' failed with diagnostics:
    path for html_dependency not found: 
    Execution halted
    ```

*   checking installed package size ... NOTE
    ```
      installed size is 13.7Mb
      sub-directories of 1Mb or more:
        doc        2.6Mb
        seqplots  10.3Mb
    ```

*   checking foreign function calls ... NOTE
    ```
    Foreign function call to a different package:
      .Call("BWGFile_summary", ..., PACKAGE = "rtracklayer")
    See chapter ‘System and foreign language interfaces’ in the ‘Writing R
    Extensions’ manual.
    ```

*   checking R code for possible problems ... NOTE
    ```
    ...
    plotHeatmap,list: no visible global function definition for ‘kmeans’
    plotHeatmap,list: no visible global function definition for ‘hclust’
    plotHeatmap,list: no visible global function definition for ‘dist’
    plotHeatmap,list: no visible global function definition for ‘cutree’
    plotHeatmap,list: no visible global function definition for
      ‘as.dendrogram’
    plotHeatmap,list: no visible global function definition for ‘title’
    Undefined global functions or variables:
      Var1 Var2 abline adjustcolor approx as.dendrogram axis box
      capture.output colorRampPalette cutree dist hclust image kmeans
      layout lines mtext par plot.new qt rainbow rect rgb text title value
    Consider adding
      importFrom("grDevices", "adjustcolor", "colorRampPalette", "rainbow",
                 "rgb")
      importFrom("graphics", "abline", "axis", "box", "image", "layout",
                 "lines", "mtext", "par", "plot.new", "rect", "text",
                 "title")
      importFrom("stats", "approx", "as.dendrogram", "cutree", "dist",
                 "hclust", "kmeans", "qt")
      importFrom("utils", "capture.output")
    to your NAMESPACE file.
    ```

# sergeant

Version: 0.5.2

## In both

*   checking tests ...
    ```
     ERROR
    Running the tests in ‘tests/testthat.R’ failed.
    Last 13 lines of output:
      2: httr::POST(sprintf("%s/query.json", drill_server), encode = "json", body = list(queryType = "SQL", 
             query = query))
      3: request_perform(req, hu$handle$handle)
      4: request_fetch(req$output, req$url, handle)
      5: request_fetch.write_memory(req$output, req$url, handle)
      6: curl::curl_fetch_memory(url, handle = handle)
      
      testthat results ================================================================
      OK: 1 SKIPPED: 0 FAILED: 3
      1. Error: Core dbplyr ops work (@test-sergeant.R#12) 
      2. Failure: REST API works (@test-sergeant.R#25) 
      3. Error: REST API works (@test-sergeant.R#27) 
      
      Error: testthat unit tests failed
      Execution halted
    ```

# sf

Version: 0.5-5

## In both

*   checking re-building of vignette outputs ... WARNING
    ```
    Error in re-building vignettes:
      ...
    Warning in engine$weave(file, quiet = quiet, encoding = enc) :
      The vignette engine knitr::rmarkdown is not available, because the rmarkdown package is not installed. Please install it.
    Warning in engine$weave(file, quiet = quiet, encoding = enc) :
      The vignette engine knitr::rmarkdown is not available, because the rmarkdown package is not installed. Please install it.
    Warning in engine$weave(file, quiet = quiet, encoding = enc) :
      The vignette engine knitr::rmarkdown is not available, because the rmarkdown package is not installed. Please install it.
    Warning in engine$weave(file, quiet = quiet, encoding = enc) :
      The vignette engine knitr::rmarkdown is not available, because the rmarkdown package is not installed. Please install it.
    Warning in engine$weave(file, quiet = quiet, encoding = enc) :
      The vignette engine knitr::rmarkdown is not available, because the rmarkdown package is not installed. Please install it.
    Quitting from lines 194-197 (sf5.Rmd) 
    Error: processing vignette 'sf5.Rmd' failed with diagnostics:
    cannot open the connection
    Execution halted
    ```

*   checking installed package size ... NOTE
    ```
      installed size is 20.2Mb
      sub-directories of 1Mb or more:
        doc     10.7Mb
        libs     5.7Mb
        sqlite   1.5Mb
    ```

# SHDZ.db

Version: 3.2.3

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

# sparkavro

Version: 0.1.0

## In both

*   checking tests ...
    ```
     ERROR
    Running the tests in ‘tests/testthat.R’ failed.
    Last 13 lines of output:
          matches
      
      The following objects are masked from 'package:stats':
      
          filter, lag
      
      The following objects are masked from 'package:base':
      
          intersect, setdiff, setequal, union
      
      Error in if (is.na(a)) return(-1L) : argument is of length zero
      Calls: test_check ... spark_install_find -> spark_versions -> lapply -> FUN -> compareVersion
      testthat results ================================================================
      OK: 0 SKIPPED: 0 FAILED: 0
      Execution halted
    ```

# sparklyr

Version: 0.6.4

## In both

*   checking tests ...
    ```
     ERROR
    Running the tests in ‘tests/testthat.R’ failed.
    Complete output:
      > Sys.setenv("R_TESTS" = "")
      > library(testthat)
      > library(sparklyr)
      > 
      > if (identical(Sys.getenv("NOT_CRAN"), "true")) {
      +   test_check("sparklyr")
      +   on.exit({ spark_disconnect_all() ; livy_service_stop() })
      + }
      Error in if (is.na(a)) return(-1L) : argument is of length zero
      Calls: test_check ... spark_install_find -> spark_versions -> lapply -> FUN -> compareVersion
      testthat results ================================================================
      OK: 0 SKIPPED: 0 FAILED: 0
      Execution halted
    ```

# specL

Version: 1.10.0

## In both

*   checking installed package size ... NOTE
    ```
      installed size is  5.6Mb
      sub-directories of 1Mb or more:
        doc   4.2Mb
    ```

*   checking R code for possible problems ... NOTE
    ```
    .onAttach: no visible global function definition for ‘packageVersion’
    .retentiontimePlotFile : <anonymous>: no visible global function
      definition for ‘rgb’
    plot,specLSet: no visible global function definition for ‘draw.circle’
    summary,specLSet : <anonymous>: no visible binding for global variable
      ‘iRTpeptides’
    Undefined global functions or variables:
      draw.circle iRTpeptides packageVersion rgb
    Consider adding
      importFrom("grDevices", "rgb")
      importFrom("utils", "packageVersion")
    to your NAMESPACE file.
    ```

*   checking Rd files ... NOTE
    ```
    prepare_Rd: ms1.p2069.Rd:28-32: Dropping empty section \references
    prepare_Rd: ms1.p2069.Rd:23-26: Dropping empty section \examples
    ```

*   checking re-building of vignette outputs ... NOTE
    ```
    ...
    Warning in plot.histogram(r, freq = freq1, col = col, border = border, angle = angle,  :
      the AREAS in the plot are wrong -- rather use 'freq = FALSE'
    Warning in plot.histogram(r, freq = freq1, col = col, border = border, angle = angle,  :
      the AREAS in the plot are wrong -- rather use 'freq = FALSE'
    Warning in plot.histogram(r, freq = freq1, col = col, border = border, angle = angle,  :
      the AREAS in the plot are wrong -- rather use 'freq = FALSE'
    Warning in plot.histogram(r, freq = freq1, col = col, border = border, angle = angle,  :
      the AREAS in the plot are wrong -- rather use 'freq = FALSE'
    Warning in plot.histogram(r, freq = freq1, col = col, border = border, angle = angle,  :
      the AREAS in the plot are wrong -- rather use 'freq = FALSE'
    Warning in plot.histogram(r, freq = freq1, col = col, border = border, angle = angle,  :
      the AREAS in the plot are wrong -- rather use 'freq = FALSE'
    Warning in plot.histogram(r, freq = freq1, col = col, border = border, angle = angle,  :
      the AREAS in the plot are wrong -- rather use 'freq = FALSE'
    Warning in plot.histogram(r, freq = freq1, col = col, border = border, angle = angle,  :
      the AREAS in the plot are wrong -- rather use 'freq = FALSE'
    Warning in plot.histogram(r, freq = freq1, col = col, border = border, angle = angle,  :
      the AREAS in the plot are wrong -- rather use 'freq = FALSE'
    Error: processing vignette 'cdsw.Rmd' failed with diagnostics:
    path for html_dependency not found: 
    Execution halted
    ```

# sqldf

Version: 0.4-11

## In both

*   checking whether package ‘sqldf’ can be installed ... WARNING
    ```
    Found the following significant warnings:
      Warning: no DISPLAY variable so Tk is not available
    See ‘/home/muelleki/git/R/DBI/revdep/checks/sqldf/new/sqldf.Rcheck/00install.out’ for details.
    ```

# sqlutils

Version: 1.2

## In both

*   checking package dependencies ... NOTE
    ```
    Packages which this enhances but not available for checking:
      ‘RPostgreSQL’ ‘RODBC’ ‘RMySQL’ ‘RJDBC’
    ```

*   checking DESCRIPTION meta-information ... NOTE
    ```
    Malformed Title field: should not end in a period.
    ```

*   checking dependencies in R code ... NOTE
    ```
    'library' or 'require' calls in package code:
      ‘RJDBC’ ‘RMySQL’ ‘RODBC’ ‘RPostgreSQL’ ‘RSQLite’ ‘tcltk’
      Please use :: or requireNamespace() instead.
      See section 'Suggested packages' in the 'Writing R Extensions' manual.
    ```

*   checking R code for possible problems ... NOTE
    ```
    cacheQuery: no visible global function definition for ‘read.csv’
    cacheQuery: no visible global function definition for ‘write.csv’
    Undefined global functions or variables:
      read.csv write.csv
    Consider adding
      importFrom("utils", "read.csv", "write.csv")
    to your NAMESPACE file.
    ```

# stream

Version: 1.2-4

## In both

*   checking installed package size ... NOTE
    ```
      installed size is  6.6Mb
      sub-directories of 1Mb or more:
        doc    1.6Mb
        libs   4.5Mb
    ```

# taxizedb

Version: 0.1.4

## In both

*   checking tests ...
    ```
     ERROR
    Running the tests in ‘tests/test-all.R’ failed.
    Last 13 lines of output:
      > library(testthat)
      > test_check("taxizedb")
      Loading required package: taxizedb
      1. Failure: db_load fails as expected - more (@test-db_load.R#33) --------------
      error$message does not match "Failed to connect".
      Actual value: "\nmysql not found on your computer\nInstall the missing tool(s) and try again"
      
      
      testthat results ================================================================
      OK: 59 SKIPPED: 0 FAILED: 1
      1. Failure: db_load fails as expected - more (@test-db_load.R#33) 
      
      Error: testthat unit tests failed
      Execution halted
    ```

# tcpl

Version: 1.2.2

## In both

*   checking installed package size ... NOTE
    ```
      installed size is  9.9Mb
      sub-directories of 1Mb or more:
        sql   8.7Mb
    ```

# TFBSTools

Version: 1.14.2

## In both

*   checking re-building of vignette outputs ... WARNING
    ```
    ...
      Don't need to call dbFetch() for statements, only for queries
    Warning in rsqlite_fetch(res@ptr, n = n) :
      Don't need to call dbFetch() for statements, only for queries
    Warning in rsqlite_fetch(res@ptr, n = n) :
      Don't need to call dbFetch() for statements, only for queries
    Warning in rsqlite_fetch(res@ptr, n = n) :
      Don't need to call dbFetch() for statements, only for queries
    Warning in rsqlite_fetch(res@ptr, n = n) :
      Don't need to call dbFetch() for statements, only for queries
    Warning in rsqlite_fetch(res@ptr, n = n) :
      Don't need to call dbFetch() for statements, only for queries
    
    Attaching package: 'CNEr'
    
    The following object is masked from 'package:Biostrings':
    
        N50
    
    Error: processing vignette 'TFBSTools.Rmd' failed with diagnostics:
    path for html_dependency not found: 
    Execution halted
    ```

*   checking dependencies in R code ... NOTE
    ```
    Unexported objects imported by ':::' calls:
      ‘S4Vectors:::new_SimpleList_from_list’ ‘seqLogo:::pwm2ic’
      See the note in ?`:::` about the use of this operator.
    ```

# timeseriesdb

Version: 0.2.1

## In both

*   checking R code for possible problems ... NOTE
    ```
    ...
    plot.tslist: no visible global function definition for ‘legend’
    readTimeSeries : <anonymous>: no visible global function definition for
      ‘ts’
    resolveOverlap: no visible global function definition for ‘is.ts’
    resolveOverlap: no visible global function definition for ‘frequency’
    resolveOverlap: no visible global function definition for ‘time’
    resolveOverlap: no visible global function definition for ‘ts’
    storeTimeSeries: no visible binding for global variable ‘frequency’
    zooLikeDateConvert: no visible global function definition for ‘time’
    zooLikeDateConvert: no visible global function definition for
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

# topGO

Version: 2.28.0

## In both

*   checking package dependencies ... NOTE
    ```
    Depends: includes the non-default packages:
      ‘BiocGenerics’ ‘graph’ ‘Biobase’ ‘GO.db’ ‘AnnotationDbi’ ‘SparseM’
    Adding so many packages to the search path is excessive and importing
    selectively is preferable.
    ```

*   checking dependencies in R code ... NOTE
    ```
    'library' or 'require' calls in package code:
      ‘Rgraphviz’ ‘multtest’
      Please use :: or requireNamespace() instead.
      See section 'Suggested packages' in the 'Writing R Extensions' manual.
    Missing object imported by a ':::' call: ‘globaltest:::globaltest’
    ```

*   checking R code for possible problems ... NOTE
    ```
    ...
    GOplot.counts : plotSigChart: no visible global function definition for
      ‘getY’
    GOplot.counts: no visible global function definition for
      ‘getDefaultAttrs’
    GOplot.counts: no visible global function definition for ‘agopen’
    getPvalues: no visible global function definition for ‘mt.teststat’
    getPvalues: no visible global function definition for ‘mt.rawp2adjp’
    printDOT: no visible global function definition for ‘getDefaultAttrs’
    printDOT: no visible global function definition for ‘toDot’
    GOSumTest,classicScore: no visible binding for global variable
      ‘.PERMSUM.MAT’
    GOSumTest,classicScore: no visible binding for global variable
      ‘.PERMSUM.LOOKUP’
    initialize,classicExpr: no visible global function definition for
      ‘error’
    scoresInTerm,topGOdata-missing: no visible global function definition
      for ‘scoreInNode’
    Undefined global functions or variables:
      .PERMSUM.LOOKUP .PERMSUM.MAT AgNode agopen drawTxtLabel error
      getDefaultAttrs getNodeCenter getNodeLW getNodeXY getX getY
      mt.rawp2adjp mt.teststat name pieGlyph scoreInNode toDot txtLabel
    ```

# toxboot

Version: 0.1.1

## In both

*   checking package dependencies ... NOTE
    ```
    Package suggested but not available for checking: ‘rmongodb’
    ```

# TScompare

Version: 2015.4-1

## In both

*   checking package dependencies ... NOTE
    ```
    Packages which this enhances but not available for checking:
      ‘TSPostgreSQL’ ‘TSodbc’ ‘TSfame’
    ```

*   checking R code for possible problems ... NOTE
    ```
    tfDetails: no visible global function definition for ‘start’
    tfDetails: no visible global function definition for ‘end’
    Undefined global functions or variables:
      end start
    Consider adding
      importFrom("stats", "end", "start")
    to your NAMESPACE file.
    ```

# TSdata

Version: 2016.8-1

## In both

*   checking running R code from vignettes ...
    ```
    ...
    INFO: Contacting web service with query: https://stats.oecd.org/restsdmx/sdmx.ashx/GetDataStructure/QNA
    Nov 23, 2017 3:08:16 PM it.bancaditalia.oss.sdmx.client.RestSdmxClient runQuery
    SEVERE: HTTP error code 429 doesn't have a defined SDMX meaning.
    Nov 23, 2017 3:08:16 PM it.bancaditalia.oss.sdmx.client.RestSdmxClient runQuery
    SEVERE: HTTP error code 429 doesn't have a defined SDMX meaning.
    
      When sourcing ‘Guide.R’:
    Error: QNA.CAN.B1_GE.CARSA.Q error: it.bancaditalia.oss.sdmx.exceptions.SdmxInvalidParameterException: HTTP error code 429 doesn't have a defined SDMX meaning.
    Execution halted
    when running code in ‘GuideAppendix.Stex’
      ...
    
    > options(continue = "  ")
    
    > user <- Sys.getenv("MYSQL_USER")
    
    > setup <- RMySQL::dbConnect(RMySQL::MySQL(), dbname = "test")
    
      When sourcing ‘GuideAppendix.R’:
    Error: Failed to connect to database: Error: Can't connect to local MySQL server through socket '/var/run/mysqld/mysqld.sock' (2)
    Execution halted
    ```

*   checking re-building of vignette outputs ... NOTE
    ```
    ...
    INFO: Contacting web service with query: http://ec.europa.eu/eurostat/SDMX/diss-web/rest/dataflow/ESTAT/ei_nama_q/latest
    Nov 23, 2017 3:08:24 PM it.bancaditalia.oss.sdmx.client.RestSdmxClient runQuery
    INFO: Contacting web service with query: http://ec.europa.eu/eurostat/SDMX/diss-web/rest/datastructure/ESTAT/DSD_ei_nama_q/1.0
    Nov 23, 2017 3:08:24 PM it.bancaditalia.oss.sdmx.client.RestSdmxClient runQuery
    INFO: Contacting web service with query: http://ec.europa.eu/eurostat/SDMX/diss-web/rest/datastructure/ESTAT/DSD_ei_nama_q/1.0
    Nov 23, 2017 3:08:24 PM it.bancaditalia.oss.sdmx.client.RestSdmxClient runQuery
    INFO: Contacting web service with query: http://ec.europa.eu/eurostat/SDMX/diss-web/rest/data/ESTAT,ei_nama_q,1.0/Q.MIO-EUR.NSA.CP.NA-P72.IT
    Nov 23, 2017 3:08:24 PM it.bancaditalia.oss.sdmx.client.RestSdmxClient runQuery
    INFO: Contacting web service with query: http://ec.europa.eu/eurostat/SDMX/diss-web/rest/data/ESTAT,ei_nama_q,1.0/Q.MIO-EUR.NSA.CP.NA-P72.IT
    Nov 23, 2017 3:08:24 PM it.bancaditalia.oss.sdmx.client.RestSdmxClient getData
    INFO: The sdmx call returned messages in the footer:
     Message [code=400, severity=Error, url=null, text=[Error caused by the caller due to incorrect or semantically invalid arguments]]
    Nov 23, 2017 3:08:24 PM it.bancaditalia.oss.sdmx.client.RestSdmxClient getData
    INFO: The sdmx call returned messages in the footer:
     Message [code=400, severity=Error, url=null, text=[Error caused by the caller due to incorrect or semantically invalid arguments]]
    
    Error: processing vignette 'Guide.Stex' failed with diagnostics:
     chunk 5 
    Error in .local(serIDs, con, ...) : 
      ei_nama_q.Q.MIO-EUR.NSA.CP.NA-P72.IT error: it.bancaditalia.oss.sdmx.exceptions.SdmxXmlContentException: The query: ei_nama_q.Q.MIO-EUR.NSA.CP.NA-P72.IT did not match any time series on the provider.
    Execution halted
    ```

# TSdbi

Version: 2017.4-1

## In both

*   checking Rd cross-references ... NOTE
    ```
    Packages unavailable to check Rd xrefs: ‘TSSQLite’, ‘TSMySQL’, ‘TSPostgreSQL’
    ```

# TSfame

Version: 2015.4-1

## In both

*   checking R code for possible problems ... NOTE
    ```
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

# u133x3p.db

Version: 3.2.3

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

# VariantAnnotation

Version: 1.22.3

## In both

*   checking dependencies in R code ... NOTE
    ```
    'library' or 'require' call to ‘snpStats’ in package code.
      Please use :: or requireNamespace() instead.
      See section 'Suggested packages' in the 'Writing R Extensions' manual.
    Unexported objects imported by ':::' calls:
      ‘BiocGenerics:::replaceSlots’ ‘BiocGenerics:::testPackage’
      ‘Rsamtools:::.RsamtoolsFile’ ‘Rsamtools:::.RsamtoolsFileList’
      ‘Rsamtools:::.io_check_exists’ ‘S4Vectors:::expandByColumnSet’
      ‘S4Vectors:::labeledLine’ ‘S4Vectors:::recycleVector’
      ‘S4Vectors:::selectSome’
      ‘SummarizedExperiment:::.SummarizedExperiment.charbound’
      ‘SummarizedExperiment:::.cbind.DataFrame’
      See the note in ?`:::` about the use of this operator.
    ```

*   checking R code for possible problems ... NOTE
    ```
    .predictCodingGRangesList: no visible binding for global variable
      ‘GENETIC_CODE’
    VRangesForMatching: no visible binding for global variable ‘REF’
    VRangesForMatching: no visible binding for global variable ‘ALT’
    probabilityToSnpMatrix: no visible global function definition for
      ‘post2g’
    import,VcfFile-ANY-ANY: no visible global function definition for
      ‘checkArgFormat’
    Undefined global functions or variables:
      ALT GENETIC_CODE REF checkArgFormat post2g
    ```

*   checking compiled code ... NOTE
    ```
    File ‘VariantAnnotation/libs/VariantAnnotation.so’:
      Found non-API calls to R: ‘R_GetConnection’, ‘R_WriteConnection’
    
    Compiled code should not call non-API entry points in R.
    
    See ‘Writing portable packages’ in the ‘Writing R Extensions’ manual.
    ```

# VariantFiltering

Version: 1.12.2

## In both

*   checking tests ...
    ```
     ERROR
    Running the tests in ‘tests/runTests.R’ failed.
    Last 13 lines of output:
      4: In `seqlevelsStyle<-`(`*tmp*`, value = c("1", "2", "3", "4", "5",  :
        more than one seqlevels style supplied, using the 1st one only
      5: In `seqlevelsStyle<-`(`*tmp*`, value = c("1", "2", "3", "4", "5",  :
        more than one seqlevels style supplied, using the 1st one only
      6: In annotationEngine(variants, param, annotationCache, BPPARAM = BPPARAM) :
        Assumming hg19 and hs37d5 represent the same genome build.
      7: In `seqlevelsStyle<-`(`*tmp*`, value = c("1", "2", "3", "4", "5",  :
        more than one seqlevels style supplied, using the 1st one only
      8: In .scoreBindingSiteVariants(variantsVR_annotated, weightMatrices,  :
        Assumming hg19 and hs37d5 represent the same genome build.
      9: In .nextMethod(x, i, value = value) :
        number of values supplied is not a sub-multiple of the number of values to be replaced
      10: In .nextMethod(x, i, value = value) :
        number of values supplied is not a sub-multiple of the number of values to be replaced
      Execution halted
    ```

*   checking dependencies in R code ... NOTE
    ```
    Unexported objects imported by ':::' calls:
      'S4Vectors:::labeledLine' 'VariantAnnotation:::.checkArgs'
      'VariantAnnotation:::.consolidateHits'
      'VariantAnnotation:::.returnEmpty'
      See the note in ?`:::` about the use of this operator.
    There are ::: calls to the package's namespace in its code. A package
      almost never needs to use ::: for its own objects:
      '.adjustForStrandSense'
    ```

# vmsbase

Version: 2.1.3

## In both

*   checking whether package ‘vmsbase’ can be installed ... ERROR
    ```
    Installation failed.
    See ‘/home/muelleki/git/R/DBI/revdep/checks/vmsbase/new/vmsbase.Rcheck/00install.out’ for details.
    ```

## Installation

### Devel

```
* installing *source* package ‘vmsbase’ ...
** package ‘vmsbase’ successfully unpacked and MD5 sums checked
** R
** inst
** preparing package for lazy loading
Warning: no DISPLAY variable so Tk is not available
R session is headless; GTK+ not initialized.

(R:49664): Gtk-WARNING **: gtk_disable_setlocale() must be called before gtk_init()
Error : .onLoad failed in loadNamespace() for 'cairoDevice', details:
  call: fun(libname, pkgname)
  error: GDK display not found - please make sure X11 is running
ERROR: lazy loading failed for package ‘vmsbase’
* removing ‘/home/muelleki/git/R/DBI/revdep/checks/vmsbase/new/vmsbase.Rcheck/vmsbase’

```
### CRAN

```
* installing *source* package ‘vmsbase’ ...
** package ‘vmsbase’ successfully unpacked and MD5 sums checked
** R
** inst
** preparing package for lazy loading
Warning: no DISPLAY variable so Tk is not available
R session is headless; GTK+ not initialized.

(R:49651): Gtk-WARNING **: gtk_disable_setlocale() must be called before gtk_init()
Error : .onLoad failed in loadNamespace() for 'cairoDevice', details:
  call: fun(libname, pkgname)
  error: GDK display not found - please make sure X11 is running
ERROR: lazy loading failed for package ‘vmsbase’
* removing ‘/home/muelleki/git/R/DBI/revdep/checks/vmsbase/old/vmsbase.Rcheck/vmsbase’

```
# withr

Version: 2.1.0

## In both

*   checking dependencies in R code ... NOTE
    ```
    Namespace in Imports field not imported from: ‘lattice’
      All declared Imports should be used.
    ```

# xlaevis.db

Version: 3.2.3

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
    Package in Depends field not imported from: ‘org.Xl.eg.db’
      These packages need to be imported from (in the NAMESPACE file)
      for when this namespace is loaded but not attached.
    ```

*   checking R code for possible problems ... NOTE
    ```
    File ‘xlaevis.db/R/zzz.R’:
      .onLoad calls:
        packageStartupMessage(AnnotationDbi:::annoStartupMessages("xlaevis.db"))
    
    See section ‘Good practice’ in '?.onAttach'.
    ```

# yeast2.db

Version: 3.2.3

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
    Package in Depends field not imported from: ‘org.Sc.sgd.db’
      These packages need to be imported from (in the NAMESPACE file)
      for when this namespace is loaded but not attached.
    ```

*   checking R code for possible problems ... NOTE
    ```
    File ‘yeast2.db/R/zzz.R’:
      .onLoad calls:
        packageStartupMessage(AnnotationDbi:::annoStartupMessages("yeast2.db"))
    
    See section ‘Good practice’ in '?.onAttach'.
    ```

# ygs98.db

Version: 3.2.3

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
    Package in Depends field not imported from: ‘org.Sc.sgd.db’
      These packages need to be imported from (in the NAMESPACE file)
      for when this namespace is loaded but not attached.
    ```

*   checking R code for possible problems ... NOTE
    ```
    File ‘ygs98.db/R/zzz.R’:
      .onLoad calls:
        packageStartupMessage(AnnotationDbi:::annoStartupMessages("ygs98.db"))
    
    See section ‘Good practice’ in '?.onAttach'.
    ```

# zebrafish.db

Version: 3.2.3

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
    Package in Depends field not imported from: ‘org.Dr.eg.db’
      These packages need to be imported from (in the NAMESPACE file)
      for when this namespace is loaded but not attached.
    ```

*   checking R code for possible problems ... NOTE
    ```
    File ‘zebrafish.db/R/zzz.R’:
      .onLoad calls:
        packageStartupMessage(AnnotationDbi:::annoStartupMessages("zebrafish.db"))
    
    See section ‘Good practice’ in '?.onAttach'.
    ```

