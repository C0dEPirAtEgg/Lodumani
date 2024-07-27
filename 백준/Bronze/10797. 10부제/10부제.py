D = int(input())
C = list(map(int,input().split()))
sum = 0

for i in C:
    if D == i:
        sum+=1

print(sum)