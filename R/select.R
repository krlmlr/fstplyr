#' @export
select.tbl_fst <- function(.data, ...) {
  # Pass via splicing to avoid matching vars_select() arguments
  vars <- tidyselect::vars_select(tbl_vars(.data), !!! quos(...))
  .data$vars <- vars
  .data
}

#' @export
rename.tbl_fst <- function(.data, ...) {
  vars <- tidyselect::vars_rename(tbl_vars(.data), !!! quos(...))
  .data$vars <- vars
  .data
}
