# SALES_DATE | PRODUCT_ID | USER_ID | SALES_AMOUNT

# SELECT
#     DATE_FORMAT(sales_date,"%Y-%m-%d") AS sales_date,
#     product_id,
#     user_id,
#     sales_amount
# FROM ONLINE_SALE
# WHERE
#     1=1
#     AND EXTRACT(YEAR FROM sales_date) = 2022
#     AND EXTRACT(MONTH FROM sales_date)  = 3

# UNION ALL

# SELECT
#     sales_date,
#     product_id,
#     NULL AS user_id,
#     sales_amount
# FROM OFFLINE_SALE
# WHERE
#     1=1
#     AND EXTRACT(YEAR FROM sales_date) = 2022
#     AND EXTRACT(MONTH FROM sales_date)  = 3
# ORDER BY
#     sales_date,
#     product_id,
#     user_id

# 쿼리를 작성하는 목표, 확인할 지표 : ONLINE_SALE 테이블과 OFFLINE_SALE 테이블에서 2022년 3월의 오프라인/온라인 상품 판매 데이터의   판매날짜, 상품 ID, 유저 ID, 판매량을 출력하는 작성 OFFLINE_SALE 테이블의 판매 데이터의 USER_ID 값은 NULL 로 표시
# 쿼리 계산 방법 : ONLINE_SALES, OFFLINE_SALES 의 각각의 값을 구한후 UNION 하여 합쳐준다,
# 데이터의 기간 : 2022년 3월
# 사용할 테이블 : ONLINE_SALES, OFFLINE_SALES
# Join KEY : X
# 데이터 특징 : X


SELECT
    DATE_FORMAT(sales_date, '%Y-%m-%d') AS sales_date,
    product_id,
    user_id,
    sales_amount
FROM ONLINE_SALE
WHERE
    1=1
    AND EXTRACT(YEAR FROM sales_date) = 2022
    AND EXTRACT(MONTH FROM sales_date) = 3
UNION
SELECT
    DATE_FORMAT(sales_date, '%Y-%m-%d'),
    product_id,
    NULL AS user_id,
    sales_amount
FROM OFFLINE_SALE
WHERE
    1=1
    AND EXTRACT(YEAR FROM sales_date) = 2022
    AND EXTRACT(MONTH FROM sales_date) = 3
ORDER BY
    sales_date,
    product_id,
    user_id
# SELECT
#     DATE_FORMAT(SALES_DATE,'%Y-%m-%d') AS SALES_DATE,
#     PRODUCT_ID,
#     USER_ID,
#     SALES_AMOUNT
# FROM (    
#     SELECT
#         sales_date,
#         product_id,
#         'NULL' AS user_id,
#         sales_amount
#     FROM OFFLINE_SALE
#     UNION ALL
#     SELECT
#         sales_date,
#         product_id,
#         user_id,
#         sales_amount
#     FROM ONLINE_SALE
# ) AS SALE
# WHERE
#     1=1
#     AND sales_date >= STR_TO_DATE('2022-03-01', '%Y-%m-%d')
#     AND sales_date < STR_TO_DATE('2022-04-01', '%Y-%m-%d')
# ORDER BY
#     SALES_DATE,
#     PRODUCT_ID,
#     USER_ID






