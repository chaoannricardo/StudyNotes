total = 0   # This is global variable
# Function definition is here
def sum_data(arg1, arg2):
    total = arg1 + arg2; # total is local variable
    # print 30
    print("Inside the function local total : ", total)
    return total
    
# Now you can call sum function
sum_data(10, 20)
# print 0
print("Outside the function global total : ", total)
