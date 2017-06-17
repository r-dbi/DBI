# Setup

## Platform

|setting  |value                        |
|:--------|:----------------------------|
|version  |R version 3.4.0 (2017-04-21) |
|system   |x86_64, linux-gnu            |
|ui       |X11                          |
|language |(EN)                         |
|collate  |en_US.UTF-8                  |
|tz       |Zulu                         |
|date     |2017-06-17                   |

## Packages

|package   |*  |version |date       |source                          |
|:---------|:--|:-------|:----------|:-------------------------------|
|blob      |   |1.1.0   |2017-06-17 |Github (tidyverse/blob@9dd54d9) |
|covr      |   |2.2.2   |2017-01-05 |cran (@2.2.2)                   |
|DBI       |   |0.6-14  |2017-06-17 |Github (rstats-db/DBI@0f390df)  |
|hms       |   |0.3     |2016-11-22 |cran (@0.3)                     |
|knitr     |   |1.16    |2017-05-18 |cran (@1.16)                    |
|magrittr  |   |1.5     |2014-11-22 |CRAN (R 3.4.0)                  |
|rmarkdown |   |1.6     |2017-06-15 |cran (@1.6)                     |
|rprojroot |   |1.2     |2017-01-16 |cran (@1.2)                     |
|RSQLite   |   |1.1-2   |2017-01-08 |CRAN (R 3.4.0)                  |
|testthat  |   |1.0.2   |2016-04-23 |cran (@1.0.2)                   |
|xml2      |   |1.1.1   |2017-01-24 |cran (@1.1.1)                   |

# Check results

34 packages with problems

|package           |version  | errors| warnings| notes|
|:-----------------|:--------|------:|--------:|-----:|
|anchoredDistr     |1.0.2    |      0|        1|     0|
|annmap            |1.18.0   |      0|        2|     5|
|AnnotationDbi     |1.38.1   |      0|        1|     5|
|AnnotationHubData |1.6.0    |      1|        0|     4|
|aroma.affymetrix  |3.1.0    |      1|        0|     0|
|bigrquery         |0.3.0    |      1|        0|     0|
|ChemmineR         |2.28.0   |      1|        0|     0|
|chunked           |0.3      |      1|        0|     1|
|cn.farms          |1.24.0   |      1|        0|     2|
|etl               |0.3.5    |      1|        1|     0|
|GenomicFeatures   |1.28.3   |      0|        1|     3|
|GOFunction        |1.24.0   |      0|        1|     5|
|implyr            |0.1.0    |      1|        0|     0|
|lumi              |2.28.0   |      0|        2|     3|
|mgsa              |1.24.0   |      0|        1|     5|
|mimager           |1.0.0    |      1|        0|     0|
|MonetDBLite       |0.3.1    |      2|        0|     3|
|oce               |0.9-21   |      1|        0|     1|
|oligo             |1.40.1   |      1|        1|     9|
|ora               |2.0-1    |      1|        0|     0|
|PAnnBuilder       |1.40.0   |      0|        3|     1|
|plethy            |1.14.0   |      2|        0|     3|
|RImmPort          |1.4.1    |      0|        1|     0|
|RJDBC             |0.2-5    |      0|        1|     1|
|rnaSeqMap         |2.34.0   |      0|        1|     5|
|ROracle           |1.3-1    |      1|        0|     0|
|RPresto           |1.2.1    |      1|        1|     1|
|RQDA              |0.2-8    |      1|        0|     1|
|seqplots          |1.13.0   |      2|        0|     3|
|sqldf             |0.4-10   |      0|        1|     2|
|taxizedb          |0.1.0    |      1|        0|     0|
|TSdata            |2016.8-1 |      0|        1|     0|
|VariantFiltering  |1.12.1   |      0|        1|     4|
|vmsbase           |2.1.3    |      1|        0|     0|

## anchoredDistr (1.0.2)
Maintainer: Heather Savoy <frystacka@berkeley.edu>

0 errors | 1 warning  | 0 notes

```
checking re-building of vignette outputs ... WARNING
Error in re-building vignettes:
  ...
Quitting from lines 50-64 (anchoredDistr.Rmd) 
Error: processing vignette 'anchoredDistr.Rmd' failed with diagnostics:
cannot open the connection
Execution halted

```

## annmap (1.18.0)
Maintainer: Chris Wirth <Christopher.Wirth@cruk.manchester.ac.uk>

0 errors | 2 warnings | 5 notes

```
checking Rd cross-references ... WARNING
Missing link or links in documentation object 'plot.ngs.Rd':
  ‘[IRanges]{Rle}’

See section 'Cross-references' in the 'Writing R Extensions' manual.


checking re-building of vignette outputs ... WARNING
Error in re-building vignettes:
  ...
    auto-pst-pdf will not work!
.

See the auto-pst-pdf package documentation for explanation.
Type  H <return>  for immediate help.
 ...                                              
                                                  
... 8 lines ...
l.134         Or turn off auto-pst-pdf.}
                                        %
/usr/share/texlive/texmf-dist/tex/latex/auto-pst-pdf/auto-pst-pdf.sty:134:  ==>
 Fatal error occurred, no output PDF file produced!
Transcript written on annmap.log.
/usr/bin/texi2dvi: pdflatex exited with bad status, quitting.
Makefile:7: recipe for target 'pdf' failed
make: *** [pdf] Error 1
Error in buildVignettes(dir = "/home/muelleki/git/R/DBI/revdep/checks/annmap.Rcheck/vign_test/annmap") : 
  running 'make' failed
Execution halted

checking for hidden files and directories ... NOTE
Found the following hidden files and directories:
  .BBSoptions
These were most likely included in error. See section ‘Package
structure’ in the ‘Writing R Extensions’ manual.

checking DESCRIPTION meta-information ... NOTE
Malformed Title field: should not end in a period.

checking dependencies in R code ... NOTE
'library' or 'require' call to ‘rjson’ in package code.
  Please use :: or requireNamespace() instead.
  See section 'Suggested packages' in the 'Writing R Extensions' manual.
There are ::: calls to the package's namespace in its code. A package
  almost never needs to use ::: for its own objects:
  ‘.make.hash’

checking R code for possible problems ... NOTE
.coerce: no visible global function definition for ‘setNames’
.coerce: no visible binding for global variable ‘v’
.coerce: no visible binding for global variable ‘k’
.get.stats.cache: no visible global function definition for
  ‘flush.console’
.layout.genes: no visible global function definition for ‘strwidth’
.load.and.parse: no visible global function definition for ‘fromJSON’
.read.databases: no visible global function definition for ‘read.table’
.single.transcript.coords.to.genome: no visible global function
... 25 lines ...
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

checking Rd line widths ... NOTE
Rd file 'annmap.coords.Rd':
  \usage lines wider than 90 characters:
       transcriptCoordsToGenome( transcript.ids, position=1, as.vector=FALSE, check.bounds=TRUE, truncate=TRUE, cds=FALSE )
       genomeToTranscriptCoords( position, transcript.ids, as.vector=FALSE, check.bounds=TRUE, end=c( 'none', 'both', '5', '3' ) )
       proteinCoordsToGenome( protein.ids, position=1, as.vector=FALSE, check.bounds=TRUE, truncate=TRUE )

Rd file 'annmap.range.Rd':
  \examples lines wider than 100 characters:
         df = data.frame( chr=c( '17', 'X' ), start=c( 7510000, 1000000 ), end=c( 7550000, 1500000 ), strand=c( -1, -1 ) )
... 24 lines ...
       genomicExonDepthPlot( .exons, start, end, exon.depth.alpha=0.1, exon.depth.col='black', ... )

Rd file 'plot.ngs.Rd':
  \usage lines wider than 90 characters:
       convertBamToRle( bam.file.name, chr, start, end, chr.name.mapping=function( name ){ name } )
       ngsTracePlotter( rle.data, start, end, ylim, trace.label.properties=list(), smoothing.function=function( rle, ... ) { IRanges::runmea ... [TRUNCATED]
                          trace.clip='inherit', trace.draw.scale=FALSE, trace.bor='transparent', trace.pad=c(0,0), ... )
       ngsBridgePlot( xrange, data=list(), main=NULL, sub=NULL, highlights=NULL, trace.plotter=ngsTracePlotter, genome.layout.weight=4,
                    trace.scale=ngsTraceScale, trace.draw.scale=NULL, trace.match.strand=TRUE, probe.plot=NULL, exon.depth.plot=genomicExonD ... [TRUNCATED]

These lines will be truncated in the PDF manual.
```

## AnnotationDbi (1.38.1)
Maintainer: Bioconductor Package Maintainer <maintainer@bioconductor.org>

0 errors | 1 warning  | 5 notes

```
checking for unstated dependencies in ‘tests’ ... WARNING
'library' or 'require' call not declared from: ‘org.testing.db’

checking installed package size ... NOTE
  installed size is  8.7Mb
  sub-directories of 1Mb or more:
    R         1.0Mb
    extdata   6.0Mb

checking DESCRIPTION meta-information ... NOTE
Packages listed in more than one of Depends, Imports, Suggests, Enhances:
  ‘methods’ ‘utils’ ‘stats4’ ‘BiocGenerics’ ‘Biobase’ ‘IRanges’ ‘DBI’ ‘RSQLite’
A package should be listed in only one of these fields.

checking dependencies in R code ... NOTE
'library' or 'require' calls in package code:
  ‘GO.db’ ‘KEGG.db’ ‘RSQLite’ ‘graph’
  Please use :: or requireNamespace() instead.
  See section 'Suggested packages' in the 'Writing R Extensions' manual.

checking R code for possible problems ... NOTE
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

checking Rd line widths ... NOTE
Rd file 'inpIDMapper.Rd':
  \examples lines wider than 100 characters:
       YeastUPSingles = inpIDMapper(ids, "HOMSA", "SACCE", destIDType="UNIPROT", keepMultDestIDMatches = FALSE)

These lines will be truncated in the PDF manual.
```

## AnnotationHubData (1.6.0)
Maintainer: Bioconductor Package Maintainer <maintainer@bioconductor.org>

1 error  | 0 warnings | 4 notes

```
checking tests ... ERROR
  Running ‘AnnotationHubData_unit_tests.R’ [68s/144s]
Running the tests in ‘tests/AnnotationHubData_unit_tests.R’ failed.
Last 13 lines of output:
  
   
  1 Test Suite : 
  AnnotationHubData RUnit Tests - 21 test functions, 1 error, 0 failures
  ERROR in test_Grasp2Db_recipe: Error : object 'src_sql' is not exported by 'namespace:dplyr'
  
  Test files with failing tests
  
     test_recipe.R 
       test_Grasp2Db_recipe 
  
  
  Error in BiocGenerics:::testPackage("AnnotationHubData") : 
    unit tests failed for package AnnotationHubData
  Execution halted

checking DESCRIPTION meta-information ... NOTE
Package listed in more than one of Depends, Imports, Suggests, Enhances:
  ‘BiocInstaller’
A package should be listed in only one of these fields.

checking top-level files ... NOTE
Non-standard file/directory found at top level:
  ‘appveyor.yml’

checking dependencies in R code ... NOTE
'library' or 'require' call to ‘BiocInstaller’ in package code.
  Please use :: or requireNamespace() instead.
  See section 'Suggested packages' in the 'Writing R Extensions' manual.
Missing object imported by a ':::' call: ‘AnnotationHub:::.db_connection’
Unexported object imported by a ':::' call: ‘OrganismDbi:::.packageTaxIds’
  See the note in ?`:::` about the use of this operator.

checking R code for possible problems ... NOTE
.NCBIMetadataFromUrl: no visible binding for global variable ‘results’
.NCBIMetadataFromUrl: no visible binding for global variable ‘specData’
.makeComplexGR: no visible binding for global variable ‘seqname’
makeAnnotationHubMetadata : <anonymous> : <anonymous>: no visible
  binding for global variable ‘Title’
makeAnnotationHubMetadata : <anonymous> : <anonymous>: no visible
  binding for global variable ‘Description’
makeAnnotationHubMetadata : <anonymous> : <anonymous>: no visible
  binding for global variable ‘BiocVersion’
... 39 lines ...
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

## aroma.affymetrix (3.1.0)
Maintainer: Henrik Bengtsson <henrikb@braju.com>  
Bug reports: https://github.com/HenrikBengtsson/aroma.affymetrix/issues

1 error  | 0 warnings | 0 notes

```
checking tests ... ERROR
  Running ‘001.setupExampleData,annotationData.R’ [10s/10s]
  Running ‘002.setupExampleData,rawData.R’
  Running ‘AffymetrixCdfFile.R’
  Running ‘AffymetrixCelFile.R’
  Running ‘AffymetrixCelSet.R’
Running the tests in ‘tests/AffymetrixCelSet.R’ failed.
Last 13 lines of output:
  > ds <- AffymetrixCelSet()
  
   *** caught segfault ***
  address 0x100000000, cause 'memory not mapped'
  
  Traceback:
   1: GenericDataFileSet(files = files, ...)
   2: extend(GenericDataFileSet(files = files, ...), "AromaMicroarrayDataSet")
   3: AromaMicroarrayDataSet(files = files, ...)
   4: extend(AromaMicroarrayDataSet(files = files, ...), c("AffymetrixFileSet",     uses("AromaPlatformInterface")))
   5: AffymetrixFileSet(files = files, ...)
   6: extend(AffymetrixFileSet(files = files, ...), "AffymetrixCelSet",     `cached:.intensities` = NULL, `cached:.intensitiesIdxs` = NULL,     `cached:.readUnitsCache` = NULL, `cached:.getUnitIntensitiesCache` = NULL,     `cached:.averageFiles` = list(), `cached:.timestamps` = NULL,     `cached:.fileSize` = NULL)
   7: AffymetrixCelSet()
  An irrecoverable exception occurred. R is aborting now ...
  Segmentation fault (core dumped)
```

## bigrquery (0.3.0)
Maintainer: Hadley Wickham <hadley@rstudio.com>  
Bug reports: https://github.com/rstats-db/bigrquery/issues

1 error  | 0 warnings | 0 notes

```
checking whether package ‘bigrquery’ can be installed ... ERROR
Installation failed.
See ‘/home/muelleki/git/R/DBI/revdep/checks/bigrquery.Rcheck/00install.out’ for details.
```

## ChemmineR (2.28.0)
Maintainer: Thomas Girke <thomas.girke@ucr.edu>

1 error  | 0 warnings | 0 notes

```
checking whether package ‘ChemmineR’ can be installed ... ERROR
Installation failed.
See ‘/home/muelleki/git/R/DBI/revdep/checks/ChemmineR.Rcheck/00install.out’ for details.
```

## chunked (0.3)
Maintainer: Edwin de Jonge <edwindjonge@gmail.com>  
Bug reports: https://github.com/edwindj/chunked/issues

1 error  | 0 warnings | 1 note 

```
checking tests ... ERROR
  Running ‘testthat.R’
Running the tests in ‘tests/testthat.R’ failed.
Last 13 lines of output:
  1. Error: write_chunkwise to db works (@test-write.R#29) -----------------------
  'sql_render' is not an exported object from 'namespace:dplyr'
  1: write_chunkwise(iris2, tmp, row.names = FALSE) at testthat/test-write.R:29
  2: write_chunkwise.tbl_sql(iris2, tmp, row.names = FALSE)
  3: dplyr::sql_render
  4: getExportedValue(pkg, name)
  5: stop(gettextf("'%s' is not an exported object from 'namespace:%s'", name, getNamespaceName(ns)), 
         call. = FALSE, domain = NA)
  
  testthat results ================================================================
  OK: 28 SKIPPED: 0 FAILED: 1
  1. Error: write_chunkwise to db works (@test-write.R#29) 
  
  Error: testthat unit tests failed
  Execution halted

checking dependencies in R code ... NOTE
Missing or unexported object: ‘dplyr::sql_render’
```

## cn.farms (1.24.0)
Maintainer: Andreas Mitterecker <mitterecker@bioinf.jku.at>

1 error  | 0 warnings | 2 notes

```
checking examples ... ERROR
Running examples in ‘cn.farms-Ex.R’ failed
The error most likely occurred in:

> base::assign(".ptime", proc.time(), pos = "CheckExEnv")
> ### Name: plotEvalIc
> ### Title: Creates a plot with known regions and a numeric vector
> ### Aliases: plotEvalIc
> 
> ### ** Examples
> 
> load(system.file("exampleData/slData.RData", package = "cn.farms"))
> load(system.file("exampleData/testSegments.RData", package = "cn.farms"))
> plotEvalIc(slData, fData(testSegments),
+      variable = assayData(slData)$L_z[, 1], 23)
Error in loadNamespace(name) : there is no package called ‘KernSmooth’
Calls: plotEvalIc ... tryCatch -> tryCatchList -> tryCatchOne -> <Anonymous>
Execution halted

checking R code for possible problems ... NOTE
calcDistance: no visible global function definition for ‘density’
callSummarizeH01: no visible binding for global variable ‘var’
callSummarizeH01: no visible global function definition for ‘rnorm’
createAnnotation: no visible global function definition for
  ‘installed.packages’
determineBaselineArray: no visible binding for global variable ‘median’
flcSnp6Std: no visible global function definition for ‘lowess’
flcSnp6Std: no visible global function definition for ‘approx’
flcSnp6StdH01: no visible global function definition for ‘lowess’
... 102 lines ...
             "order.dendrogram", "pchisq", "rnorm", "runif", "sd", "var")
  importFrom("utils", "assignInNamespace", "getFromNamespace", "head",
             "installed.packages", "packageDescription")
to your NAMESPACE file.

Found the following assignments to the global environment:
File ‘cn.farms/R/sFclusterFunctions.R’:
  assign("var1", 99, pos = globalenv())
  assign("var2", 101, pos = globalenv())
File ‘cn.farms/R/sFsnowfall-internal.R’:
  assign(name, value, envir = globalenv())

checking compiled code ... NOTE
File ‘cn.farms/libs/cn.farms.so’:
  Found no call to: ‘R_useDynamicSymbols’

It is good practice to register native routines and to disable symbol
search.

See ‘Writing portable packages’ in the ‘Writing R Extensions’ manual.
```

## etl (0.3.5)
Maintainer: Ben Baumer <ben.baumer@gmail.com>  
Bug reports: https://github.com/beanumber/etl/issues

1 error  | 1 warning  | 0 notes

```
checking tests ... ERROR
  Running ‘testthat.R’
Running the tests in ‘tests/testthat.R’ failed.
Last 13 lines of output:
  downloaded 11 KB
  
  trying URL 'http://www.nytimes.com'
  Content type 'text/html; charset=utf-8' length 227072 bytes (221 KB)
  ==================================================
  downloaded 221 KB
  
  testthat results ================================================================
  OK: 15 SKIPPED: 0 FAILED: 3
  1. Error: sqlite works (@test-etl.R#9) 
  2. Failure: dplyr works (@test-etl.R#25) 
  3. Error: MonetDBLite works (@test-etl.R#54) 
  
  Error: testthat unit tests failed
  Execution halted

checking Rd cross-references ... WARNING
Missing link or links in documentation object 'etl.Rd':
  ‘[dplyr]{src_sql}’

See section 'Cross-references' in the 'Writing R Extensions' manual.

```

## GenomicFeatures (1.28.3)
Maintainer: Bioconductor Package Maintainer <maintainer@bioconductor.org>

0 errors | 1 warning  | 3 notes

```
checking for missing documentation entries ... WARNING
Undocumented code objects:
  ‘exonicParts’ ‘intronicParts’
All user-level objects in a package should have documentation entries.
See chapter ‘Writing R documentation files’ in the ‘Writing R
Extensions’ manual.

checking package dependencies ... NOTE
Depends: includes the non-default packages:
  ‘BiocGenerics’ ‘S4Vectors’ ‘IRanges’ ‘GenomeInfoDb’ ‘GenomicRanges’
  ‘AnnotationDbi’
Adding so many packages to the search path is excessive and importing
selectively is preferable.

checking dependencies in R code ... NOTE
Unexported objects imported by ':::' calls:
  ‘biomaRt:::martBM’ ‘biomaRt:::martDataset’ ‘biomaRt:::martHost’
  ‘rtracklayer:::resourceDescription’ ‘rtracklayer:::ucscTableOutputs’
  See the note in ?`:::` about the use of this operator.

checking R code for possible problems ... NOTE
.writeMetadataFeatureTable: no visible global function definition for
  ‘packageDescription’
.writeMetadataTable: no visible global function definition for
  ‘packageDescription’
Undefined global functions or variables:
  packageDescription
Consider adding
  importFrom("utils", "packageDescription")
to your NAMESPACE file.
```

## GOFunction (1.24.0)
Maintainer: Jing Wang <jingwang.uestc@gmail.com>

0 errors | 1 warning  | 5 notes

```
checking sizes of PDF files under ‘inst/doc’ ... WARNING
  ‘gs+qpdf’ made some significant size reductions:
     compacted ‘GOFunction.pdf’ from 679Kb to 143Kb
  consider running tools::compactPDF(gs_quality = "ebook") on these files

checking package dependencies ... NOTE
Depends: includes the non-default packages:
  ‘Biobase’ ‘graph’ ‘Rgraphviz’ ‘GO.db’ ‘AnnotationDbi’ ‘SparseM’
Adding so many packages to the search path is excessive and importing
selectively is preferable.

checking DESCRIPTION meta-information ... NOTE
Packages listed in more than one of Depends, Imports, Suggests, Enhances:
  ‘methods’ ‘Biobase’ ‘graph’ ‘Rgraphviz’ ‘GO.db’ ‘AnnotationDbi’ ‘SparseM’
A package should be listed in only one of these fields.

checking dependencies in R code ... NOTE
'library' or 'require' calls to packages already attached by Depends:
  ‘GO.db’ ‘Rgraphviz’ ‘SparseM’ ‘graph’ ‘methods’
  Please remove these calls from your code.
Packages in Depends field not imported from:
  ‘GO.db’ ‘Rgraphviz’ ‘graph’
  These packages need to be imported from (in the NAMESPACE file)
  for when this namespace is loaded but not attached.

checking R code for possible problems ... NOTE
File ‘GOFunction/R/zzz.R’:
  .onLoad calls:
    require(methods)

Package startup functions should not change the search path.
See section ‘Good practice’ in '?.onAttach'.

GOFunction: no visible global function definition for ‘nodes’
GOFunction: no visible global function definition for ‘write.csv’
... 15 lines ...
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

checking Rd line widths ... NOTE
Rd file 'GOFunction.Rd':
  \usage lines wider than 90 characters:
     GOFunction(interestGenes, refGenes, organism = "org.Hs.eg.db", ontology = "BP", fdrmethod = "BY", fdrth = 0.05, ppth =   0.05, pcth = 0 ... [TRUNCATED]
  \examples lines wider than 100 characters:
            sigTerm <- GOFunction(interestGenes, refGenes, organism = "org.Hs.eg.db", ontology= "BP", fdrmethod = "BY", 
            fdrth = 0.05, ppth = 0.05, pcth = 0.05, poth = 0.05, peth = 0.05, bmpSize = 2000, filename="sigTerm")

These lines will be truncated in the PDF manual.
```

## implyr (0.1.0)
Maintainer: Ian Cook <ian@cloudera.com>  
Bug reports: https://github.com/ianmcook/implyr/issues

1 error  | 0 warnings | 0 notes

```
checking whether package ‘implyr’ can be installed ... ERROR
Installation failed.
See ‘/home/muelleki/git/R/DBI/revdep/checks/implyr.Rcheck/00install.out’ for details.
```

## lumi (2.28.0)
Maintainer: Pan Du <dupan.mail@gmail.com>, Lei Huang <lhuang@bsd.uchicago.edu>, Gang Feng <g-feng@northwestern.edu>

0 errors | 2 warnings | 3 notes

```
checking dependencies in R code ... WARNING
'::' or ':::' imports not declared from:
  ‘IRanges’ ‘bigmemoryExtras’

checking files in ‘vignettes’ ... WARNING
Files in the 'vignettes' directory but no files in 'inst/doc':
  ‘IlluminaAnnotation.R’, ‘IlluminaAnnotation.pdf’, ‘lumi.R’,
    ‘lumi.pdf’, ‘lumi_VST_evaluation.R’, ‘lumi_VST_evaluation.pdf’,
    ‘methylationAnalysis.R’, ‘methylationAnalysis.pdf’
Package has no Sweave vignette sources and no VignetteBuilder field.

checking installed package size ... NOTE
  installed size is  6.5Mb
  sub-directories of 1Mb or more:
    R      2.6Mb
    data   3.6Mb

checking Rd line widths ... NOTE
Rd file 'IlluminaID2nuID.Rd':
  \usage lines wider than 90 characters:
     IlluminaID2nuID(IlluminaID, lib.mapping=NULL, species = c("Human", "Mouse", "Rat", "Unknown"), chipVersion = NULL, ...)

Rd file 'addAnnotationInfo.Rd':
  \usage lines wider than 90 characters:
     addAnnotationInfo(methyLumiM, lib = 'FDb.InfiniumMethylation.hg19', annotationColumn=c('COLOR_CHANNEL', 'CHROMOSOME', 'POSITION'))

Rd file 'addNuID2lumi.Rd':
... 177 lines ...
     smoothQuantileNormalization(dataMatrix, ref = NULL, adjData=NULL, logMode = TRUE, bandwidth = NULL, degree = 1, verbose = FALSE, ...)

Rd file 'ssn.Rd':
  \usage lines wider than 90 characters:
     ssn(x.lumi, targetArray = NULL, scaling = TRUE, bgMethod=c('density', 'mean', 'median', 'none'), fgMethod=c('mean', 'density', 'median' ... [TRUNCATED]

Rd file 'vst.Rd':
  \usage lines wider than 90 characters:
     vst(u, std, nSupport = min(length(u), 500), backgroundStd=NULL, fitMethod = c('linear', 'quadratic'), lowCutoff = 1/3, ifPlot = FALSE)

These lines will be truncated in the PDF manual.

checking Rd cross-references ... NOTE
Package unavailable to check Rd xrefs: ‘bigmemoryExtras’
```

## mgsa (1.24.0)
Maintainer: Sebastian Bauer <mail@sebastianbauer.info>

0 errors | 1 warning  | 5 notes

```
checking for GNU extensions in Makefiles ... WARNING
Found the following file(s) containing GNU extensions:
  src/Makevars
  src/Makevars.in
Portable Makefiles do not use GNU extensions such as +=, :=, $(shell),
$(wildcard), ifeq ... endif. See section ‘Writing portable packages’ in
the ‘Writing R Extensions’ manual.

checking top-level files ... NOTE
Non-standard files/directories found at top level:
  ‘acinclude.m4’ ‘aclocal.m4’ ‘script’

checking whether the namespace can be loaded with stated dependencies ... NOTE
Warning: no function found corresponding to methods exports from ‘mgsa’ for: ‘show’

A namespace must be able to be loaded with just the base namespace
loaded: otherwise if the namespace gets loaded by a saved object, the
session will be unable to start.

Probably some imports need to be declared in the NAMESPACE file.

checking dependencies in R code ... NOTE
'library' or 'require' call to ‘gplots’ which was already attached by Depends.
  Please remove these calls from your code.
'library' or 'require' calls in package code:
  ‘DBI’ ‘GO.db’ ‘RSQLite’
  Please use :: or requireNamespace() instead.
  See section 'Suggested packages' in the 'Writing R Extensions' manual.
Packages in Depends field not imported from:
  ‘gplots’ ‘methods’
  These packages need to be imported from (in the NAMESPACE file)
  for when this namespace is loaded but not attached.

checking R code for possible problems ... NOTE
createMgsaGoSets: no visible global function definition for ‘new’
mcmcSummary: no visible binding for global variable ‘sd’
mgsa.wrapper: no visible global function definition for ‘str’
mgsa.wrapper: no visible global function definition for ‘new’
readGAF: no visible global function definition for ‘read.delim’
readGAF: no visible global function definition for ‘na.omit’
readGAF: no visible global function definition for ‘new’
initialize,MgsaSets: no visible global function definition for
  ‘callNextMethod’
... 10 lines ...
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

checking compiled code ... NOTE
File ‘mgsa/libs/mgsa.so’:
  Found no call to: ‘R_useDynamicSymbols’

It is good practice to register native routines and to disable symbol
search.

See ‘Writing portable packages’ in the ‘Writing R Extensions’ manual.
```

## mimager (1.0.0)
Maintainer: Aaron Wolen <aaron@wolen.com>  
Bug reports: https://github.com/aaronwolen/mimager/issues

1 error  | 0 warnings | 0 notes

```
checking tests ... ERROR
  Running ‘testthat.R’ [62s/66s]
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

## MonetDBLite (0.3.1)
Maintainer: Hannes Muehleisen <hannes@cwi.nl>  
Bug reports: https://github.com/hannesmuehleisen/MonetDBLite/issues

2 errors | 0 warnings | 3 notes

```
checking examples ... ERROR
Running examples in ‘MonetDBLite-Ex.R’ failed
The error most likely occurred in:

> base::assign(".ptime", proc.time(), pos = "CheckExEnv")
> ### Name: src_monetdb
> ### Title: dplyr integration from MonetDBLite
> ### Aliases: src_monetdb src_monetdblite tbl.src_monetdb
> ###   src_desc.src_monetdb src_translate_env.src_monetdb
> ###   sample_frac.tbl_monetdb sample_n.tbl_monetdb
... 18 lines ...

The following objects are masked from ‘package:base’:

    intersect, setdiff, setequal, union

> # Connection basics ---------------------------------------------------------
> # To connect to a database first create a src:
> dbdir <- file.path(tempdir(), "dplyrdir")
> my_db <- MonetDBLite::src_monetdb(embedded=dbdir)
Error: 'src_sql' is not an exported object from 'namespace:dplyr'
Execution halted

checking tests ... ERROR
  Running ‘testthat.R’ [19s/48s]
Running the tests in ‘tests/testthat.R’ failed.
Last 13 lines of output:
  testthat results ================================================================
  OK: 132 SKIPPED: 0 FAILED: 13
  1. Error: we can connect (@test_03_dplyr.R#15) 
  2. Error: dplyr copy_to() (@test_03_dplyr.R#27) 
  3. Error: dplyr tbl( sql() ) (@test_03_dplyr.R#35) 
  4. Error: dplyr select() (@test_03_dplyr.R#43) 
  5. Error: dplyr filter() (@test_03_dplyr.R#51) 
  6. Error: dplyr arrange() (@test_03_dplyr.R#59) 
  7. Error: dplyr mutate() (@test_03_dplyr.R#67) 
  8. Error: dplyr summarise() (@test_03_dplyr.R#75) 
  9. Error: dplyr multiple objects (@test_03_dplyr.R#84) 
  1. ...
  
  Error: testthat unit tests failed
  Execution halted

checking installed package size ... NOTE
  installed size is  6.9Mb
  sub-directories of 1Mb or more:
    libs   6.6Mb

checking dependencies in R code ... NOTE
Missing or unexported objects:
  ‘dplyr::base_agg’ ‘dplyr::base_scalar’ ‘dplyr::base_win’
  ‘dplyr::build_sql’ ‘dplyr::is.ident’ ‘dplyr::sql_infix’
  ‘dplyr::sql_prefix’ ‘dplyr::sql_translator’ ‘dplyr::sql_variant’
  ‘dplyr::src_sql’ ‘dplyr::tbl_sql’

checking compiled code ... NOTE
File ‘MonetDBLite/libs/libmonetdb5.so’:
  Found no calls to: ‘R_registerRoutines’, ‘R_useDynamicSymbols’

It is good practice to register native routines and to disable symbol
search.

See ‘Writing portable packages’ in the ‘Writing R Extensions’ manual.
```

## oce (0.9-21)
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
  installed size is  5.5Mb
  sub-directories of 1Mb or more:
    help   2.1Mb
```

## oligo (1.40.1)
Maintainer: Benilton Carvalho <benilton@unicamp.br>

1 error  | 1 warning  | 9 notes

```
checking examples ... ERROR
Running examples in ‘oligo-Ex.R’ failed
The error most likely occurred in:

> base::assign(".ptime", proc.time(), pos = "CheckExEnv")
> ### Name: MAplot
> ### Title: MA plots
> ### Aliases: MAplot MAplot-methods MAplot,FeatureSet-method
> ###   MAplot,TilingFeatureSet-method MAplot,PLMset-method
> ###   MAplot,ExpressionSet-method MAplot,matrix-method
... 8 lines ...
+   groups <- factor(rep(c('brain', 'UnivRef'), each=3))
+   data.frame(sampleNames(nimbleExpressionFS), groups)
+   MAplot(nimbleExpressionFS, pairs=TRUE, ylim=c(-.5, .5), groups=groups)
+ }
Loading required package: oligoData
Loading required package: pd.hg18.60mer.expr
Loading required package: RSQLite
Loading required package: DBI
Error in loadNamespace(name) : there is no package called ‘KernSmooth’
Calls: MAplot ... tryCatch -> tryCatchList -> tryCatchOne -> <Anonymous>
Execution halted

checking files in ‘vignettes’ ... WARNING
Files in the 'vignettes' directory newer than all files in 'inst/doc':
  ‘Makefile’

checking installed package size ... NOTE
  installed size is 30.2Mb
  sub-directories of 1Mb or more:
    R         1.1Mb
    doc      12.9Mb
    scripts  15.7Mb

checking DESCRIPTION meta-information ... NOTE
Packages listed in more than one of Depends, Imports, Suggests, Enhances:
  ‘biomaRt’ ‘AnnotationDbi’ ‘GenomeGraphs’ ‘RCurl’ ‘ff’
A package should be listed in only one of these fields.

checking top-level files ... NOTE
Non-standard file/directory found at top level:
  ‘TODO.org’

checking whether the namespace can be loaded with stated dependencies ... NOTE
Warning: no function found corresponding to methods exports from ‘oligo’ for: ‘show’

A namespace must be able to be loaded with just the base namespace
loaded: otherwise if the namespace gets loaded by a saved object, the
session will be unable to start.

Probably some imports need to be declared in the NAMESPACE file.

checking dependencies in R code ... NOTE
Unexported object imported by a ':::' call: ‘Biobase:::annotatedDataFrameFromMatrix’
  See the note in ?`:::` about the use of this operator.

checking foreign function calls ... NOTE
Foreign function calls to a different package:
  .Call("ReadHeader", ..., PACKAGE = "affyio")
  .Call("read_abatch", ..., PACKAGE = "affyio")
See chapter ‘System and foreign language interfaces’ in the ‘Writing R
Extensions’ manual.

checking R code for possible problems ... NOTE
image,FeatureSet: warning in matrix(NA, nr = geom[1], nc = geom[2]):
  partial argument match of 'nr' to 'nrow'
image,FeatureSet: warning in matrix(NA, nr = geom[1], nc = geom[2]):
  partial argument match of 'nc' to 'ncol'
NUSE: no visible global function definition for ‘abline’
RLE: no visible global function definition for ‘abline’
basicMvApairsPlot: no visible binding for global variable
  ‘smoothScatter’
basicMvApairsPlot: no visible global function definition for ‘frame’
... 36 lines ...
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

checking Rd line widths ... NOTE
Rd file 'basicRMA.Rd':
  \usage lines wider than 90 characters:
     basicRMA(pmMat, pnVec, normalize = TRUE, background = TRUE, bgversion = 2, destructive = FALSE, verbose = TRUE, ...)

Rd file 'fitProbeLevelModel.Rd':
  \usage lines wider than 90 characters:
     fitProbeLevelModel(object, background=TRUE, normalize=TRUE, target="core", method="plm", verbose=TRUE, S4=TRUE, ...)

Rd file 'getProbeInfo.Rd':
  \usage lines wider than 90 characters:
     getProbeInfo(object, field, probeType = "pm", target = "core", sortBy = c("fid", "man_fsetid", "none"), ...)
  \examples lines wider than 100 characters:
        agenGene <- getProbeInfo(affyGeneFS, field=c('fid', 'fsetid', 'type'), target='probeset', subset= type == 'control->bgp->antigenomic ... [TRUNCATED]

Rd file 'preprocessTools.Rd':
  \usage lines wider than 90 characters:
     backgroundCorrect(object, method=backgroundCorrectionMethods(), copy=TRUE, extra, subset=NULL, target='core', verbose=TRUE)
     normalize(object, method=normalizationMethods(), copy=TRUE, subset=NULL,target='core', verbose=TRUE, ...)

These lines will be truncated in the PDF manual.

checking compiled code ... NOTE
File ‘oligo/libs/oligo.so’:
  Found no calls to: ‘R_registerRoutines’, ‘R_useDynamicSymbols’

It is good practice to register native routines and to disable symbol
search.

See ‘Writing portable packages’ in the ‘Writing R Extensions’ manual.
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

## PAnnBuilder (1.40.0)
Maintainer: Li Hong <sysptm@gmail.com>

0 errors | 3 warnings | 1 note 

```
checking dependencies in R code ... WARNING
'library' or 'require' call to ‘Biobase’ which was already attached by Depends.
  Please remove these calls from your code.
':::' calls which should be '::':
  ‘AnnotationDbi:::as.list’ ‘base:::get’ ‘tools:::list_files_with_type’
  See the note in ?`:::` about the use of this operator.
Unexported objects imported by ':::' calls:
  ‘AnnotationDbi:::createAnnDbBimaps’
  ‘AnnotationDbi:::prefixAnnObjNames’ ‘tools:::makeLazyLoadDB’
  See the note in ?`:::` about the use of this operator.
  Including base/recommended package(s):
  ‘tools’
There are ::: calls to the package's namespace in its code. A package
  almost never needs to use ::: for its own objects:
  ‘getShortSciName’ ‘twoStepSplit’

checking R code for possible problems ... WARNING
Found an obsolete/platform-specific call in the following function:
  ‘makeLLDB’
Found the defunct/removed function:
  ‘.saveRDS’

In addition to the above warning(s), found the following notes:

File ‘PAnnBuilder/R/zzz.R’:
  .onLoad calls:
    require(Biobase)

Package startup functions should not change the search path.
See section ‘Good practice’ in '?.onAttach'.

Found the following calls to data() loading into the global environment:
File ‘PAnnBuilder/R/writeManPage.R’:
  data("descriptionInfo")
  data("descriptionInfo")
See section ‘Good practice’ in ‘?data’.

checking re-building of vignette outputs ... WARNING
Error in re-building vignettes:
  ...
             }
     

trying URL 'http://gpcr2.biocomp.unibo.it/bacello/dataset.htm'
Content type 'text/html; charset=iso-8859-1' length 5062 bytes
==================================================
downloaded 5062 bytes
... 8 lines ...
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

checking DESCRIPTION meta-information ... NOTE
Packages listed in more than one of Depends, Imports, Suggests, Enhances:
  ‘methods’ ‘utils’ ‘Biobase’ ‘RSQLite’ ‘AnnotationDbi’
A package should be listed in only one of these fields.
```

## plethy (1.14.0)
Maintainer: Daniel Bottomly <bottomly@ohsu.edu>

2 errors | 0 warnings | 3 notes

```
checking examples ... ERROR
Running examples in ‘plethy-Ex.R’ failed
The error most likely occurred in:

> base::assign(".ptime", proc.time(), pos = "CheckExEnv")
> ### Name: Utility functions
> ### Title: Utility functions to assist with QA/QC and analysis of
> ###   plethysmography data
> ### Aliases: add.labels.by.sample get.err.breaks adjust.labels proc.sanity
> ### Keywords: Utilities
... 21 lines ...
> temp.db.file <- tempfile()
> write(sim.bux.lines, file=temp.file)
> test.bux.db <- parse.buxco(file.name=temp.file, db.name=temp.db.file, chunk.size=10000)
Processing /tmp/RtmpOzzZOO/file191622a45aeb in chunks of 10000
Starting chunk 1
Reached breakpoint change
Processing breakpoint 1
Starting sample sample_1
Error in if (sum(which.gt) > 0) { : missing value where TRUE/FALSE needed
Calls: parse.buxco ... write.sample.breaks -> write.sample.db -> sanity.check.time
Execution halted

checking tests ... ERROR
  Running ‘runTests.R’ [24s/25s]
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
    closing unused connection 3 (/tmp/RtmpLRUjJg/file19d116401b0d)
  Execution halted

checking dependencies in R code ... NOTE
There are ::: calls to the package's namespace in its code. A package
  almost never needs to use ::: for its own objects:
  ‘csv.to.table’ ‘find.break.ranges.integer’ ‘fix.time’ ‘multi.grep’

checking R code for possible problems ... NOTE
generate.sample.buxco : <anonymous> : <anonymous> : <anonymous> :
  <anonymous>: no visible global function definition for ‘rnorm’
make.db.package: no visible global function definition for
  ‘packageDescription’
mvtsplot.data.frame: no visible global function definition for ‘colors’
mvtsplot.data.frame: no visible global function definition for ‘par’
mvtsplot.data.frame: no visible global function definition for ‘layout’
mvtsplot.data.frame: no visible global function definition for
  ‘strwidth’
... 14 lines ...
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

checking Rd line widths ... NOTE
Rd file 'parsing.Rd':
  \usage lines wider than 90 characters:
     parse.buxco(file.name = NULL, table.delim = "Table", burn.in.lines = c("Measurement", "Create measurement", "Waiting for", "Site Acknow ... [TRUNCATED]
       chunk.size = 500, db.name = "bux_test.db", max.run.time.minutes = 60, overwrite = TRUE, verbose=TRUE, make.package = F, author = NULL ... [TRUNCATED]
     parse.buxco.basic(file.name=NULL, table.delim="Table", burn.in.lines=c("Measurement", "Create measurement", "Waiting for", "Site Acknow ... [TRUNCATED]

Rd file 'utilities.Rd':
  \usage lines wider than 90 characters:
     get.err.breaks(bux.db, max.exp.count=150, max.acc.count=900, vary.perc=.1, label.val="ERR")
     proc.sanity(bux.db, max.exp.time=300, max.acc.time=1800, max.exp.count=150, max.acc.count=900)
  \examples lines wider than 100 characters:
     err.dta <- data.frame(samples=samples, count=count, measure_break=measure_break, table_break=table_break, phase=phase, stringsAsFactors ... [TRUNCATED]
     sample.labels <- data.frame(samples=c("sample_1","sample_3"), response_type=c("high", "low"),stringsAsFactors=FALSE)

These lines will be truncated in the PDF manual.
```

## RImmPort (1.4.1)
Maintainer: Ravi Shankar <rshankar@stanford.edu>

0 errors | 1 warning  | 0 notes

```
checking sizes of PDF files under ‘inst/doc’ ... WARNING
  ‘gs+qpdf’ made some significant size reductions:
     compacted ‘RImmPort_Article.pdf’ from 735Kb to 339Kb
  consider running tools::compactPDF(gs_quality = "ebook") on these files
```

## RJDBC (0.2-5)
Maintainer: Simon Urbanek <Simon.Urbanek@r-project.org>

0 errors | 1 warning  | 1 note 

```
checking for missing documentation entries ... WARNING
Undocumented S4 methods:
  generic 'dbReadTable' and siglist 'JDBCConnection,ANY'
All user-level objects in a package (including S4 classes and methods)
should have documentation entries.
See chapter ‘Writing R documentation files’ in the ‘Writing R
Extensions’ manual.

checking top-level files ... NOTE
Non-standard file/directory found at top level:
  ‘java-src’
```

## rnaSeqMap (2.34.0)
Maintainer: Michal Okoniewski <michal@fgcz.ethz.ch>

0 errors | 1 warning  | 5 notes

```
checking re-building of vignette outputs ... WARNING
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


checking DESCRIPTION meta-information ... NOTE
Malformed Description field: should contain one or more complete sentences.

checking dependencies in R code ... NOTE
There are ::: calls to the package's namespace in its code. A package
  almost never needs to use ::: for its own objects:
  ‘.chr.convert’ ‘.countz’ ‘.munion’ ‘.tunion’ ‘.wytnij’ ‘getBamData’
  ‘newSeqReads’

checking R code for possible problems ... NOTE
.exonCoverage: no visible global function definition for ‘exon.details’
.fillRleList: no visible global function definition for ‘Rle’
.geneCoverage: no visible global function definition for ‘gene.details’
.munion: no visible global function definition for ‘exon.details’
.munion: no visible global function definition for ‘gene.to.exon’
.rsCount: no visible global function definition for ‘gene.details’
.simplePlot: no visible global function definition for ‘plot’
.simplePlot: no visible global function definition for ‘lines’
.tunion: no visible global function definition for ‘exon.details’
... 100 lines ...
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

checking Rd line widths ... NOTE
Rd file 'SeqReds.Rd':
  \usage lines wider than 90 characters:
     newSeqReads(chr, start, end, strand, datain=NULL, phenoData=NULL, featureData=NULL, covdesc=NULL)

Rd file 'parseGff3.Rd':
  \usage lines wider than 90 characters:
     parseGff3(filegff, fileg="genes.txt", filet="transcripts.txt", filee="exons.txt", nofiles=FALSE)

Rd file 'regionBasedCoverage.Rd':
  \examples lines wider than 100 characters:
       #runs the Lindell-Aumann algorithm at 100, 90, ... and picks maximal mi-level, where the nucleotide has a region found

These lines will be truncated in the PDF manual.

checking compiled code ... NOTE
File ‘rnaSeqMap/libs/rnaSeqMap.so’:
  Found no call to: ‘R_useDynamicSymbols’

It is good practice to register native routines and to disable symbol
search.

See ‘Writing portable packages’ in the ‘Writing R Extensions’ manual.
```

## ROracle (1.3-1)
Maintainer: Rajendra S. Pingte <rajendra.pingte@oracle.com>

1 error  | 0 warnings | 0 notes

```
checking whether package ‘ROracle’ can be installed ... ERROR
Installation failed.
See ‘/home/muelleki/git/R/DBI/revdep/checks/ROracle.Rcheck/00install.out’ for details.
```

## RPresto (1.2.1)
Maintainer: Onur Ismail Filiz <onur@fb.com>  
Bug reports: https://github.com/prestodb/RPresto/issues

1 error  | 1 warning  | 1 note 

```
checking tests ... ERROR
  Running ‘testthat.R’
Running the tests in ‘tests/testthat.R’ failed.
Last 13 lines of output:
  1: setup_mock_dplyr_connection() at testthat/test-db_query_fields.R:42
  2: src_presto(RPresto::Presto(), schema = "test", catalog = "catalog", host = "http://localhost", 
         port = 8000, user = Sys.getenv("USER"), session.timezone = test.timezone(), parameters = list())
  3: dplyr::src_sql
  4: getExportedValue(pkg, name)
  5: stop(gettextf("'%s' is not an exported object from 'namespace:%s'", name, getNamespaceName(ns)), 
         call. = FALSE, domain = NA)
  
  testthat results ================================================================
  OK: 175 SKIPPED: 33 FAILED: 2
  1. Error: db_explain works with mock (@test-db_explain.R#25) 
  2. Error: db_query_fields works with mock (@test-db_query_fields.R#42) 
  
  Error: testthat unit tests failed
  Execution halted

checking Rd cross-references ... WARNING
Missing link or links in documentation object 'dplyr_function_implementations.Rd':
  ‘[dplyr]{src_desc}’

See section 'Cross-references' in the 'Writing R Extensions' manual.


checking dependencies in R code ... NOTE
Missing or unexported objects:
  ‘dplyr::base_agg’ ‘dplyr::base_scalar’ ‘dplyr::base_win’
  ‘dplyr::build_sql’ ‘dplyr::sql_prefix’ ‘dplyr::sql_translator’
  ‘dplyr::sql_variant’ ‘dplyr::src_sql’ ‘dplyr::tbl_sql’
```

## RQDA (0.2-8)
Maintainer: HUANG Ronggui <ronggui.huang@gmail.com>

1 error  | 0 warnings | 1 note 

```
checking whether package ‘RQDA’ can be installed ... ERROR
Installation failed.
See ‘/home/muelleki/git/R/DBI/revdep/checks/RQDA.Rcheck/00install.out’ for details.

checking package dependencies ... NOTE
Package which this enhances but not available for checking: ‘rjpod’
```

## seqplots (1.13.0)
Maintainer: Przemyslaw Stempor <ps562@cam.ac.uk>  
Bug reports: http://github.com/przemol/seqplots/issues

2 errors | 0 warnings | 3 notes

```
checking examples ... ERROR
Running examples in ‘seqplots-Ex.R’ failed
The error most likely occurred in:

> base::assign(".ptime", proc.time(), pos = "CheckExEnv")
> ### Name: plotAverage
> ### Title: Create the average plot
> ### Aliases: plotAverage plotAverage,PlotSetArray-method
> ###   plotAverage,PlotSetList-method plotAverage,PlotSetPair-method
> ###   plotAverage,list-method
... 24 lines ...
+     load(system.file("extdata", "precalc_plotset.Rdata", package="seqplots"))
+ }
character
Processing: Transcripts_ce10_chrI_100Kb.bed @ GSM1208360_chrI_100Kb_q5_sample.bw [ 1 / 2 ]
Error in scan(file = file, what = what, sep = sep, quote = quote, dec = dec,  : 
  invalid connection
Calls: getPlotSetArray ... .supportedSeqnameMappings -> lapply -> lapply -> FUN -> scan
Error in close.connection(file) : invalid connection
Calls: getPlotSetArray ... lapply -> lapply -> FUN -> close -> close.connection
Execution halted
** found \donttest examples: check also with --run-donttest

checking tests ... ERROR
  Running ‘test-all.R’ [25s/28s]
Running the tests in ‘tests/test-all.R’ failed.
Last 13 lines of output:
  Error in signalCondition(e) : 
    no function to return from, jumping to top level
  Calls: <Anonymous> ... close.connection -> .handleSimpleError -> h -> signalCondition
  testthat results ================================================================
  OK: 63 SKIPPED: 0 FAILED: 7
  1. Error: Test getPlotSetArray function and plotting interfaces (@test1.R#21) 
  2. Error: Test getPlotSetArray function and plotting interfaces (@test1.R#21) 
  3. Error: Test getPlotSetArray function and plotting interfaces (@test1.R#53) 
  4. Error: Test motifs (@test1.R#106) 
  5. Error: Test motifs (@test1.R#106) 
  6. Error: Test motifs (@test1.R#137) 
  7. Error: Test motifs (@test1.R#137) 
  
  Error: testthat unit tests failed
  Execution halted

checking installed package size ... NOTE
  installed size is  9.0Mb
  sub-directories of 1Mb or more:
    R          1.1Mb
    doc        2.4Mb
    seqplots   4.9Mb

checking foreign function calls ... NOTE
Foreign function call to a different package:
  .Call("BWGFile_summary", ..., PACKAGE = "rtracklayer")
See chapter ‘System and foreign language interfaces’ in the ‘Writing R
Extensions’ manual.

checking R code for possible problems ... NOTE
getPlotSetArray : <anonymous>: no visible global function definition
  for ‘qt’
getSF : <anonymous>: no visible global function definition for ‘approx’
ggHeatmapPlotWrapper: no visible global function definition for
  ‘colorRampPalette’
ggHeatmapPlotWrapper: no visible binding for global variable ‘Var2’
ggHeatmapPlotWrapper: no visible binding for global variable ‘Var1’
ggHeatmapPlotWrapper: no visible binding for global variable ‘value’
heatmapPlotWrapper: no visible global function definition for
... 42 lines ...
  capture.output colorRampPalette cutree dist hclust image kmeans
  layout lines mtext par plot.new qt rainbow rect rgb title value
Consider adding
  importFrom("grDevices", "adjustcolor", "colorRampPalette", "rainbow",
             "rgb")
  importFrom("graphics", "abline", "axis", "box", "image", "layout",
             "lines", "mtext", "par", "plot.new", "rect", "title")
  importFrom("stats", "approx", "as.dendrogram", "cutree", "dist",
             "hclust", "kmeans", "qt")
  importFrom("utils", "capture.output")
to your NAMESPACE file.
```

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

## taxizedb (0.1.0)
Maintainer: Scott Chamberlain <myrmecocystus+r@gmail.com>  
Bug reports: https://github.com/ropensci/taxizedb/issues

1 error  | 0 warnings | 0 notes

```
checking tests ... ERROR
  Running ‘test-all.R’
Running the tests in ‘tests/test-all.R’ failed.
Complete output:
  > library(testthat)
  > test_check("taxizedb")
  Loading required package: taxizedb
  1. Failure: sql_collect works (@test-sql_collect.R#9) --------------------------
  `src` inherits from `src_dbi/src_sql/src` not `src_sqlite`.
  
  
  testthat results ================================================================
  OK: 34 SKIPPED: 4 FAILED: 1
  1. Failure: sql_collect works (@test-sql_collect.R#9) 
  
  Error: testthat unit tests failed
  Execution halted
```

## TSdata (2016.8-1)
Maintainer: Paul Gilbert <pgilbert.ttv9z@ncf.ca>

0 errors | 1 warning  | 0 notes

```
checking re-building of vignette outputs ... WARNING
Error in re-building vignettes:
  ...
INFO: Contacting web service with query: https://stats.oecd.org/restsdmx/sdmx.ashx/GetData/QNA/CAN+USA+MEX.B1_GE.CARSA.Q?format=compact_v2
Jun 17, 2017 10:26:42 PM it.bancaditalia.oss.sdmx.client.RestSdmxClient runQuery
INFO: Contacting web service with query: http://ec.europa.eu/eurostat/SDMX/diss-web/rest/dataflow/ESTAT/ei_nama_q/latest
Jun 17, 2017 10:26:42 PM it.bancaditalia.oss.sdmx.client.RestSdmxClient runQuery
INFO: Contacting web service with query: http://ec.europa.eu/eurostat/SDMX/diss-web/rest/dataflow/ESTAT/ei_nama_q/latest
Jun 17, 2017 10:26:42 PM it.bancaditalia.oss.sdmx.client.RestSdmxClient runQuery
INFO: Contacting web service with query: http://ec.europa.eu/eurostat/SDMX/diss-web/rest/datastructure/ESTAT/DSD_ei_nama_q/1.0
... 8 lines ...
INFO: The sdmx call returned messages in the footer:
 Message [code=400, severity=Error, url=null, text=[Error caused by the caller due to incorrect or semantically invalid arguments]]
Jun 17, 2017 10:26:43 PM it.bancaditalia.oss.sdmx.client.RestSdmxClient getData
INFO: The sdmx call returned messages in the footer:
 Message [code=400, severity=Error, url=null, text=[Error caused by the caller due to incorrect or semantically invalid arguments]]

Error: processing vignette 'Guide.Stex' failed with diagnostics:
 chunk 5 
Error in .local(serIDs, con, ...) : 
  ei_nama_q.Q.MIO-EUR.NSA.CP.NA-P72.IT error: it.bancaditalia.oss.sdmx.exceptions.SdmxXmlContentException: The query: ei_nama_q.Q.MIO-EUR.NSA.CP.NA-P72.IT did not match any time series on the provider.
Execution halted
```

## VariantFiltering (1.12.1)
Maintainer: Robert Castelo <robert.castelo@upf.edu>  
Bug reports: https://github.com/rcastelo/VariantFiltering/issues

0 errors | 1 warning  | 4 notes

```
checking sizes of PDF files under ‘inst/doc’ ... WARNING
  ‘gs+qpdf’ made some significant size reductions:
     compacted ‘usingVariantFiltering.pdf’ from 415Kb to 154Kb
  consider running tools::compactPDF(gs_quality = "ebook") on these files

checking installed package size ... NOTE
  installed size is  8.0Mb
  sub-directories of 1Mb or more:
    R         3.7Mb
    extdata   3.5Mb

checking dependencies in R code ... NOTE
Unexported objects imported by ':::' calls:
  'S4Vectors:::labeledLine' 'VariantAnnotation:::.checkArgs'
  'VariantAnnotation:::.consolidateHits'
  'VariantAnnotation:::.returnEmpty'
  See the note in ?`:::` about the use of this operator.
There are ::: calls to the package's namespace in its code. A package
  almost never needs to use ::: for its own objects:
  '.adjustForStrandSense'

checking Rd line widths ... NOTE
Rd file 'MafDb-class.Rd':
  \examples lines wider than 100 characters:
       ## founder mutation in a regulatory element located within the HERC2 gene inhibiting OCA2 expression.

Rd file 'MafDb2-class.Rd':
  \examples lines wider than 100 characters:
       ## founder mutation in a regulatory element located within the HERC2 gene inhibiting OCA2 expression.

Rd file 'VariantFilteringParam-class.Rd':
... 19 lines ...

Rd file 'autosomalRecessiveHeterozygous.Rd':
  \usage lines wider than 90 characters:
                                                                      BPPARAM=bpparam("SerialParam"))

Rd file 'autosomalRecessiveHomozygous.Rd':
  \usage lines wider than 90 characters:
                                                                    use=c("everything", "complete.obs", "all.obs"),
                                                                    BPPARAM=bpparam("SerialParam"))

These lines will be truncated in the PDF manual.

checking compiled code ... NOTE
File ‘VariantFiltering/libs/VariantFiltering.so’:
  Found no call to: ‘R_useDynamicSymbols’

It is good practice to register native routines and to disable symbol
search.

See ‘Writing portable packages’ in the ‘Writing R Extensions’ manual.
```

## vmsbase (2.1.3)
Maintainer: Lorenzo D'Andrea <support@vmsbase.org>

1 error  | 0 warnings | 0 notes

```
checking whether package ‘vmsbase’ can be installed ... ERROR
Installation failed.
See ‘/home/muelleki/git/R/DBI/revdep/checks/vmsbase.Rcheck/00install.out’ for details.
```

