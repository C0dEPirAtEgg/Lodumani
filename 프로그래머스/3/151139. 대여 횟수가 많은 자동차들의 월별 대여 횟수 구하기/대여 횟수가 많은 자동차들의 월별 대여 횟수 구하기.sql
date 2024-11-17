# SELECT
#     MONTH(START_DATE) AS MONTH,
#     CAR_ID,
#     COUNT(HISTORY_ID) AS RECORDS
# FROM CAR_RENTAL_COMPANY_RENTAL_HISTORY
# WHERE
#     1=1
#     AND START_DATE BETWEEN '2022-08-01' AND '2022-10-31'
# GROUP BY
#     CAR_ID,
#     MONTH
# HAVING
#     RECORDS >= 5
# ORDER BY
#     MONTH,
#     CAR_ID DESC

SELECT Month(start_date) MONTH,
       car_id,
       Count(*)          RECORDS
FROM   car_rental_company_rental_history
WHERE  car_id IN (SELECT car_id
                 FROM   car_rental_company_rental_history
                 WHERE  start_date BETWEEN '2022-08-01' AND '2022-10-31'
                 GROUP  BY car_id
                 HAVING Count(*) >= 5)
       AND start_date BETWEEN '2022-08-01' AND '2022-10-31'
GROUP  BY month,
          car_id
ORDER  BY 1,
          2 DESC