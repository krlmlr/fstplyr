context("select")

test_that("can select", {
  src <- src_fst("src")
  tbl <- tbl(src, "iris")

  expect_identical(tbl %>% select(1:5) %>% collect(), tbl %>% collect())
  expect_identical(tbl %>% select(-Species) %>% collect(), tbl %>% collect() %>% select(-Species))
  expect_identical(tbl %>% select(Species) %>% head() %>% collect(), tbl %>% collect() %>% select(Species) %>% head())
  expect_identical(tbl %>% select() %>% collect(), tbl %>% collect() %>% select())
  expect_identical(tbl %>% select(a = Species) %>% collect(), tbl %>% collect() %>% select(a = Species))
})

test_that("can rename", {
  src <- src_fst("src")
  tbl <- tbl(src, "iris")

  expect_identical(tbl %>% rename(a = Species) %>% collect(), tbl %>% collect() %>% rename(a = Species))
})

test_that("colnames work after select", {
  src <- src_fst("src")
  tbl <- tbl(src, "iris")

  expect_identical(tbl %>% select(a = Species) %>% colnames(), "a")
})
