
run,bus,sub = map(int,input().split())

if run < sub:
    if bus < sub:
        print('Bus')
    elif sub < bus:
        print('Subway')
    else:
        print('Anything')
elif run == sub:
    if sub < bus:
        print('Subway')
    elif bus < sub:
        print('Bus')
    else:
        print('Anything')
elif bus < sub:
    print('Bus')
#elif run == sun and sub == bus:
#    print('Anything')
