add_package_checks()

get_stage("deploy") %>%
  add_step(step_install_ssh_keys()) %>%
  add_step(step_test_ssh())

if (ci()$get_branch() == "master" && Sys.getenv("BUILD_PKGDOWN") != "") {
  get_stage("deploy") %>%
    add_step(step_build_pkgdown()) %>%
    add_step(step_push_deploy())
}
