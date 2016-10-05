context("methods")

expect_ellipsis <- function(name, method) {
  sym <- as.name(name)
  eval(bquote({
    .(sym) <- method
    expect_true("..." %in% names(formals(.(sym))))
  }))
}

test_that("all methods have ellipsis", {
  symbols <- ls(env = asNamespace("DBI"))
  objects <- mget(symbols, env = asNamespace("DBI"), mode = "function", ifnotfound = rep(list(NULL), length(symbols)))
  is_method <- vapply(objects, inherits, "standardGeneric", FUN.VALUE = logical(1L))
  methods <- objects[is_method]
  Map(expect_ellipsis, names(methods), methods)
})
