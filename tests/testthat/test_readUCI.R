test_that("read_UCI works", {
  expect_type(read_UCI("iris", "iris.data"), "list")
  expect_equal(nrow(read_UCI("iris", "iris.data")), 150)
  expect_equal(ncol(read_UCI("iris", "iris.data")), 5)
})
