
h,m = input().split()
h = int(h)
m = int(m)

if h == 0 and m-45 >=0:
    print(h,m-45)
elif h == 0 and m-45<0:
    print(h+23,60+m-45)
elif m-45>=0:
    print(h,m-45)
elif m-45<0:
    print(h-1,60+m-45)
else:
    print(h,m-45)
