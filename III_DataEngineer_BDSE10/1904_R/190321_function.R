#function
celsius_to_fahrenheit <- function(a){
  x_fahrenheit <- a*1.8 + 32
  return(x_fahrenheit)
}
celsius_to_fahrenheit(25)

#function with 2 inputs
get_bmi <- function(h, w){
  bmi <- w / (h*0.01)^2
  return(bmi)
}
get_bmi(173, 63)

#function with adjustable inputs
temperature_convertor <- function(x, is_celsius){
  if(is_celsius){
    y <- x*1.8 + 32
  }else{
    y <- (x-32) / 1.8
  }
  return(y)
}
temperature_convertor(24, TRUE)
temperature_convertor(75.2, FALSE)
