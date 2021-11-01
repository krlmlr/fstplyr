#' @export
dplyr::slice
#' @export
slice.tbl_fst <- function(.data, ...) {

  .dots <- list(...)

  stopifnot(length(.dots) == 1L)

  if (all(.dots[[1]] > 0)) {

    collect(.data,
            slice = .dots[[1]])

  } else if (all(.dots[[1]] < 0)) {

    collect(.data,
            slice = setdiff(1:dim(.data)[1],
                            -.dots[[1]]))

  } else stop("Row indices must be exclusively positive or negative.")

}

#' @export
slice_dates <- function(.data,
                        effective = "1900-01-01",
                        expiry = "9000-12-31") {

  dates_dt <- .data %>%
    select(ETL_END_EFF_DTS,
           ETL_END_EXP_DTS) %>%
    collect()

  .data %>%
    slice(dates_dt[ETL_END_EFF_DTS >= effective & ETL_END_EXP_DTS < expiry,
                   which = TRUE])

}
