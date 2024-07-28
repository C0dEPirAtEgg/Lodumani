N = input()
M = 'aeiou'
count = 0
for i in N:
    if i in M:
        count+=1

print(count)