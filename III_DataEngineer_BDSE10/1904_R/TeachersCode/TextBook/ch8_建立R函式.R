#Say Hello
say.hello <- function(){
print("Hello World")
}

#Special Input Character
sprintf("My name is %s", "Ricardo")
sprintf("%s name is %s", "His", "Ricardo")
name <- function(first, last){
  sprintf("%s name is %s", first, last)
}

#Return
return0 <- function(){
  return("Ricardo")
}
return0()

#do call
do.call(name, args = list(first = "My", last = "Ricardo"))
