K,N,M = map(int,input().split())

KNsum = K * N
if KNsum > M:
    print(KNsum-M)
else:
    print(0)