


#C 를 시 분 으로 가공?

#시 24를 넘어갈때 분이 60분을 넘어갈때

A,B = input().split()
C = int(input())
A = int(A)
B = int(B)

H = C//60
M = C%60

if A+H+1>=24 and B+M>=60:
    print(A+H+1-24,B+M-60)
elif A+H>=24 and B+M<60:
    print(A+H-24,B+M)
elif A+H+1<24 and B+M>=60:
    print(A+H+1,B+M-60)
else:
    print(A+H,B+M)

    
 


