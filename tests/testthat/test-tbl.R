context("tbl")

test_that("can collect tbls", {
  src <- src_fst("src")
  expect_identical(tbl(src, "iris") %>% head(80), as_tibble(head(iris, 80)))
  expect_identical(tbl(src, "mtcars") %>% collect(), as_tibble(`rownames<-`(mtcars, NULL)))
})
