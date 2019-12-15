test_that("read_UCI works", {
  expect_type(read_UCI("iris", "iris.data"), "list")
  expect_equal(nrow(read_UCI("iris", "iris.data")), 150)
  expect_equal(ncol(read_UCI("iris", "iris.data")), 5)
})

test_that("preview_names works", {
  expect_type(preview_names(adult), "data.frame")
  expect_error(preview_names(read_UCI("wine", "wine.data")), "Your data does not have variable names.")
})