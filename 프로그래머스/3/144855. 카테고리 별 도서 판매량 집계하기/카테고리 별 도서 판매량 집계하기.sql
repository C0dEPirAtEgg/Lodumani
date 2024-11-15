-- category, total_sales 카테고리별로 몇권을 팔았는가
-- book_id, category | book_id, sales_date, sales

WITH JAN_SALES AS (
    SELECT
        book_id,
        SUM(sales) AS sum_sales
    FROM book_sales
    WHERE
        1=1
        AND YEAR(sales_date) = 2022
        AND MONTH(sales_date) = 1
    GROUP BY
        book_id
)

SELECT
    category,
    SUM(sum_sales) AS TOTAL_SALES
FROM jan_sales AS j
LEFT JOIN book AS b
ON j.book_id = b.book_id
GROUP BY
    category
ORDER BY
    category