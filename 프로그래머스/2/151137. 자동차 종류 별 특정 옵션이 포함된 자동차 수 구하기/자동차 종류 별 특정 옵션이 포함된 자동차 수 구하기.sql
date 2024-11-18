SELECT
    car_type,
    COUNT(*) AS cars
FROM CAR_RENTAL_COMPANY_CAR
WHERE
    1=1
    AND options LIKE "%통풍시트%"
    OR options LIKE "%열선시트%"
    OR options LIKE "%가죽시트%"
GROUP BY
    car_type
ORDER BY
    car_type