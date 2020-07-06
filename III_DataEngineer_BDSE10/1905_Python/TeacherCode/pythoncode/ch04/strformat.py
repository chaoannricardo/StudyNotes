# string formatted
# format method
x, y, z = 10, 20, 30
s = "Y= {1} X={0} Z={2}".format(x, y, z)
print(s)
s = "Y= {a} X={b} Z={c}".format(b=x, a=y, c=z)
print(s)

print("Integer: {0:5d}".format(123))
print("Integer: {0:05d}".format(123))
print("Float: {0:6.3f}".format(123.45678))
print("Binary: {0:b}".format(100))
print("Octal: {0:o}".format(100))
print("Hex: {0:x}".format(100))