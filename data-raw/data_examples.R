# imports 5 data sets

adult <- read_UCI("adult", "adult.data", trim_ws = TRUE)
colnames(adult) <- c(
  "age", "workclass", "fnlwgt", "education", "education-num",
  "marital-status", "occupation", "relationship", "race", "sex",
  "capital-gain", "capital-loss", "hours-per-week",
  "native-country", "salary"
)
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
colnames(wine) <- c(
  "class", "alcohol", "malic_acid", "ash", "ash_alcalinity",
  "magnesium", "total_phenols", "flavanoids",
  "non_flavanoid_phenols", "proanthocyanins",
  "color_intensity", "hue", "OD280_OD315_diluted", "proline"
)
wine$class <- as.factor(wine$class)
usethis::use_data(wine, overwrite = TRUE)

las_vegas <- read_UCI("00397", "LasVegasTripAdvisorReviews-Dataset.csv",
                      data_delim = ";", data_col_names = TRUE
)
las_vegas <- preview_names(las_vegas)
las_vegas$score <- as.factor(las_vegas$score)
las_vegas$period_of_stay <- as.factor(las_vegas$period_of_stay)
levels(las_vegas$period_of_stay) <- c("Dec-Feb", "Mar-May", "Jun-Aug", "Sep-Nov")
las_vegas$traveler_type <- as.factor(las_vegas$traveler_type)
las_vegas$pool <- as.factor(las_vegas$pool)
las_vegas$gym <- as.factor(las_vegas$gym)
las_vegas$tennis_court <- as.factor(las_vegas$tennis_court)
las_vegas$spa <- as.factor(las_vegas$spa)
las_vegas$casino <- as.factor(las_vegas$casino)
las_vegas$free_internet <- as.factor(las_vegas$free_internet)
las_vegas <- las_vegas %>%
  mutate(hotel_stars = case_when(
    hotel_stars == 35 ~ 3.5,
    hotel_stars == 45 ~ 4.5,
    TRUE ~ hotel_stars
  ))
las_vegas$user_continent <- as.factor(las_vegas$user_continent)
las_vegas$review_month <- as.factor(las_vegas$review_month)
levels(las_vegas$review_month) <- c(
  "January", "February", "March", "April",
  "May", "June", "July", "August", "September",
  "October", "November", "December"
)
las_vegas$review_weekday <- as.factor(las_vegas$review_weekday)
levels(las_vegas$review_weekday) <- c(
  "Monday", "Tuesday", "Wednesday",
  "Thursday", "Friday", "Saturday",
  "Sunday"
)
usethis::use_data(las_vegas, overwrite = TRUE)

tictactoe <- read_UCI("tic-tac-toe", "tic-tac-toe.data")
colnames(tictactoe) <- c(
  "top_left", "top_middle", "top_right",
  "middle_left", "center", "middle_right",
  "bottom_left", "bottom_middle", "bottom_right", "class"
)
tictactoe$top_left <- as.factor(tictactoe$top_left)
tictactoe$top_middle <- as.factor(tictactoe$top_middle)
tictactoe$top_right <- as.factor(tictactoe$top_right)
tictactoe$middle_left <- as.factor(tictactoe$middle_left)
tictactoe$center <- as.factor(tictactoe$center)
tictactoe$middle_right <- as.factor(tictactoe$middle_right)
tictactoe$bottom_left <- as.factor(tictactoe$bottom_left)
tictactoe$bottom_middle <- as.factor(tictactoe$bottom_middle)
tictactoe$bottom_right <- as.factor(tictactoe$bottom_right)
tictactoe$class <- as.factor(tictactoe$class)
usethis::use_data(tictactoe, overwrite = TRUE)

flags <- read_UCI("flags", "flag.data")
colnames(flags) <- c(
  "name", "landmass", "zone", "area", "population",
  "language", "religion", "bars", "stripes", "colours",
  "red", "green", "blue", "gold", "white", "black", "orange",
  "mainhue", "circles", "crosses", "saltires", "quarters",
  "sunstars", "crescent", "triangle", "icon", "animate",
  "text", "topleft", "botright"
)
flags$landmass <- as.factor(flags$landmass)
flags$zone <- as.factor(flags$zone)
flags$language <- as.factor(flags$language)
flags$religion <- as.factor(flags$religion)
flags$red <- as.factor(flags$red)
flags$green <- as.factor(flags$green)
flags$blue <- as.factor(flags$blue)
flags$gold <- as.factor(flags$gold)
flags$white <- as.factor(flags$white)
flags$black <- as.factor(flags$black)
flags$orange <- as.factor(flags$orange)
flags$crescent <- as.factor(flags$crescent)
flags$triangle <- as.factor(flags$triangle)
flags$icon <- as.factor(flags$icon)
flags$animate <- as.factor(flags$animate)
flags$text <- as.factor(flags$text)
usethis::use_data(flags, overwrite = TRUE)
