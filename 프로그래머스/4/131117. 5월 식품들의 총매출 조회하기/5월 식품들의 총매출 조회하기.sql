-- 생산일자가 2022년 5월인 식품들의 식품 id,식품 name, 총 매출을 조회하는
-- 식품 id | 식품 name | 총 매출

WITH base AS (
    SELECT
        product_id,
        SUM(amount) AS amount
    FROM food_order
    WHERE
        1=1
        AND produce_date LIKE "2022-05%"
    GROUP BY
        product_id
)
SELECT
    fp.product_id AS PRODUCT_ID,
    fp.product_name AS PRODUCT_NAME,
    amount * price AS TOTAL_SALES
FROM base AS b
INNER JOIN food_product AS fp
ON b.product_id = fp.product_id
ORDER BY
    TOTAL_SALES DESC,
    fp.product_id

# SELECT
#     fp.product_id,
#     fp.product_name,
#     amount * price AS TOTAL_SALES
# FROM base AS b
# INNER JOIN food_product AS fp
# ON b.product_id = fp.product_id
# ORDER BY
#     fp.product_id