-- 대여 시작일을 기준으로 2022년 8월부터 2022년 10월까지 총 대여 횟수가 5회 이상인 자동차들에 대해서 월별 자동차 ID 별 총 대여 횟수 컬럼명 : REcORDS 리스트를 출력
-- start_date가 8월,9월,10월인 데이터
-- 결과 MONTH | CAR_ID | RECORDS
-- CAR_ID | RECORDS 수가 5이상
-- 21 18 20 12 11 10 19 8 7 25 23 5 2 28 13 27 15
# WITH count5 AS (
#     SELECT
#         car_id
#     FROM CAR_RENTAL_COMPANY_RENTAL_HISTORY
#     WHERE
#         1=1
#         AND start_date BETWEEN '2022-08-01' AND '2022-10-31'
#     GROUP BY
#         car_id
#     HAVING
#         COUNT(*) >= 5
# )
# SELECT
#     MONTH(start_date) AS MONTH,
#     crcrh.car_id,
#     COUNT(*) AS RECORDS
# FROM CAR_RENTAL_COMPANY_RENTAL_HISTORY AS crcrh
# INNER JOIN count5 c5
# ON crcrh.car_id = c5.car_id
# WHERE
#     1=1
#     AND start_date BETWEEN '2022-08-01' AND '2022-10-31'
# GROUP BY
#     MONTH(start_date),
#     crcrh.car_id
# ORDER BY
#     MONTH,
#     crcrh.car_id DESC
    
# SELECT 
#     Month(start_date) MONTH,
#     car_id,
#     Count(*) AS RECORDS
# FROM car_rental_company_rental_history
# WHERE
#     1=1
#     AND car_id IN (SELECT 
#                         car_id
#                    FROM car_rental_company_rental_history
#                    WHERE  
#                         1=1
#                         AND
#                         start_date BETWEEN '2022-08-01' AND '2022-10-31'
#                    GROUP BY
#                         car_id
#                    HAVING 
#                         Count(*) >= 5)
#     AND start_date BETWEEN '2022-08-01' AND '2022-10-31'
# GROUP BY 
#     month,
#     car_id
# ORDER  BY 
#     month,
#     car_id DESC

# 쿼리를 작성하는 목표, 확인할 지표 : CAR_RENTAL_COMPANY_RENTAL_HISTORY 테이블에서 대여 시작일을 기준으로 2022년 08월부터 2022년 10월까지 총 대여 횟수가 5회 이상인 자동차들에 대해서 해당 기간 동안의 월별 자동차 ID 별 총 대여횟수 리스트 출력
# 쿼리 계산 방법 :
# 쿼리 결과 : month | car_id | 대여횟수
# 데이터의 기간 : 2022년 08월 ~ 2022년 10월
# 사용할 테이블 : CAR_RENTAL_COMPANY_HISTORY
# Join KEY : 
# 데이터 특징 : X


WITH CTE1 AS (
    SELECT
        EXTRACT(MONTH FROM START_DATE) AS MONTH,
        CAR_ID,
        COUNT(*)  AS RECORDS
    FROM CAR_RENTAL_COMPANY_RENTAL_HISTORY
    WHERE
        1=1
        AND START_DATE BETWEEN '2022-08-01' AND '2022-10-31'
    GROUP BY
        MONTH,
        CAR_ID     
), CTE2 AS (
    SELECT
        CAR_ID,
        COUNT(*) AS CNT
    FROM CAR_RENTAL_COMPANY_RENTAL_HISTORY
    WHERE
        1=1
        AND START_DATE BETWEEN '2022-08-01' AND '2022-10-31'
    GROUP BY
        CAR_ID
    HAVING
        CNT >= 5
)
SELECT
    C1.MONTH,
    C1.CAR_ID,
    C1.RECORDS
FROM CTE1 AS C1
INNER JOIN CTE2 C2
ON C1.CAR_ID = C2.CAR_ID
ORDER BY
    MONTH,
    CAR_ID DESC




