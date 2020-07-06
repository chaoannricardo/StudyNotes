#read.csv
diamonds_csv <- read.csv("C:/Users/richi/Desktop/diamonds.csv")
str(diamonds_csv) #'data.frame'
diamonds_csv
diamonds_csv$cut
levels(diamonds_csv$cut) #"Fair"      "Good"      "Ideal"     "Premium"   "Very Good"
class(diamonds_csv$cut) #factor
factor() #transform vector into factor vector
#factor(vector, levels =, oordered = TRUE)
#paste(target, collapse = ",")
nrow(diamonds_csv)
unique(diamonds_csv$cut)





