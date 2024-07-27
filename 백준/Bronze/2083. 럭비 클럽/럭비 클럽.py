while True:
    A = list(input().split())
    if A[0] == '#' and A[1] == '0' and A[2] == '0':
        break
    
    if int(A[1]) > 17 or int(A[2]) >=80:
        print(f'{A[0]} Senior')
    else:
        print(f'{A[0]} Junior')