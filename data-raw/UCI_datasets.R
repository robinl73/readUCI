## code to prepare `UCI_datasets` dataset goes here

#read in the data from the data-raw folder
UCI_datasets <- readr::read_csv("data-raw/UCI_datasets.csv", na = "")

#clean up the names
names(UCI_datasets) <- c("name", "data_types", "default_task", "attribute_types", "num_instances", "num_attributes", "year")

#remove the whitespace
UCI_datasets <- purrr::map_df(UCI_datasets, stringr::str_trim)

#convert to numeric
UCI_datasets$num_attributes <- as.numeric(UCI_datasets$num_attributes)
UCI_datasets$num_instances <- as.numeric(UCI_datasets$num_instances)
UCI_datasets$year <- as.numeric(UCI_datasets$year)


usethis::use_data(UCI_datasets)
