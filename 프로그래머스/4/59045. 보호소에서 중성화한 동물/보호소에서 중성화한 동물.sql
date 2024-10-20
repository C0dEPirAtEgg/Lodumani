# 쿼리를 작성하는 목표, 확인할 지표 : 보호소에서 중성화 수술을 거친 동물 정보를 알기 보호소 당시에는 중성화 되지 않았지만 나갈당시 중성화된 ID,생물종,이름을 조회 ID 순으로
# 쿼리 계산 방법 : INTACT 중성화 X, SPATED,NEUTERED 중성화 O ANIMAL_INS와 ANIMAL_OUTS의 SEX_UPON_OUTCOME 컬럼을 비교?
# 데이터의 기간 : X
# 사용할 테이블 : ANIMAL_INS,ANIMAL_OUTS
# Join KEY : ANIMAL_ID
# 데이터 특징 :


SELECT
    AI.ANIMAL_ID,
    AI.ANIMAL_TYPE,
    AI.NAME
FROM ANIMAL_INS AS AI
INNER JOIN ANIMAL_OUTS AS AO
ON AI.ANIMAl_ID = AO.ANIMAL_ID
WHERE
    1=1
    AND AI.SEX_UPON_INTAKE != AO.SEX_UPON_OUTCOME
ORDER BY
    1
    