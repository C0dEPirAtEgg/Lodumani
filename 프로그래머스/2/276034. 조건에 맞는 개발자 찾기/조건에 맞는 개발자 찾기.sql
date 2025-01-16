SELECT
    DISTINCT ID,
    EMAIL,
    FIRST_NAME,
    LAST_NAME
FROM DEVELOPERS AS D
JOIN SKILLCODES AS S
ON D.SKILL_CODE & S.CODE
WHERE
    1=1
    AND NAME IN ('Python', 'C#')
ORDER BY
    ID

# SELECT DISTINCT(ID), EMAIL, FIRST_NAME, LAST_NAME
#     FROM DEVELOPERS D
#     JOIN SKILLCODES S
#       ON D.SKILL_CODE & S.CODE 정수를 비트연산자로 계산을하였을때 이진수에서 하나라도 1이 나타난다면 연결해주세요.                                                0101(5) & 0001(1) = 0001 JOIN , 0010(2) & 0001(1) = 0000 JOIN X
#     WHERE NAME = 'Python' OR NAME = 'C#'
#     ORDER BY 1

# Alice (SKILL_CODE = 5):
# 5의 이진수는 0101.
# Python(1, 0001): 0101 & 0001 = 0001 (True)
# C#(4, 0100): 0101 & 0100 = 0100 (True)
# 매칭: Python, C# 둘 다 보유.

# Bob (SKILL_CODE = 2):
# 2의 이진수는 0010.
# Python(1, 0001): 0010 & 0001 = 0000 (False)
# C#(4, 0100): 0010 & 0100 = 0000 (False)
# 매칭: 없음.

# Charlie (SKILL_CODE = 12):
# 12의 이진수는 1100.
# Python(1, 0001): 1100 & 0001 = 0000 (False)
# C#(4, 0100): 1100 & 0100 = 0100 (True)
# 매칭: C#만 보유.