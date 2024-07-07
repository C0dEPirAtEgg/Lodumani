import sys

N = list(map(int,sys.stdin.readline().strip().split()))

sum = 0
for i in N:
    sum += i*i
print(sum%10)