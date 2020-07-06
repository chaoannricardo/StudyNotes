lst = ['physics', 'chemistry', 1997, 2000]
print("Value available at index 2 : ", lst[2])
print("ID of lst is",id(lst))

lst[2] = 2001
print("New value available at index 2 : ", lst[2])

print(lst)
del lst[2]

print("After deleting value at index 2 : ", lst)
print("Length of list : ", len(lst))
print("ID of lst is",id(lst))
