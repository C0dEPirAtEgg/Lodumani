# (
# SELECT
#     DATE_FORMAT(SALES_DATE, "%Y-%m-%d") AS sales_date,
#     product_id,
#     user_id,
#     sales_amount
# FROM ONLINE_SALE
# WHERE
#     1=1
#     AND YEAR(sales_date) = 2022
#     AND MONTH(sales_date) = 3
# )
# UNION
# (
# SELECT
#     sales_date,
#     product_id,
#     NULL,
#     sales_amount
# FROM ONLINE_SALE
# WHERE
#     1=1
#     AND YEAR(sales_date) = 2022
#     AND MONTH(sales_date) = 3
# )
# ORDER BY
#     sales_date,
#     product_id,
#     user_id IS NULL DESC,
#     user_id

SELECT
    DATE_FORMAT(SALES_DATE,'%Y-%m-%d') AS SALES_DATE,
    PRODUCT_ID,
    USER_ID,
    SALES_AMOUNT
FROM ONLINE_SALE
WHERE
    1=1
    AND SUBSTRING(SALES_DATE,1,7) = '2022-03'
UNION
SELECT
    SALES_DATE,
    PRODUCT_ID,
    NULL,
    SALES_AMOUNT
FROM OFFLINE_SALE
WHERE
    1=1
    AND SUBSTRING(SALES_DATE,1,7) = '2022-03'
ORDER BY
    SALES_DATE,
    PRODUCT_ID,
    USER_ID IS NULL DESC,
    USER_ID
