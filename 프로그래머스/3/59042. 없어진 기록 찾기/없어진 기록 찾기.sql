# 쿼리를 작성하는 목표, 확인할 지표 : 입양을 간 기록은 있는데 보호소에 들어온 기록이 없는 동물의 ID와 이름을 ID순으로 조회
# 쿼리 계산 방법 : ANIMAL_ID를 통해 두개의 테이블을 조인하는데 ANIMAL_OUTS를 기준으로 LEFT JOIN을 걸고 만약 ANIMAL_INS 의 ANIMAL_ID 가 NULL인데 ANIMAL_OUTS 의 ANIMAL_ID가 있는경우
# 데이터의 기간 : x
# 사용할 테이블 : ANIMA_INS, ANIMAL_OUTS
# Join KEY : ANIMAL_ID
# 데이터 특징 : 


# SELECT
#     AO.ANIMAL_ID,
#     AO.NAME
# FROM ANIMAL_OUTS AS AO
# LEFT JOIN ANIMAL_INS AS AI
# ON AO.ANIMAL_ID = AI.ANIMAL_ID
# WHERE
#     AI.ANIMAL_ID IS NULL
# ORDER BY
#     1

# 쿼리를 작성하는 목표, 확인할 지표 : 천재지변으로 인해 데이터가 유실되었습니다. 입양을 간 기록은 있는데, 보호소에 들어온 기록이 없는 동물의 ID 와 이름을 ID순으로 조회
# 쿼리 계산 방법 :
# 쿼리 결과 : ID | NAME
# 데이터의 기간 : X
# 사용할 테이블 : ANIMAL_INS, ANIMAL_OUTS
# Join KEY :
# 데이터 특징 : X


SELECT
    A1.ANIMAL_ID,
    A1.NAME
FROM ANIMAL_OUTS AS A1
LEFT JOIN ANIMAL_INS AS A2
ON A1.ANIMAL_ID = A2.ANIMAL_ID
WHERE
    1=1
    AND A2.ANIMAL_ID IS NULL
ORDER BY
    ANIMAL_ID















