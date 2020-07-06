#«¢Åo¥@¬É
print("Hello World")
print("Hello R")

hello_msg <- "Hello R"

#Declaring Objects
my_favorite_star <- "Tom Cruise"
my_lucky_numeber <- 9
r_is_easy <- TRUE

#Declaring Functions
say_hello <- function(){
return("Hello R!")  
}

#Printing Objects
my_favorite_star
my_lucky_numeber
r_is_easy

#Calling Function
say_hello()

rm(r_is_easy)

#Install Packages
install.packages("rvest")

?read_html

library(rvest)

?read_html

#session info
sessionInfo()
Sys.getlocale()
getwd()
setwd("C:/Users/Student/Desktop") 
#Be careful that "\" in wondows are "/" in Unix and most of the computer languange.

#q to quit
q()


#Exercise
#Declaring Function
Mile <- function(k){
  k * 0.62137
}
Fahrenheit <- function(c){
  c * 1.8 + 32
}
JBMI <- function(h, w){
  w / ( h / 100 )^2
}
#Calculate the value
Mile(42.195)
Fahrenheit(24)
JBMI(191,91)

#Practice; What did Ross Geller say?
writeLines("Let\'s put aside the fact that you \"accidentally\" pick up my grand mother's ring.", con = "C:/Users/Student/Desktop/Exercise.txt")


#About sprintf()
#Could print variables with the function
ricardo_name <- "Ricardo"
ricardo_height <- 1.73
ricardo_weight <- 63
ricardo_BMI <- (ricardo_weight / ricardo_height^2)
sprintf("%s's BMI is %f", ricardo_name, ricardo_BMI)

#Exercise
Buzz <- function(i){
  if(i %% 15 == 0){
    writeLines("fizz buzz")
  }else if(i %% 5 == 0){
    writeLines("buzz")
  }else if(i %% 3 == 0){
    writeLines("fizz")
  }else{
   return(i)
  }
}

Buzz(7)












