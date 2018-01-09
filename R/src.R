#' @export
src_fst <- function(path) {
  path <- normalizePath(path, mustWork = TRUE)
  src(subclass = "fst", path = path, meta = get_dir_metadata(path))
}

#' @export
src_tbls.src_fst <- function(x) {
  names(x$meta)
}

#' @export
format.src_fst <- function(x, ...) {
  paste0(
    "src:  fst files in ", x$path, "\n",
    "tbls: ", paste0(sort(src_tbls(x)), collapse = ", ")
  )
}

get_dir_metadata <- function(path) {
  files <- dir(path, include.dirs = FALSE, full.names = TRUE)
  names(files) <- gsub("[.][^.]+$", "", basename(files))
  meta <- map(files, try_get_metadata)
  compact(meta)
}

try_get_metadata <- function(file) {
  tryCatch(
    metadata_fst(file),
    error = function(e) NULL
  )
}
