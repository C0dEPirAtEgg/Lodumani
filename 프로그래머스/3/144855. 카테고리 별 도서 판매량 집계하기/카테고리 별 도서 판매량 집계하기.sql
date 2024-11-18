-- 2022년 1월의 카테고리 별 도서 판매량을 합산 카테고리, 총 판매량 리스트를 출력하세요.
-- 카테고리 | 총 판매량

SELECT
    b.category,
    SUM(bs.sales) AS total_sales
FROM Book AS b
INNER JOIN (SELECT
                *
            FROM book_sales
            WHERE
                1=1
                AND sales_date LIKE '2022-01%') AS bs
ON b.book_id = bs.book_id
GROUP BY
    b.category
ORDER BY
    b.category