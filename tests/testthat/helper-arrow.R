skip_if_no_lazy_arrow <- function() {
  skip_if_not(has_lazy_arrow(), "nanoarrow lacks function_array_stream()")
}
