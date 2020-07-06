# set
A = {1, 2, 3, 4, 5}
B = {4, 5, 6, 7, 8}
print("A =",A)
print("B =",B)

# intersection
C = A & B
print("A & B =",C)
C = A.intersection(B)
print("A.intersection(B) =",C)

# union 
C = A | B
print("A | B =",C)
C = A.union(B)
print("A.union(B) =",C)

# difference
C = A - B
print("A - B =",C)
C = A.difference(B)
print("A.difference(B) =",C)

# symmetric difference
C = A ^ B
print("A ^ B =",C)
C = A.symmetric_difference(B)
print("A.symmetric_difference(B) =",C)