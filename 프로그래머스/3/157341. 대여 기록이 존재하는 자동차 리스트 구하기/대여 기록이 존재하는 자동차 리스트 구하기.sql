# 쿼리를 작성하는 목표, 확인할 지표 : CAR_RENTAL_COMPANY_CAR 테이블과 CAR_RENTAL_COMPANY_RENTAL_HISTORY 테이블에서 자동차 종류가 '세단'인 자동차들 중 10월에 대여를 시작한 기록이 있는 자동차 ID 리스트를 출력하는 SQL문 작성 자동차 ID리스트는 중복이 없어야함
# 쿼리 계산 방법 :
# 쿼리 결과 :
# 데이터의 기간 :
# 사용할 테이블 :
# Join KEY :
# 데이터 특징 :

WITH RENTAL_CAR AS (
    SELECT
        CAR_ID
    FROM CAR_RENTAL_COMPANY_CAR
    WHERE
        1=1
        AND CAR_TYPE = '세단'
)
SELECT
    DISTINCT R.CAR_ID
FROM RENTAL_CAR AS R
INNER JOIN CAR_RENTAL_COMPANY_RENTAL_HISTORY AS C
ON R.CAR_ID = C.CAR_ID
WHERE
    1=1
    AND EXTRACT(MONTH FROM START_DATE) = 10
ORDER BY
    R.CAR_ID DESC