# dictionary
# get value
d1 = {
      "name": "tom",
      "age": 20,
      1: [1, 3, 5]
     }
print("d1 =",d1)     
print(d1["name"])
print(d1["age"])
print(d1[1])

# chage value
d1["age"] = 21
print("d1['age'] = 21 => " + str(d1))

# add item
d1["address"] = "Taipei"
print("d1['address']='Taipei'=>" + str(d1))
