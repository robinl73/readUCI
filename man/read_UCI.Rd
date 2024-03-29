% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/read_UCI.R
\name{read_UCI}
\alias{read_UCI}
\title{Read files from the UCI Machine Learning Repository}
\usage{
read_UCI(webpage, data, data_delim = ",", data_col_names = FALSE,
  data_overwrite = FALSE, ...)
}
\arguments{
\item{webpage}{A string that corresponds with the the name of the dataset as
it appears in the \href{https://archive.ics.uci.edu/ml/machine-learning-databases/}{Parent Directory}.
Note, you do not need to include "/", and correct spelling is important.}

\item{data}{A string that corresponds with the primary file name you
wish to read in (typically data). This is visible on the page following the
parent directory. You can also navigate to the page by selecting "Data
Folder" on the homepage of the dataset. Correct spelling is important. If
there is a file extension such as \code{.csv} or \code{.xlsx}, that needs to be
included.}

\item{data_delim}{Default is ",". A single character delimiter used to
separate fields within the data file.}

\item{data_col_names}{Default is \code{FALSE}. Either \code{TRUE}, \code{FALSE}, or a
character vector of column names for the data file.}

\item{data_overwrite}{Default is \code{FALSE}. Either \code{TRUE} or \code{FALSE}. Gets passed to
\code{write_disk()} within \code{httr::GET()}. \code{FALSE} prevents from overwriting any
existing files.}

\item{...}{Arguments to be based to \code{readxl::read_excel} (if ".xls" is
detected) or to \code{readr::read_delim}.}
}
\description{
Read files from the UCI Machine Learning Repository
}
\examples{
#Read in the Las Vegas Trip Advisor Reviews dataset
las_vegas <- read_UCI("00397", "LasVegasTripAdvisorReviews-Dataset.csv", data_delim = ";")

#Read in Iris dataset
iris_uci <- read_UCI("iris", "iris.data")

#Read in Immunotherapy dataset
immunotherapy <- read_UCI("00428", "Immunotherapy.xlsx")

#Read in Breast Tissue dataset
breast_tissue <- read_UCI("00192", "BreastTissue.xls", sheet = 2, data_overwrite = TRUE) 
}
