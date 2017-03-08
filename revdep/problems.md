# Setup

## Platform

|setting  |value                        |
|:--------|:----------------------------|
|version  |R version 3.3.3 (2017-03-06) |
|system   |x86_64, linux-gnu            |
|ui       |X11                          |
|language |(EN)                         |
|collate  |en_US.UTF-8                  |
|tz       |Zulu                         |
|date     |2017-03-08                   |

## Packages

|package   |*  |version    |date       |source                           |
|:---------|:--|:----------|:----------|:--------------------------------|
|covr      |   |2.2.2      |2017-01-05 |cran (@2.2.2)                    |
|DBI       |   |0.5-22     |2017-03-08 |Github (rstats-db/DBI@b0ee46a)   |
|hms       |   |0.3        |2016-11-22 |cran (@0.3)                      |
|knitr     |   |1.15.1     |2016-11-22 |cran (@1.15.1)                   |
|magrittr  |   |1.5        |2014-11-22 |CRAN (R 3.3.1)                   |
|rmarkdown |   |1.3        |2016-12-21 |cran (@1.3)                      |
|rprojroot |   |1.2        |2017-01-16 |cran (@1.2)                      |
|RSQLite   |   |1.1-2      |2017-01-08 |cran (@1.1-2)                    |
|testthat  |   |1.0.2.9000 |2017-02-27 |Github (hadley/testthat@b72a228) |
|xml2      |   |1.1.1      |2017-01-24 |cran (@1.1.1)                    |

# Check results

40 packages with problems

|package           |version   | errors| warnings| notes|
|:-----------------|:---------|------:|--------:|-----:|
|annmap            |1.16.0    |      0|        2|     5|
|AnnotationDbi     |1.36.2    |      0|        1|     5|
|AnnotationHubData |1.4.1     |      1|        0|     3|
|ChemmineR         |2.26.1    |      1|        0|     0|
|ChIPpeakAnno      |3.8.9     |      2|        1|     2|
|cn.farms          |1.22.0    |      1|        0|     1|
|convey            |0.1.0     |      1|        0|     0|
|DECIPHER          |2.2.0     |      1|        1|     3|
|eiR               |1.14.1    |      1|        2|     6|
|ensembldb         |1.6.2     |      2|        1|     2|
|GenomicFeatures   |1.26.3    |      2|        1|     2|
|Genominator       |1.28.0    |      1|        1|     4|
|GenVisR           |1.4.1     |      1|        0|     0|
|GOFunction        |1.22.0    |      0|        1|     5|
|GWASTools         |1.20.0    |      2|        0|     1|
|lumi              |2.26.4    |      0|        1|     3|
|mgsa              |1.22.0    |      0|        1|     4|
|oce               |0.9-20    |      1|        0|     1|
|oligo             |1.38.0    |      1|        0|     9|
|ora               |2.0-1     |      1|        0|     0|
|PAnnBuilder       |1.38.0    |      0|        3|     1|
|plethy            |1.12.1    |      2|        0|     3|
|poplite           |0.99.17.3 |      0|        1|     0|
|postGIStools      |0.2.1     |      1|        0|     0|
|RImmPort          |1.2.0     |      0|        1|     1|
|RJDBC             |0.2-5     |      0|        1|     1|
|rnaSeqMap         |2.32.0    |      0|        1|     4|
|ROracle           |1.3-1     |      1|        0|     0|
|RQDA              |0.2-8     |      1|        0|     1|
|RSQLite           |1.1-2     |      1|        0|     1|
|rTRM              |1.12.0    |      0|        1|     1|
|seqplots          |1.12.0    |      2|        0|     3|
|sf                |0.3-4     |      1|        0|     1|
|sparklyr          |0.5.2     |      1|        0|     0|
|specL             |1.8.0     |      0|        1|     3|
|sqldf             |0.4-10    |      0|        1|     2|
|TSdata            |2016.8-1  |      0|        1|     0|
|VariantAnnotation |1.20.2    |      2|        2|     3|
|VariantFiltering  |1.10.1    |      2|        2|     4|
|vmsbase           |2.1.3     |      1|        0|     0|

## annmap (1.16.0)
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

## AnnotationDbi (1.36.2)
Maintainer: Bioconductor Package Maintainer <maintainer@bioconductor.org>

0 errors | 1 warning  | 5 notes

```
checking for unstated dependencies in ‘tests’ ... WARNING
'library' or 'require' call not declared from: ‘org.testing.db’

checking installed package size ... NOTE
  installed size is  8.6Mb
  sub-directories of 1Mb or more:
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

## AnnotationHubData (1.4.1)
Maintainer: Bioconductor Package Maintainer <maintainer@bioconductor.org>

1 error  | 0 warnings | 3 notes

```
checking tests ... ERROR
  Running ‘AnnotationHubData_unit_tests.R’ [98s/180s]
Running the tests in ‘tests/AnnotationHubData_unit_tests.R’ failed.
Last 13 lines of output:
  1 Test Suite : 
  AnnotationHubData RUnit Tests - 21 test functions, 1 error, 0 failures
  ERROR in test_dbSNPVCFPreparer_recipe: Error in curl::curl(ul, "r") : Timeout was reached
  
  Test files with failing tests
  
     test_recipe.R 
       test_dbSNPVCFPreparer_recipe 
  
  
  Error in BiocGenerics:::testPackage("AnnotationHubData") : 
    unit tests failed for package AnnotationHubData
  In addition: Warning message:
  closing unused connection 3 (ftp://ftp.ncbi.nlm.nih.gov/pub/clinvar/vcf_GRCh37/archive/2016/) 
  Execution halted

checking top-level files ... NOTE
Non-standard file/directory found at top level:
  ‘appveyor.yml’

checking dependencies in R code ... NOTE
Missing object imported by a ':::' call: ‘AnnotationHub:::.db_connection’
Unexported object imported by a ':::' call: ‘OrganismDbi:::.packageTaxIds’
  See the note in ?`:::` about the use of this operator.

checking R code for possible problems ... NOTE
.NCBIMetadataFromUrl: no visible binding for global variable ‘results’
.NCBIMetadataFromUrl: no visible binding for global variable ‘specData’
.makeComplexGR: no visible binding for global variable ‘seqname’
jsonPath: no visible binding for global variable ‘SourceFile’
jsonPath: no visible binding for global variable ‘HubRoot’
makeAnnotationHubMetadata : <anonymous>: no visible binding for global
  variable ‘Title’
makeAnnotationHubMetadata : <anonymous>: no visible binding for global
  variable ‘Description’
... 52 lines ...
  SourceFile SourceType SourceUrl SourceVersion Species TaxonomyId
  Title ahroot bucket checkTrue read.csv results seqname specData
  suppresWarnings
Consider adding
  importFrom("utils", "read.csv")
to your NAMESPACE file.

Found the following calls to data() loading into the global environment:
File ‘AnnotationHubData/R/makeNCBIToOrgDbs.R’:
  data(specData, package = "GenomeInfoDb")
See section ‘Good practice’ in ‘?data’.
```

## ChemmineR (2.26.1)
Maintainer: Thomas Girke <thomas.girke@ucr.edu>

1 error  | 0 warnings | 0 notes

```
checking whether package ‘ChemmineR’ can be installed ... ERROR
Installation failed.
See ‘/home/muelleki/git/R/DBI/revdep/checks/ChemmineR.Rcheck/00install.out’ for details.
```

## ChIPpeakAnno (3.8.9)
Maintainer: Lihua Julie Zhu <julie.zhu@umassmed.edu>,
 Jianhong Ou <Jianhong.ou@umassmed.edu>

2 errors | 1 warning  | 2 notes

```
checking examples ... ERROR
Running examples in ‘ChIPpeakAnno-Ex.R’ failed
The error most likely occurred in:

> base::assign(".ptime", proc.time(), pos = "CheckExEnv")
> ### Name: addMetadata
> ### Title: Add metadata of the GRanges objects used for findOverlapsOfPeaks
> ### Aliases: addMetadata
> ### Keywords: misc
> 
... 9 lines ...
> peaks2 <- GRanges(seqnames=c(6,6,6,6,5),
+                   IRanges(start=c(1549800,1554400,1565000,1569400,167888600),
+                           end=c(1550599,1560799,1565399,1571199,167888999),
+                           names=c("f1","f2","f3","f4","f5")),
+                   strand="+",
+                   score=6:10, id=LETTERS[1:5])
> ol <- findOverlapsOfPeaks(peaks1, peaks2)
Error in c(<S4 object of class "GRanges">, <S4 object of class "GRanges">) : 
  could not find symbol "recursive" in environment of the generic function
Calls: findOverlapsOfPeaks -> vennCounts -> unlist -> GRangesList
Execution halted

checking tests ... ERROR
  Running ‘runTests.R’ [50s/49s]
Running the tests in ‘tests/runTests.R’ failed.
Last 13 lines of output:
  testthat results ================================================================
  OK: 56 SKIPPED: 3 FAILED: 10
  1.  Error: annotatePeakInBatch works not correct (@test_annotatePeakInBatch.R#42) 
  2.  Error: assignChromosomeRegion works not correct (@test_assignChromosomeRegion.R#8) 
  3.  Error: binOverFeature works not correct (@test_binOverFeature.R#34) 
  4.  Error: featureAligend works not correct (@test_feature.R#3) 
  5.  Error: findEnhancers works not correct (@test_findEnhancers.R#3) 
  6.  Error: findOverlapsOfPeaks works not correct (@test_findOverlapsOfPeaks.R#13) 
  7.  Error: getAllPeakSequence works not correct (@test_getAllPeakSequence.R#7) 
  8.  Error: getVennCounts works not correct (@test_getVennCounts.R#15) 
  9.  Error: makeVennDiagram works not correct (@test_makeVennDiagram.R#16) 
  10. Error: toGRanges works not correct (@test_toGRanges.R#48) 
  
  Error: testthat unit tests failed
  Execution halted

checking re-building of vignette outputs ... WARNING
Error in re-building vignettes:
  ...
Warning in engine$weave(file, quiet = quiet, encoding = enc) :
  Pandoc (>= 1.12.3) and/or pandoc-citeproc not available. Falling back to R Markdown v1.
Quitting from lines 2-25 (ChIPpeakAnno.Rmd) 
Error: processing vignette 'ChIPpeakAnno.Rmd' failed with diagnostics:
could not find function "doc_date"
Execution halted


checking package dependencies ... NOTE
Depends: includes the non-default packages:
  ‘grid’ ‘IRanges’ ‘Biostrings’ ‘GenomicRanges’ ‘S4Vectors’
  ‘VennDiagram’
Adding so many packages to the search path is excessive and importing
selectively is preferable.

checking installed package size ... NOTE
  installed size is 20.8Mb
  sub-directories of 1Mb or more:
    R         1.6Mb
    data     12.7Mb
    extdata   5.2Mb
```

## cn.farms (1.22.0)
Maintainer: Andreas Mitterecker <mitterecker@bioinf.jku.at>

1 error  | 0 warnings | 1 note 

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
```

## convey (0.1.0)
Maintainer: Djalma Pessoa <pessoad@gmail.com>  
Bug reports: https://github.com/djalmapessoa/convey/issues

1 error  | 0 warnings | 0 notes

```
checking tests ... ERROR
  Running ‘testthat.R’ [111s/112s]
Running the tests in ‘tests/testthat.R’ failed.
Last 13 lines of output:
  
  testthat results ================================================================
  OK: 273 SKIPPED: 0 FAILED: 9
  1. Failure: compare results convey vs vardpoor (@test-svyarpr.R#46) 
  2. Failure: compare results convey vs vardpoor (@test-svyarpr.R#48) 
  3. Failure: compare results convey vs vardpoor (@test-svyarpt.R#43) 
  4. Failure: compare results convey vs vardpoor (@test-svyarpt.R#45) 
  5. Failure: compare results convey vs vardpoor (@test-svypoormed.R#44) 
  6. Failure: compare results convey vs vardpoor (@test-svypoormed.R#46) 
  7. Failure: compare results convey vs vardpoor (@test-svyqsr.R#45) 
  8. Failure: compare results convey vs vardpoor (@test-svyrmpg.R#48) 
  9. Failure: compare results convey vs vardpoor (@test-svyrmpg.R#50) 
  
  Error: testthat unit tests failed
  Execution halted
```

## DECIPHER (2.2.0)
Maintainer: Erik Wright <DECIPHER@cae.wisc.edu>

1 error  | 1 warning  | 3 notes

```
checking examples ... ERROR
Running examples in ‘DECIPHER-Ex.R’ failed
The error most likely occurred in:

> base::assign(".ptime", proc.time(), pos = "CheckExEnv")
> ### Name: AdjustAlignment
> ### Title: Improve An Existing Alignment By Adjusting Gap Placements
> ### Aliases: AdjustAlignment
> 
> ### ** Examples
... 13 lines ...
[2]     5 ARRPK
> 
> # a real example
> fas <- system.file("extdata", "Streptomyces_ITS_aligned.fas", package="DECIPHER")
> dna <- readDNAStringSet(fas)
> adjustedDNA <- AdjustAlignment(dna)
> BrowseSeqs(adjustedDNA, highlight=1)
Error in c(myXStringSet, ConsensusSequence(myXStringSet, ...)) : 
  could not find symbol "recursive" in environment of the generic function
Calls: BrowseSeqs -> c
Execution halted

checking re-building of vignette outputs ... WARNING
Error in re-building vignettes:
  ...
    Filter, Find, Map, Position, Reduce, anyDuplicated, append,
    as.data.frame, cbind, colnames, do.call, duplicated, eval, evalq,
    get, grep, grepl, intersect, is.unsorted, lapply, lengths, mapply,
    match, mget, order, paste, pmax, pmax.int, pmin, pmin.int, rank,
    rbind, rownames, sapply, setdiff, sort, table, tapply, union,
    unique, unsplit, which, which.max, which.min

... 8 lines ...
    colMeans, colSums, expand.grid, rowMeans, rowSums

Loading required package: IRanges
Loading required package: XVector
Loading required package: RSQLite

Error: processing vignette 'ArtOfAlignmentInR.Rnw' failed with diagnostics:
 chunk 2 (label = expr0) 
Error in .Primitive("c")(<S4 object of class structure("IRanges", package = "IRanges")>) : 
  could not find symbol "recursive" in environment of the generic function
Execution halted

checking installed package size ... NOTE
  installed size is  9.1Mb
  sub-directories of 1Mb or more:
    data      2.5Mb
    doc       3.8Mb
    extdata   1.4Mb

checking foreign function calls ... NOTE
Registration problems:
  symbol ‘functionCall’ in the local frame:
   .Call(functionCall, myXStringSet, as.numeric(subMatrix), gapOpening, 
       gapExtension, gapLetter, shiftPenalty, threshold, weight, 
       PACKAGE = "DECIPHER")
  symbol ‘consensusProfile’ in the local frame:
   .Call(consensusProfile, pattern, p.weight, NULL, PACKAGE = "DECIPHER")
  symbol ‘consensusProfile’ in the local frame:
   .Call(consensusProfile, subject, s.weight, NULL, PACKAGE = "DECIPHER")
... 11 lines ...
       structureMatrix)
  Evaluating ‘compression[1]’ during check gives error
‘object 'compression' not found’:
   .Call(compression[1], x, 2L - length(compression), compressRepeats, 
       processors, PACKAGE = "DECIPHER")
  Evaluating ‘compression[1]’ during check gives error
‘object 'compression' not found’:
   .Call(compression[1], x, 2L - length(compression), processors, 
       PACKAGE = "DECIPHER")
See chapter ‘System and foreign language interfaces’ in the ‘Writing R
Extensions’ manual.

checking R code for possible problems ... NOTE
DesignSignatures: no visible binding for global variable ‘deltaHrules’
Undefined global functions or variables:
  deltaHrules
```

## eiR (1.14.1)
Maintainer: Thomas Girke <thomas.girke@ucr.edu>

1 error  | 2 warnings | 6 notes

```
checking tests ... ERROR
  Running ‘runTests.R’
Running the tests in ‘tests/runTests.R’ failed.
Last 13 lines of output:
  
   
  1 Test Suite : 
  eiR RUnit Tests - 1 test function, 1 error, 0 failures
  ERROR in /tmp/Rtmp8WgxMz/RLIBS_38b7379feeea/eiR/unitTests/test_main.R: Error while sourcing  /tmp/Rtmp8WgxMz/RLIBS_38b7379feeea/eiR/unitTests/test_main.R : Error : (converted from warning) Closing open result set, pending rows
  
  Test files with failing tests
  
     test_main.R 
       /tmp/Rtmp8WgxMz/RLIBS_38b7379feeea/eiR/unitTests/test_main.R 
  
  
  Error in BiocGenerics:::testPackage("eiR") : 
    unit tests failed for package eiR
  Execution halted

checking for GNU extensions in Makefiles ... WARNING
Found the following file(s) containing GNU extensions:
  src/Makevars
Portable Makefiles do not use GNU extensions such as +=, :=, $(shell),
$(wildcard), ifeq ... endif. See section ‘Writing portable packages’ in
the ‘Writing R Extensions’ manual.

checking re-building of vignette outputs ... WARNING
Error in re-building vignettes:
  ...
Warning in engine$weave(file, quiet = quiet, encoding = enc) :
  Pandoc (>= 1.12.3) and/or pandoc-citeproc not available. Falling back to R Markdown v1.
Quitting from lines 2-33 (eiR.Rmd) 
Error: processing vignette 'eiR.Rmd' failed with diagnostics:
could not find function "pkg_ver"
Execution halted


checking for hidden files and directories ... NOTE
Found the following hidden files and directories:
  .BBSoptions
These were most likely included in error. See section ‘Package
structure’ in the ‘Writing R Extensions’ manual.

checking DESCRIPTION meta-information ... NOTE
Packages listed in more than one of Depends, Imports, Suggests, Enhances:
  ‘methods’ ‘ChemmineR’ ‘RCurl’ ‘snow’
A package should be listed in only one of these fields.

checking top-level files ... NOTE
File
  LICENSE
is not mentioned in the DESCRIPTION file.
Non-standard file/directory found at top level:
  ‘tmp’

checking R code for possible problems ... NOTE
IddbVsIddbDist : process : <anonymous> : <anonymous>: no visible global
  function definition for ‘read.table’
checkEmbedding : embedJob: no visible global function definition for
  ‘head’
checkEmbedding: no visible global function definition for ‘head’
eiMakeDb: no visible global function definition for ‘str’
eiMakeDb: no visible global function definition for ‘read.table’
eiMakeDb: no visible global function definition for ‘cmdscale’
eiMakeDb: no visible global function definition for ‘write.table’
... 17 lines ...
toFile : writePart: no visible global function definition for
  ‘write.table’
writeIddbFile: no visible global function definition for ‘write.table’
Undefined global functions or variables:
  aggregate cmdscale head postgresqlWriteTable read.table str write.csv
  write.table
Consider adding
  importFrom("stats", "aggregate", "cmdscale")
  importFrom("utils", "head", "read.table", "str", "write.csv",
             "write.table")
to your NAMESPACE file.

checking Rd line widths ... NOTE
Rd file 'addTransform.Rd':
  \examples lines wider than 100 characters:
                     stop(paste("unknown type for 'input', or filename does not exist. type found:",class(input)))

Rd file 'eiCluster.Rd':
  \usage lines wider than 90 characters:
                                                              distance=getDefaultDist(descriptorType),
                                                              conn=defaultConn(dir), W = 1.39564, M=19,L=10,T=30,type="cluster",linkage="sin ... [TRUNCATED]

Rd file 'eiInit.Rd':
  \usage lines wider than 90 characters:
             conn=defaultConn(dir,create=TRUE), updateByName = FALSE, cl = NULL, connSource = NULL)

These lines will be truncated in the PDF manual.

checking compiled code ... NOTE
File ‘eiR/libs/eiR.so’:
  Found ‘_ZSt4cerr’, possibly from ‘std::cerr’ (C++)
    Objects: ‘apost.o’, ‘format.o’, ‘recordfile.o’, ‘scan.o’
  Found ‘_ZSt4cout’, possibly from ‘std::cout’ (C++)
    Objects: ‘apost.o’, ‘format.o’, ‘profiling.o’

Compiled code should not call entry points which might terminate R nor
write to stdout/stderr instead of to the console, nor the system RNG.

See ‘Writing portable packages’ in the ‘Writing R Extensions’ manual.
```

## ensembldb (1.6.2)
Maintainer: Johannes Rainer <johannes.rainer@eurac.edu>  
Bug reports: https://github.com/jotsetung/ensembldb/issues

2 errors | 1 warning  | 2 notes

```
checking examples ... ERROR
Running examples in ‘ensembldb-Ex.R’ failed
The error most likely occurred in:

> base::assign(".ptime", proc.time(), pos = "CheckExEnv")
> ### Name: seqlevelsStyle
> ### Title: Support for other than Ensembl seqlevel style
> ### Aliases: seqlevelsStyle seqlevelsStyle,EnsDb-method seqlevelsStyle<-
> ###   seqlevelsStyle<-,EnsDb-method supportedSeqlevelsStyles
> ###   supportedSeqlevelsStyles,EnsDb-method
... 358 lines ...
[1] "GRCh37"
> ## Although differently named, both represent genome build GRCh37.
> 
> ## Extract the full transcript sequences of all lincRNAs encoded on chromsome Y.
> yTxSeqs <- extractTranscriptSeqs(bsg, exonsBy(edb, "tx",
+                                               filter=list(SeqnameFilter("chrY"),
+                                                           GenebiotypeFilter("lincRNA"))))
Error in .Primitive("c")(<S4 object of class "DNAStringSet">) : 
  could not find symbol "recursive" in environment of the generic function
Calls: extractTranscriptSeqs ... unsplit_list_of_XVectorList -> do.call -> do.call -> <Anonymous>
Execution halted

checking tests ... ERROR
  Running ‘runTests.R’ [97s/95s]
Running the tests in ‘tests/runTests.R’ failed.
Last 13 lines of output:
  1 Test Suite : 
  ensembldb RUnit Tests - 76 test functions, 1 error, 0 failures
  ERROR in test_extractTranscriptSeqs_with_BSGenome: Error in .Primitive("c")(<S4 object of class structure("DNAStringSet", package = "Biostrings")>) : 
    could not find symbol "recursive" in environment of the generic function
  
  Test files with failing tests
  
     test_get_sequence.R 
       test_extractTranscriptSeqs_with_BSGenome 
  
  
  Error in BiocGenerics:::testPackage("ensembldb") : 
    unit tests failed for package ensembldb
  In addition: There were 29 warnings (use warnings() to see them)
  Execution halted

checking re-building of vignette outputs ... WARNING
Error in re-building vignettes:
  ...
The following objects are masked from 'package:base':

    colMeans, colSums, expand.grid, rowMeans, rowSums

Loading required package: IRanges
Loading required package: GenomeInfoDb
Loading required package: GenomicFeatures
... 8 lines ...

Loading required package: BSgenome
Loading required package: Biostrings
Loading required package: XVector
Loading required package: rtracklayer
Warning in .formatSeqnameByStyleFromQuery(x, sn, ifNotFound) :
  More than 5 seqnames with seqlevels style of the database (Ensembl) could not be mapped to the seqlevels style: UCSC!) Returning the orginal seqnames for these.
Quitting from lines 487-504 (ensembldb.Rmd) 
Error: processing vignette 'ensembldb.Rmd' failed with diagnostics:
could not find symbol "recursive" in environment of the generic function
Execution halted

checking dependencies in R code ... NOTE
Unexported objects imported by ':::' calls:
  'GenomicFeatures:::fetchChromLengthsFromEnsembl'
  'GenomicFeatures:::fetchChromLengthsFromEnsemblPlants'
  See the note in ?`:::` about the use of this operator.

checking Rd line widths ... NOTE
Rd file 'EnsDb.Rd':
  \examples lines wider than 100 characters:
     dbcon <- dbConnect(MySQL(), user = my_user, pass = my_pass, host = my_host, dbname = "ensdb_hsapiens_v75")

These lines will be truncated in the PDF manual.
```

## GenomicFeatures (1.26.3)
Maintainer: Bioconductor Package Maintainer <maintainer@bioconductor.org>

2 errors | 1 warning  | 2 notes

```
checking examples ... ERROR
Running examples in ‘GenomicFeatures-Ex.R’ failed
The error most likely occurred in:

> base::assign(".ptime", proc.time(), pos = "CheckExEnv")
> ### Name: as-format-methods
> ### Title: Coerce to file format structures
> ### Aliases: asBED,TxDb-method asGFF,TxDb-method
> 
> ### ** Examples
> 
>   txdb_file <- system.file("extdata", "hg19_knownGene_sample.sqlite",
+                            package="GenomicFeatures")
>   txdb <- loadDb(txdb_file)
> 
>   asBED(txdb)
Error in .Primitive("c")(<S4 object of class "GRanges">) : 
  could not find symbol "recursive" in environment of the generic function
Calls: asBED ... range -> .local -> do.call -> do.call -> <Anonymous>
Execution halted

checking tests ... ERROR
  Running ‘run_unitTests.R’ [110s/110s]
Running the tests in ‘tests/run_unitTests.R’ failed.
Last 13 lines of output:
  
     test_mapIdsToRanges.R 
       /home/muelleki/git/R/DBI/revdep/checks/GenomicFeatures.Rcheck/GenomicFeatures/unitTests/test_mapIdsToRanges.R 
  
     test_transcripts.R 
       test_GenomicRanges_distance 
  
     test_transcriptsBy.R 
       test_transcriptsBy 
  
  
  Error in BiocGenerics:::testPackage("GenomicFeatures") : 
    unit tests failed for package GenomicFeatures
  Calls: <Anonymous> -> <Anonymous>
  Execution halted

checking re-building of vignette outputs ... WARNING
Error in re-building vignettes:
  ...
Quitting from lines 369-372 (GenomicFeatures.Rnw) 
Error: processing vignette 'GenomicFeatures.Rnw' failed with diagnostics:
could not find symbol "recursive" in environment of the generic function
Execution halted


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
```

## Genominator (1.28.0)
Maintainer: James Bullard <bullard@stat.berkeley.edu>

1 error  | 1 warning  | 4 notes

```
checking examples ... ERROR
Running examples in ‘Genominator-Ex.R’ failed
The error most likely occurred in:

> base::assign(".ptime", proc.time(), pos = "CheckExEnv")
> ### Name: makeGeneRepresentation
> ### Title: Compute a gene representation from annotation.
> ### Aliases: makeGeneRepresentation
> ### Keywords: manip
> 
> ### ** Examples
> 
> data(yeastAnno)
> ui <- makeGeneRepresentation(yeastAnno, type = "background")
Error in c(x0, y) : 
  could not find symbol "recursive" in environment of the generic function
Calls: makeGeneRepresentation ... .local -> gaps -> union -> union -> .local -> reduce -> c
Execution halted

checking re-building of vignette outputs ... WARNING
Error in re-building vignettes:
  ...
    match, mget, order, paste, pmax, pmax.int, pmin, pmin.int, rank,
    rbind, rownames, sapply, setdiff, sort, table, tapply, union,
    unique, unsplit, which, which.max, which.min

Loading required package: IRanges
Loading required package: S4Vectors
Loading required package: stats4
... 8 lines ...
Loading required package: GenomeGraphs
Loading required package: biomaRt
Loading required package: grid
matplot: doing 1 plots with  col= ("1") pch= ("1" "2" "3" "4" "5" "6" "7" "8" "9" "0" "a" "b" "c" "d" "e" "f" "g" "h" "i" "j" "k" "l" "m" "n" "o" "p" "q" "r" "s" "t" "u" "v" "w" "x" "y" "z" "A" "B" "C" "D" "E" "F" "G" "H" "I" "J" "K" "L" "M" "N" "O" "P" "Q" "R" "S" "T" "U" "V" "W" "X" "Y" "Z") ...


Error: processing vignette 'plotting.Rnw' failed with diagnostics:
 chunk 6 
Error in .Primitive("c")(<S4 object of class structure("IRanges", package = "IRanges")>) : 
  could not find symbol "recursive" in environment of the generic function
Execution halted

checking dependencies in R code ... NOTE
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

checking S3 generic/method consistency ... NOTE
Found the following apparent S3 methods exported but not registered:
  plot.genominator.coverage plot.genominator.goodness.of.fit
See section ‘Registering S3 methods’ in the ‘Writing R Extensions’
manual.

checking R code for possible problems ... NOTE
addPrimingWeights: no visible global function definition for
  ‘varLabels’
addPrimingWeights: no visible global function definition for
  ‘alignData’
addPrimingWeights: no visible global function definition for ‘subseq’
addPrimingWeights: no visible global function definition for ‘sread’
addPrimingWeights: no visible global function definition for
  ‘AlignedDataFrame’
addPrimingWeights: no visible global function definition for ‘pData’
... 46 lines ...
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

checking Rd line widths ... NOTE
Rd file 'makeGeneRepresentation.Rd':
  \usage lines wider than 90 characters:
     "background"), gene.id = "ensembl_gene_id", transcript.id = "ensembl_transcript_id", bind.columns, ignoreStrand = TRUE, verbose = getOp ... [TRUNCATED]

These lines will be truncated in the PDF manual.
```

## GenVisR (1.4.1)
Maintainer: Zachary Skidmore <zlskidmore@gmail.com>  
Bug reports: https://github.com/griffithlab/GenVisR/issues

1 error  | 0 warnings | 0 notes

```
checking examples ... ERROR
Running examples in ‘GenVisR-Ex.R’ failed
The error most likely occurred in:

> base::assign(".ptime", proc.time(), pos = "CheckExEnv")
> ### Name: compIdent
> ### Title: Construct identity snp comparison plot
> ### Aliases: compIdent
> 
> ### ** Examples
... 42 lines ...
Loading required package: XVector
Loading required package: rtracklayer
> hg19 <- BSgenome.Hsapiens.UCSC.hg19
> 
> # Generate plot
> compIdent(genome=hg19, debug=TRUE)
Argument not supplied to target, defaulting to predefined identity SNPs from hg19 assembly!
Error in .Primitive("c")(<S4 object of class "DNAStringSet">, <S4 object of class "DNAStringSet">,  : 
  could not find symbol "recursive" in environment of the generic function
Calls: compIdent ... unsplit_list_of_XVectorList -> do.call -> do.call -> <Anonymous>
Execution halted
```

## GOFunction (1.22.0)
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

## GWASTools (1.20.0)
Maintainer: Stephanie M. Gogarten <sdmorris@u.washington.edu>, Adrienne Stilp <amstilp@u.washington.edu>

2 errors | 0 warnings | 1 note 

```
checking examples ... ERROR
Running examples in ‘GWASTools-Ex.R’ failed
The error most likely occurred in:

> base::assign(".ptime", proc.time(), pos = "CheckExEnv")
> ### Name: vcfWrite
> ### Title: Utility to write VCF file
> ### Aliases: vcfWrite vcfCheck
> ### Keywords: manip
> 
... 32 lines ...
> vcffile <- tempfile()
> vcfWrite(genoData, vcffile, id.col="rsID", info.cols="IntensityOnly")
Block 1 of 4... 1000 SNPs
Block 2 of 4... 1000 SNPs
Block 3 of 4... 1000 SNPs
Block 4 of 4... 300 SNPs
> vcf <- readVcf(vcffile, "hg18")
Error in c(DataFrameList(META = meta), tbls[unique(tags)]) : 
  could not find symbol "recursive" in environment of the generic function
Calls: readVcf ... scanBcfHeader -> .bcfHeaderAsSimpleList -> SimpleList -> c
Execution halted

checking tests ... ERROR
  Running ‘test.R’ [156s/154s]
Running the tests in ‘tests/test.R’ failed.
Last 13 lines of output:
  
     vcfWrite_test.R 
       test_VA 
       test_both.exclude 
       test_ref.allele 
       test_scan.exclude 
       test_scan.order 
       test_snp.exclude 
       test_snp.exclude.blocks 
       test_snp.exclude.blocks2 
  
  
  Error in BiocGenerics:::testPackage("GWASTools", pattern = ".*_test\\.R$") : 
    unit tests failed for package GWASTools
  Execution halted

checking Rd line widths ... NOTE
Rd file 'assocRegression.Rd':
  \examples lines wider than 100 characters:
     scanAnnot$blood.pressure[scanAnnot$case.cntl.status==1] <- rnorm(sum(scanAnnot$case.cntl.status==1), mean=100, sd=10)
     scanAnnot$blood.pressure[scanAnnot$case.cntl.status==0] <- rnorm(sum(scanAnnot$case.cntl.status==0), mean=90, sd=5)

Rd file 'createDataFile.Rd':
  \usage lines wider than 90 characters:
                    precision="single", compress="ZIP_RA:8M", compress.geno="ZIP_RA", compress.annot="ZIP_RA",

These lines will be truncated in the PDF manual.
```

## lumi (2.26.4)
Maintainer: Pan Du <dupan.mail@gmail.com>, Lei Huang <lhuang@bsd.uchicago.edu>, Gang Feng <g-feng@northwestern.edu>

0 errors | 1 warning  | 3 notes

```
checking dependencies in R code ... WARNING
'::' or ':::' imports not declared from:
  ‘IRanges’ ‘bigmemoryExtras’

checking installed package size ... NOTE
  installed size is  6.8Mb
  sub-directories of 1Mb or more:
    R      2.8Mb
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

## mgsa (1.22.0)
Maintainer: Sebastian Bauer <mail@sebastianbauer.info>

0 errors | 1 warning  | 4 notes

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
```

## oce (0.9-20)
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
  installed size is  5.4Mb
  sub-directories of 1Mb or more:
    help   2.1Mb
```

## oligo (1.38.0)
Maintainer: Benilton Carvalho <benilton@unicamp.br>

1 error  | 0 warnings | 9 notes

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

checking package dependencies ... NOTE
Package which this enhances but not available for checking: ‘doMPI’

checking installed package size ... NOTE
  installed size is 30.4Mb
  sub-directories of 1Mb or more:
    R         1.2Mb
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

## PAnnBuilder (1.38.0)
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

## plethy (1.12.1)
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
Processing /tmp/RtmpcLtFfP/filee48d527b1eab in chunks of 10000
Starting chunk 1
Reached breakpoint change
Processing breakpoint 1
Starting sample sample_1
Error in if (sum(which.gt) > 0) { : missing value where TRUE/FALSE needed
Calls: parse.buxco ... write.sample.breaks -> write.sample.db -> sanity.check.time
Execution halted

checking tests ... ERROR
  Running ‘runTests.R’ [22s/22s]
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
  closing unused connection 3 (/tmp/RtmpI5jW2o/filee84136ff7391) 
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

## poplite (0.99.17.3)
Maintainer: Daniel Bottomly <bottomly@ohsu.edu>

0 errors | 1 warning  | 0 notes

```
checking re-building of vignette outputs ... WARNING
Error in re-building vignettes:
  ...
Loading required package: GenomicRanges
Loading required package: SummarizedExperiment
Loading required package: Biobase
Welcome to Bioconductor

    Vignettes contain introductory material; view with
    'browseVignettes()'. To cite Bioconductor, see
... 8 lines ...

The following object is masked from ‘package:base’:

    tabulate


Error: processing vignette 'poplite.Rnw' failed with diagnostics:
 chunk 15 
Error in c(DataFrameList(META = meta), tbls[unique(tags)]) : 
  could not find symbol "recursive" in environment of the generic function
Execution halted
```

## postGIStools (0.2.1)
Maintainer: Philippe Marchand <pmarchand@sesync.org>  
Bug reports: https://github.com/SESYNC-ci/postGIStools/issues

1 error  | 0 warnings | 0 notes

```
checking tests ... ERROR
  Running ‘testthat.R’ [2s/22s]
Running the tests in ‘tests/testthat.R’ failed.
Last 13 lines of output:
  > 
  > test_check("postGIStools")
  1. Failure: get_postgis_query correctly imports geometry (@test_get_query.R#49) 
  proj4string(qry) not equal to `proj_wgs84`.
  1/1 mismatches
  x[1]: "+proj=longlat +datum=WGS84 +no_defs"
  y[1]: "+proj=longlat +datum=WGS84 +no_defs +ellps=WGS84 +towgs84=0,0,0"
  
  
  testthat results ================================================================
  OK: 48 SKIPPED: 0 FAILED: 1
  1. Failure: get_postgis_query correctly imports geometry (@test_get_query.R#49) 
  
  Error: testthat unit tests failed
  Execution halted
```

## RImmPort (1.2.0)
Maintainer: Ravi Shankar <rshankar@stanford.edu>

0 errors | 1 warning  | 1 note 

```
checking sizes of PDF files under ‘inst/doc’ ... WARNING
  ‘gs+qpdf’ made some significant size reductions:
     compacted ‘RImmPort_Article.pdf’ from 731Kb to 336Kb
  consider running tools::compactPDF(gs_quality = "ebook") on these files

checking R code for possible problems ... NOTE
getCellularQuantification: no visible binding for global variable
  ‘experiment_sample_accession’
getCellularQuantification: no visible binding for global variable
  ‘control_files_names’
getCellularQuantification: no visible binding for global variable
  ‘ZBREFIDP’
getGeneticsFindings: no visible binding for global variable
  ‘experiment_sample_accession’
getNucleicAcidQuantification: no visible binding for global variable
  ‘experiment_sample_accession’
getProteinQuantification: no visible binding for global variable
  ‘experiment_sample_accession’
getTiterAssayResults: no visible binding for global variable
  ‘experiment_sample_accession’
Undefined global functions or variables:
  ZBREFIDP control_files_names experiment_sample_accession
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

## rnaSeqMap (2.32.0)
Maintainer: Michal Okoniewski <michal@fgcz.ethz.ch>

0 errors | 1 warning  | 4 notes

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
```

## ROracle (1.3-1)
Maintainer: Rajendra S. Pingte <rajendra.pingte@oracle.com>

1 error  | 0 warnings | 0 notes

```
checking whether package ‘ROracle’ can be installed ... ERROR
Installation failed.
See ‘/home/muelleki/git/R/DBI/revdep/checks/ROracle.Rcheck/00install.out’ for details.
```

## RQDA (0.2-8)
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

## RSQLite (1.1-2)
Maintainer: Kirill Müller <krlmlr+r@mailbox.org>  
Bug reports: https://github.com/rstats-db/RSQLite/issues

1 error  | 0 warnings | 1 note 

```
checking tests ... ERROR
  Running ‘testthat.R’
Running the tests in ‘tests/testthat.R’ failed.
Last 13 lines of output:
  testthat results ================================================================
  OK: 1462 SKIPPED: 22 FAILED: 84
  1. Failure: DBItest[RSQLite]: Driver: data_type_driver (@spec-driver-data-type.R#13) 
  2. Failure: DBItest[RSQLite]: Connection: data_type_connection (@spec-connection-data-type.R#5) 
  3. Failure: DBItest[RSQLite]: Result: fetch_n_bad (@spec-result-fetch.R#73) 
  4. Failure: DBItest[RSQLite]: Result: fetch_n_bad (@spec-result-fetch.R#73) 
  5. Failure: DBItest[RSQLite]: Result: fetch_n_bad (@spec-result-fetch.R#73) 
  6. Failure: DBItest[RSQLite]: Result: fetch_n_good_after_bad (@spec-result-fetch.R#90) 
  7. Failure: DBItest[RSQLite]: Result: fetch_n_good_after_bad (@spec-result-fetch.R#90) 
  8. Failure: DBItest[RSQLite]: Result: fetch_no_return_value (@spec-result-fetch.R#107) 
  9. Failure: DBItest[RSQLite]: Result: fetch_n_more_rows (@spec-result-fetch.R#197) 
  1. ...
  
  Error: testthat unit tests failed
  Execution halted

checking installed package size ... NOTE
  installed size is  7.8Mb
  sub-directories of 1Mb or more:
    libs   7.2Mb
```

## rTRM (1.12.0)
Maintainer: Diego Diez <diego10ruiz@gmail.com>  
Bug reports: https://github.com/ddiez/rTRM/issues

0 errors | 1 warning  | 1 note 

```
checking re-building of vignette outputs ... WARNING
Error in re-building vignettes:
  ...
Read 8734 items
Error : .onLoad failed in loadNamespace() for 'MotifDb', details:
  call: c(values, x)
  error: could not find symbol "recursive" in environment of the generic function
Quitting from lines 277-286 (rTRM_Introduction.Rnw) 
Error: processing vignette 'rTRM_Introduction.Rnw' failed with diagnostics:
package or namespace load failed for 'MotifDb'
Execution halted


checking Rd line widths ... NOTE
Rd file 'findTRM.Rd':
  \usage lines wider than 90 characters:
     findTRM(g, target, query, method = "nsa", max.bridge = 1, extended = FALSE, strict = FALSE, type = "igraph")

Rd file 'plotGraph.Rd':
  \usage lines wider than 90 characters:
     plotGraph(g, layout = layout.fruchterman.reingold, mar = .5, vertex.pch = 21, vertex.cex, vertex.col, vertex.bg, vertex.lwd, edge.col,  ... [TRUNCATED]

Rd file 'plotTRM.Rd':
  \usage lines wider than 90 characters:
     plotTRM(g, layout = layout.fruchterman.reingold, mar = .5, vertex.col, vertex.cex, vertex.lwd, edge.col, edge.lwd, edge.lty, label = TR ... [TRUNCATED]

Rd file 'processBiogrid.Rd':
  \usage lines wider than 90 characters:
     processBiogrid(dblist, org = "human", simplify = TRUE, type = "physical", mimic.old = FALSE)

These lines will be truncated in the PDF manual.
```

## seqplots (1.12.0)
Maintainer: Przemyslaw Stempor <ps562@cam.ac.uk>  
Bug reports: http://github.com/przemol/seqplots/issues

2 errors | 0 warnings | 3 notes

```
checking examples ... ERROR
Running examples in ‘seqplots-Ex.R’ failed
The error most likely occurred in:

> base::assign(".ptime", proc.time(), pos = "CheckExEnv")
> ### Name: getPlotSetArray
> ### Title: Process genomic signal
> ### Aliases: getPlotSetArray
> 
> ### ** Examples
... 38 lines ...
MotifSetup with 2 motifs/tracks.> ms$addBigWig(bw1)
MotifSetup with 3 motifs/tracks.> if(.Platform$OS.type != "windows" || .Machine$sizeof.pointer != 4) {
+     plotset2 <- getPlotSetArray(ms, c(bed1, bed2), 'ce10')
+ }
character
Processing: Transcripts_ce10_chrI_100Kb.bed @ GAGA [ 1 / 6 ]
Error in c(x, value) : 
  could not find symbol "recursive" in environment of the generic function
Calls: getPlotSetArray ... eval -> .nextMethod -> replaceROWS -> replaceROWS -> c
Execution halted
** found \donttest examples: check also with --run-donttest

checking tests ... ERROR
  Running ‘test-all.R’ [17s/16s]
Running the tests in ‘tests/test-all.R’ failed.
Last 13 lines of output:
  12: `[<-`(`*tmp*`, idx, value = <S4 object of class structure("DNAStringSet", package = "Biostrings")>)
  13: callNextMethod(x, i, value = value) at /tmp/RtmpGs2f8Q/devtools11166e56ff03/S4Vectors/R/List-class.R:526
  14: eval(call, callEnv)
  15: eval(expr, envir, enclos)
  16: .nextMethod(x, i, value = value) at /tmp/RtmpGs2f8Q/devtools11166e56ff03/S4Vectors/R/List-class.R:526
  17: replaceROWS(x, i, value) at /tmp/RtmpGs2f8Q/devtools11166e56ff03/S4Vectors/R/Vector-class.R:427
  18: replaceROWS(x, i, value) at /tmp/RtmpGs2f8Q/devtools11166e56ff03/S4Vectors/R/subsetting-utils.R:431
  19: c(x, value) at /tmp/RtmpGs2f8Q/devtools11166e56ff03/S4Vectors/R/Vector-class.R:443
  
  testthat results ================================================================
  OK: 41 SKIPPED: 0 FAILED: 1
  1. Error: Test motifs (@test1.R#106) 
  
  Error: testthat unit tests failed
  Execution halted

checking installed package size ... NOTE
  installed size is  9.1Mb
  sub-directories of 1Mb or more:
    R          1.2Mb
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
... 39 lines ...
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

## sf (0.3-4)
Maintainer: Edzer Pebesma <edzer.pebesma@uni-muenster.de>  
Bug reports: https://github.com/edzer/sfr/issues/

1 error  | 0 warnings | 1 note 

```
checking tests ... ERROR
  Running ‘cast.R’
  Comparing ‘cast.Rout’ to ‘cast.Rout.save’ ... OK
  Running ‘crs.R’
  Comparing ‘crs.Rout’ to ‘crs.Rout.save’ ... OK
  Running ‘dist.R’
  Comparing ‘dist.Rout’ to ‘dist.Rout.save’ ... OK
  Running ‘dplyr.R’
  Comparing ‘dplyr.Rout’ to ‘dplyr.Rout.save’ ... OK
  Running ‘empty.R’
... 38 lines ...
  1: spTransform(sp, CRS("+init=epsg:3857")) at testthat/test_gdal.R:10
  2: spTransform(sp, CRS("+init=epsg:3857")) at /tmp/RtmpvuUUir/devtools345049746f77/sp/R/Spatial-methods.R:93
  3: stop("package rgdal is required for spTransform methods") at /tmp/RtmpvuUUir/devtools345049746f77/sp/R/Spatial-methods.R:97
  
  OGR: Unsupported geometry type
  testthat results ================================================================
  OK: 393 SKIPPED: 5 FAILED: 1
  1. Error: st_transform works (@test_gdal.R#10) 
  
  Error: testthat unit tests failed
  Execution halted

checking installed package size ... NOTE
  installed size is  9.7Mb
  sub-directories of 1Mb or more:
    doc    3.9Mb
    libs   3.8Mb
```

## sparklyr (0.5.2)
Maintainer: Javier Luraschi <javier@rstudio.com>  
Bug reports: https://github.com/rstudio/sparklyr/issues

1 error  | 0 warnings | 0 notes

```
checking whether package ‘sparklyr’ can be installed ... ERROR
Installation failed.
See ‘/home/muelleki/git/R/DBI/revdep/checks/sparklyr.Rcheck/00install.out’ for details.
```

## specL (1.8.0)
Maintainer: Christian Panse <cp@fgcz.ethz.ch>, Witold E. Wolski <wewolski@gmail.com>  
Bug reports: https://github.com/fgcz/specL/issues

0 errors | 1 warning  | 3 notes

```
checking re-building of vignette outputs ... WARNING
Error in re-building vignettes:
  ...
Warning in engine$weave(file, quiet = quiet, encoding = enc) :
  Pandoc (>= 1.12.3) and/or pandoc-citeproc not available. Falling back to R Markdown v1.
Quitting from lines 2-25 (cdsw.Rmd) 
Error: processing vignette 'cdsw.Rmd' failed with diagnostics:
could not find function "doc_date"
Execution halted


checking S3 generic/method consistency ... NOTE
Found the following apparent S3 methods exported but not registered:
  merge.specLSet plot.psm plot.psmSet summary.psmSet
See section ‘Registering S3 methods’ in the ‘Writing R Extensions’
manual.

checking R code for possible problems ... NOTE
.onAttach: no visible global function definition for ‘packageVersion’
plot,specLSet: no visible global function definition for ‘draw.circle’
summary,specLSet : <anonymous>: no visible binding for global variable
  ‘iRTpeptides’
Undefined global functions or variables:
  draw.circle iRTpeptides packageVersion
Consider adding
  importFrom("utils", "packageVersion")
to your NAMESPACE file.

checking Rd files ... NOTE
prepare_Rd: ms1.p2069.Rd:28-32: Dropping empty section \references
prepare_Rd: ms1.p2069.Rd:23-26: Dropping empty section \examples
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

## TSdata (2016.8-1)
Maintainer: Paul Gilbert <pgilbert.ttv9z@ncf.ca>

0 errors | 1 warning  | 0 notes

```
checking re-building of vignette outputs ... WARNING
Error in re-building vignettes:
  ...
Mar 08, 2017 2:58:21 PM it.bancaditalia.oss.sdmx.util.Configuration init
INFO: Configuration file: /home/muelleki/R/x86_64-pc-linux-gnu-library/3.3/RJSDMX/configuration.properties
Mar 08, 2017 2:58:21 PM it.bancaditalia.oss.sdmx.client.RestSdmxClient runQuery
INFO: Contacting web service with query: http://stats.oecd.org/restsdmx/sdmx.ashx//GetDataStructure/QNA
Mar 08, 2017 2:58:22 PM it.bancaditalia.oss.sdmx.client.RestSdmxClient runQuery
INFO: Contacting web service with query: http://stats.oecd.org/restsdmx/sdmx.ashx//GetDataStructure/QNA
Mar 08, 2017 2:58:22 PM it.bancaditalia.oss.sdmx.client.RestSdmxClient runQuery
... 8 lines ...
Mar 08, 2017 2:58:24 PM it.bancaditalia.oss.sdmx.client.RestSdmxClient runQuery
INFO: Contacting web service with query: http://ec.europa.eu/eurostat/SDMX/diss-web/rest/data/ESTAT,ei_nama_q,1.0/Q.MIO-EUR.NSA.CP.NA-P72.IT
Mar 08, 2017 2:58:24 PM it.bancaditalia.oss.sdmx.client.RestSdmxClient getData
INFO: The sdmx call returned messages in the footer:
 Message [code=400, severity=Error, url=null, text=[Error caused by the caller due to incorrect or semantically invalid arguments]]

Error: processing vignette 'Guide.Stex' failed with diagnostics:
 chunk 5 
Error in .local(serIDs, con, ...) : 
  ei_nama_q.Q.MIO-EUR.NSA.CP.NA-P72.IT error: it.bancaditalia.oss.sdmx.util.SdmxException: The query: ei_nama_q.Q.MIO-EUR.NSA.CP.NA-P72.IT did not match any time series on the provider.
Execution halted
```

## VariantAnnotation (1.20.2)
Maintainer: Valerie Obenchain <maintainer@bioconductor.org>

2 errors | 2 warnings | 3 notes

```
checking examples ... ERROR
Running examples in ‘VariantAnnotation-Ex.R’ failed
The error most likely occurred in:

> base::assign(".ptime", proc.time(), pos = "CheckExEnv")
> ### Name: GLtoGP
> ### Title: Convert genotype likelihoods to genotype probabilities
> ### Aliases: GLtoGP PLtoGP
> ### Keywords: manip
> 
> ### ** Examples
> 
>   ## Read a vcf file with a "GL" field.
>   vcfFile <- system.file("extdata", "gl_chr1.vcf", package="VariantAnnotation") 
>   vcf <- readVcf(vcfFile, "hg19")
Error in c(DataFrameList(META = meta), tbls[unique(tags)]) : 
  could not find symbol "recursive" in environment of the generic function
Calls: readVcf ... scanBcfHeader -> .bcfHeaderAsSimpleList -> SimpleList -> c
Execution halted

checking tests ... ERROR
  Running ‘VariantAnnotation_unit_tests.R’ [74s/72s]
Running the tests in ‘tests/VariantAnnotation_unit_tests.R’ failed.
Last 13 lines of output:
  
     test_summarizeVariants-methods.R 
       /home/muelleki/git/R/DBI/revdep/checks/VariantAnnotation.Rcheck/VariantAnnotation/unitTests/test_summarizeVariants-methods.R 
  
     test_writeVcf-methods.R 
       test_writeVcf_connection_increment 
       test_writeVcf_flatgeno 
       test_writeVcf_geno 
       test_writeVcf_tags 
  
  
  Error in BiocGenerics:::testPackage("VariantAnnotation") : 
    unit tests failed for package VariantAnnotation
  Calls: <Anonymous> -> <Anonymous>
  Execution halted

checking for missing documentation entries ... WARNING
Undocumented S4 methods:
  generic '[' and siglist 'VCF,ANY,ANY,ANY'
All user-level objects in a package (including S4 classes and methods)
should have documentation entries.
See chapter ‘Writing R documentation files’ in the ‘Writing R
Extensions’ manual.

checking re-building of vignette outputs ... WARNING
Error in re-building vignettes:
  ...
Loading required package: SummarizedExperiment
Loading required package: Biobase
Welcome to Bioconductor

    Vignettes contain introductory material; view with
    'browseVignettes()'. To cite Bioconductor, see
    'citation("Biobase")', and for packages
... 8 lines ...

The following object is masked from ‘package:base’:

    tabulate


Error: processing vignette 'VariantAnnotation.Rnw' failed with diagnostics:
 chunk 3 (label = readVcf) 
Error in c(DataFrameList(META = meta), tbls[unique(tags)]) : 
  could not find symbol "recursive" in environment of the generic function
Execution halted

checking installed package size ... NOTE
  installed size is  5.1Mb
  sub-directories of 1Mb or more:
    R         2.6Mb
    extdata   1.2Mb

checking dependencies in R code ... NOTE
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

checking R code for possible problems ... NOTE
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

## VariantFiltering (1.10.1)
Maintainer: Robert Castelo <robert.castelo@upf.edu>  
Bug reports: https://github.com/rcastelo/VariantFiltering/issues

2 errors | 2 warnings | 4 notes

```
checking examples ... ERROR
Running examples in ‘VariantFiltering-Ex.R’ failed
The error most likely occurred in:

> base::assign(".ptime", proc.time(), pos = "CheckExEnv")
> ### Name: VariantFilteringParam-class
> ### Title: VariantFiltering parameter class
> ### Aliases: sequence_variant.gSOXP class:VariantFilteringParam
> ###   VariantFilteringParam VariantFilteringParam-class
> ###   show,VariantFilteringParam-method $,VariantFilteringParam-method
> ###   names,VariantFilteringParam-method
> ###   filters,VariantFilteringParam-method
> ###   cutoffs,VariantFilteringParam-method sog,VariantFilteringParam-method
> ###   spliceSiteMatricesHuman variantLocations
> ### Keywords: classes,methods
> 
> ### ** Examples
> 
> vfpar <- VariantFilteringParam(system.file("extdata", "CEUtrio.vcf.bgz", package="VariantFiltering"),
+                                system.file("extdata", "CEUtrio.ped", package="VariantFiltering"),
+                                snpdb=list(), otherAnnotations=character(0))
Error in c(DataFrameList(META = meta), tbls[unique(tags)]) : 
  could not find symbol "recursive" in environment of the generic function
Calls: VariantFilteringParam ... scanBcfHeader -> .bcfHeaderAsSimpleList -> SimpleList -> c
Execution halted

checking tests ... ERROR
  Running ‘runTests.R’ [20s/20s]
Running the tests in ‘tests/runTests.R’ failed.
Last 13 lines of output:
  ERROR in test_location_annotations: Error in c(DataFrameList(META = meta), tbls[unique(tags)]) : 
    could not find symbol "recursive" in environment of the generic function
  
  Test files with failing tests
  
     test_VariantFilteringParam-methods.R 
       test_VariantFilteringParam 
  
     test_location-methods.R 
       test_location_annotations 
  
  
  Error in BiocGenerics:::testPackage("VariantFiltering") : 
    unit tests failed for package VariantFiltering
  Execution halted

checking sizes of PDF files under ‘inst/doc’ ... WARNING
  ‘gs+qpdf’ made some significant size reductions:
     compacted ‘usingVariantFiltering.pdf’ from 415Kb to 153Kb
  consider running tools::compactPDF(gs_quality = "ebook") on these files

checking re-building of vignette outputs ... WARNING
Error in re-building vignettes:
  ...
Loading required package: GenomicRanges
Loading required package: SummarizedExperiment
Loading required package: Biobase
Welcome to Bioconductor

    Vignettes contain introductory material; view with
    'browseVignettes()'. To cite Bioconductor, see
... 8 lines ...

The following object is masked from ‘package:base’:

    tabulate


Error: processing vignette 'usingVariantFiltering.Rnw' failed with diagnostics:
 chunk 3 
Error in c(DataFrameList(META = meta), tbls[unique(tags)]) : 
  could not find symbol "recursive" in environment of the generic function
Execution halted

checking installed package size ... NOTE
  installed size is  7.9Mb
  sub-directories of 1Mb or more:
    R         3.6Mb
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

checking Rd cross-references ... NOTE
Package unavailable to check Rd xrefs: ‘phastCons100way.UCSC.hg38’
```

## vmsbase (2.1.3)
Maintainer: Lorenzo D'Andrea <support@vmsbase.org>

1 error  | 0 warnings | 0 notes

```
checking whether package ‘vmsbase’ can be installed ... ERROR
Installation failed.
See ‘/home/muelleki/git/R/DBI/revdep/checks/vmsbase.Rcheck/00install.out’ for details.
```

