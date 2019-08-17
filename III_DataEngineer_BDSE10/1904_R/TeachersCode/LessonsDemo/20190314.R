# 2019-03-14
# 哈囉世界
print("Hello world")
print("Hello R!")

# <- or =
# alt -
hello_msg <- "Hello world"
say_hello <- function(x) {
  msg <- sprintf("Hello %s", x)
  return(msg)
}
say_hello("world")
?print
help(print)

# Declaring objects
my_favorite_star <- "Tom Hanks"
my_lucky_number <- 87
r_is_easy <- TRUE # logical

library(rvest)
?read_html

help(help)
?help

?iris
?cars
?mtcars

setwd("C:\Users\Student")
setwd("C:/Users/Student")
getwd()
q()

lucky_num <- 24
LETTERS

?class
class(87L)
class(8.7L)
class(8 + 7i)

mcd <- "I\'m lovin\' it"
my_fav_center <- 'Shaquille O\'Neal'
writeLines("My favorite burger is \"big mac\".", con = "C:/Users/Student/Desktop/big_mac.txt") # stdout
xx <- 'Let\'s put aside the fact that you "accidentally" pick up my grand mother\'s ring.'
yy <- "Let's put aside the fact that you \"accidentally\" pick up my grand mother's ring."

player_name <- "Shaquille O'Neal"
player_height <- 2.16
player_weight <- 147
player_bmi <- player_weight / player_height**2
sprintf("%s's BMI is %s", player_name, player_bmi)
sprintf("%s's BMI is %f", player_name, player_bmi)
sprintf("%s's BMI is %.0f", player_name, player_bmi)
sprintf("%s's BMI is %.2f", player_name, player_bmi)
sprintf("%s's BMI is %e", player_name, player_bmi)
?sprintf

8 > 7
8 < 7

lucky_nums <- c(24, 42)
skywalkers <- c("Anakin Skywalker", "Luke Skywalker")
true_false <- c(TRUE, FALSE)
?c

87 %in% lucky_nums
24 %in% lucky_nums
FALSE %in% true_false
TRUE %in% true_false
"true" %in% true_false # v
"TRUE" %in% true_false # x

TRUE && TRUE
TRUE && FALSE
FALSE && FALSE

TRUE & TRUE
TRUE & FALSE
FALSE & FALSE

TRUE || TRUE
TRUE || FALSE
FALSE || FALSE

TRUE | TRUE
TRUE | FALSE
FALSE | FALSE


c(TRUE, TRUE) && c(FALSE, TRUE) # FALSE
c(TRUE, FALSE) || c(FALSE, FALSE) # TRUE

c(TRUE, TRUE, FALSE) & c(FALSE, TRUE, FALSE)
c(TRUE, FALSE, TRUE) | c(FALSE, FALSE, TRUE)

lucky_nums * 10
LETTERS > letters
letters > LETTERS

(1:10)**2

matrix(c(1,2,3), nrow=3) %*% matrix(c(1,2,3), ncol=3)

mat_a <- matrix(1:9, nrow = 9)
mat_b <- matrix(1:9, ncol = 9)
mat_a %*% mat_b

"哈囉" + "世界"
"哈囉" * 3

integer <- 6
if (integer %% 3 == 0) {
  "Hello" # run!
} else if (integer %% 3 == 1) {
  "World"
} else {
  "R"
}

player_name <- "LeBron James"
player_height <- 2.03
player_weight <- 113
player_bmi <- player_weight / player_height**2

if (player_bmi > 30) {
  player_bmi_index <- "Obese"
} else if (player_bmi < 18.5) {
  player_bmi_index <- "Under weight"
} else if ((player_bmi >= 18.5) & (player_bmi < 25)) {
  player_bmi_index <- "Normal weight"
} else {
  player_bmi_index <- "Overweight"
}

player_bmi_index
msg <- sprintf("%s's BMI is %.4f and his BMI index is %s", player_name, player_bmi, player_bmi_index)
msg

get_bmi_index <- function(player_name, player_height, player_weight) {
  player_bmi <- player_weight / player_height**2
  
  if (player_bmi > 30) {
    player_bmi_index <- "Obese"
  } else if (player_bmi < 18.5) {
    player_bmi_index <- "Under weight"
  } else if ((player_bmi >= 18.5) & (player_bmi < 25)) {
    player_bmi_index <- "Normal weight"
  } else {
    player_bmi_index <- "Overweight"
  }
  
  player_bmi_index
  msg <- sprintf("%s's BMI is %.4f and his BMI index is %s", player_name, player_bmi, player_bmi_index)
  return(msg)
}

players <- c("Manute Bol", "LeBron James", "Michael Jordan", "Shaquille O'Neal")
heights <- c(2.31, 2.03, 1.98, 2.16)
weights <- c(91, 113, 98, 147)

for (i in 1:4) {
  print(get_bmi_index(players[i], heights[i], weights[i]))
}

int <- 30
if (int %% 15 == 0) {
  print("fizz buzz")
} else if (int %% 3 == 0) {
  print("fizz")
} else if (int %% 5 == 0) {
  print("buzz")
} else {
  print(int)
}