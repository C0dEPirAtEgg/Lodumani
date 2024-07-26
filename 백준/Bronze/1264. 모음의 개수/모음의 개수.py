while True:
    sum = 0
    N = input()
    if N == '#':
        break
    for i in range(len(N)):
        if N[i] == 'a' or N[i] == 'e' or N[i] == 'i' or N[i] == 'o' or N[i] =='u' or N[i] =='A'or N[i] =='E'or N[i] =='I'or N[i] =='O'or N[i] =='U':
            sum +=1
    
    print(sum)