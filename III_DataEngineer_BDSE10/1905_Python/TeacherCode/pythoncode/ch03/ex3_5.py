a = 20
b = 20
print('result 1:','a=',a,':',id(a), 'b=',b,':',id(b))

if a is b:
    print("result 2: a and b have same identity")
else:
    print("result 2: a and b do not have same identity")

if id(a) == id(b):
    print("result 3: a and b have same identity")
else:
    print("result 3: a and b do not have same identity")

b = 30
print('result 4:','a=',a,':',id(a), 'b=',b,':',id(b))

if a is not b:
    print("result 5: a and b do not have same identity")
else:
    print("result 5: a and b have same identity")
