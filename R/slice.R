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
