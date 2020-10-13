
context("tbl_cube")

test_that("can collect tbls", {

  src <- src_fst("src")

  x = as.tbl_cube(tbl(src, "flights"), dim_names = c("day", "dep_time", "origin", "tailnum"))

  expect_equal(
    as.tbl_cube(tbl(src, "flights"), dim_names = c("day", "dep_time", "origin", "tailnum")),
    as.tbl_cube(tbl(src, "flights") %>% collect(), dim_names = c("day", "dep_time", "origin", "tailnum"))
  )
})
