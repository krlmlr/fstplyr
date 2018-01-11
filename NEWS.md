## fstplyr 0.1-2 (2018-01-12)

- Fix endless recursion in `groups()`.


# fstplyr 0.1-1

- Reexport all dplyr methods, and the pipe operator.
- Fix `select()` and `rename()` chains (#1).
- Fix `colnames()` after `select()`.

# fstplyr 0.1

Initial version.

- `src_fst()` creates a dplyr data source that gives access to all `.fst` files in a directory.
