# dictionary
d1 = {"tom":30, "bobe":3}
print("d1 =",d1)
print("ID of d1 is", id(d1))
d2 = {"bobe":3, "tom":30}
print("d2 =",d2)
print("ID of d2 is", id(d2))

# Member
print("tom" in d1)       # True
print("tom" not in d1)   # False

# Relational
print(d1 == d2)  # True
print(d1 != d2)  # False
