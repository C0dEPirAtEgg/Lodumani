-- 식품분류별로 가격이 제일 비싼 식품의 분류,가격,이름을 조회  category,MAX(price) 
-- category = 식품분류가 '과자', '국', '김치', '식용유'
-- category | max_price | product_name

WITH max_price AS (
    SELECT
        category,
        MAX(price) AS max_price
    FROM food_product
    GROUP BY
        category
)
SELECT
    DISTINCT
    fp.category,
    mp.max_price,
    fp.product_name
FROM food_product AS fp
INNER JOIN max_price AS mp
ON fp.price = mp.max_price
WHERE
    1=1
    AND fp.category IN ('과자', '국', '김치', '식용유')
ORDER BY
    mp.max_price DESC