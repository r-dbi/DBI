Intermediate release.

## Test environments
* ubuntu 16.04 (local install), R 3.3.1
* ubuntu 12.04 (on travis-ci), R devel, release, and oldrel
* win-builder (release and devel)


## R CMD check results

0 errors | 0 warnings | 1 note

Found the following apparent S3 methods exported but not registered:
  print.list.pairs

- print.list.pairs() has been deprecated and will be removed soon.


## Reverse dependencies

* I have run R CMD check on all 76 reverse dependencies for both the currently
released version 0.4-1 and for the release candidate. For all packages I
could install, no substantial textual difference could be observed between the
results for the current and for the next version. All maintainers of the reverse
dependencies have been notified.
