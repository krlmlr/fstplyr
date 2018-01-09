context("test-src.R")

test_that("can open source", {
  src <- src_fst("src")
  expect_equal(src_tbls(src), c("flights", "iris", "mtcars"))
})
