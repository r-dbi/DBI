make_generic_return_invisible <- function(name, envir = parent.frame()) {
  generic <- get(name, envir)
  generic <- patch_generic_to_return_invisible(generic)
  assign(name, generic, envir)
}

patch_generic_to_return_invisible <- function(generic) {
  generic_body <- body(generic@.Data)
  final_statement <- generic_body[[length(generic_body)]]
  final_statement <- bquote(invisible(.(final_statement)))
  generic_body[[length(generic_body)]] <- final_statement
  body(generic@.Data) <- generic_body
}
