methods_as_rd <- function(method) {
  if (method == "transactions") {
    method <- c("dbBegin", "dbCommit", "dbRollback")
  }

  if (
    identical(Sys.getenv("IN_PKGDOWN"), "true") && file.exists("DESCRIPTION")
  ) {
    packages <- strsplit(
      read.dcf("DESCRIPTION")[, "Config/Needs/website"],
      ",( |\n)*",
      perl = TRUE
    )[[1]]
    packages <- grep("/", packages, invert = TRUE, value = TRUE)
    for (package in packages) {
      # Loading a backend is what puts its S4 methods in front of
      # findMethods() below, so a package that is missing costs this page the
      # methods it implements -- but it must not cost the whole website.
      # CRAN archives a backend from time to time, `adbi` and `RPresto` in
      # September 2026, and the workflow then leaves it out of the website
      # dependencies instead of failing the installation. Match that here:
      # say which page lost which backend, and carry on.
      if (!requireNamespace(package, quietly = TRUE)) {
        message(
          "methods_as_rd(",
          paste(method, collapse = ", "),
          "): ",
          "not installed, its methods are missing from this page: ",
          package
        )
      }
    }
  }

  methods <- unlist(lapply(method, methods::findMethods), recursive = FALSE)

  # Extracted from roxygen2::object_topic.s4method
  s4_topic <- function(x) {
    sig <- paste0(x@defined, collapse = ",")
    sig_text <- paste0('"', x@defined, '"', collapse = ", ")
    package <- unname(tryCatch(
      getNamespaceName(environment(x@.Data)),
      error = function(e) NA
    ))
    if (is.na(package) || package == "DBI") {
      return(data.frame())
    }

    topic <- paste0(x@generic, ",", sig, "-method")
    call <- paste0(package, "::", x@generic, "(", sig_text, ")")

    if (identical(Sys.getenv("IN_PKGDOWN"), "true")) {
      url <- downlit::autolink_url(paste0("?", package, "::`", topic, "`"))
    } else {
      url <- NA
    }

    data.frame(package, topic, call, url, stringsAsFactors = FALSE)
  }

  item_list <- lapply(methods@.Data, s4_topic)
  items <- do.call(rbind, item_list)
  if (is.null(items) || ncol(items) == 0) {
    return("")
  }

  items <- items[order(items$call), ]

  if (identical(Sys.getenv("IN_PKGDOWN"), "true")) {
    linked <- ifelse(
      is.na(items$url),
      items$call,
      paste0("\\href{", items$url, "}{", items$call, "}")
    )
    item_text <- paste0("\\code{", linked, "}")
  } else {
    item_text <- paste0("\\code{\\link[=", items$topic, "]{", items$call, "}}")
  }

  paste0(
    "\\subsection{Methods in other packages}{\n\n",
    "This documentation page describes the generics. ",
    "Refer to the documentation pages linked below for the documentation for the methods that are implemented in various backend packages.",
    "\\itemize{\n",
    paste0("\\item ", item_text, "\n", collapse = ""),
    "}}\n"
  )
}
