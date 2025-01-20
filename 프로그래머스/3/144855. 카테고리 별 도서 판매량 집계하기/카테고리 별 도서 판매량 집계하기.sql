-- 2022년 1월의 카테고리 별 도서 판매량을 합산 카테고리, 총 판매량 리스트를 출력하세요.
-- 카테고리 | 총 판매량

# SELECT
#     b.category,
#     SUM(bs.sales) AS total_sales
# FROM Book AS b
# INNER JOIN (SELECT
#                 *
#             FROM book_sales
#             WHERE
#                 1=1
#                 AND sales_date LIKE '2022-01%') AS bs
# ON b.book_id = bs.book_id
# GROUP BY
#     b.category
# ORDER BY
#     b.category
    
# WITH jan_book AS (
#     SELECT
#         *
#     FROM book_sales
#     WHERE
#         1=1
#         AND sales_date LIKE '2022-01%'
# )
# SELECT
#     b.category,
#     SUM(bs.sales) AS total_sales
# FROM book AS b
# INNER JOIN jan_book AS bs
# ON b.book_id = bs.book_id
# GROUP BY
#     b.category
# ORDER BY
#     b.category
    
# SELECT
#     b.category,
#     SUM(bs.sales) AS total_sales
# FROM book AS b
# INNER JOIN book_sales AS bs
# ON b.book_id = bs.book_id
# WHERE
#     1=1
#     AND bs.sales_date LIKE '2022-01%'
# GROUP BY
#     b.category
# ORDER BY
#     b.category

# 쿼리를 작성하는 목표, 확인할 지표 : 2022년 1월의 카테고리 별 도서 판매량을 합산하고 카테고리, 총 판매량 리스트를 출력하는 SQL문을 작성해주세요.
# 쿼리 계산 방법 :
# 쿼리 결과 : CATEGORY | TOTAL_SALES
# 데이터의 기간 : 2022년 1월
# 사용할 테이블 : BOOK, BOOK_SALES
# Join KEY :
# 데이터 특징 : X

WITH CTE1 AS (
    SELECT
        BOOK_ID,
        SUM(SALES) AS HALF_SALES
    FROM BOOK_SALES
    WHERE
        1=1
        AND EXTRACT(YEAR FROM SALES_DATE) = 2022
        AND EXTRACT(MONTH FROM SALES_DATE) = 1
    GROUP BY
        BOOK_ID
)
SELECT
    CATEGORY,
    SUM(HALF_SALES) AS TOTAL_SALES
FROM BOOK AS B
INNER JOIN CTE1 AS C
ON B.BOOK_ID = C.BOOK_ID
GROUP BY
    CATEGORY
ORDER BY
    CATEGORY










