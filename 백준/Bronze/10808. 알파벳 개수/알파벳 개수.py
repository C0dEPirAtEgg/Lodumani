S = input()
L_count = [0]*26

for char in S:
    index = ord(char)-ord('a')
    L_count[index] += 1 

print(' '.join(map(str,L_count)))

