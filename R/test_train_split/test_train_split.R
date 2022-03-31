class_test <- function(dataset, test_size, seed) {
  # Seed is for the random seed
  row <- nrow(dataset)
  col <- ncol(dataset)
  set.seed(seed)
  out <- list()
  
  out$test_set <- dataset %>%
    sample_n(test_size)
  
  out$train_set <- dataset %>%
    setdiff(test_set)
  
  out$test_input <- test_set[c(1:(col-1))]
  out$test_output <- train_set[c(col)]
  
  out$train_input <- train_set[c(1:(col-1))]
  out$train_output <- train_set[c(col)]
  
  return(out)
}
