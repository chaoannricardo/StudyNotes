#switch
switch0 <- function(x){
  switch(x,
         "a" = "first",
         "b" = "second",
         "c" = "third",
         "d" = "fourth"
  )
}
switch0("a")
switch0(1)
switch0(2)

#ifelse
ifelse(1 == 1, "yes", "no")
test <- c(1, 2, 3, 4, 5, 6, 7, 8, 9, 0)
ifelse(test == 1, "yes", "no")
ifelse(test == 1, test, "no")

#duplicated ifelse
a <- c(1, 1, 0, 1)
b <- c(2, 1, 0, 1)
ifelse(a == 1 & b == 2, "yes", "no")
ifelse(a == 1 && b == 2, "yes", "no")


















