# https://github.com/r-lib/pkgdown/issues/1163
get_stage("install") %>%
  add_step(step_install_github(c("rstudio/rmarkdown")))

do_package_checks()

if (ci_has_env("DEV_VERSIONS")) {
  get_stage("install") %>%
    add_step(step_install_github(c("r-dbi/DBI", "r-dbi/RSQLite")))
}

# Build only for master or release branches
if (ci_has_env("BUILD_PKGDOWN") && grepl("^master$|^r-", ci_get_branch())) {
  do_pkgdown()
}
