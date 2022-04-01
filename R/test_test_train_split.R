test_that("test_train_split works", {
  expect_type(preview_names(adult), "list")
  expect_equal(nrow(test_train_split(iris_uci, 20)), 20)
})