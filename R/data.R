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
#' 
#' Adult Data Set
#' @doctType data
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
#' filter(salary = "<=50K")}
#' \dontrun{
#' adult %>%
#' group_by(marital_status) %>%
#' count()}
#' 
#' Wine Data Set
#' @doctType data
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
#' arrange(total_phenols)}
#' \dontrun{
#' adult %>%
#' group_by(class) %>%
#' count()}
#' 
#' Las Vegas Data Set
#' @doctType data
#' @source https://archive.ics.uci.edu/ml/datasets/Las+Vegas+Strip
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
#' @examples
#' \dontrun{
#' las_vegas %>%
#' filter(score == 5)}
#' \dontrun{
#' adult %>%
#' group_by(hotel_stars) %>%
#' count()}
"UCI_datasets"
"adult"
"wine"
"las_vegas"