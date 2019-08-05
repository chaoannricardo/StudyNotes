#190315
sprintf("%.8f", pi)
sprintf("%.10f", pi)
format(pi, digit = 10)
#global options, not recommended

#Check variable class
class(87)
is.numeric(87)
is.numeric("87") #is String
is.character("87")
is.character(TRUE)
is.logical(TRUE)
is.logical(T)

# Use as. for conversion
#as numeric
as.numeric("8.787")
as.numeric("SkyWalker") #not available (N/A)
as.numeric(TRUE) #1
as.numeric(FALSE) #0

#as character
as.character(87) #you could almost convert everything into character by the function.
as.character(T) #output "True"

#as logical
as.logical(1)
as.logical(0)
as.logical(0.56789) #numeric other than 0  would be considered as "TRUE"
as.logical(pi) #numeric other than 0  would be considered as "TRUE"
as.logical(-0.12345) #numeric other than 0  would be considered as "TRUE"
as.logical("true") #TRUE
as.logical("tRue") #N/A
as.logical("True") #TRUE
as.logical("TRUE") #TRUE

#Date
Sys.Date() #throws current system date.
class(Sys.Date()) #Date
as.Date("1960-01-01")
as.Date("1960/01/01")
?date #Search "Conversion"
as.Date("¤@¤ë, 01, 1960", format = "%b, %d, %Y")

#as.numeric(sysdate)
sysdate <- Sys.Date()
as.numeric(sysdate) #17970
as.numeric(sysdate - 1)
sysdate - as.numeric(sysdate) #"1970-01-01", UNIX TIME,
yearHasPassedSince1970 <- 17970 / 365
yearHasPassedSince1970 #49.23288
originaldate <-  sysdate - as.numeric(sysdate)
as.numeric(originaldate) #0

#Practice: How many years does the Beatles has rocked since 1960?
sysdate <- Sys.Date() #current date
beatlesToday <- as.numeric(sysdate) #(numeric)current date
beatlesFormed <- as.numeric(as.Date("1960-01-01")) #(numeric)(date)"1960-01-01"
daysBeatles <- beatlesToday - beatlesFormed
yearsBeatles <- daysBeatles %/% 365
yearsBeatles

#POSIXct
systime <- Sys.time()
class(systime) #"POSIXct" "POSIXt" ("POSIXct" succeed "POSIXt")
as.numeric(systime) #1552616485
systime - as.numeric(systime) #"1970-01-01 08:00:00 CST" (Origin Time (00:00 in England))
origin_time_london <- as.POSIXct("1970-01-01 00:00:00", tz = "GMT")
as.numeric(origin_time_london) #0
OlsonNames() #Time Zones accepted by R
origin_time_hawaii <- as.POSIXct("1970-01-01 00:00:00", tz = "US/Hawaii")
as.numeric(origin_time_hawaii)

#Some Clarifies
class(Inf) #infinity
class(-Inf)
as.logical(Inf)
as.logical(-Inf)
is.logical(Inf)
#In R, "divided by zero" does not throw out errors.

#Practice: The 921 Earthquake(P54)
first_shock <- as.POSIXct("1999-09-21 01:47:16")
first_shock_time <- as.numeric(first_shock) #937849636 (UNIX seconds)
second_shock <- as.POSIXct("1999-09-21 01:57:15")
second_shock_time <- as.numeric(second_shock) #937850235 (UNIX seconds)
time_gap <- (second_shock_time - first_shock_time) 
time_gap #599 (Seconds)
minute_gap <- (second_shock - first_shock) #Time difference of 9.983333 mins


#matrix
matrix(c(1,2,3,4), nrow = 2) %*% matrix(c(1,2,3,4), nrow = 2) #¤º¿n
matrix(c(1,2,3,4), nrow = 2) **2
matrix(c(1,2,3,4), nrow = 2) * matrix(c(1,2,3,4), nrow = 2)

#Vector Type Tranform
lucky_nums <- c(87, 78, 5566)
lucky_nums0 <- c(TRUE, FALSE, "5566", 87.78654)
class(lucky_nums0) 

mixed_vec <- c(TRUE, FALSE)
class(mixed_vec) #logical
mixed_vec <- c(mixed_vec, 5566L)
class(mixed_vec) #transform into integer (region of Integer is larger)
mixed_vec <- c(mixed_vec, 8.787)
class(mixed_vec) #transform into numeric (float)
mixed_vec <- c(mixed_vec, "56shallnotfall")
class(mixed_vec) #transform into character
#To put different Datatypes, use "list" or "Dataframe"


#Slicing & Indexing (P60)
mixed_vec[1]
mixed_vec[3] #Vector index starts from "1"
mixed_vec[-1] #Take out elements other than "index 1"
mixed_vec[-2] #Take out elements other than "index 2"
length(mixed_vec)
mixed_vec[c(1,4)] #Take out elements 
seq(1,3) #1-3
seq(1, to = 10, by = 2) #1,3,5,7,9
mixed_vec[1:3] #Take out elements from 1 to 3
mixed_vec[c(1,4)] #Slicing

#Logical Filtering (P65)
mixed_vec[c(TRUE, FALSE, TRUE, FALSE)] #logical filtering (basic)
mixed_vec == "56shallnotfall" #logical filtering 
mixed_vec == 5566L
(mixed_vec == "56shallnotfall") & (mixed_vec == 5566L) #logical filtering (and)
(mixed_vec == "56shallnotfall") | (mixed_vec == 5566L) #logical filtering (or)
mixed_vec %in% c("56shallnotfall", 5566L) #logical filtering (or)

#Random Seeds
set.seed(87)   #acquire random seed -> cause samples may be similar among all the sampling.
for(i in 1:10){
  print (sample(1:100, size = 1))
}

#sampling(Random)
for(i in 1:10){
print (sample(1:100, size = 1))
}
set.seed(87)    
random_number <- sample(1:1000, size = 100)
head(random_number)   #Pick head numbers of the sample

#Practice: finding odd numbers in random_number
set.seed(87)    #acquire random seed -> cause sample may be similar among all the sampling.
random_number <- sample(1:1000, size = 100) #Sampling
random_number_odd <- (random_number %% 2 == 1)
random_number_odd
random_number[random_number_odd] #print out the elements of "random_number_odd"

#install.packages("ggplot2")
install.packages("ggplot2") #grammar of graphics
library(ggplot2)
?diamonds
head(diamonds) #Show first couple rows of data
dim(diamonds)  #show basic info of dataset (dimension)
View(diamonds) #View data in table
str(diamonds) #Show description of the table column
diamonds$cut #same as "diamond.cut" within other computer language.
diamonds[["cut"]] #same as "diamonds$cut"
head(diamonds$cut) #Also output the level, means the factors contain values
head(as.character(diamonds$cut)) #Only output factors
as.numeric(diamonds$cut) #Only output factors(Only output numeric values)
as.numeric(as.character(diamonds$cut))

diamonds_cut_lv <- levels(diamonds$cut) #leave levels of diamonds$cut
diamonds_cut <- factor(diamonds_cut_lv) #contain the factor
diamonds_cut[1:3] #leave only the first three levels
c(diamonds_cut, "Awesome") #???

#Rename Files by R
setwd("")
?list
list.files() #Shows the files within the directory
list_files <- list.files()
is_xlsx <- grepl(pattern = ".xlsx", list_files) #find .xlsx within the directory
xlsx_names_org <- list.files[is_xlsx] #find .xlsx within the directory
?file.rename
xlsx_names_chg <- sprintf("%03.f.xlsx", 1:length(xlsx_names_org)) #File name you want to change to.
paste0(1:100, ".xlsx") #paste (1-100).xlsx
file.rename(from = xlsx_names_org, to = xlsx_names_chg) #Change File name


#Vector is iterable 
for(i in 1:9){
  print(i)
}

#New Iterator Concept
LETTERS
letters
month.abb
month.name
for(LETTER in LETTERS){
  print(LETTER)
}

#source (R Packages)
setwd("C:/R") #Set working directory
source("fizz-buzz.R") #source the R Script
for(int in 1:100){
  print(fizzbuzz(int))
  
}

#Practice: Is "a" a Prime
Prime <- function(a){
  div_counter <-  0
  for(i in 1:a)
    if(a %% i == 0){
      div_counter = div_counter +1
    }
  if(div_counter > 2){
    return("Not Prime")
  }else{
    return("Prime")
  }
}
Prime(89)











