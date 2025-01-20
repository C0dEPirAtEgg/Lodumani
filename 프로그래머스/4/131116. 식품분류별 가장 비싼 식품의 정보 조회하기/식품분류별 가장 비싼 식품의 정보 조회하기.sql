-- 식품분류별로 가격이 제일 비싼 식품의 분류,가격,이름을 조회  category,MAX(price) 
-- category = 식품분류가 '과자', '국', '김치', '식용유'
-- category | max_price | product_name

# WITH max_price AS (
#     SELECT
#         category,
#         MAX(price) AS max_price
#     FROM food_product
#     GROUP BY
#         category
# )
# SELECT
#     DISTINCT
#     fp.category,
#     mp.max_price,
#     fp.product_name
# FROM food_product AS fp
# INNER JOIN max_price AS mp
# ON fp.price = mp.max_price
# WHERE
#     1=1
#     AND fp.category IN ('과자', '국', '김치', '식용유')
# ORDER BY
#     mp.max_price DESC
# WITH max_price AS(
#     SELECT
#         category,
#         MAX(price) AS max_price
#     FROM food_product
#     WHERE
#         1=1
#         AND category IN ('과자', '국', '김치', '식용유')
#     GROUP BY
#         category
# )
# SELECT
#     fp.category,
#     fp.price AS max_price,
#     fp.product_name
# FROM food_product AS fp
# INNER JOIN max_price AS mp
# ON fp.price = mp.max_price
# AND fp.category = mp.category
# ORDER BY
#     max_price DESC

# WITH max_price AS(
#     SELECT
#         category,
#         MAX(price) AS max_price
#     FROM food_product
#     GROUP BY
#         category
# )
# SELECT
#     fp.category,
#     fp.price AS max_price,
#     fp.product_name
# FROM food_product AS fp
# INNER JOIN max_price AS mp
# ON fp.price = mp.max_price
# AND fp.category = mp.category
# WHERE
#     1=1
#     AND fp.category IN ('과자', '국', '김치', '식용유')
# ORDER BY
#     max_price DESC

# 쿼리를 작성하는 목표, 확인할 지표 : FOOD_PRODUCT 테이블에서 식품분류별로 가격이 제일 비싼 식품의 분류, 가격, 이름을 조회하는 SQL문을 작성 식품 분류가 '과자','국','김치','식용유'인 경우만 출력
# 쿼리 계산 방법 : 결과가 국 최고가격 이름 과작 최고가격 이름 SELF JOIN 을 하는데 ON을 price와 category가 같은 것을 출력하는 방법
# 쿼리 결과 : category | price | product_name
# 데이터의 기간 : x
# 사용할 테이블 : FOOD_PRODUCT
# Join KEY : x
# 데이터 특징 : x

WITH category_max_price AS (
    SELECT
        CATEGORY,
        MAX(PRICE) AS MAX_PRICE
    FROM FOOD_PRODUCT
    WHERE
        1=1
        AND CATEGORY IN ('과자','국','김치','식용유')
    GROUP BY
        CATEGORY
)
SELECT
    F2.CATEGORY,
    F2.MAX_PRICE,
    F1.PRODUCT_NAME
FROM FOOD_PRODUCT AS F1
INNER JOIN category_max_price AS F2
ON F1.CATEGORY = F2.CATEGORY
AND F1.PRICE = F2.MAX_PRICE
ORDER BY
    F2.MAX_PRICE DESC









