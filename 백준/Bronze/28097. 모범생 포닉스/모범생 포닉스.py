N = int(input())
T = list(map(int,input().split()))
tum = 8*(N-1)
day = (sum(T)+tum)//24
hour = (sum(T)+tum)%24

print(day,hour)