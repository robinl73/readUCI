## code to prepare `UCI_datasets` dataset goes here

# #read in the data from the data-raw folder
# UCI_datasets <- readr::read_csv("data-raw/UCI_datasets.csv", na = "")
#
# #clean up the names
# names(UCI_datasets) <- c("name", "data_types", "default_task", "attribute_types", "num_instances", "num_attributes", "year")
#
# #remove the whitespace
# UCI_datasets <- purrr::map_df(UCI_datasets, stringr::str_trim)
#
# #convert to numeric
# UCI_datasets$num_attributes <- as.numeric(UCI_datasets$num_attributes)
# UCI_datasets$num_instances <- as.numeric(UCI_datasets$num_instances)
# UCI_datasets$year <- as.numeric(UCI_datasets$year)

library(rvest)
library(tidyverse)

url <- read_html("https://archive.ics.uci.edu/ml/datasets.php")

## Adding urls for each dataset
## Create a separate dataframe that only includes dataset names and urls
name <- url %>%
  html_nodes("tr") %>%
  html_nodes("a") %>%
  html_text2() %>% 
  unique() 

name <- name[-c(1:42)]

links_list <- url %>%
  html_nodes("tr") %>%
  html_nodes("a") %>%
  html_attr("href") %>%
  unique()

links_list <- links_list[-c(1:45)]
links  <- list()
for (i in links_list) {
  links[[i]] <- paste("https://archive.ics.uci.edu/ml/",i,sep = "")
}
links <- unlist(links)
url_list <- data.frame(name, links)

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
webcode_list <- do.call(rbind, Map(data.frame, links=links, webcode=webcode))

large_table <- url %>%
  html_nodes(css = "table") %>%
  html_table(fill = TRUE) 

UCI_datasets <- large_table[[6]]
UCI_datasets <- UCI_datasets[-1, -1:-2]


names(UCI_datasets) <- c("name", "data_types", "default_task", "attribute_types", "num_instances", "num_attributes", "year")

UCI_datasets <- UCI_datasets %>%
  distinct(name, .keep_all = TRUE) %>%
  filter(!is.na(name))

UCI_datasets <- UCI_datasets %>%
  mutate(data_types = ifelse(data_types == "", NA, data_types),
         default_task = ifelse(default_task == "", NA, default_task),
         attribute_types = ifelse(attribute_types == "", NA, attribute_types),
         num_instances = ifelse(num_instances == "", NA, num_instances),
         num_attributes = ifelse(num_attributes == "", NA, num_attributes),
         year = ifelse(year == "", NA, year)  ) %>%
  left_join(url_list, by = "name")

# manually add urls for 3 datasets
UCI_datasets$links[258] <- url_list$links[258]
UCI_datasets$links[289] <- url_list$links[289]
UCI_datasets$links[493] <- url_list$links[493]

UCI_datasets <- UCI_datasets %>%
  left_join(webcode_list, by = "links")

# Adding the area variable
whole <- list("https://archive.ics.uci.edu/ml/datasets.php?format=&task=&att=&area=life&numAtt=&numIns=&type=&sort=nameUp&view=table", "https://archive.ics.uci.edu/ml/datasets.php?format=&task=&att=&area=phys&numAtt=&numIns=&type=&sort=nameUp&view=table", "https://archive.ics.uci.edu/ml/datasets.php?format=&task=&att=&area=comp&numAtt=&numIns=&type=&sort=nameUp&view=table", "https://archive.ics.uci.edu/ml/datasets.php?format=&task=&att=&area=soc&numAtt=&numIns=&type=&sort=nameUp&view=table", "https://archive.ics.uci.edu/ml/datasets.php?format=&task=&att=&area=bus&numAtt=&numIns=&type=&sort=nameUp&view=table", "https://archive.ics.uci.edu/ml/datasets.php?format=&task=&att=&area=game&numAtt=&numIns=&type=&sort=nameUp&view=table", "https://archive.ics.uci.edu/ml/datasets.php?format=&task=&att=&area=other&numAtt=&numIns=&type=&sort=nameUp&view=table")

master <- list()
for (i in whole) {
  url <- read_html(i)

  large_table <- url %>%
    html_nodes(css = "table") %>%
    html_table(fill = TRUE)

  dataset <- large_table[[6]]
  dataset <- dataset[-1, -1:-2]
  names(dataset) <- c("name", "data_types", "default_task", "attribute_types", "num_instances", "num_attributes", "year")

  dataset <- dataset %>%
    filter(!is.na(name))
  master[[i]] <- dataset
}

area_set <- function(list, index, title) {
  list[[index]] %>%
    mutate(area = as.character(title)) %>%
    select(name, area)
}

life_sciences <- area_set(master, 1, "Life Sciences")
physical_sciences <- area_set(master, 2, "Physical Sciences")
cs <- area_set(master, 3, "CS/ Engineering")
social_sciences <- area_set(master, 4, "Social Sciences")
business <- area_set(master, 5, "Business")
game <- area_set(master, 6, "Game")
other <- area_set(master, 7, "Other")

# combining all of the area datasets into one
area <- bind_rows(life_sciences, physical_sciences, cs, social_sciences, business, game, other)
area <- area %>%
  distinct(name, .keep_all = TRUE)

# combining area data set with UCI_datasets to create new variable called area

UCI_datasets <- left_join(UCI_datasets, area, by = c("name")) 

usethis::use_data(UCI_datasets, overwrite = TRUE)
