# list
# Concatenation
list1 = [2, 4]
list2 = [6, 8, 10]
print("list1 =",list1)
print("ID of list1 is",id(list1))
print("list2 =",list2)
print("ID of list 2 is",id(list2))
list3 = list1 + list2
print("list3=list1+list2 =",list3)
print("ID of list 3 is",id(list3))

# Repetition
list4 = list1 * 3
print("list4=list1*3 =",list4)
print("ID of list4 is",id(list4))

# Member
print(8 in list2)       # True
print(2 not in list1)   # False
