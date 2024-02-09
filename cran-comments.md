DBI 1.2.2

## R CMD check results

- [x] Checked locally, R 4.3.2
- [x] Checked on CI system, R 4.3.2
- [x] Checked on win-builder, R devel

## Current CRAN check results

- [x] Checked on 2024-02-09, problems found: https://cran.r-project.org/web/checks/check_results_DBI.html
- [ ] NOTE: r-devel-linux-x86_64-fedora-clang
     Package suggested but not available for checking: ‘arrow’
- [ ] NOTE: r-devel-linux-x86_64-fedora-clang
     Undeclared package ‘withr’ in Rd xrefs
- [ ] ERROR: r-devel-linux-x86_64-fedora-gcc, r-release-macos-arm64, r-release-windows-x86_64, r-oldrel-macos-arm64, r-oldrel-windows-x86_64
     Error(s) in re-building vignettes:
     --- re-building ‘DBI-1.Rmd’ using rmarkdown
     --- finished re-building ‘DBI-1.Rmd’
     
     --- re-building ‘DBI-advanced.Rmd’ using rmarkdown
     --- finished re-building ‘DBI-advanced.Rmd’
     
     --- re-building ‘DBI-arrow.Rmd’ using rmarkdown
     --- finished re-building ‘DBI-arrow.Rmd’
     
     --- re-building ‘DBI-history.Rmd’ using rmarkdown
     --- finished re-building ‘DBI-history.Rmd’
     
     --- re-building ‘DBI-proposal.Rmd’ using rmarkdown
     --- finished re-building ‘DBI-proposal.Rmd’
     
     --- re-building ‘DBI.Rmd’ using rmarkdown
     --- finished re-building ‘DBI.Rmd’
     
     --- re-building ‘backend.Rmd’ using rmarkdown
     --- finished re-building ‘backend.Rmd’
     
     --- re-building ‘spec.Rmd’ using rmarkdown
     File ../help/figures/lifecycle-experimental.svg not found in resource path
     Error: processing vignette 'spec.Rmd' failed with diagnostics:
     pandoc document conversion failed with error 99
     --- failed re-building ‘spec.Rmd’
     
     SUMMARY: processing the following file failed:
     ‘spec.Rmd’
     
     Error: Vignette re-building failed.
     Execution halted

Check results at: https://cran.r-project.org/web/checks/check_results_DBI.html
