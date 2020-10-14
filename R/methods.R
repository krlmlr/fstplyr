
# Elementary --------------------------------------------------------------

#' @export
dplyr::arrange
#' @export
arrange.tbl_fst <- function(.data, ...) {
  arrange(collect(.data), ...)
}

#' @export
dplyr::distinct
#' @export
distinct.tbl_fst <- function(.data, ...) {
  distinct(collect(.data), ...)
}

#' @export
dplyr::do
#' @export
do.tbl_fst <- function(.data, ...) {
  do(collect(.data), ...)
}

#' @export
dplyr::filter
#' @export
filter.tbl_fst <- function(.data, ...) {
  filter(collect(.data), ...)
}

#' @export
dplyr::intersect
#' @export
intersect.tbl_fst <- function(x, y, ...) {
  intersect(collect(x), collect(y), ...)
}

#' @export
dplyr::mutate
#' @export
mutate.tbl_fst <- function(.data, ...) {
  mutate(collect(.data), ...)
}

#' @export
dplyr::pull
#' @export
pull.tbl_fst <- function(.data, ...) {
  pull(collect(.data), ...)
}

#' @export
dplyr::sample_frac
#' @export
sample_frac.tbl_fst <- function(tbl, size, replace, weight, .env, ...) {
  sample_frac(collect(tbl), size, replace, weight, .env, ...)
}

#' @export
dplyr::sample_n
#' @export
sample_n.tbl_fst <- function(tbl, size, replace, weight, .env, ...) {
  sample_n(collect(tbl), size, replace, weight, .env, ...)
}

#' @export
dplyr::setdiff
#' @export
setdiff.tbl_fst <- function(x, y, ...) {
  setdiff(collect(x), collect(y), ...)
}

#' @export
dplyr::setequal
#' @export
setequal.tbl_fst <- function(x, y, ...) {
  setequal(collect(x), collect(y), ...)
}

#' @export
dplyr::slice
#' @export
slice.tbl_fst <- function(.data, ...) {
  slice(collect(.data), ...)
}

#' @export
dplyr::summarise
dplyr::summarize
#' @export
summarise.tbl_fst <- function(.data, ...) {
  summarise(collect(.data), ...)
}

#' @export
dplyr::union
#' @export
union.tbl_fst <- function(x, y, ...) {
  union(collect(x), collect(y), ...)
}

#' @export
dplyr::union_all
#' @export
union_all.tbl_fst <- function(x, y, ...) {
  union_all(collect(x), collect(y), ...)
}


# Grouping ----------------------------------------------------------------

#' @export
dplyr::group_vars
#' @export
group_vars.tbl_fst <- function(x) {
  group_vars(collect(x))
}

#' @export
dplyr::group_by
#' @export
group_by.tbl_fst <- function(.data, ...) {
  group_by(collect(.data), ...)
}

#' @export
dplyr::group_indices
#' @export
group_indices.tbl_fst <- function(.data, ...) {
  group_indices(collect(.data), ...)
}

#' @export
dplyr::group_size
#' @export
group_size.tbl_fst <- function(x) {
  group_size(collect(x))
}

#' @export
dplyr::groups
#' @export
groups.tbl_fst <- function(x) {
  NULL
}

#' @export
dplyr::n_groups
#' @export
n_groups.tbl_fst <- function(x) {
  n_groups(x)
}

#' @export
dplyr::ungroup
#' @export
ungroup.tbl_fst <- function(x, ...) {
  ungroup(collect(x), ...)
}


# Joins -------------------------------------------------------------------

#' @export
dplyr::anti_join
#' @export
anti_join.tbl_fst <- function(x, y, ...) {
  anti_join(collect(x), collect(y), ...)
}

#' @export
dplyr::full_join
#' @export
full_join.tbl_fst <- function(x, y, ...) {
  full_join(collect(x), collect(y), ...)
}

#' @export
dplyr::inner_join
#' @export
inner_join.tbl_fst <- function(x, y, ...) {
  inner_join(collect(x), collect(y), ...)
}

#' @export
dplyr::left_join
#' @export
left_join.tbl_fst <- function(x, y, ...) {
  left_join(collect(x), collect(y), ...)
}

#' @export
dplyr::right_join
#' @export
right_join.tbl_fst <- function(x, y, ...) {
  right_join(collect(x), collect(y), ...)
}

#' @export
dplyr::semi_join
#' @export
semi_join.tbl_fst <- function(x, y, ...) {
  semi_join(collect(x), collect(y), ...)
}

# Coercion ----------------------------------------------------------------

#' @export
as.data.frame.tbl_fst <- function(x, ...) {
  as.data.frame(collect(x), ...)
}

#' @export
dplyr::as_tibble
#' @export
as_tibble.tbl_fst <- function(x, ...) {
  as_tibble(collect(x), ...)
}

#' @export
cubelyr::as.tbl_cube
#' @export
as.tbl_cube.tbl_fst <- function(x, ...) {
  as.tbl_cube(collect(x), ...)
}

#' @export
dplyr::collapse
#' @export
collapse.tbl_fst <- function(x, ...) {
  collapse(collect(x), ...)
}

#' @export
dplyr::compute
#' @export
compute.tbl_fst <- function(x, name, ...) {
  compute(collect(x), name, ...)
}


# Internal ----------------------------------------------------------------

#' @export
dplyr::same_src
#' @export
same_src.src_fst <- function(x, y, ...) {
  if (!inherits(y, "src_fst")) return(FALSE)
  identical(x$path, y$path)
}

#' @export
dplyr::tbl_vars
#' @export
tbl_vars.tbl_fst <- function(x) {
  colnames(x)
}
