library("devtools")

res <- revdep_check(threads=4, ignore = c("ora", "ROracle"))
revdep_check_save_summary()
