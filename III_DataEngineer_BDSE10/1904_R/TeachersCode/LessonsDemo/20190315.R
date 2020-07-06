# 2019-03-15
sprintf("%.8f", pi)
sprintf("%.10f", pi)
format(pi, digits = 10)
# global options, not recommended
default_options <- options()
pi
options(digits = 10)
pi
options(default_options)
pi
class(87)
is.numeric(87) # TRUE
is.numeric("8.787") # FALSE
is.numeric(TRUE) # FALSE
is.numeric(FALSE) # FALSE

is.character(87) # FALSE
is.character("8.787") # TRUE
is.character(TRUE) # FALSE
is.character(FALSE) # FALSE

is.logical(87) # FALSE
is.logical("8.787") # FALSE
is.logical(TRUE) # TRUE
is.logical(FALSE) # TRUE
is.logical(T) # TRUE
is.logical(F) # TRUE

as.numeric("8.787") # 8.787
as.numeric("Skywalker") # NA
as.numeric("天行者") # NA
as.numeric(TRUE) # 1
as.numeric(FALSE) # 0
as.numeric(T) # 1
as.numeric(F) # 0

as.character(8.787)
as.character(TRUE)
substr(as.character(T), 1, 1) # "T"
as.character(FALSE)
as.character(F)

as.logical(1) # TRUE
as.logical(0) # FALSE
as.logical(87) # TRUE
as.logical(-1) # TRUE
as.logical(0.00000001) # TRUE
as.logical(0 + 1i) # TRUE
as.logical("T")
as.logical("F")
as.logical("TRUE")
as.logical("FALSE")
as.logical("true") # TRUE
as.logical("false") # FALSE
as.logical("True") # TRUE
as.logical("False") # FALSE
as.logical("tRUe") # NA
as.logical("fALsE") # NA

?Sys.Date
sys_date <- Sys.Date()
sys_date
class(sys_date)
"2019-03-15" - 1
sys_date - 1
as.numeric(sys_date)
as.numeric(sys_date - 1)
origin_date <- sys_date - as.numeric(sys_date)
as.numeric(origin_date)
origin_date - 1

# Sys.Date() - "1960-01-01"
Sys.Date() - "1960-01-01"
sys_date_num <- as.numeric(Sys.Date())
beatles_formed <- as.numeric(as.Date("1960-01-01"))
(sys_date_num - beatles_formed) %/% 365
as.Date("1960-01-01")
as.Date("1960/01/01")
as.Date("19600101") # Error
as.Date("19600101", format = "%Y%m%d")
as.Date("01/01/1960")
as.Date("01/01/1960", format = "%d/%m/%Y")
as.Date("一月, 01, 1960")
as.Date("一月, 01, 1960", format = "%b, %d, %Y")
?as.Date

sys_time <- Sys.time()
class(sys_time)
origin_time <- sys_time - as.numeric(sys_time) # 1970-01-01 00:00:00
origin_time + 1
origin_time - 1
origin_time_london <- as.POSIXct("1970-01-01 00:00:00", tz = "GMT")
as.numeric(origin_time_london)
OlsonNames()
origin_time_hawaii <- as.POSIXct("1969-12-31 14:00:00", tz = "US/Hawaii")
as.numeric(origin_time_hawaii)

first_shock <- "1999-09-21 01:47:16"
after_shock <- "1999-09-21 01:57:15"
first_shock_time <- as.numeric(as.POSIXct(first_shock))
after_shock_time <- as.numeric(as.POSIXct(after_shock))
after_shock_time - first_shock_time
diff_min <- (after_shock_time - first_shock_time) %/% 60
diff_sec <- (after_shock_time - first_shock_time) %% 60
sprintf("Time difference: %s minutes %s seconds.", diff_min, diff_sec)

matrix(c(1, 2, 3, 4), nrow = 2) %*% matrix(c(1, 2, 3, 4), nrow = 2)
matrix(c(1, 2, 3, 4), nrow = 2)**2
matrix(c(1, 2, 3, 4), nrow = 2) * matrix(c(1, 2, 3, 4), nrow = 2)

mixed_vec <- c(TRUE, FALSE)
class(mixed_vec) # logical
mixed_vec <- c(mixed_vec, 5566L)
class(mixed_vec) # integer
mixed_vec
mixed_vec <- c(mixed_vec, 8.787)
class(mixed_vec) # numeric
mixed_vec
mixed_vec <- c(mixed_vec, "56不能亡")
class(mixed_vec) # character
mixed_vec

mixed_vec[1]
# ...
mixed_vec[length(mixed_vec)]
mixed_vec[-1]
mixed_vec[-2]
friends_characters <- c("Racheal Green", "Phoebe Buffay", "Monica Geller", "Ross Geller", "Joey Tribbiani", "Chandler Bing")
#racheal_and_ross <- c(friends_characters[1], friends_characters[4])
racheal_and_ross <- friends_characters[c(1, 4)]
racheal_and_ross
#female_roles <- friends_characters[c(1, 2, 3)]
female_roles <- friends_characters[1:3]
female_roles
male_roles <- friends_characters[4:length(friends_characters)]
male_roles

c(1, 2, 3) # 1:3
1:3
seq(1, 3)
seq(1, to = 11, by = 2)

racheal_and_ross
friends_characters[c(1, 4)] # slicing
friends_characters[c(TRUE, FALSE, FALSE, TRUE, FALSE, FALSE)] # logical filtering
friends_characters == "Racheal Green"
friends_characters == "Ross Geller"
#(friends_characters == "Racheal Green") & (friends_characters == "Ross Geller")
(friends_characters == "Racheal Green") | (friends_characters == "Ross Geller")
#is_racheal_or_ross <- (friends_characters == "Racheal Green") | (friends_characters == "Ross Geller")
is_racheal_or_ross <- friends_characters %in% c("Racheal Green", "Ross Geller")
racheal_and_ross <- friends_characters[is_racheal_or_ross]
racheal_and_ross

for (i in 1:10) {
  set.seed(56)
  print(sample(1:100, size = 1))
}

set.seed(87)
random_numbers <- sample(1:1000, size = 100)
#random_numbers[c(1, 3, 5, 8, ..., 98)]
random_numbers[c(TRUE, FALSE, TRUE, ..., FALSE, FALSE)]
is_odd <- random_numbers %% 2 == 1
random_numbers[is_odd]
random_numbers[random_numbers %% 2 == 1] # recommended!

install.packages("ggplot2") # grammar of graphics
library(ggplot2)
?diamonds
head(diamonds)
dim(diamonds) # dimension
View(diamonds)
diamonds$cut # diamonds.cut
diamonds[["cut"]] # diamonds.cut
class(diamonds$cut) # factor: numeric + character
head(diamonds$cut)
head(as.character(diamonds$cut))
as.numeric(diamonds$cut)
as.numeric(as.character(diamonds$cut))

diamonds_cut_lv <- levels(diamonds$cut)
diamonds_cut <- factor(diamonds_cut_lv)
c(diamonds_cut, "Awesome")

setwd("C:/Shared/")
list_files <- list.files()
is_xlsx <- grepl(pattern = ".xlsx", list_files)
xlsx_names_org <- list_files[is_xlsx]
xlsx_names_chg <- sprintf("%03.f.xlsx", 1:length(xlsx_names_org))
file.rename(from = xlsx_names_org, to = xlsx_names_chg)

# i = 0 起點
# i < 10 終止的條件
# i++ 公差

for (i in 0:9) {
  print(i)
}

LETTERS
letters
month.abb
month.name

for (LETTER in LETTERS) {
  print(LETTER)
}

for (m_abb in month.abb) {
  print(m_abb)
}

for (i in 1:length(month.abb)) {
  print(month.abb[i])
}

source("my-functions.R")

fizz_buzz <- function(x) {
  if (x %% 15 == 0) {
    msg <- "fizz buzz"
  } else if (x %% 3 == 0) {
    msg <- "fizz"
  } else if (x %% 5 == 0) {
    msg <- "buzz"
  } else {
    msg <- x
  }
  return(msg)
}

for (int in 1:100) {
  print(fizz_buzz(int))
}

players <- c("Manute Bol", "LeBron James", "Michael Jordan", "Shaquille O'Neal")
heights <- c(2.31, 2.03, 1.98, 2.16)
weights <- c(91, 113, 98, 147)

for (i in 1:length(players)) {
  print(get_bmi_index(player_name = players[i], player_height = heights[i], player_weight = weights[i]))
}

sprintf("%s's BMI is %.2f", players, weights / heights**2)

install.packages("rvest")
library(rvest)

roster_url <- "https://en.wikipedia.org/wiki/List_of_current_NBA_team_rosters"
html_doc <- roster_url %>%
  read_html()
player_full_names <- html_doc %>%
  html_nodes("td:nth-child(3) a") %>%
  html_text()

class(strsplit("Luke Skywalker", split = " ")) # list
class(strsplit("Irving, Kyrie", split = ", ")) # list

full_name_splits <- strsplit(player_full_names, split = ", ")
family_names_print <- c()
for (i in 1:length(full_name_splits)) {
  family_names_print <- c(family_names_print, toupper(full_name_splits[[i]][1]))
}
family_names_print

is_prime(87)
is_prime(89)

x <- 5
y <- 13
#prime_counter <- 0
check_results <- c()
for (i in x:y) {
  #if (is_prime(i)) {
    #prime_counter <- prime_counter + 1
  #}
  check_results <- c(check_results, is_prime(i))
}
sum(check_results)