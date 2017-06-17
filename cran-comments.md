Minor update to support upcoming release of RSQLite.

## Test environments
* ubuntu 17.04 (local install), R 3.4.0
* ubuntu 12.04 (on travis-ci), R devel, release, and oldrel
* win-builder (release and devel)


## R CMD check results

0 errors | 0 warnings | 1 note

Found the following apparent S3 methods exported but not registered:
  print.list.pairs

- print.list.pairs() has been deprecated and will be removed in the next release.


## Reverse dependencies

Checked all 157 downstream dependencies on CRAN and Bioconductor, no regressions found.
