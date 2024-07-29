A,B = map(int,input().split())

if (A+B)%2==0 and A >= B:
    print(int((A+B)/2), int((A-B)/2))
else:
    print(-1)