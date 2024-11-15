-- book, author, book_sales
-- 2022년 1월의 도서 판매 데이터를 기준으로 저자 별 카테고리 별 매출액 (total_sales = 판매량 * 판매가)
-- author_id, author_name, category, sales

WITH jan_sales AS (
    SELECT
        book_id,
        SUM(sales) AS sum_sales
    FROM book_sales
    WHERE
        1=1
        AND sales_date LIKE "2022-01%"
    GROUP BY
        book_id
), book_acount AS (
    SELECT
        b.category,
        b.author_id,
        SUM(b.price * ja.sum_sales) AS sales
    FROM book AS b
    LEFT JOIN jan_sales AS ja
    ON b.book_id = ja.book_id
    GROUP BY
        b.category,
        b.author_id
)
SELECT
    a.author_id,
    a.author_name,
    ba.category,
    ba.sales AS TOTAL_SALES
FROM book_acount AS ba
INNER JOIN author AS a
ON ba.author_id = a.author_id
ORDER BY
    a.author_id,
    ba.category DESC
