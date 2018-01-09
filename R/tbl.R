#' @export
tbl.src_fst <- function(src, name, ..., slice = NULL, vars = NULL) {
  if (!(name %in% src_tbls(src))) {
    stop("Table `", name, "` not found!", call. = FALSE)
  }

  meta <- src$meta[[name]]
  make_tbl("fst", meta = meta, slice = slice, vars = vars)
}

#' @importFrom utils head
#' @export
head.tbl_fst <- function(x, n = 6L, ...) {
  read_from_meta(x, slice = seq_len(n))
}

#' @importFrom utils head
#' @export
dim.tbl_fst <- function(x) {
  c(x$meta$nrOfRows, length(orig_vars(x)))
}

#' @importFrom utils head
#' @export
dimnames.tbl_fst <- function(x) {
  list(NULL, new_vars(x))
}

#' @importFrom utils head
#' @export
collect.tbl_fst <- function(x, ...) {
  read_from_meta(x)
}

read_from_meta <- function(x, slice = NULL) {
  vars <- orig_vars(x)

  if (length(vars) == 0) {
    if (is.null(slice)) {
      return(empty_tibble(nrow(x)))
    } else {
      return(empty_tibble(length(slice)))
    }
  }

  if (is.null(slice)) {
    data <- read_fst(x$meta$path, columns = vars)
  } else {
    start <- min(slice)
    end <- max(slice)
    data <- read_fst(x$meta$path, from = start, to = end, columns = vars)
    data <- data[slice - (start - 1L), , drop = FALSE]
  }

  new_names <- new_vars(x)
  if (!is.null(new_names)) {
    new_names_idx <- which(new_names != vars)
    names(data)[new_names_idx] <- new_names[new_names_idx]
  }

  tibble::as_tibble(data)
}

empty_tibble <- function(nrow) {
  tibble::new_tibble(list(), nrow = nrow)
}

orig_vars <- function(x) {
  if (is.null(x$vars)) return(x$meta$columnNames)
  unname(x$vars)
}

new_vars <- function(x) {
  if (is.null(names(x$vars))) return(orig_vars(x))
  new_names <- names(x$vars)
  old_names_idx <- which(new_names == "")
  new_names[old_names_idx] <- orig_vars(x)[old_names_idx]
  new_names
}
