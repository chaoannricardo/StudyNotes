# Function definition is here
def printinfo(name, age=35):
    print("Name: ", name)
    print("Age ", age)
    return
    
# Now you can call printinfo function
printinfo(age=50, name="miki")   # age is 50
printinfo(name="miki")   # age is 35
