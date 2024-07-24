N = int(input())
sum1 = 0
sum2 = 0
for i in range(0,N):
    S = input()
    if S == 'Never gonna give you up':
        sum1 +=1
    if S == 'Never gonna let you down':
        sum1 +=1
    if S == 'Never gonna run around and desert you':
        sum1 +=1
    if S == 'Never gonna make you cry':
        sum1 +=1
    if S == 'Never gonna say goodbye':
        sum1 +=1
    if S == 'Never gonna tell a lie and hurt you':
        sum1 +=1
    if S == 'Never gonna stop':
        sum1 +=1
    if sum1 !=1:
        sum2 +=1
    sum1 = 0    
        
if sum2 >=1:
    print('Yes')
else:
    print('No')