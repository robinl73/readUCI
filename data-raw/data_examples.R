#import 5 datasets

adult <- read_UCI("adult", "adult.data", trim_ws = TRUE)
colnames(adult) <- c("age", "workclass", "fnlwgt", "education", "education-num",
                     "marital-status", "occupation", "relationship", "race", "sex",
                     "capital-gain", "capital-loss", "hours-per-week",
                     "native-country", "salary")
adult <- preview_names(adult)
adult$workclass <- as.factor(adult$workclass)
adult$education <- as.factor(adult$education)
adult$marital_status <- as.factor(adult$marital_status)
adult$occupation <- as.factor(adult$occupation)
adult$relationship <- as.factor(adult$relationship)
adult$race <- as.factor(adult$race)
adult$sex <- as.factor(adult$sex)
adult$native_country <- as.factor(adult$native_country)

usethis::use_data(adult, overwrite = TRUE)

wine <- read_UCI("wine", "wine.data")
colnames(wine) <- c("class", "alcohol", "malic_acid", "ash", "ash_alcalinity",
                    "magnesium", "total_phenols", "flavanoids",
                    "non_flavanoid_phenols", "proanthocyanins",
                    "color_intensity", "hue", "OD280_OD315_diluted", "proline")
wine$class <- as.factor(wine$class)

usethis::use_data(wine, overwrite = TRUE)

las_vegas <- read_UCI("00397", "LasVegasTripAdvisorReviews-Dataset.csv",
                      data_delim = ";", data_col_names = TRUE)
las_vegas <- preview_names(las_vegas)
