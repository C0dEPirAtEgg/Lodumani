# 쿼리를 작성하는 목표, 확인할 지표 : 2022년 10월 16일 대여 중인 자동차 대여중 
# 쿼리 계산 방법 : START_DATE 와 END_DATE 사이에 2022년 10월 16일 있으면 대여중 없으면 대여가능
# CAR_ID 가 있으면 CAR_ID를 기준으로 대여중, 대여가능 CASE WHEN THEN END 사용
# 데이터의 기간 :
# 사용할 테이블 : CAR_RENTAL_COMPANY_RENTAL_HISTORY
# Join KEY :
# 데이터 특징 :

WITH RENTAL AS (
    SELECT
        *
    FROM CAR_RENTAL_COMPANY_RENTAL_HISTORY
    WHERE
        1=1
        AND START_DATE <= '2022-10-16'
        AND END_DATE >= '2022-10-16'
)
SELECT
    DISTINCT CRCRH.CAR_ID,
    CASE
        WHEN R.car_id IS NULL THEN '대여 가능'
        WHEN R.car_id IS NOT NULL THEN '대여중'
    END AS AVAILABILITY
FROM CAR_RENTAL_COMPANY_RENTAL_HISTORY AS CRCRH
LEFT JOIN RENTAL AS R
ON CRCRH.car_id = R.car_id
ORDER BY
    CAR_ID DESC