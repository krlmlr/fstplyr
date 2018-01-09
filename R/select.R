#' @export
select.tbl_fst <- function(.data, ...) {
  # Pass via splicing to avoid matching vars_select() arguments
  vars <- tidyselect::vars_select(colnames(.data), !!! quos(...))
  .data$vars <- vars
  .data
}
