
# Elementary --------------------------------------------------------------

#' @export
arrange.tbl_fst <- function(.data, ...) {
  arrange(collect(.data), ...)
}

#' @export
distinct.tbl_fst <- function(.data, ...) {
  distinct(collect(.data), ...)
}

#' @export
do.tbl_fst <- function(.data, ...) {
  do(collect(.data), ...)
}

#' @importFrom dplyr filter
#' @export
filter.tbl_fst <- function(.data, ...) {
  filter(collect(.data), ...)
}

#' @importFrom dplyr intersect
#' @export
intersect.tbl_fst <- function(.data, ...) {
  intersect(collect(.data), ...)
}

#' @export
mutate.tbl_fst <- function(.data, ...) {
  mutate(collect(.data), ...)
}

#' @export
pull.tbl_fst <- function(.data, ...) {
  pull(collect(.data), ...)
}

#' @export
sample_frac.tbl_fst <- function(.data, ...) {
  sample_frac(collect(.data), ...)
}

#' @export
sample_n.tbl_fst <- function(.data, ...) {
  sample_n(collect(.data), ...)
}

#' @importFrom dplyr setdiff
#' @export
setdiff.tbl_fst <- function(.data, ...) {
  setdiff(collect(.data), ...)
}

#' @importFrom dplyr setequal
#' @export
setequal.tbl_fst <- function(.data, ...) {
  setequal(collect(.data), ...)
}

#' @export
slice.tbl_fst <- function(.data, ...) {
  slice(collect(.data), ...)
}

#' @export
summarise.tbl_fst <- function(.data, ...) {
  summarise(collect(.data), ...)
}

#' @importFrom dplyr union
#' @export
union.tbl_fst <- function(.data, ...) {
  union(collect(.data), ...)
}

#' @export
union_all.tbl_fst <- function(.data, ...) {
  union_all(collect(.data), ...)
}



# Grouping ----------------------------------------------------------------

#' @export
group_by.tbl_fst <- function(.data, ...) {
  group_by(collect(.data), ...)
}

#' @export
group_indices.tbl_fst <- function(.data, ...) {
  group_indices(collect(.data), ...)
}

#' @export
group_size.tbl_fst <- function(.data, ...) {
  group_size(collect(.data), ...)
}

#' @export
groups.tbl_fst <- function(.data, ...) {
  groups(collect(.data), ...)
}

#' @export
n_groups.tbl_fst <- function(.data, ...) {
  n_groups(collect(.data), ...)
}

#' @export
ungroup.tbl_fst <- function(.data, ...) {
  ungroup(collect(.data), ...)
}


# Joins -------------------------------------------------------------------

#' @export
anti_join.tbl_fst <- function(.data, ...) {
  anti_join(collect(.data), ...)
}

#' @export
full_join.tbl_fst <- function(.data, ...) {
  full_join(collect(.data), ...)
}

#' @export
left_join.tbl_fst <- function(.data, ...) {
  left_join(collect(.data), ...)
}

#' @export
right_join.tbl_fst <- function(.data, ...) {
  right_join(collect(.data), ...)
}

#' @export
semi_join.tbl_fst <- function(.data, ...) {
  semi_join(collect(.data), ...)
}

#' @export
inner_join.tbl_fst <- function(.data, ...) {
  inner_join(collect(.data), ...)
}

# Coercion ----------------------------------------------------------------

#' @export
as.tbl.tbl_fst <- function(.data, ...) {
  as.tbl(collect(.data), ...)
}

#' @export
as.tbl_cube.tbl_fst <- function(.data, ...) {
  as.tbl_cube(collect(.data), ...)
}

#' @export
collapse.tbl_fst <- function(.data, ...) {
  collapse(collect(.data), ...)
}

#' @export
compute.tbl_fst <- function(.data, ...) {
  compute(collect(.data), ...)
}


# Internal ----------------------------------------------------------------

#' @export
same_src.src_fst <- function(x, y, ...) {
  if (!inherits(y, "src_fst")) return(FALSE)
  identical(x$path, y$path)
}

#' @export
tbl_vars.tbl_fst <- function(.data, ...) {
  colnames(.data)
}
