#fizz_buzz.R
fizzbuzz <- function(i){
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