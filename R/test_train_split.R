#' @export
#' @param data An existing data frame that has been pulled in from the UCI database.
#' @param test_size An integer that describes the size of the test set as the number of rows in the new test set. 
#' @title test_train_split

test_train_split <- function(data, test_size  ) {
  a <- nrow(data)
  b <- ncol(data)
  all_datasets <- list()
  
  rand_data <- data[sample(a),]
  
  all_datasets$test_set <- rand_data %>%
    slice(1:test_size)
  
  all_datasets$train_set <- rand_data %>%
    slice((test_size+1):a)
  
  all_datasets$test_input <- all_datasets$test_set[c(1:(b-1))]
  all_datasets$test_output <- all_datasets$test_set[b]
  
  all_datasets$train_input <- all_datasets$train_set[c(1:(b-1))]
  all_datasets$train_output <- all_datasets$train_set[b]
  
  return(all_datasets)
}
