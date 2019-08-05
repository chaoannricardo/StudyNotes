# for list
list1 = [x for x in range(10)]
print("[x for x in range(10)]")
print(list1)

list2 = [x+1 for x in range(10)]
print("[x+1 for x in range(10)]")
print(list2)

list3 = [x for x in range(10) if x % 2 == 0]
print("[x for x in range(10) if x%2==0]")
print(list3)

list4 = [x*2 for x in range(10) if x % 2 == 0]
print("[x*2 for x in range(10) if x%2==0]")
print(list4)


