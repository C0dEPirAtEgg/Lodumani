
A = list(map(int,input().split()))
B = [1,1,2,2,2,8]
C = [0,0,0,0,0,0]
length = len(A)
for i in range(length):
    C[i] = B[i] - A[i]
print(*C)
