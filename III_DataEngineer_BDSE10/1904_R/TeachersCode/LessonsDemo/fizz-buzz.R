# fizz-buzz.R
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