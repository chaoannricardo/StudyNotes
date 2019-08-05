# Function definition is here
def changeme(mylist):
    print("Values in the function before change: ", mylist)
    mylist[2]=50
    print("Values in the function after change: ", mylist)
    return

# Now you can call changeme function
# MAIN
mylist = [10,20,30]
changeme(mylist)
print("Values outside the function: ", mylist)
