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
#' @param names_file Default is NA. A string that corresponds with the secondary
#'   file name you wish to read in (typically names). This is visible on the
#'   page following the parent directory. You can also navigate to the page by
#'   selecting "Data Folder" on the homepage of the dataset. Correct spelling is
#'   important. If there is a file type such as `.csv`, that needs to be
#'   included.
#' @param data_delim Default is ",". A single character delimiter used to
#'   separate fields within the data file.
#' @param data_col_names Default is `FALSE`. Either `TRUE`, `FALSE`, or a
#'   character vector of column names for the data file.
#' @param names_delim Default is ",". A single character delimiter used to
#'   separate fields within the names file.
#' @param names_col_names Default is `FALSE`. Either `TRUE`, `FALSE`, or a
#'   character vector of column names for the names file.
#' @param ... Arguments to be based to `openxlsx::read.xlsx` (if ".xls"
#'   is detected) or to `readr::read_delim`.
#' @title read_UCI
#' @examples
#' #Read in the Las Vegas Trip Advisor Reviews dataset
#' las_vegas <- read_UCI("00397", "LasVegasTripAdvisorReviews-Dataset.csv", data_delim = ";")
#'
#' #Read in Iris dataset
#' iris_uci <- read_UCI("iris", "iris.data")
read_UCI <- function(webpage,
                     data_file,
                     names_file = NA,
                     data_delim = ",",
                     data_col_names = FALSE,
                     names_delim = ",",
                     names_col_names = FALSE,
                     ...){
  #Paste together a url using the webpage and data_file
  url <- paste0("https://archive.ics.uci.edu/ml/machine-learning-databases/", webpage,"/", data_file)
  #If data_file is an excel object, create a using openxlsx::read.xlsx, the url,
  #and the dots
  if((stringr::str_detect(data_file, ".xls") == TRUE)){
    a <- tibble::tibble(openxlsx::read.xlsx(xlsxFile = url,...))}
  #If data_file is not an excel object, create a using readr::read_delim, the
  #url, data_delim, data_col_names, and the dots
  else{
    a <- readr::read_delim(file = url(url),
                           delim = data_delim,
                           col_names = data_col_names,
                           ...)}
  #If a names_file is provided, paste together a names_url using the webpage and
  #the names_file
  if(!is.na(names_file)){
    names_url <- paste0("https://archive.ics.uci.edu/ml/machine-learning-databases/",
                        webpage,
                        "/",
                        names_file)
    #If names_file is an excel object, create b using openxlsx::read.xlsx, the
    #url, and the dots
    if(stringr::str_detect(names_file, ".xls") == TRUE){
      b <- tibble::tibble(openxlsx::read.xlsx(xlsxFile = names_url,...))}
    #If names_file is not an excel object, create b using readr::read_delim, the
    #names_url, names_delim, names_col_names, and the dots
    else{
      b <- readr::read_delim(file = url(names_url), delim = names_delim, col_names = names_col_names)}
    #If names_file has been provided, return a list that includes a and b
    return(list(a, b))}
  #If names_file has not been provided, simply return a
  else{return(a)}
}
