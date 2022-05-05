#' UCI Machine Learning Repository Available Datasets
#' @docType data
#' @source (https://archive.ics.uci.edu/ml/datasets.php)
#' @format
#' \describe{
#' \item{name}{The name of the dataset.}
#' \item{data_types}{The types of data in the dataset. Can include Multivariate, Univariate, Sequential, Time-Series, Text, Domain-Theory, etc.}
#' \item{default_task}{The default task of the dataset. Can include Classification, Regression, Clustering, etc.}
#' \item{attribute_types}{The attribute types of the dataset. Can include Categorical, Integer, and Real.}
#' \item{num_instances}{The number of instances (observations) in the dataset.}
#' \item{num_attributes}{The number of attributes (variables) in the dataset.}
#' \item{year}{The year the dataset is from.}
#' \item{area}{The field of study of the dataset. Can include Life Sciences, Physical Sciences, CS/Engineering, Social Sciences, Business, Game, and Other}}
#' @examples
#' \dontrun{
#' UCI_datasets %>%
#'   filter(Categorical %in% attribute_types)
#' }
#' \dontrun{
#' UCI_datasets %>%
#'   group_by(data_types) %>%
#'   count()
#' }
"UCI_datasets"

#' Arguments Data Set
#'
#' This data set provides the user with the arguments needed to import data from the UCI repository using the read_UCI function.
#'
#' @docType data
#' @format
#' \describe{
#' \item{name}{The name of the dataset.}
#' \item{links}{The link to the dataset provides data arguement for the function. Data argument is located below the index header inside the "Data Folder".}
#' \item{webpage}{The webpage needed for the webpage argument in read_UCI function. Webpage is ../machine-learning-databases/"webpage"/.}
#' }
"args_UCI"

#' Adult Data Set
#' @docType data
#' @source \url{https://archive.ics.uci.edu/ml/machine-learning-databases/adult/}
#' @format A data frame with 32561 rows and 15 variables:
#' \describe{
#' \item{age}{The individual's age.}
#' \item{workclass}{The individual's type of employment. Can include Private, Federal-gov, Without-pay, etc.}
#' \item{fnlwgt}{Final weight.}
#' \item{education}{The individual's education level. Can include Bachelors, Some-college, etc.}
#' \item{education_num}{A numeric representation of the individual's education level.}
#' \item{marital_status}{The individual's marital status. Can include Never-married, Divorced, Widowed, etc.}
#' \item{occupation}{The individual's occupation industry. Can include Tech-support, Farming-fishing, etc.}
#' \item{relationship}{The individual's relationship to other family members. Can include Wife, Husband, Own-child, etc.}
#' \item{race}{The individual's race. Can include White, Asian-Pac-Islander, etc.}
#' \item{sex}{The individual's sex, male or female.}
#' \item{capital_gain}{The individual's capital gain.}
#' \item{capital_loss}{The individual's capital loss.}
#' \item{hours_per_week}{The individual's hours worked per week.}
#' \item{native_country}{The individual's native country.}
#' \item{salary}{The individual's salary, either <=50K or >50K.}
#' }
"adult"

#' Wine Data Set
#'
#' This data is the result of a chemical analysis of wines grown in the same region in Italy but derived from three different cultivars.
#' The analysis determined the quantities of 13 constituents found in each of the three types of wines.
#'
#' @docType data
#' @source \url{https://archive.ics.uci.edu/ml/datasets/Wine}
#' @format A data frame with 178 rows and 14 variables:
#' \describe{
#' \item{class}{Type of wine.}
#' \item{alcohol}{Alcohol.}
#' \item{malic_acid}{Malic acid.}
#' \item{ash}{Ash.}
#' \item{ash_alcalinity}{Ash alcalinity.}
#' \item{magnesium}{Magnesium.}
#' \item{total_phenols}{Total Phenols}
#' \item{flavanoids}{Flavanoids.}
#' \item{non_flavanoid_phenols}{Non-flavanoid phenols.}
#' \item{proanthocyanins}{Proanthocyanins.}
#' \item{color_intensity}{Color intensity.}
#' \item{hue}{Hue.}
#' \item{OD280_OD315_diluted}{OD280_OD315_diluted.}
#' \item{proline}{Proline.}
#' }
"wine"

#' Las Vegas Data Set
#' @docType data
#' @source \url{https://archive.ics.uci.edu/ml/datasets/Las+Vegas+Strip}
#' @format A data frame with 504 rows and 20 variables:
#' \describe{
#' \item{user_country}{User country.}
#' \item{nr_reviews}{Number of reviews by user.}
#' \item{nr_hotel_reviews}{Number of hotel reviews by user.}
#' \item{helpful_votes}{Number of helpful votes for review.}
#' \item{score}{Review score.}
#' \item{period_of_stay}{Period of stay associated with the review.}
#' \item{traveler_type}{User traveler type.}
#' \item{pool}{Indicator of whether hotel has a pool.}
#' \item{gym}{Indicator of whether hotel has a gym.}
#' \item{tennis_court}{Indicator of whether hotel has a tennis court.}
#' \item{spa}{Indicator of whether hotel has a spa.}
#' \item{casino}{Indicator of whether hotel has a casino.}
#' \item{free_internet}{Indicator of whether a hotel has free internet.}
#' \item{hotel_name}{Hotel name.}
#' \item{hotel_stars}{Hotel stars.}
#' \item{nr_rooms}{Hotel number of rooms.}
#' \item{user_continent}{User continent.}
#' \item{member_years}{User number of years on site.}
#' \item{review_month}{Review month.}
#' \item{review_weekday}{Review day of week.}
#' }
"las_vegas"

#' Tic-Tac-Toe Data Set
#' @docType data
#' @source \url{http://archive.ics.uci.edu/ml/datasets/Tic-Tac-Toe+Endgame}
#' @format A data frame with 958 rows and 10 variables:
#' \describe{
#' \item{top_left}{The mark in the top left square of the board. x, o, or b (blank).}
#' \item{top_middle}{The mark in the top middle square of the board. x, o, or b (blank).}
#' \item{top_right}{The mark in the top right square of the board. x, o, or b (blank).}
#' \item{middle_left}{The mark in the middle left square of the board. x, o, or b (blank).}
#' \item{center}{The mark in the center square of the board. x, o, or b (blank).}
#' \item{middle_right}{The mark in the middle right square of the board. x, o, or b (blank).}
#' \item{bottom_left}{The mark in the bottom left square of the board. x, o, or b (blank).}
#' \item{bottom_middle}{The mark in the bottom middle square of the board. x, o, or b (blank).}
#' \item{bottom_right}{The mark in the bottom right square of the board. x, o, or b (blank).}
#' \item{class}{The verdict of the game. Positive if x wins, negative otherwise.}
#' }
"tictactoe"

#' Flags Data Set
#'
#' This data file contains details of various nations and their flags
#'
#' @docType data
#' @source \url{http://archive.ics.uci.edu/ml/datasets/Flags}
#' @format A data frame with 194 rows and 30 variables
#' \describe{
#' \item{name}{Name of country.}
#' \item{landmass}{Continent of country. 1 = North America, 2 = South America, 3 = Europe, 4 = Africa, 5 = Asia, 6 = Oceania.}
#' \item{zone}{Geographic quadrant. 1 = NE, 2 = SE, 3 = SW, 4 = NW.}
#' \item{area}{Area in thousands of square km.}
#' \item{population}{Population in round millions.}
#' \item{language}{Language. 1 = English, 2 = Spanish, 3 = French, 4 = German, 5 = Slavic, 6 = Other Indo-European, 7 = Chinese, 8 = Arabic, 9 = Japanesse/Turkish/Finnish/Magyar, 10 = Others.}
#' \item{religion}{Religion. 0 = Catholic, 1 = Other Christian, 2 = Muslim, 3 = Buddhist, 4 = Hindu, 5 = Ethnic, 6 = Marxist, 7 = Others.}
#' \item{bars}{Number of vertical bars in flag.}
#' \item{stripes}{Number of horizontal stripes in flag.}
#' \item{colours}{Number of different colours in flag.}
#' \item{red}{Indicator of whether the flag contains red.}
#' \item{green}{Indicator of whether the flag contains green.}
#' \item{blue}{Indicator of whether the flag contains blue.}
#' \item{gold}{Indicator of whether the flag contains gold or yellow.}
#' \item{white}{Indicator of whether the flag contains white.}
#' \item{black}{Indicator of whether the flag contains black.}
#' \item{orange}{Indicator of whether the flag contains orange or brown.}
#' \item{mainhue}{Predominant color in flag.}
#' \item{circles}{Number of circles in flag.}
#' \item{crosses}{Number of upright crosses in flag.}
#' \item{saltires}{Number of diagonal crosses in flag.}
#' \item{quarters}{Number of quartered sections in flag.}
#' \item{sunstars}{Number of sun or star symbols.}
#' \item{crescent}{Indicator of whether the flag contains a crescent moon.}
#' \item{triangle}{Indicator of whether the flag contains any triangles.}
#' \item{icon}{Indicator of whether the flag contains an inanimate image.}
#' \item{animate}{Indicator of whether the flag contains an animate image.}
#' \item{text}{Indicator of whether the flag contains letters or writing.}
#' \item{topleft}{Colour in the top-left corner.}
#' \item{botright}{Colour in the bottom-right corner.}
#' }
"flags"

#' Car Evalutaion Data Set
#' @docType data
#' @source \url{http://archive.ics.uci.edu/ml/datasets/Car+Evaluation}
#' @format A data frame with 1728 rows and 7 variables:
#' \describe{
#' \item{buying}{The buying price of a car.}
#' \item{maint}{The price of maintenence.}
#' \item{doors}{The number of car doors.}
#' \item{persons}{The capacity of people to carry.}
#' \item{lug_boot}{The size of the luggage boot.}
#' \item{safety}{The estimated safety of the car.}
#' \item{class_values}{The car class values.}
#' }
"car"

#' Breast Cancer Data Set
#'
#' Real patient data obtained from the Institute of Oncology, Ljubljana
#'
#' @docType data
#' @source \url{http://archive.ics.uci.edu/ml/datasets/Breast+Cancer}
#' @format A dataframe with 286 instances and 10 variables:
#' \describe{
#' \item{class}{The reoccurance of events.}
#' \item{age}{The age of the patient at the time of diagnosis.}
#' \item{menopause}{Whether the patient is pre- or postmenopausal at time of diagnosis.}
#' \item{inv_nodes}{The number (range 0 - 39) of axillary lymph nodes that contain metastatic breast cancer visible on histological examination.}
#' \item{node_caps}{The presence of cancer in the lymph nodes.}
#' \item{deg_malig}{The Degree of malignancy, the histological grade (range 1-3) of the tumor.}
#' \item{breast}{The prescence of brest cancer in either breast.}
#' \item{breast_quad}{Breast quadrant, the breast may be divided into four quadrants, using the nipple as a central point.}
#' \item{irradiat}{Irradiation, the use of radiation therapy}
#' }
"breast_cancer"

#' Glass Identification Data Set
#'
#' From USA Forensic Science Service; 6 types of glass; defined in terms of their oxide content (i.e. Na, Fe, K, etc)
#'
#' @docType data
#' @source \url{http://archive.ics.uci.edu/ml/datasets/Glass+Identification}
#' @format A dataframe with 214 instances and 11 variables:
#' \describe{
#' \item{ID}{ID number: 1 to 214}
#' \item{RI}{The refractive index.}
#' \item{Na}{Sodium (unit measurement: weight percent in corresponding oxide).}
#' \item{Mg}{Magnesium (unit measurement: weight percent in corresponding oxide).}
#' \item{Al}{Aluminum (unit measurement: weight percent in corresponding oxide).}
#' \item{Si}{Silicon (unit measurement: weight percent in corresponding oxide).}
#' \item{K}{Potassium (unit measurement: weight percent in corresponding oxide).}
#' \item{Ca}{Calcium (unit measurement: weight percent in corresponding oxide).}
#' \item{Ba}{Barium (unit measurement: weight percent in corresponding oxide).}
#' \item{Fe}{Iron (unit measurement: weight percent in corresponding oxide).}
#' \item{glass_type}{Type of class: 1 = building_windows_float_processed, 2 = building_windows_non_float_processed, 3 = vehicle_windows_float_processed, 4 = vehicle_windows_non_float_processed, 5 = containers, 6 = tableware, 7 = headlamps.}
#' }
"glass"

#' Liver Disorders Data Set
#' @docType data
#' @source \url{http://archive.ics.uci.edu/ml/datasets/Liver+Disorders}
#' @format A dataframe with 214 instances and 11 variables:
#' \describe{
#' \item{mcv}{Mean corpuscular volume.}
#' \item{alkphos}{Alkphos alkaline phosphotase.}
#' \item{sgpt}{Sgpt alanine aminotransferase.}
#' \item{sgot}{Sgot aspartate aminotransferase.}
#' \item{gammagt}{Gamma-glutamyl transpeptidase.}
#' \item{drinks}{Number of half-pint equivalents of alcoholic beverages drunk per day.}
#' \item{selector}{Field created by the BUPA researchers to split the data into train/test sets.}
#' }
"liver"
