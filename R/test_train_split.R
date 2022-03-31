test_train_split <- function(dataset, test_size  ) {
  a <- nrow(dataset)
  b <- ncol(dataset)
  all_datasets <- list()
  
  rand_data <- dataset[sample(a),]
  
  all_datasets$test_set <- rand_data %>%
    slice(1:test_size)
  
  all_datasets$train_set <- rand_data %>%
    slice((test_size+1):a)
  
  all_datasets$test_input <- all_datasets$test_set[c(1:(b-1))]
  all_datasets$test_output <- all_datasets$train_set[b]
  
  all_datasets$train_input <- all_datasets$train_set[c(1:(b-1))]
  all_datasets$train_output <- all_datasets$train_set[b]
  
  return(all_datasets)
}