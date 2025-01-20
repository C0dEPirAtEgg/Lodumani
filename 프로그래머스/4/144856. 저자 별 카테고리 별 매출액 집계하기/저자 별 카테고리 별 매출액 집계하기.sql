-- 2022년 1월 도서 판매 데이터를 기준으로 저자 별, 카테고리 별 매출액 을 구하여
-- AUTHOR_ID | AUTHOR_NAME | CATEGORY | SALES 출력하는 SQL문 작성

# WITH cte1 AS (
#     SELECT
#         author_id,
#         category,
#         SUM(price * sales) AS TOTAL_SALES
#     FROM BOOK AS B
#     INNER JOIN BOOK_SALES AS BS
#     ON B.book_id = BS.book_id
#     WHERE
#     1=1
#     AND EXTRACT(YEAR FROM BS.SALES_DATE) = 2022
#     AND EXTRACT(MONTH FROM BS.SALES_DATE) = 1
#     GROUP BY
#         1,2
# )
# SELECT
#     c.author_id,
#     A.author_name,
#     c.category,
#     c.total_sales
# FROM cte1 AS c
# INNER JOIN AUTHOR AS A
# ON c.author_id = A.author_id
# ORDER BY
#     c.author_id,
#     category DESC

# WITH jan_sales AS (
#     SELECT
#         book_id,
#         SUM(sales) AS sum_sales
#     FROM book_sales
#     WHERE
#         1=1
#         AND sales_date LIKE "2022-01%"
#     GROUP BY
#         book_id
# ), book_account AS (
#     SELECT
#         b.category,
#         b.author_id,
#         SUM(b.price * ja.sum_sales) AS sales
#     FROM book AS b
#     LEFT JOIN jan_sales AS ja
#     ON b.book_id = ja.book_id
#     GROUP BY
#         b.category,
#         b.author_id
# )
# SELECT
#     a.author_id,
#     a.author_name,
#     ba.category,
#     ba.sales AS TOTAL_SALES
# FROM book_account AS ba
# INNER JOIN author AS a
# ON ba.author_id = a.author_id
# ORDER BY
#     a.author_id,
#     ba.category DESC

# SELECT 
#     a.AUTHOR_ID,
#     a.AUTHOR_NAME,
#     b.CATEGORY,
#     SUM(bs.SALES * b.PRICE) AS TOTAL_SALES
# FROM 
#     BOOK_SALES bs
# JOIN 
#     BOOK b ON bs.BOOK_ID = b.BOOK_ID
# JOIN 
#     AUTHOR a ON b.AUTHOR_ID = a.AUTHOR_ID
# WHERE 
#     bs.SALES_DATE BETWEEN '2022-01-01' AND '2022-01-31'
# GROUP BY 
#     a.AUTHOR_ID, a.AUTHOR_NAME, b.CATEGORY
# ORDER BY 
#     a.AUTHOR_ID ASC, b.CATEGORY DESC;

# 쿼리를 작성하는 목표, 확인할 지표 : 2022년 1월의 도서 판매 데이터를 기준으로 저자 별, 카테고리 별 매출액(TOTAL_SALES = 판매량 * 판매가) 을 구하여, 저자 ID(AUTHOR_ID), 저자명(AUTHOR_NAME), 카테고리(CATEGORY), 매출액(SALES) 리스트를 출력하는 SQL쿼리
# 쿼리 결과 : | 저자ID | 저자명 | 카테고리 | 매출액 |
# 쿼리 계산 방법 : AUTHOR 테이블과 BOOK 테이블을 조인후 저자 저자명 카테고리를 그룹화한후 BOOK_SALES 테이블과 조인후 매출액을 구하는 방법
# 데이터의 기간 : 2022년 1월
# 사용할 테이블 : BOOK_SALES, BOOK, AUTHOR
# Join KEY :
# 데이터 특징 : X

WITH SALES202201 AS (
    SELECT
        *
    FROM BOOK_SALES
    WHERE
        1=1
        AND EXTRACT(YEAR FROM SALES_DATE) = 2022
        AND EXTRACT(MONTH FROM SALES_DATE) = 1
), TOTAL_SALES202201 AS (
    SELECT
        B.AUTHOR_ID,
        B.CATEGORY,
        SUM(B.PRICE * BS.SALES) AS TOTAL_SALES
    FROM BOOK AS B
    INNER JOIN SALES202201 AS BS
    ON B.BOOK_ID = BS.BOOK_ID
    GROUP BY
        B.AUTHOR_ID,
        B.CATEGORY
)
SELECT
    A.AUTHOR_ID,
    A.AUTHOR_NAME,
    TS.CATEGORY,
    TS.TOTAL_SALES
FROM TOTAL_SALES202201 AS TS
INNER JOIN AUTHOR AS A
ON TS.AUTHOR_ID = A.AUTHOR_ID
ORDER BY
    AUTHOR_ID,
    CATEGORY DESC
















