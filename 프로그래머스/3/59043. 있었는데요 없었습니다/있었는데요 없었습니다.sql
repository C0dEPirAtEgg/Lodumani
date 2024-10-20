# 쿼리를 작성하는 목표, 확인할 지표 : 동물의 입양일을 잘못 입력. 보호 시작일 보다 입양일이 더빠른 동물의 아이디와 이름을 조회
# 쿼리 계산 방법 : ANIMAl_INS의 DATETIME = 보호 시작일 , ANIMAL_OUTS의 DATETIME = 입양일
# 데이터의 기간 : x
# 사용할 테이블 : ANIMAL_INS, ANIMAL_OUTS
# Join KEY : ANIMAL_ID
# 데이터 특징 : 


SELECT
    AI.ANIMAL_ID,
    AI.NAME
FROM ANIMAL_INS AS AI
INNER JOIN ANIMAL_OUTS AS AO
ON AI.ANIMAL_ID = AO.ANIMAL_ID
WHERE
    AI.DATETIME > AO.DATETIME
ORDER BY
    AI.DATETIME
