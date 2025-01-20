# SELECT
#     car_type,
#     COUNT(*) AS cars
# FROM CAR_RENTAL_COMPANY_CAR
# WHERE
#     1=1
#     AND options LIKE "%통풍시트%"
#     OR options LIKE "%열선시트%"
#     OR options LIKE "%가죽시트%"
# GROUP BY
#     car_type
# ORDER BY
#     car_type

SELECT
    CAR_TYPE,
    COUNT(*) AS CARS
FROM CAR_RENTAL_COMPANY_CAR
WHERE
    1=1
    AND (OPTIONS LIKE '%통풍시트%'
    OR OPTIONS LIKE '%열선시트%'
    OR OPTIONS LIKE '%가죽시트%')
GROUP BY
    CAR_TYPE
ORDER BY
    CAR_TYPE










