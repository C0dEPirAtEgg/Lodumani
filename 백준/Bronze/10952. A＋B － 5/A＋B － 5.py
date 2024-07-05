import sys
for _ in iter(lambda: True, False):
    A,B = map(int,sys.stdin.readline().strip().split())
    if A==0 and B==0:
        break
    print(A+B)