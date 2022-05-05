globalVariables(c("UCI_datasets", "name","data_types", "default_task", "num_instances", "area"))

#' @param data_type A string that corresponds with the the name of the dataset as
#'   it appears in the [Parent
#'   Directory](https://archive.ics.uci.edu/ml/machine-learning-databases/).
#'   Note, you do not need to include "/", and correct spelling is important.
#' @param data_task A string that corresponds with the primary file name you
#'   wish to read in (typically data). This is visible on the page following the
#'   parent directory. You can also navigate to the page by selecting "Data
#'   Folder" on the homepage of the dataset. Correct spelling is important. If
#'   there is a file extension such as `.csv` or `.xlsx`, that needs to be
#'   included.
#' @param data_area Default is ",". A single character delimiter used to
#'   separate fields within the data file.
#' @param min_instances Default is `FALSE`. Either `TRUE`, `FALSE`, or a
#'   character vector of column names for the data file.
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


