N,M = map(int,input().split())

if 1 == M or 2 == M:
    print('NEWBIE!')
elif M <= N:
    print('OLDBIE!')
else:
    print('TLE!')

