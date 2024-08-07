N = int(input())
x, y = 0,0
for i in range(N):
    score = input()
    if score == 'D':
        x += 1
    elif score == 'P':
        y += 1
    
    if x >= y+2:
        break
    elif y >= x+2:
        break
        
print(f'{x}:{y}')
        