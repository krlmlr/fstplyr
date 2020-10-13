context("test-coerce.R")

test_that("can coerce (#8)", {
  src <- src_fst("src")
  tbl <- tbl(src, "iris")
  expect_identical(as.data.frame(tbl), iris)
  expect_identical(as_tibble(tbl), as_tibble(iris))
})
