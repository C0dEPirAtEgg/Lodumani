N = int(input())

for i in range(0,N):
    a,b,x = map(int,input().split())
    w = a*(x-1)+b
    print(w)