# string operators
# using index
str1 = 'Hello'
print("str1 =",str1)
print(str1[0])   # H
print(str1[1])   # e
print(str1[-1])  # o
print(str1[-2])  # l

# Concatenation
str2 = " World!"
str3 = str1 + str2
print("str2 = ",str2)
print("str1 + str2 = " + str3)

# Repetition
str4 = str1 * 3
print("str1 * 3 =",str4)

# Member
str5 = "Welcome!"
print("come" in str5)       # True
print("come" not in str5)   # False

# Relational
print("green" == "glow", "green" != "glow",
      "green" > "glow", "green" >= "glow",
      "green" < "glow" , "green" <= "glow")

