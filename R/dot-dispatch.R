# Creates a function that can be used as `def` argument to `setGeneric()`.
# This function has ... as signature but will emulate a different argument list
# for method selection.
# This is a hack that allows emulating a signature change by using ... as the
# generic's signature but asking implementers to adhere to the new signature.
make_dispatch_override_generic <- function(f, fdef, envir = parent.frame()) {
  ret <- eval(bquote(
    function(...) {
      true_signature <- .(fdef)
      dispatch_arg_name <- names(formals(true_signature))[[1L]]
      my_call <- match.call(true_signature)
      x <- eval.parent(my_call[[dispatch_arg_name]])
      method <- selectMethod(.(f), class(x))
      method(...)
    }
  ))

  environment(ret) <- envir
  ret
}
