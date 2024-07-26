A, B, C = map(int, input().split())
D = int(input())


A1 = D // 3600
B1 = (D % 3600) // 60
C1 = (D % 3600) % 60


C += C1
if C >= 60:
    C -= 60
    B += 1


B += B1
if B >= 60:
    B -= 60
    A += 1


A += A1
if A >= 24:
    A = A % 24

print(f'{A} {B} {C}')
