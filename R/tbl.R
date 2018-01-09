#' @export
tbl.src_fst <- function(src, name, ..., slice = NULL, vars = NULL) {
  if (!(name %in% src_tbls(src))) {
    stop("Table `", name, "` not found!", call. = FALSE)
  }
  make_tbl("fst", meta = src$meta[[name]], slice = slice, vars = vars)
}

#' @importFrom utils head
#' @export
head.tbl_fst <- function(x, n = 6L, ...) {
  read_from_meta(x, slice = seq_len(n))
}

#' @importFrom utils head
#' @export
dim.tbl_fst <- function(x) {
  c(x$meta$nrOfRows, length(x$meta$columnNames))
}

#' @importFrom utils head
#' @export
collect.tbl_fst <- function(x, ...) {
  read_from_meta(x)
}

read_from_meta <- function(x, slice = NULL, vars = NULL) {
  if (is.null(vars)) {
    vars = x$meta$columnNames
  }

  if (is.null(slice)) {
    data <- read_fst(x$meta$path, columns = vars)
  } else {
    start <- min(slice)
    end <- max(slice)
    data <- read_fst(x$meta$path, from = start, to = end, columns = vars)
    data <- data[slice - (start - 1L), ]
  }
  as_tibble(data)
}
