#' @export
#' @param data An existing dataframe that has been pulled in from the UCI
#'   database.
#' @param overwrite Default is TRUE. Indicates whether new, clean column names
#'   should replace the existing column names.
#' @param ... Additional arguments to be passed to janitor::clean_names
#' @title preview_names
#' @examples
#' # show and clean names for iris
#' \dontrun{
#' iris_uci <- read_UCI("iris", "iris.data")
#' iris_uci_names <- preview_names(iris_uci)
#' }
preview_names <- function(data, overwrite = TRUE, ...) {
  # check if data has names
  if (colnames(data)[[1]] == "X1") {
    stop("Your data does not have variable names.")
  }
  # if overwrite is TRUE, replace names with clean names
  if (overwrite == TRUE) {
    colnames_clean <- janitor::make_clean_names(colnames(data), ...)
    colnames(data) <- colnames_clean
    print(colnames(data))
    invisible(data)
  } else {
    # print existing column names
    print(colnames(data))
    invisible(data)
  }
}
