# Setup

## Platform

|setting  |value                        |
|:--------|:----------------------------|
|version  |R version 3.3.2 (2016-10-31) |
|system   |x86_64, linux-gnu            |
|ui       |X11                          |
|language |(EN)                         |
|collate  |en_US.UTF-8                  |
|tz       |Zulu                         |
|date     |2017-02-28                   |

## Packages

|package   |*  |version    |date       |source                           |
|:---------|:--|:----------|:----------|:--------------------------------|
|covr      |   |2.2.2      |2017-01-05 |cran (@2.2.2)                    |
|DBI       |   |0.5-17     |2017-02-27 |Github (rstats-db/DBI@89005a5)   |
|knitr     |   |1.15.1     |2016-11-22 |cran (@1.15.1)                   |
|rmarkdown |   |1.3        |2016-12-21 |cran (@1.3)                      |
|RSQLite   |   |1.1-2      |2017-01-08 |cran (@1.1-2)                    |
|testthat  |   |1.0.2.9000 |2017-02-27 |Github (hadley/testthat@b72a228) |

# Check results

27 packages with problems

|package           |version  | errors| warnings| notes|
|:-----------------|:--------|------:|--------:|-----:|
|annmap            |1.16.0   |      0|        2|     5|
|AnnotationDbi     |1.36.2   |      0|        1|     5|
|ChemmineR         |2.26.1   |      1|        0|     0|
|ChIPpeakAnno      |3.8.9    |      0|        1|     2|
|cn.farms          |1.22.0   |      1|        0|     1|
|eiR               |1.14.1   |      1|        2|     6|
|GOFunction        |1.22.0   |      0|        1|     5|
|lumi              |2.26.4   |      0|        1|     3|
|mgsa              |1.22.0   |      0|        1|     4|
|oce               |0.9-20   |      1|        0|     1|
|oligo             |1.38.0   |      1|        0|     9|
|ora               |2.0-1    |      1|        0|     0|
|PAnnBuilder       |1.38.0   |      0|        3|     1|
|plethy            |1.12.1   |      2|        0|     3|
|postGIStools      |0.2.1    |      1|        0|     0|
|RImmPort          |1.2.0    |      0|        1|     1|
|rnaSeqMap         |2.32.0   |      0|        1|     4|
|ROracle           |1.3-1    |      1|        0|     0|
|RQDA              |0.2-8    |      1|        0|     1|
|RSQLite           |1.1-2    |      1|        0|     1|
|sf                |0.3-4    |      1|        0|     1|
|specL             |1.8.0    |      0|        1|     3|
|sqldf             |0.4-10   |      0|        1|     2|
|TSdata            |2016.8-1 |      0|        1|     0|
|VariantAnnotation |1.20.2   |      0|        1|     3|
|VariantFiltering  |1.10.1   |      0|        1|     4|
|vmsbase           |2.1.3    |      1|        0|     0|

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

0 errors | 1 warning  | 2 notes

```
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

## eiR (1.14.1)
Maintainer: Thomas Girke <thomas.girke@ucr.edu>

1 error  | 2 warnings | 6 notes

```
checking tests ... ERROR
Running the tests in ‘tests/runTests.R’ failed.
Last 13 lines of output:
  1 Test Suite : 
  eiR RUnit Tests - 1 test function, 1 error, 0 failures
  ERROR in /tmp/RtmpatfrtU/RLIBS_1eab7fd5d1f8/eiR/unitTests/test_main.R: Error while sourcing  /tmp/RtmpatfrtU/RLIBS_1eab7fd5d1f8/eiR/unitTests/test_main.R : Error : (converted from warning) Closing open result set, pending rows
  
  Test files with failing tests
  
     test_main.R 
       /tmp/RtmpatfrtU/RLIBS_1eab7fd5d1f8/eiR/unitTests/test_main.R 
  
  
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
Processing /tmp/RtmpUaYyBy/filed5144f45352b in chunks of 10000
Starting chunk 1
Reached breakpoint change
Processing breakpoint 1
Starting sample sample_1
Error in if (sum(which.gt) > 0) { : missing value where TRUE/FALSE needed
Calls: parse.buxco ... write.sample.breaks -> write.sample.db -> sanity.check.time
Execution halted

checking tests ... ERROR
Running the tests in ‘tests/runTests.R’ failed.
Last 13 lines of output:
  
     test_check_helpers.R 
       test.add.labels.by.sample 
       test.dbImport 
       test.get.err.breaks 
       test.summaryMeasures 
  
  
  Error in BiocGenerics:::testPackage("plethy") : 
    unit tests failed for package plethy
  In addition: Warning message:
  closing unused connection 3 (/tmp/Rtmpub3sC2/filed76d5e002e73) 
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

## postGIStools (0.2.1)
Maintainer: Philippe Marchand <pmarchand@sesync.org>  
Bug reports: https://github.com/SESYNC-ci/postGIStools/issues

1 error  | 0 warnings | 0 notes

```
checking tests ... ERROR
Running the tests in ‘tests/testthat.R’ failed.
Last 13 lines of output:
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
Running the tests in ‘tests/testthat.R’ failed.
Last 13 lines of output:
  1. Failure: DBItest[RSQLite]: Result: fetch_n_bad (@spec-result-fetch.R#78) 
  2. Failure: DBItest[RSQLite]: Result: fetch_n_bad (@spec-result-fetch.R#78) 
  3. Failure: DBItest[RSQLite]: Result: fetch_n_bad (@spec-result-fetch.R#78) 
  4. Failure: DBItest[RSQLite]: Result: fetch_n_good_after_bad (@spec-result-fetch.R#95) 
  5. Failure: DBItest[RSQLite]: Result: fetch_n_good_after_bad (@spec-result-fetch.R#95) 
  6. Failure: DBItest[RSQLite]: Result: fetch_no_return_value (@spec-result-fetch.R#112) 
  7. Error: DBItest[RSQLite]: Result: cannot_clear_result_twice_query (@spec-result-clear-result.R#42) 
  8. Error: DBItest[RSQLite]: Result: cannot_clear_result_twice_statement (@spec-result-clear-result.R#52) 
  9. Failure: DBItest[RSQLite]: Result: get_query_n_bad (@spec-result-get-query.R#87) 
  1. ...
  
  Error: testthat unit tests failed
  Execution halted

checking installed package size ... NOTE
  installed size is  7.8Mb
  sub-directories of 1Mb or more:
    libs   7.2Mb
```

## sf (0.3-4)
Maintainer: Edzer Pebesma <edzer.pebesma@uni-muenster.de>  
Bug reports: https://github.com/edzer/sfr/issues/

1 error  | 0 warnings | 1 note 

```
checking tests ... ERROR
Running the tests in ‘tests/testthat.R’ failed.
Last 13 lines of output:
  1. Error: st_transform works (@test_gdal.R#10) ---------------------------------
  package rgdal is required for spTransform methods
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
Feb 28, 2017 9:46:24 AM it.bancaditalia.oss.sdmx.util.Configuration init
INFO: Configuration file: /home/muelleki/R/x86_64-pc-linux-gnu-library/3.3/RJSDMX/configuration.properties
Feb 28, 2017 9:46:24 AM it.bancaditalia.oss.sdmx.client.RestSdmxClient runQuery
INFO: Contacting web service with query: http://stats.oecd.org/restsdmx/sdmx.ashx//GetDataStructure/QNA
Feb 28, 2017 9:46:24 AM it.bancaditalia.oss.sdmx.client.RestSdmxClient runQuery
INFO: Contacting web service with query: http://stats.oecd.org/restsdmx/sdmx.ashx//GetDataStructure/QNA
Feb 28, 2017 9:46:25 AM it.bancaditalia.oss.sdmx.client.RestSdmxClient runQuery
... 8 lines ...
Feb 28, 2017 9:46:26 AM it.bancaditalia.oss.sdmx.client.RestSdmxClient runQuery
INFO: Contacting web service with query: http://ec.europa.eu/eurostat/SDMX/diss-web/rest/data/ESTAT,ei_nama_q,1.0/Q.MIO-EUR.NSA.CP.NA-P72.IT
Feb 28, 2017 9:46:27 AM it.bancaditalia.oss.sdmx.client.RestSdmxClient getData
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

0 errors | 1 warning  | 3 notes

```
checking for missing documentation entries ... WARNING
Undocumented S4 methods:
  generic '[' and siglist 'VCF,ANY,ANY,ANY'
All user-level objects in a package (including S4 classes and methods)
should have documentation entries.
See chapter ‘Writing R documentation files’ in the ‘Writing R
Extensions’ manual.

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

0 errors | 1 warning  | 4 notes

```
checking sizes of PDF files under ‘inst/doc’ ... WARNING
  ‘gs+qpdf’ made some significant size reductions:
     compacted ‘usingVariantFiltering.pdf’ from 415Kb to 153Kb
  consider running tools::compactPDF(gs_quality = "ebook") on these files

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

