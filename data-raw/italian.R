## code to prepare `italian` dataset goes here
library(janitor)
library(dplyr)
italian <- readr::read_csv("http://gattonweb.uky.edu/sheather/book/docs/datasets/nyc.csv")
italian <- clean_names(italian)
italian <- select(italian, -case)
italian$east <- factor(italian$east, labels = c("west", "east"))
usethis::use_data(italian, overwrite = TRUE)
