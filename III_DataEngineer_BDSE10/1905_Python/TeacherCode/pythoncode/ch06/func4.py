# Function definition is here
def printinfo(arg1, *vartuple):
    print("Output is: ")
    print('first:',arg1)
    for var in vartuple:
        print(var)
    print()
    return
    
# Now you can call printinfo function
printinfo(10)
printinfo(70, 60, 50)
