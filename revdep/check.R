library("devtools")

res <- revdep_check(threads = parallel::detectCores(), bioconductor = TRUE, ignore = NULL)
revdep_check_save_summary()
