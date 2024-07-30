sum = 0
N = int(input())
L = list(map(int,input().split()))
for i in range(len(L)):
    if N >= L[i]:
        sum+=L[i]
    else:
        sum+=N
        
print(sum)