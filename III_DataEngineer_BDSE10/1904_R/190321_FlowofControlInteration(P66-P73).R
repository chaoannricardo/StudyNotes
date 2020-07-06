my_vec <- 1:10
my_vec %% 2 == 0
my_vec[my_vec %% 2 == 0] #output values that qualify limitation.
my_vec %% 2 == 1
my_vec > 7
my_vec < 7

#split list
strsplit(c("LeBron James", "Steve Nash"), split = " ")
split_list <- strsplit(c("LeBron James", "Steve Nash"), split = " ")
split_list[[1]]
split_list[[1]][2]
split_list[[2]]
for(i in 1:length(split_list)){
  print(split_list[[i]][2])
}

#Break, Next Demo
for(m in month.abb){
  if(m == "Apr"){
    break
  }
  print(m);
}

for(m in month.abb){
  if(m == "Apr"){
    next
  }
  print(m);
}

#Pratice:Sampling from 1:1000 until we get a number that can be divided by 89
sampleEpoch <- 0
simulation_results <- c()
for(i in 1:1000){
  while(TRUE){
    sampleNumber <- sample(1:1000, size = 1 )
    #print(sampleNumber)
    sampleEpoch <- sampleEpoch + 1
    if(sampleNumber %% 89 == 0){
      break;
    }
  }
  simulation_results <- c(simulation_results, sampleEpoch)
}
summary(simulation_results)

#Practices: How many times do I have to roll a dice to have 3 times of six
six_count <- 0
sampleEpoch <- 0
 while(six_count < 3){
  sampleNum <- sample(1:6, size = 1)
  sampleEpoch <- sampleEpoch + 1
  if(sampleNum ==  6){
    six_count <- six_count + 1
  }
}
sampleEpoch
#Using Vector to log
simulation_rolls <- c()
for(i in 1:1000){
  roll_log <- c()
  while((sum(roll_log == 6)) < 3){
    dice_roll <- sample(1:6, size = 1)
    roll_log <- c(roll_log, dice_roll)
  }
  roll_times <- length(roll_log)
  simulation_rolls <- c(simulation_rolls, roll_times)
}
summary(simulation_rolls)
hist(simulation_rolls)

#Show the epoch of 6
#Method I
indice <- c()
for (i in 1:length(roll_log)) {
  if(roll_log[i] == 6){
    indice <- c(indice, i)
  }
}
indice
#Method II
which(roll_log == 6)

#Practice: Fibonacci
#method I
f1 <- 0
f2 <- 1
i <- 2
f_length <- 25
F_log <- c(f1, f2)
while(i < f_length){
  f  <-  F_log[i] +F_log[i-1]
  F_log <- c(F_log, f)
  i <- i + 1 
}
F_log
#method II
f1 <- 0
f2 <- 1
a <- 2
F1_log <- c(f1, f2)
for (a in 2:23) {
  f  <-  F1_log[a] +F1_log[a-1]
  F1_log <- c(F1_log, f)
  a <- a + 1   
}
F1_log


#Practice: Poker Card Back














