# 쿼리를 작성하는 목표, 확인할 지표 : 2021년에 가입한 전체 회원들 중 상품을 구매한 회원수와 상품을 구매한 회원의 비율(=2021년에 가입한 회원 중 상품을 구매한 회원수 / 2021년에 가입한 전체회원수) 을 년,월,별로 출력 DISTITINCT_COUNT 상품을 구매한 회원수
# 쿼리 계산 방법 : 
# 데이터의 기간 :
# 사용할 테이블 :
# Join KEY :
# 데이터 특징 :

WITH CTE AS (
    SELECT
        YEAR(JOINED) AS YEAR,
        COUNT(*) AS CNT
    FROM USER_INFO
    WHERE
        YEAR(JOINED) = 2021
), CTE1 AS (
    SELECT
        USER_ID AS USER_ID1
    FROM USER_INFO
    WHERE
        1=1
        AND YEAR(JOINED) = 2021
), CTE2 AS (
    SELECT
        YEAR(SALES_DATE) AS YEAR,
        MONTH(SALES_DATE) AS MONTH,
        COUNT(DISTINCT USER_ID) AS PURCHASED_USERS
    FROM ONLINE_SALE AS OS
    INNER JOIN CTE1 AS C1
    ON OS.USER_ID = C1.USER_ID1
    GROUP BY
        YEAR,
        MONTH
)


SELECT
    C2.YEAR,
    C2.MONTH,
    PURCHASED_USERS,
    ROUND((PURCHASED_USERS / CNT),1)
FROM CTE2 AS C2
LEFT JOIN CTE AS C
ON C2.YEAR = C.YEAR + 1


