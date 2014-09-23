This is a patch release to fix two very minor problems (failed to export generic, used wrong method in default implementation of dbGetQuery).

The following notes were generated across my local OS X install, ubuntu running on travis-ci and win builder (devel and release):

* checking CRAN incoming feasibility ... NOTE
  Possibly mis-spelled words in DESCRIPTION:
  DBI (8:36)
  
  These are correctly spelled.

I did not run R CMD check on downstream dependencies of DBI because the change is tiny.