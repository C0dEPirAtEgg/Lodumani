N,X = map(int,input().split())
L = []
for i in range(N):
    s,t = map(int,input().split())
    if (s+t) <= X:
        L.append(s)
    
print(max(L))