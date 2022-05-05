globalVariables(c("UCI_datasets", "name","data_types", "default_task", "num_instances", "area"))

#' @param data_type The types of data in the dataset. Can include: Multivariate, Univariate, Text, Data-Generator, Domain-Theory, Time-Series, Spatial, Relational, Sequential, Spatio-temporal, Transactional, Image.
#' @param data_task The default machine learning task of the dataset. Can include: Classification, Recommender-System, Regression, Function-Learning, Relational-Learning, Clustering, Description, Causal-Discovery, Causa, Recommendation.
#' @param data_area The field of study of the dataset. Can include: Life Sciences, Social Sciences, Physical Sciences, CS/ Engineering, Other, Game, Business.
#' @param min_instances The minimum instances included the dataset. Integer can range from 1 and 63,000,000.
#' @title Read files from the UCI Machine Learning Repository
#' @examples
#' dataset_pref1 <- search_UCI("Time-Series", "Classification", "Life Sciences", 300)
#' dataset_pref2 <- search_UCI(data_type = "Text", data_area = "Business")
#' 
#' @import dplyr
#' @importFrom rlang is_null
#' @export

search_UCI <- function(data_type = NULL, data_task = NULL, data_area = NULL, min_instances = 0) {
  types <- unique(unlist(strsplit(UCI_datasets$data_types, ", ")))
  tasks <- unique(unlist(strsplit(UCI_datasets$default_task, ", ")))
  areas <- unique(UCI_datasets$area)
  
  ## Error
  
  if (!is_null(data_type) == TRUE) {
    if (!(data_type %in% types)) {
      stop("Invalid type value. \n  Please enter a valid data type: Multivariate, Univariate, Text, Data-Generator, Domain-Theory, Time-Series, Spatial, Relational, Sequential, Spatio-temporal, Transactional, Image")
    }
  }
  
  if (!is_null(data_task) == TRUE) {
    if (!(data_task %in% tasks)) {
      stop("Invalid task value. \n  Please enter a valid task: Classification, Recommender-System, Regression, Function-Learning, Relational-Learning, Clustering, Description, Causal-Discovery, Causa, Recommendation")
    }
  }
  
  if (!is_null(data_area) == TRUE) {
    if (!(data_area %in% areas)) {
      stop("Invalid area value. \n  Please enter a valid area: Life Sciences, Social Sciences, Physical Sciences, CS/ Engineering, Other, Game, Business")
    }
  }
  
  if (min_instances < 0 | min_instances > 6.3e+07) {
    stop("Invalid value for min_instances. \n  Please enter an integer between 1 and 63,000,000.")
  }
  
  data <- UCI_datasets
  data <- data %>%
    dplyr::select(name, data_types, default_task, num_instances, area)
  
  if (!is_null(data_type) == TRUE) {
    data <- data %>% dplyr::filter(stringr::str_detect(data_types, data_type))
  }
  if (!is_null(data_task) == TRUE) {
    data <- data %>% dplyr::filter(stringr::str_detect(default_task, data_task))
  }
  if (!is_null(data_area) == TRUE) {
    data <- data %>% dplyr::filter(stringr::str_detect(area, data_area))
  }
  if (min_instances != 0) {
    data <- filter(data, num_instances >= min_instances)
  }
  return(data)
}


