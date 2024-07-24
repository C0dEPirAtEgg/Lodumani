T,S = map(int,input().split())

if S==1 or (T<12 or T>16):
    print(280)
elif S==0 and (12<=T and T<= 16):
    print(320)