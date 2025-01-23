# 쿼리를 작성하는 목표, 확인할 지표 : 보호소에서 중성화 수술을 거친 동물 정보를 알기 보호소 당시에는 중성화 되지 않았지만 나갈당시 중성화된 ID,생물종,이름을 조회 ID 순으로
# 쿼리 계산 방법 : INTACT 중성화 X, SPATED,NEUTERED 중성화 O ANIMAL_INS와 ANIMAL_OUTS의 SEX_UPON_OUTCOME 컬럼을 비교?
# 데이터의 기간 : X
# 사용할 테이블 : ANIMAL_INS,ANIMAL_OUTS
# Join KEY : ANIMAL_ID
# 데이터 특징 :


# SELECT
#     AI.ANIMAL_ID,
#     AI.ANIMAL_TYPE,
#     AI.NAME
# FROM ANIMAL_INS AS AI
# INNER JOIN ANIMAL_OUTS AS AO
# ON AI.ANIMAl_ID = AO.ANIMAL_ID
# WHERE
#     1=1
#     AND AI.SEX_UPON_INTAKE != AO.SEX_UPON_OUTCOME
# ORDER BY
#     1

# 쿼리를 작성하는 목표, 확인할 지표 : 보호소에서 중성화 수술을 거친 동물 정보를 알아보려 합니다. 보호소에 들어올 당시에는 중성화 되지 않았지만 보호소를 나갈 당시에는 중성화된 동물의 아이디와 생물 종 이름을 조회하는 아이디순으로 조회하는 SQL
# 쿼리 계산 방법 : 두개의 테이블에서 SEX_UPON_INTAKE를 비교
# 쿼리 결과 : ID | ANIMAL_TYPE | NAME
# 데이터의 기간 : x
# 사용할 테이블 : ANIMAL_INS, ANIMAL_OUTS
# Join KEY : ANIMAL_ID
# 데이터 특징 : x


SELECT
    A1.ANIMAL_ID,
    A1.ANIMAL_TYPE,
    A1.NAME
FROM ANIMAL_INS AS A1
INNER JOIN ANIMAL_OUTS AS A2
ON A1.ANIMAL_ID = A2.ANIMAL_ID
WHERE
    1=1
    AND A1.SEX_UPON_INTAKE != A2.SEX_UPON_OUTCOME
    AND (A2.SEX_UPON_OUTCOME LIKE 'Spayed%' OR A2.SEX_UPON_OUTCOME LIKE 'Neutered%')
ORDER BY
    A1.ANIMAL_ID
















