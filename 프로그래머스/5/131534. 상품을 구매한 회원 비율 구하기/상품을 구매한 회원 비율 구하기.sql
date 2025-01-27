# 쿼리를 작성하는 목표, 확인할 지표 : 2021년에 가입한 전체 회원들 중 상품을 구매한 회원수와 상품을 구매한 회원의 비율(=2021년에 가입한 회원 중 상품을 구매한 회원수 / 2021년에 가입한 전체회원수) 을 년,월,별로 출력 DISTITINCT_COUNT 상품을 구매한 회원수
# 쿼리 계산 방법 : 
# 데이터의 기간 :
# 사용할 테이블 :
# Join KEY :
# 데이터 특징 :

# WITH CTE AS (
#     SELECT
#         YEAR(JOINED) AS YEAR,
#         COUNT(*) AS CNT
#     FROM USER_INFO
#     WHERE
#         YEAR(JOINED) = 2021
# ), CTE1 AS (
#     SELECT
#         USER_ID AS USER_ID1
#     FROM USER_INFO
#     WHERE
#         1=1
#         AND YEAR(JOINED) = 2021
# ), CTE2 AS (
#     SELECT
#         YEAR(SALES_DATE) AS YEAR,
#         MONTH(SALES_DATE) AS MONTH,
#         COUNT(DISTINCT USER_ID) AS PURCHASED_USERS
#     FROM ONLINE_SALE AS OS
#     INNER JOIN CTE1 AS C1
#     ON OS.USER_ID = C1.USER_ID1
#     GROUP BY
#         YEAR,
#         MONTH
# )
# SELECT
#     C2.YEAR,
#     C2.MONTH,
#     PURCHASED_USERS,
#     ROUND((PURCHASED_USERS / CNT),1)
# FROM CTE2 AS C2
# LEFT JOIN CTE AS C
# ON C2.YEAR = C.YEAR + 1
# ORDER BY
#     YEAR,
#     MONTH

# 쿼리를 작성하는 목표, 확인할 지표 : USER_INFO 테이블과 ONLINE_SALE 테이블에서 2021년에 가입한 전체 회원들 중 상품을 구매한 회원수와 상품을 구매한 회원의 비율(=2021년에 가입한 회원 중 상품을 구매한 회원수 / 2021년에 가입한 전체 히원 수)을 년, 월 별로 출력하는 SQL문 작성
# 쿼리 계산 방법 :
# 쿼리 결과 : YEAR | MONTH | PURCHASED_USERS | PUCHASED_RATIO
# 데이터의 기간 : 2021
# 사용할 테이블 : USER_INFO, ONLINE_SALE
# Join KEY :
# 데이터 특징 : X

WITH USER_2021 AS (
    SELECT
        COUNT(USER_ID) AS USERS
    FROM USER_INFO
    WHERE
        1=1
        AND EXTRACT(YEAR FROM JOINED) = 2021
), USER_2021_SALE AS (
    SELECT
        O.ONLINE_SALE_ID,
        O.USER_ID,
        O.PRODUCT_ID,
        O.SALES_AMOUNT,
        O.SALES_DATE
    FROM ONLINE_SALE AS O
    INNER JOIN USER_INFO AS U
    ON O.USER_ID = U.USER_ID
    WHERE
        1=1
        AND EXTRACT(YEAR FROM U.JOINED) = 2021
), PURCHASED_USER AS (
    SELECT
        EXTRACT(YEAR FROM SALES_DATE) AS YEAR,
        EXTRACT(MONTH FROM SALES_DATE) AS MONTH,
        COUNT(DISTINCT USER_ID) AS PURCHASED_USERS
    FROM USER_2021_SALE AS U
    GROUP BY
        YEAR,
        MONTH
)
SELECT
    YEAR,
    MONTH,
    PURCHASED_USERS,
    ROUND(PURCHASED_USERS / USERS, 1) AS PUCHASED_RATIO
FROM PURCHASED_USER AS P
CROSS JOIN USER_2021 AS U

-- 2021년 가입하고 물건을 구매한 유저 / 2021년 가입한 전체 회원수















