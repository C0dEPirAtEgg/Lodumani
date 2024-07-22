a = list(input())
b = []

for i in a:
    if i.isupper() == True:
        b.append(i.lower())
    if i.islower() == True:
        b.append(i.upper())
        
result = ''.join(b)
print(result)
      

      
