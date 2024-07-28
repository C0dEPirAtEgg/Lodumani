import math
L = int(input())
A = int(input())
B = int(input())
C = int(input())
D = int(input())

if math.ceil(A/C) >= math.ceil(B/D):
    print(L - math.ceil(A/C))
else:
    print(L - math.ceil(B/D))
