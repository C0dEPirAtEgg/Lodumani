A = int(input())
B = int(input())
C = int(input())
D = int(input())
E = int(input())

time = 0

if A <= 0:
    time += (0-A)*C+D+(B * E)
elif A >= 0:
    time += (B-A)*E
    
print(time)
    
    