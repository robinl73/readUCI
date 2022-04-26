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
#' Adult Data Set
#' @docType data
#' @source https://archive.ics.uci.edu/ml/machine-learning-databases/adult/
#' @format
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
#' \item{salary}{The individual's salary, either <=50K or >50K.}}
#' @examples
#' \dontrun{
#' adult %>%
#'   filter(salary = "<=50K")
#' }
#' \dontrun{
#' adult %>%
#'   group_by(marital_status) %>%
#'   count()
#' }
"adult"
#' Wine Data Set
#' @docType data
#' @source https://archive.ics.uci.edu/ml/datasets/Wine
#' @format
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
#' \item{proanthoyanins}{Proanthoyanins.}
#' \item{color_intensity}{Color intensity.}
#' \item{hue}{Hue.}
#' \item{OD280_OD315_diluted}{OD280_OD315_diluted.}
#' \item{proline}{Proline.}}
#' @examples
#' \dontrun{
#' wine %>%
#'   arrange(total_phenols)
#' }
#' \dontrun{
#' adult %>%
#'   group_by(class) %>%
#'   count()
#' }
"wine"
###### WARNING MESSAGE: unexpected section header '\description' , found in man/las_vegas.Rd
#' Las Vegas Data Set
########
#' @docType data
####### WARNING MESSAGE: unexpected section header '\source' , found in man/las_vegas.Rd
#' @source https://archive.ics.uci.edu/ml/datasets/Las+Vegas+Strip
########
#' @format
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
####### WARNING MESSAGE: unexpected section header '\examples' , found in man/las_vegas.Rd
#' @examples
#' \dontrun{
#' las_vegas %>%
#'   filter(score == 5)
#' }
#' \dontrun{
#' adult %>%
#'   group_by(hotel_stars) %>%
#'   count()
#' }
######
###### WARNING MESSAGE: unexpected section header '\usage' , found in man/las_vegas.Rd
"las_vegas"
######
####### WARNING MESSAGE: unexpected section header '\description' , found in man/tictactoe.Rd
#' Tic-Tac-Toe Data Set
######
#' @docType data
##### WARNING MESSAGE: unexpected section header '\source' , found in man/tictactoe.Rd
#' @source http://archive.ics.uci.edu/ml/datasets/Tic-Tac-Toe+Endgame
######
#' @format
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
######## WARNING MESSAGE: unexpected section header '\examples' , found in man/tictactoe.Rd
#' @examples
#######
#' \dontrun{
#' tictactoe %>%
#'   filter(class == "positive")
#' }
#' \dontrun{
#' tictactoe %>%
#'   group_by(center) %>%
#'   count()
#' }
######## WARNING MESSAGE: unexpected section header '\usage' , found in man/tictactoe.Rd
"tictactoe"
#######
###### WARNING MESSAGE: unexpected section header '\description' , found in man/flags.Rd
#' Flags Data Set
#######
#' @docType data
###### WARNING MESSAGE: unexpected section header '\source' , found in man/flags.Rd
#' @source http://archive.ics.uci.edu/ml/datasets/Flags
######
#' @format
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
######## WARNING MESSAGE: unexpected section header '\examples' , found in man/flags.Rd
#' @examples
#' \dontrun{
#' flags %>%
#'   filter(bars >= 3)
#' }
#' \dontrun{
#' flags %>%
#'   group_by(mainhue) %>%
#'   count()
#' }
######
####### WARNING MESSAGE:under \usage{}
"flags"
######
