-- 2022년 1월 도서 판매 데이터를 기준으로 저자 별, 카테고리 별 매출액 을 구하여
-- AUTHOR_ID | AUTHOR_NAME | CATEGORY | SALES 출력하는 SQL문 작성

WITH cte1 AS (
    SELECT
        author_id,
        category,
        SUM(price * sales) AS TOTAL_SALES
    FROM BOOK AS B
    INNER JOIN BOOK_SALES AS BS
    ON B.book_id = BS.book_id
    WHERE
    1=1
    AND EXTRACT(YEAR FROM BS.SALES_DATE) = 2022
    AND EXTRACT(MONTH FROM BS.SALES_DATE) = 1
    GROUP BY
        1,2
)
SELECT
    c.author_id,
    A.author_name,
    c.category,
    c.total_sales
FROM cte1 AS c
INNER JOIN AUTHOR AS A
ON c.author_id = A.author_id
ORDER BY
    c.author_id,
    category DESC
