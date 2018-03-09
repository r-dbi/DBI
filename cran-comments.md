Minor update to support upcoming release of RSQLite.

## Test environments
* ubuntu 17.04 (local install), R 3.4.3
* ubuntu 14.04 (on travis-ci), R devel, release, and oldrel
* win-builder (release and devel)


## R CMD check results

OK.

## Reverse dependencies

Checked more than 523 downstream dependencies on CRAN and Bioconductor, very few packages could not be installed or checked. Seeing new warnings in pool, RJDBC and RSQLServer, these packages need very minor documentation updates to accommodate changes to the definition of generics. Contacted maintaners of these packages.
