#' Italian Restaurants dataset
#' @docType data
#' @source \link{http://gattonweb.uky.edu/sheather/book/docs/datasets/nyc.csv}
#' @format
#' \describe{
#' \item{restaurant}{name of restaurant}
#' \item{price}{price of a meal for two with drinks, U.S. dollars}
#' \item{food}{food rating, scale 0-30}
#' \item{decor}{decor rating, scale 0-30}
#' \item{service}{service rating, scale 0-30}
#' \item{east}{indicator of whether the restaurant is east of 5th Avenue}}
#' @examples
#' #Calculate the mean price
#' mean(italian$price)
"italian"
