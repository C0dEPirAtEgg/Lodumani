-- 생산일자가 2022년 5월인 식품들의 식품 id,식품 name, 총 매출을 조회하는
-- 식품 id | 식품 name | 총 매출

# WITH base AS (
#     SELECT
#         product_id,
#         SUM(amount) AS amount
#     FROM food_order
#     WHERE
#         1=1
#         AND produce_date LIKE "2022-05%"
#     GROUP BY
#         product_id
# )
# SELECT
#     fp.product_id AS PRODUCT_ID,
#     fp.product_name AS PRODUCT_NAME,
#     amount * price AS TOTAL_SALES
# FROM base AS b
# INNER JOIN food_product AS fp
# ON b.product_id = fp.product_id
# ORDER BY
#     TOTAL_SALES DESC,
#     fp.product_id

# SELECT
#     fp.product_id,
#     fp.product_name,
#     amount * price AS TOTAL_SALES
# FROM base AS b
# INNER JOIN food_product AS fp
# ON b.product_id = fp.product_id
# ORDER BY
#     fp.product_id

# 쿼리를 작성하는 목표, 확인할 지표 : FOOD_PRODUCT 와 FOOD_ORDER 테이블에서 생산일자가 2022년 05월인 식품들의 식품 ID, 식품 이름, 총매출을 조회하는 SQL문 작성
# 쿼리 계산 방법 :
# 쿼리 결과 : 식품 ID | 식품 이름 | 총 매출
# 데이터의 기간 : 2022년 5월
# 사용할 테이블 : FOOD_PRODUCT, FOOD_ORDER
# Join KEY :
# 데이터 특징 : X


WITH FOOD202205 AS (
    SELECT
        PRODUCT_ID,
        SUM(AMOUNT) AS AMOUNT
    FROM FOOD_ORDER
    WHERE
        1=1
        AND EXTRACT(YEAR FROM PRODUCE_DATE) = 2022
        AND EXTRACT(MONTH FROM PRODUCE_DATE) = 5
    GROUP BY
        PRODUCT_ID
)
SELECT
    F2.PRODUCT_ID,
    F2.PRODUCT_NAME,
    F1.AMOUNT * F2.PRICE AS TOTAL_SALES
FROM FOOD202205 AS F1
INNER JOIN FOOD_PRODUCT AS F2
ON F1.PRODUCT_ID = F2.PRODUCT_ID
ORDER BY
    TOTAL_SALES DESC,
    PRODUCT_ID















