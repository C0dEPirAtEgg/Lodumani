# 쿼리를 작성하는 목표, 확인할 지표 : 동물의 입양일을 잘못 입력. 보호 시작일 보다 입양일이 더빠른 동물의 아이디와 이름을 조회
# 쿼리 계산 방법 : ANIMAl_INS의 DATETIME = 보호 시작일 , ANIMAL_OUTS의 DATETIME = 입양일
# 데이터의 기간 : x
# 사용할 테이블 : ANIMAL_INS, ANIMAL_OUTS
# Join KEY : ANIMAL_ID
# 데이터 특징 : 


# SELECT
#     AI.ANIMAL_ID,
#     AI.NAME
# FROM ANIMAL_INS AS AI
# INNER JOIN ANIMAL_OUTS AS AO
# ON AI.ANIMAL_ID = AO.ANIMAL_ID
# WHERE
#     AI.DATETIME > AO.DATETIME
# ORDER BY
#     AI.DATETIME

# 쿼리를 작성하는 목표, 확인할 지표 : 관리자의 실수로 일부 동물의 입양일이 잘못 입력되었습니다. 보호 시작일보다 입양일이 더 빠른 동물의 아이디와 이름을 조회하는 SQL 작성
# 쿼리 계산 방법 : 보호 테이블과 입양 테이블을 JOIN 하여 입양일이 보호시작일보다 작은 것을 찾으면 된다.
# 쿼리 결과 : ID | NAME
# 데이터의 기간 : X
# 사용할 테이블 : ANIMAL_INS, ANIMAL_OUTS
# Join KEY :
# 데이터 특징 : X


SELECT
    A1.ANIMAL_ID,
    A2.NAME
FROM ANIMAL_INS AS A1
INNER JOIN ANIMAL_OUTS AS A2
ON A1.ANIMAL_ID = A2.ANIMAL_ID
WHERE
    1=1
    AND A1.DATETIME > A2.DATETIME
ORDER BY
    A1.DATETIME














