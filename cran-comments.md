This is a re-submission. Compare to the previous submission:

* I have made `print.list.pairs()` more robust so that rangeMapper
  no longer fails R CMD check.

The following notes were generated across my local OS X install, ubuntu running on travis-ci and win builder (devel and release):

* checking CRAN incoming feasibility ... NOTE
  Possibly mis-spelled words in DESCRIPTION:
  DBI (8:36)
  
  These are correctly spelled.

I have also run R CMD check on downstream dependencies of DBI. Results are available at R release: https://github.com/wch/checkresults/blob/master/DBI/r-release. Potential problems:

* aroma.affymetrix: I couldn't check because of BioC deps.
* ora, ROracle: I couldn't check because I don't have Oracle license

