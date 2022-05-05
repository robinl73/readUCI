library(rvest)
library(tidyverse)
library(tidyr)

url2 <- read_html("https://archive.ics.uci.edu/ml/datasets.php")

## Create a dataframe containing only one column of dataset names

large_table2 <- url2 %>%
  html_nodes(css = "table") %>%
  html_table(fill = TRUE)

args_UCI <- large_table2[[6]]
args_UCI <- args_UCI[-1, -(2:9)]
args_UCI <- unique(args_UCI)
args_UCI <- args_UCI[-2, ]

names(args_UCI) <- "name"

## Adding urls for each dataset
## Create a separate dataframe that only includes dataset names and urls
name <- url2 %>%
  html_nodes("tr") %>%
  html_nodes("a") %>%
  html_text2() %>%
  unique()

name <- name[-c(1:42)]

links_list <- url2 %>%
  html_nodes("tr") %>%
  html_nodes("a") %>%
  html_attr("href") %>%
  unique()

links_list <- links_list[-c(1:45)]
links <- list()
for (i in links_list) {
  links[[i]] <- paste("https://archive.ics.uci.edu/ml/", i, sep = "")
}
links <- unlist(links)
url_list <- data.frame(name, links)

args_UCI <- args_UCI %>%
  left_join(url_list, by = "name")

# manually add urls for 3 datasets
args_UCI$links[258] <- url_list$links[258]
args_UCI$links[289] <- url_list$links[289]
args_UCI$links[493] <- url_list$links[493]

## Get dataset webcodes
webcode <- list()
for (i in links) {
  link <- read_html(i)
  data_folder <- link %>%
    html_nodes("a") %>%
    html_text2()
  index <- which(data_folder == "Data Folder")
  if (length(index) == 0 & is.integer(index)) {
    webcode[[i]] <- NA
  } else {
    data_name <- link %>%
      html_nodes("a")
    name <- data_name[[index]] %>%
      html_attr("href")
    webcode[[i]] <- name
  }
}

webpage <- unlist(webcode)
webpage_list <- data.frame(links, webpage)

args_UCI <- args_UCI %>%
  left_join(webpage_list, by = "links")

args_UCI <- args_UCI %>%
  drop_na(webpage)

usethis::use_data(args_UCI, overwrite = TRUE)
