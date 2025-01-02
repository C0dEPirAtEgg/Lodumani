# SALES_DATE | PRODUCT_ID | USER_ID | SALES_AMOUNT

SELECT
    DATE_FORMAT(sales_date,"%Y-%m-%d") AS sales_date,
    product_id,
    user_id,
    sales_amount
FROM ONLINE_SALE
WHERE
    1=1
    AND EXTRACT(YEAR FROM sales_date) = 2022
    AND EXTRACT(MONTH FROM sales_date)  = 3

UNION ALL

SELECT
    sales_date,
    product_id,
    NULL AS user_id,
    sales_amount
FROM OFFLINE_SALE
WHERE
    1=1
    AND EXTRACT(YEAR FROM sales_date) = 2022
    AND EXTRACT(MONTH FROM sales_date)  = 3
ORDER BY
    sales_date,
    product_id,
    user_id













