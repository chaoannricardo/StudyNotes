# my-functions.R
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

is_prime <- function(x) {
  div_counter <- 0
  for (i in 1:x) {
    if (x %% i == 0) {
      div_counter <- div_counter + 1
      #print(i)
      #if (div_counter > 2) {
      #  break
      #}
    }
  }
  if (div_counter == 2) {
    return(TRUE)
  } else {
    return(FALSE)
  }
}
