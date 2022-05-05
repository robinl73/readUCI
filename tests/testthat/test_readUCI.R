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

test_that("test_train_split works", {
  expect_type(test_train_split(read_UCI("iris", "iris.data"), 20, "X5"), "list")
  expect_equal(length(test_train_split(read_UCI("iris", "iris.data"), 20, "X5")), 6)
  expect_equal(nrow(test_train_split(read_UCI("iris", "iris.data"), 20, "X5")$test_set), 20)
  expect_equal(nrow(test_train_split(read_UCI("iris", "iris.data"), 20, "X5")$train_set), 130)
  expect_equal(nrow(test_train_split(read_UCI("iris", "iris.data"), 20, "X5")$test_input), 20)
  expect_equal(nrow(test_train_split(read_UCI("iris", "iris.data"), 20, "X5")$train_input), 130)
  expect_equal(ncol(test_train_split(read_UCI("iris", "iris.data"), 20, "X5")$test_set), 5)
  expect_equal(ncol(test_train_split(read_UCI("iris", "iris.data"), 20, "X5")$test_input), 4)
  expect_equal(ncol(test_train_split(read_UCI("iris", "iris.data"), 20, "X5")$test_output), 1)
  expect_error(test_train_split(read_UCI("iris", "iris.data"), 20, X5), "object 'X5' not found")
})

test_that("search_UCI works", {
  expect_type(search_UCI("Multivariate", "Classification", "Life Sciences", 500), "list")
  expect_equal(nrow(search_UCI("Multivariate", "Classification", "Life Sciences", 500)), 48)
  expect_equal(ncol(search_UCI("Multivariate", "Classification", "Life Sciences", 500)), 5)
  expect_error(search_UCI("variate", "Classification", "Life Sciences", 500), "Invalid type value. \n  Please enter a valid data type: Multivariate, Univariate, Text, Data-Generator, Domain-Theory, Time-Series, Spatial, Relational, Sequential, Spatio-temporal, Transactional, Image")
  expect_error(search_UCI("Multivariate", "Recommender System", "Life Sciences", 500), "Invalid task value. \n  Please enter a valid task: Classification, Recommender-System, Regression, Function-Learning, Relational-Learning, Clustering, Description, Causal-Discovery, Causa, Recommendation")
  expect_error(search_UCI("Multivariate", "Classification", "life sciences", 500), "Invalid area value. \n  Please enter a valid area: Life Sciences, Social Sciences, Physical Sciences, CS/ Engineering, Other, Game, Business")
})

test_that("UCI Machine Learning Repository website contains 602 datasets", {
  expect_equal(nrow(UCI_datasets), 602)
  expect_equal(nrow(args_UCI), 602)
})