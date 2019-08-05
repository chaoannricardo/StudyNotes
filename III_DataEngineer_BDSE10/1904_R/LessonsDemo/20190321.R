# 2019-03-21
install.packages("jsonlite")
library(jsonlite)

my_vec <- 1:10
my_vec[my_vec %% 2 == 0]
my_vec[my_vec %% 2 == 1]
my_vec[my_vec > 7]
my_vec[my_vec < 5]
my_vec[my_vec > 7 | my_vec < 3]

split_list <- strsplit(c("LeBron James", "Steve Nash"), split = " ")
split_list[[1]]
split_list[[2]]
split_list[[1]][2]
split_list[[2]][2]

for (i in 1:length(split_list)) {
  print(toupper(split_list[[i]][2]))
}

for (m in month.abb) {
  if (m == "Apr") {
    next
  }
  print(m)
}

while (EXPR) {
  # do something repeatedly untial EXPR is evaluated as FALSE
}

sample_epochs <- 0
while (TRUE) {
  sampled_num <- sample(1:1000, size = 1)
  print(sampled_num)
  sample_epochs <- sample_epochs + 1
  if (sampled_num %% 89 == 0) {
    break
  }
}
sample_epochs

simulation_results <- c()
for (i in 1:1000) {
  sample_epochs <- 0
  while (TRUE) {
    sampled_num <- sample(1:1000, size = 1)
    #print(sampled_num)
    sample_epochs <- sample_epochs + 1
    if (sampled_num %% 89 == 0) {
      break
    }
  }
  simulation_results <- c(simulation_results, sample_epochs)
}
summary(simulation_results)

# Using counter to log
six_counter <- 0
roll_counter <- 0
while (six_counter < 3) {
  dice_roll <- sample(1:6, size = 1)
  roll_counter <- roll_counter + 1
  if (dice_roll == 6) {
    six_counter <- six_counter + 1
  }
}
roll_counter

# Using vector to log
simulation_rolls <- c()
for (i in 1:1000) {
  roll_log <- c()
  while (sum(roll_log == 6) < 3) {
    dice_roll <- sample(1:6, size = 1)
    roll_log <- c(roll_log, dice_roll)
  }
  roll_times <- length(roll_log)
  simulation_rolls <- c(simulation_rolls, roll_times)
}
summary(simulation_rolls)
hist(simulation_rolls)

roll_res <- rep(NA, times = 1000)
for (i in 1:1000) {
  roll_res[i] <- sample(1:6, size = 1)
}
barplot(table(roll_res))

# 直觀解法
indices <- c()
for (i in 1:length(roll_log)) {
  if (roll_log[i] == 6) {
    indices <- c(indices, i)
  }
}
indices
# R 解法: function
which(roll_log == 6)

# fibnacci
f1 <- 1 # arg1
f2 <- 3 # arg2
f_len <- 15 # arg3

# for-loop
fib <- c(f1, f2)
for (n in 3:f_len) {
  fn <- fib[n - 1] + fib[n - 2] # 1st
  fib <- c(fib, fn) # 1st
}
fib

fib_generator <- function(f1, f2, f_len) {
  # for-loop
  fib <- c(f1, f2)
  for (n in 3:f_len) {
    fn <- fib[n - 1] + fib[n - 2] # 1st
    fib <- c(fib, fn) # 1st
  }
  fib
}

fib_generator(0, 1, 25)
fib_generator(1, 3, 15)
  
# while-loop
fib <- c(f1, f2)
n <- 3
while (n <= f_len) {
  fn <- fib[n - 1] + fib[n - 2] # 1st
  fib <- c(fib, fn) # 1st
  n <- n + 1
}
fib

source("c:/Shared/my-functions.R")

x <- 1
y <- 100
primes <- c()
for (i in x:y) {
  if (is_prime(i)) {
     primes <- c(primes, i)
  }
}
primes # 上衣
prime_counter <- length(primes) # 褲子
c(primes, prime_counter) # 上衣 mixed with 褲子

# 衣服
## 上衣
## 褲子
prime_res <- list(primes, prime_counter)
class(prime_res) # list: just like objects in JavaScript
prime_res <- list(
  primeArr = primes,
  howManyPrimes = prime_counter
)
prime_res
prime_res$primeArr # prime_res.primeArr
prime_res$howManyPrimes # prime_res.howManyPrimes
prime_res[["primeArr"]] # prime_res["primeArr"]
prime_res[["howManyPrimes"]] # prime_res["howManyPrimes"]
prime_res[[1]]
prime_res[[2]]

title <- "Captain Marvel"
rating <- 7.1
genre <- c("Action", "Adventure", "Sci-Fi")
release_date <- as.Date("2019-03-06")
is_release <- Sys.Date() > release_date

captain_marvel <- list(
  movieTitle = title,
  movieRating = rating,
  movieGenre = genre,
  movieReleaseDate = release_date,
  movieIsRelease = is_release
)

captain_marvel <- data.frame(
  movieTitle = title,
  movieRating = rating,
  movieGenre = genre,
  movieReleaseDate = release_date,
  movieIsRelease = is_release
)

for (e in captain_marvel) {
  print(class(e))
}

json_str <- toJSON(captain_marvel)
writeLines(json_str, con = "C:/Shared/captain_marvel.json")

str(diamonds)
diamonds$cut
diamonds_csv <- read.csv("C:/Shared/diamonds.csv")
levels(diamonds_csv$cut)
levels(diamonds$cut)
all_time_fantasy <- c("Steve Nash", "Paul Pierce", "Dirk Nowitzki", "Kevin Garnett", "Hakeem Olajuwon")
class(factor(all_time_fantasy))
as.numeric(factor(all_time_fantasy))
factor(all_time_fantasy, levels = all_time_fantasy)
as.numeric(factor(all_time_fantasy, levels = all_time_fantasy))

diamonds_csv$cut <- factor(diamonds_csv$cut, levels = levels(diamonds$cut), ordered = TRUE)
diamonds_csv$cut
diamonds$cut
unique(diamonds$cut)
levels(diamonds$cut)

cast <- c("Brie Larson", "Samuel L. Jackson", "Ben Mendelsohn")
character_names <- c("Carol Danvers / Vers / Captain Marvel", "Nick Fury", "Talos / Keller")
df <- data.frame(cast, character_names, stringsAsFactors = FALSE)
df
View(df)
str(df) # structure
dim(df) # dimension
nrow(df) # number of rows
ncol(df) # number of columns
summary(df)
head(df)
tail(df)

View(diamonds)
str(diamonds) # structure
dim(diamonds) # dimension
nrow(diamonds) # number of rows
ncol(diamonds) # number of columns
summary(diamonds)
head(diamonds, n = 10)
tail(diamonds, n = 10)

all_time_fantasy
jersey <- c(13, 34, 41, 21, 34)
has_ring <- c(FALSE, TRUE, TRUE, TRUE, TRUE)
df <- data.frame(
  playerNames = all_time_fantasy,
  jersey = jersey,
  hasRing = has_ring,
  stringsAsFactors = FALSE
)
str(df)



write.csv(df, file = "C:/Shared/all_time_fantasy.csv", row.names = FALSE)
json_str <- toJSON(df)
writeLines(json_str, con = "C:/Shared/all_time_fantasy.json")

install.packages("jsonlite")
library(jsonlite)

aqi <- fromJSON("https://opendata.epa.gov.tw/ws/Data/AQI/?$format=json")
class(aqi)
View(aqi)

# select columns
aqi$County
aqi[, "County"] # difficult
aqi[, 2]
aqi[3, "SiteName"]#aqi[m, n]

# select rows
aqi[3, ]
aqi[aqi$County == "臺南市", c("SiteName", "Longitude", "Latitude")] # difficult

# mutate
aqi$publishTimePOSIX <- as.POSIXct("2019-03-21 14:00:00")
aqi
aqi$publishTimePOSIX <- NULL
View(aqi)
aqi$PM2.5 <- as.numeric(aqi$PM2.5)

# summarise
summary(aqi)
max(aqi$PM2.5, na.rm = TRUE)
min(aqi$PM2.5, na.rm = TRUE)

counties <- unique(aqi$County)
counties
substr(counties, start = 1, stop = 2)
grep("臺", counties)
grepl("臺", counties)
counties[grep("臺", counties)]
counties[grepl("臺", counties)]
counties <- c(counties, "臺臺縣")
sub(pattern = "臺", counties, replacement = "台")
gsub(pattern = "臺", counties, replacement = "台")
district_level <- substr(counties, start = 3, stop = 3)
district_name <- substr(counties, start = 1, stop = 2)
paste(district_name, district_level)
paste0(district_name, district_level)
paste(district_name, district_level, sep = "") # paste0
trimws("      Luke Skywalker       ", which = "left")
trimws("      Luke Skywalker       ", which = "right")
trimws("      Luke Skywalker       ", which = "both")

celsius_to_fahrenheit <- function(x) {
  x_fahrenheit <- x*1.8 + 32
  return(x_fahrenheit)
}
get_bmi <- function(h, w) {
  bmi <- w / (h*0.01)**2
  return(bmi)
}
temperature_convertor <- function(x, is_celsius = TRUE) {
  if (is_celsius) {
    y <- x * 1.8 + 32
  } else {
    y <- (x - 32) / 1.8
  }
  return(y)
}
get_bmi_and_index <- function(h, w) {
  bmi <- w / (h*0.01)**2
  if (bmi > 30) {
    bmi_index <- "Obese"
  } else if (bmi < 18.5) {
    bmi_index <- "Under weight"
  } else if ((bmi >= 18.5) & (bmi < 25)) {
    bmi_index <- "Normal weight"
  } else {
    bmi_index <- "Overweight"
  }
  outputs <- list(
    bmi = bmi,
    bmiIndex = bmi_index
  )
  return(outputs)
}

celsius_to_fahrenheit(28)
get_bmi_and_index(191, 91)
temperature_convertor(28, is_celsius = TRUE)
temperature_convertor(82, is_celsius = FALSE)
temperature_convertor(28)