# 쿼리를 작성하는 목표, 확인할 지표 : 아직 입양을 못 간 동물 중 가장 오래 보호소에 있었던 동물 3마리의 이름과 보호 시작일을 조회
# 쿼리 계산 방법 : ANIMAL_INS 테이블에는 있는 ANIMAl_OUTS 테이블는 없고 ANIMAL_ID 를 ORDER BY로 순서를 정렬하고 LIMIT 3 JOIN후 ANIMAL_OUTS ID의 NULL 값을 찾아서 추출
# 데이터의 기간 : x
# 사용할 테이블 : ANIMAL_INS, ANIMAL_OUTS
# Join KEY : ANIMAL_ID
# 데이터 특징 :
SELECT
    AI.NAME,
    AI.DATETIME
FROM ANIMAL_INS AS AI
LEFT JOIN ANIMAL_OUTS AS AO
ON AI.ANIMAL_ID = AO.ANIMAL_ID
WHERE
    AO.ANIMAl_ID IS NULL
ORDER BY
    AI.DATETIME 
LIMIT
    3
