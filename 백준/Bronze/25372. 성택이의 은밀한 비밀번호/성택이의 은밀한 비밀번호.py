N = int(input())

for i in range(0,N):
    S = input()
    if 6 <= len(S) and len(S) <= 9:
        print('yes')
    else:
        print('no')