# This file is part of .Rbuildignore and will not appear in the built package

# https://github.com/r-lib/pkgload/issues/247
.onLoad <- function(libname, pkgname) {
  otel_cache_tracer()
  if (
    "RSQLite" %in%
      loadedNamespaces() &&
      identical(Sys.getenv("DEVTOOLS_LOAD"), "DBI")
  ) {
    unloadNamespace("RSQLite")
  }
}
