test_that("read_UCI works", {
  expect_type(read_UCI("iris", "iris.data"), "list")
})