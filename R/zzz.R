## $Id$

.conflicts.OK <- TRUE
".First.lib" <- 
function(lib, pkg)
{
   require(methods, quietly = TRUE, warn.conflicts = FALSE)
}
