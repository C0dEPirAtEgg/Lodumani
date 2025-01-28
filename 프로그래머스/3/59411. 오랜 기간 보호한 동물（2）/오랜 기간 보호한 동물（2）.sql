# 쿼리를 작성하는 목표, 확인할 지표 : 입양을 간 동물 중, 보호기간이 가장 길었던 동물 두마리의 아이디와 이름을 조회하는 SQL문을 작성
# 쿼리 계산 방법 : INS, OUTS 테이블을 조인하여 들어올 날짜 와 나간 날짜를 뺄셈하여 보호기간을 구한후 ORDER BY사용하여 두명을 구하기        ORDER BY가 안되면 WINDOW 함수 사용
# 쿼리 결과 : ANIMAL_ID, NAME
# 데이터의 기간 : X
# 사용할 테이블 : ANIMAL_INS, ANIMAL_OUTS
# Join KEY : ANIMAL_ID
# 데이터 특징 : x


SELECT
    A1.ANIMAL_ID,
    A1.NAME
FROM ANIMAL_INS AS A1
INNER JOIN ANIMAL_OUTS AS A2
ON A1.ANIMAL_ID = A2.ANIMAL_ID
ORDER BY
    DATEDIFF(A2.DATETIME, A1.DATETIME) DESC
LIMIT
    2
    


