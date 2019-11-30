#' @export
#' @param webpage A string that corresponds with the the name of the dataset as
#'   it appears in the [Parent
#'   Directory](https://archive.ics.uci.edu/ml/machine-learning-databases/).
#'   Note, you do not need to include "/", and correct spelling is important.
#' @param data_file A string that corresponds with the primary file name you
#'   wish to read in (typically data). This is visible on the page following the
#'   parent directory. You can also navigate to the page by selecting "Data
#'   Folder" on the homepage of the dataset. Correct spelling is important. If
#'   there is a file extension such as `.csv` or `.xlsx`, that needs to be
#'   included.
#' @param data_delim Default is ",". A single character delimiter used to
#'   separate fields within the data file.
#' @param data_col_names Default is `FALSE`. Either `TRUE`, `FALSE`, or a
#'   character vector of column names for the data file.
#' @param overwrite Default is `FALSE`. Either `TRUE` or `FALSE`. Gets passed to
#'   `write_disk()` within `httr::GET()`. `FALSE` prevents from overwriting any
#'   existing files.
#' @param ... Arguments to be based to `readxl::read_excel` (if ".xls" is
#'   detected) or to `readr::read_delim`.
#' @title read_UCI
#' @examples
#' #Read in the Las Vegas Trip Advisor Reviews dataset
#' las_vegas <- read_UCI("00397", "LasVegasTripAdvisorReviews-Dataset.csv", data_delim = ";")
#'
#' #Read in Iris dataset
#' iris_uci <- read_UCI("iris", "iris.data")
#'
#' #Read in Immunotherapy dataset
#' immunotherapy <- read_UCI("00428", "Immunotherapy.xlsx")
#'
#' #Read in Breast Tissue dataset
#' breast_tissue <- read_UCI("00192", "BreastTissue.xls", sheet = 2, overwrite = TRUE) 
read_UCI <- function(webpage,
                     data_file,
                     data_delim = ",",
                     data_col_names = FALSE,
                     overwrite = FALSE,
                     ...){
  #Paste together a url using the webpage and data_file
  url <- paste0("https://archive.ics.uci.edu/ml/machine-learning-databases/", webpage,"/", data_file)
  #If data_file is an excel object, create a using openxlsx::read.xlsx, the url,
  #and the dots
  if((stringr::str_detect(data_file, ".xls") == TRUE)){
    httr::GET(url, httr::write_disk(data_file, overwrite = overwrite))
    a <- readxl::read_excel(data_file, ...)
  }
  #If data_file is not an excel object, create a using readr::read_delim, the
  #url, data_delim, data_col_names, and the dots
  else{
    a <- readr::read_delim(file = url(url),
                           delim = data_delim,
                           col_names = data_col_names,
                           ...)}
  #If names_file has not been provided, simply return a
  return(a)
}



