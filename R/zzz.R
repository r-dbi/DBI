# This file is part of .Rbuildignore and will not appear in the built package

# https://github.com/r-lib/pkgload/issues/247
.onLoad <- function(libname, pkgname) {
  unloadNamespace("RSQLite")
}