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
slice_endorsements <- function(.data,
                               effective = "1900-01-01",
                               expiry = "9000-12-31",
                               include_inforce = TRUE) {

  dates_dt <- collect(select(.data,
                             ETL_END_EFF_DTS,
                             ETL_END_EXP_DTS))

  if (!include_inforce) {

    index <- data.table:::`[.data.table`(dates_dt,
                                         ETL_END_EFF_DTS >= effective &
                                           ETL_END_EXP_DTS < expiry,
                                         which = TRUE)

  } else if (include_inforce) {

    index <- data.table:::`[.data.table`(dates_dt,
                                         ETL_END_EXP_DTS > effective &
                                           ETL_END_EFF_DTS < expiry,
                                         which = TRUE)

  } else stop("include_inforce must be a logical.")

  slice(.data, index)

}
