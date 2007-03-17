.conflicts.OK <- TRUE
".First.lib" <- 
function(libname, pkgname)
{
   require(methods, quietly = TRUE, warn.conflicts = FALSE)
}

.onLoad <- .First.lib
