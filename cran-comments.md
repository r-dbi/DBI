Documentation updates only, necessary for the upcoming RSQLite release.

## Test environments
* ubuntu 16.04 (local install), R 3.3.3
* ubuntu 12.04 (on travis-ci), R devel, release, and oldrel
* win-builder (release and devel)


## R CMD check results

0 errors | 0 warnings | 1 note

Found the following apparent S3 methods exported but not registered:
  print.list.pairs

- print.list.pairs() has been deprecated and will be removed soon.


## Reverse dependencies

I have run R CMD check on all 141 reverse dependencies on CRAN and Bioconductor
for both the currently released version 0.5-1 and for the release candidate.
For most packages I could install, no substantial textual difference could be
observed between the results for the current and for the next version.
Exceptions:
- sparklyr 0.5.2: Affected by the change of formals in sqlInterpolate() and
  sqlParseVariables(), the maintainer has prepared a compatibility fix for
  submission to CRAN.
- RJDBC 0.2-5: Checks are now warning about missing documentation of
  dbReadTable() in that package. I have contacted the maintainer with no
  response so far. (DBI now does provide a default implementation of the
  dbReadTable() generic, but the fact that the warning occurs only now is likely
  to be an omission in R's check routines -- the checks probably should have
  also warned for the currently released version 0.5-1.
