#' @export
tbl.src_fst <- function(src, name, ...) {
  if (!(name %in% src_tbls(src))) {
    stop("Table `", name, "` not found!", call. = FALSE)
  }
  make_tbl("fst", meta = src$meta[[name]])
}

#' @importFrom utils head
#' @export
head.tbl_fst <- function(x, n = 6L, ...) {
  as_tibble(read_fst(x$meta$path, to = n))
}

#' @importFrom utils head
#' @export
dim.tbl_fst <- function(x) {
  c(x$meta$nrOfRows, length(x$meta$columnNames))
}

#' @importFrom utils head
#' @export
collect.tbl_fst <- function(x, ...) {
  as_tibble(read_fst(x$meta$path))
}
