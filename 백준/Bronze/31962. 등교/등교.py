"""
N,X = map(int,input().split())
L = []
for i in range(N):
    s,t = map(int,input().split())
    if (s+t) <= X:
        L.append(s)
    
print(max(L))
"""
N, X = map(int, input().split())

latest_departure = -1

for _ in range(N):
    S, T = map(int, input().split())
    if S + T <= X:
        latest_departure = max(latest_departure, S)

print(latest_departure)