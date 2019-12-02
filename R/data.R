#' UCI Machine Learning Repository Dataset of Available Datasets
#' @docType data
#' @source https://archive.ics.uci.edu/ml/datasets.php
#' @format
#' \describe{
#' \item{name}{The name of the dataset.}
#' \item{data_types}{The types of data in the dataset. Can include Multivariate, Univariate, Sequential, Time-Series, Text, Domain-Theory, etc.}
#' \item{default_task}{The default task of the dataset. Can include Classification, Regression, Clustering, etc.}
#' \item{attribute_types}{The attribute types of the dataset. Can include Categorical, Integer, and Real.}
#' \item{num_instances}{The number of instances (observations) in the dataset.}
#' \item{num_attributes}{The number of attributes (variables) in the dataset.}
#' \item{year}{The year the dataset is from.}}
#' @examples
#' \dontrun{
#' UCI_datasets %>%
#' filter(Categorical %in% attribute_types)}
#' \dontrun{
#' UCI_datasets %>%
#' group_by(data_types) %>%
#' count()}
"UCI_datasets"
