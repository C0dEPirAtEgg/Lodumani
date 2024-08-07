N,M = map(int,input().split())
sum = 0
for i in range(N):
        K = input()
        if K.count('O')>= (M//2 +1):
            sum +=1
            
print(sum)