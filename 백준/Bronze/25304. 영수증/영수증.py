
X = int(input())
N = int(input())
sum = 0
for i in range(1,N+1):
    price,n = input().split()
    price = int(price)
    n = int(n)
    sum += (price * n)
    
if sum == X:
    print('Yes')
else:
    print('No')