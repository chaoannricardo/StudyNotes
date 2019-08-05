# break statement
target = 38
guess = 1
while True:
    guess = int(input("Guess the number(1~100) =>"))
    if target == guess:
        break      # exit loop
    
    if guess > target:
        print("too big!")
    else:
        print("too small!")
print("Bingo :",target)


