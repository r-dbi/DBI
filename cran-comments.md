## Test environments
* ubuntu 12.04 (on travis-ci), R 3.2.5
* win-builder (devel)

## R CMD check results

0 errors | 0 warnings | 2 notes

New maintainer:
  Kirill Müller <krlmlr+r@mailbox.org>
Old maintainer(s):
  Hadley Wickham <hadley@rstudio.com>


Found the following apparent S3 methods exported but not registered:
  print.list.pairs

- Hadley agrees that I act as maintainer: https://github.com/rstats-db/DBI/commit/278f233c15ea629db8cc9ccd156d236d0a815cdd#commitcomment-16886895

- print.list.pairs() has been deprecated and will be removed soon.


## Reverse dependencies

* I have run R CMD check on the 61 downstream dependencies.
  (Summary at https://github.com/rstats-db/DBI/tree/0066ef1d03afc0c0caaf2436fa898755a2dba89f/revdep). 
  
* There were failures and packages I could not install. For those packages that I could install, the DBI changes only seemed to trigger a regression in RMySQL, which will be investigated.

* All revdep maintainers were notified of the release on 2016-03-30.
