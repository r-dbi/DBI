Follow-up release because R CMD check now fails for RPostgreSQL. An update to RMySQL will be released to address the regressions in that package.

## Test environments
* ubuntu 15.10 (local install), R 3.3.0
* ubuntu 12.04 (on travis-ci), R devel, release, and oldrel
* win-builder (release and devel)


## R CMD check results

0 errors | 0 warnings | 2 notes

5 days since last update

Found the following apparent S3 methods exported but not registered:
  print.list.pairs

- Bugfix release to fix regression in RPostgreSQL

- print.list.pairs() has been deprecated and will be removed soon.


## Reverse dependencies

* I have run R CMD check on RPostgreSQL with `Sys.setenv("POSTGRES_USER" = "muelleki", "POSTGRES_HOST" = "/run/postgresql", "POSTGRES_DATABASE" = "muelleki")` to run the tests against a database, this now succeeds. The difference to the released version 0.4 is minor and should not affect other packages.
