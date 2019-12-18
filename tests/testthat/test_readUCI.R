test_that("read_UCI works", {
  expect_type(read_UCI("iris", "iris.data"), "list")
  expect_equal(nrow(read_UCI("iris", "iris.data")), 150)
  expect_equal(ncol(read_UCI("iris", "iris.data")), 5)
  expect_error(read_UCI(00397, "LasVegasTripAdvisorReviews-Dataset.csv", data_delim = ";"), "Argument webpage requires a string")
})

test_that("preview_names works", {
  expect_type(preview_names(adult), "list")
  expect_error(preview_names(read_UCI("wine", "wine.data")), "Your data does not have variable names.")
})