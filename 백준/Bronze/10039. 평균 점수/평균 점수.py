a = []
k = 0
for i in range(0,5):
    k = int(input())
    if k >= 40:
        a.append(k)
    else:
        a.append(40)

print(int(sum(a)/5))