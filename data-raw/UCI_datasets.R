library(rvest)
library(tidyverse)

url <- read_html("https://archive.ics.uci.edu/ml/datasets.php")

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
         year = ifelse(year == "", NA, year)  )

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

#convert to numeric
UCI_datasets$num_attributes <- as.numeric(UCI_datasets$num_attributes)
UCI_datasets$num_instances <- as.numeric(UCI_datasets$num_instances)
UCI_datasets$year <- as.numeric(UCI_datasets$year)

usethis::use_data(UCI_datasets, overwrite = TRUE)

