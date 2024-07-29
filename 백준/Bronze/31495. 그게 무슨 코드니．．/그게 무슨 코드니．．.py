S = input()

if S[0] == '"' and S[-1] == '"':
    if len(S) <=2:
        print('CE')
    else:
        S = S.replace('"','')
        print(S)
else:
    print('CE')