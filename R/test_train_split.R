#' @param data An existing data frame that has been pulled in from the UCI database.
#' @param test_size An integer that describes the size of the test set as the number of rows in the new test set. 
#' @param y_var The response variable of interest. Argument requires y_var variable as a string 
#' @title test_train_split
#' @examples 
#' # create test and train data sets from iris
#' iris_datasets <- test_train_split(iris_uci, 20)
#' iris_datasets$test_set
#' iris_datasets$train_set
#' iris_datasets$test_input
#' iris_datasets$test_output
#' iris_datasets$train_input
#' iris_datasets$train_output
#' @export
#' @import tidyverse

test_train_split <- function(data, test_size, y_var) {
  a <- nrow(data)
  all_datasets <- list()
  
  if(!is.character(y_var)){
    stop("object 'X5' not found")
    }
  
  # randomize all data
  rand_data <- data[sample(a),]
  
  all_datasets$test_set <- rand_data %>%
    dplyr::slice(1:test_size)
  
  y1 <- which(colnames(all_datasets$test_set) == y_var)
  
  all_datasets$train_set <- rand_data %>%
    dplyr::slice((test_size+1):a)
  
  all_datasets$test_input <- all_datasets$test_set[,-y1]
  all_datasets$test_output <- all_datasets$test_set[y1]
  
  all_datasets$train_input <- all_datasets$train_set[,-y1]
  all_datasets$train_output <- all_datasets$train_set[y1]
  
  return(all_datasets)
}


