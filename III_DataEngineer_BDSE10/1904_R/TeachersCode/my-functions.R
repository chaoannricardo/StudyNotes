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

get_tidy_df <- function(xls_file_path) {
  df_rows <- read_excel(xls_file_path, skip = 5, col_names = FALSE)
  # 調整候選人黨籍
  candidates <- colnames(read_excel(xls_file_path, skip = 2, n_max = 2))
  candidates_split <- strsplit(candidates, split = "\n")
  numbers <- c()
  candidate_names <- c()
  parties <- c()
  for (e in candidates_split) {
    if (length(e) == 2) {
      party <- "無黨籍"
    } else {
      party <- e[3]
    }
    parties <- c(parties, party)
    numbers <- c(numbers, e[1])
    candidate_names <- c(candidate_names, e[2])
  }
  candidates <- paste(numbers, candidate_names, parties)
  # 自訂 header
  header <- c("district", "village", "office", candidates, LETTERS[1:8])
  df <- df_rows
  colnames(df) <- header
  # 去掉 district 全形空格
  df$district <- gsub(pattern = "　", df$district, replacement = "")
  # 補行政區
  for (i in 1:length(df$district)) {
    if (nchar(df$district[i]) == 0) {
      df$district[i] <- df$district[i - 1]
    }
  }
  # 刪除小計的列數
  is_complete <- complete.cases(df)
  df_wide <- df[is_complete, ]
  df_wide$office <- as.integer(df_wide$office)
  n_candidates <- ncol(df_wide) - 11
  # transpose
  df_wide_select <- df_wide[, 1:(3+n_candidates)]
  df_long <- gather(df_wide_select, key = "candidate_info", value = "votes", candidates)
  split_candidate_info <- strsplit(df_long$candidate_info, split = " ")
  numbers <- c()
  candidate_names <- c()
  parties <- c()
  for (e in split_candidate_info) {
    numbers <- c(numbers, as.integer(e[1]))
    candidate_names <- c(candidate_names, e[2])
    parties <- c(parties, e[3])
  }
  df_long$number <- numbers
  df_long$candidate <- candidate_names
  df_long$party <- parties
  df_long$candidate_info <- NULL
  df_long <- df_long[, c("district", "village", "office", "number", "candidate", "party", "votes")]
  outputs <- list(
    wide = df_wide,
    long = df_long
  )
  return(outputs)
}