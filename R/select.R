#' @export
dplyr::select
#' @export
select.tbl_fst <- function(.data, ...) {
  # Pass via splicing to avoid matching vars_select() arguments
  vars <- tidyselect::vars_select(tbl_vars(.data), !!! quos(...))
  .data$vars <- update_vars(vars_to_dict(.data), vars)
  .data
}

#' @export
dplyr::rename
#' @export
rename.tbl_fst <- function(.data, ...) {
  # Pass via splicing to avoid matching vars_rename() arguments
  vars <- tidyselect::vars_rename(tbl_vars(.data), !!! quos(...))
  .data$vars <- update_vars(vars_to_dict(.data), vars)
  .data
}

update_vars <- function(old_dict, new_dict) {
  new_vars <- set_names(old_dict[new_dict], names(new_dict))
  simplify_vars(new_vars)
}

vars_to_dict <- function(.data) {
  set_names(orig_vars(.data), new_vars(.data))
}

simplify_vars <- function(dict) {
  names(dict)[dict == names(dict)] <- ""
  dict
}
