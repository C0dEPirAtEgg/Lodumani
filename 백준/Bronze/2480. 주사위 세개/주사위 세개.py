

n1,n2,n3 = input().split()

n1 = int(n1)
n2 = int(n2)
n3 = int(n3)

if n1 == n2 and n2 == n3:
    print(10000+n1*1000)
elif n1 == n2:
    print(1000+n1*100)
elif n1 == n3:
    print(1000+n1*100)
elif n2 == n3:
    print(1000+n2*100)
elif n1 != n2 and n2 != n3:
    if(n1>=n2 and n1>=n3):
        print(n1*100)
    elif(n2>=n1 and n2>=n3):
        print(n2*100)
    elif(n3>=n1 and n3>=n2):
        print(n3*100)