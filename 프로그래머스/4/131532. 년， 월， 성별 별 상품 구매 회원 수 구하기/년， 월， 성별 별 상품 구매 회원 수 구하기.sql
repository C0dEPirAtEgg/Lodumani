# 쿼리를 작성하는 목표, 확인할 지표 : 
# 쿼리 계산 방법 : 년,월,성별로 그룹해서 count 하면될듯 성별 정보 없으면 제외
# 데이터의 기간 : X
# 사용할 테이블 : USER_INFO, ONLINE_SALE
# Join KEY : USER_ID
# 데이터 특징 : X
# 년, 월, 성별 별로 상품을 구매한 회원수를 집계하는 성별이 null 값이면 제외
# 년 | 월 | 성별(user_id로 구분이 가능) | count(user) 

# SELECT
#     YEAR(os.sales_date) AS YEAR,
#     MONTH(os.sales_date) AS MONTH,
#     GENDER,
#     COUNT(DISTINCT os.user_id) AS USERS
# FROM ONLINE_SALE AS OS
# INNER JOIN USER_INFO AS UI
# ON UI.user_id = OS.user_id
# WHERE
#     1=1
#     AND gender IS NOT NULL
# GROUP BY
#     YEAR,
#     MONTH,
#     GENDER
# ORDER BY
#     YEAR,
#     MONTH,
#     GENDER

# 쿼리를 작성하는 목표, 확인할 지표 : USER_INFO 테이블과 ONLINE_SALE 테이블에서 년,월,성별 별로 상품을 구매한 회원수를 집계하는 SQL문을 작성해주세요. 결과는 년,월,성별을 기준으로 오름차순 정렬해주세요. 성별 정보가 없는 경우 제외 0은 남자 1은 여자
# 쿼리 계산 방법 :
# 쿼리 결과 : 년 | 월 | 성별 | 상품 구매회원수
# 데이터의 기간 : X
# 사용할 테이블 : USER_INFO, ONLINE_SALE
# Join KEY :
# 데이터 특징 : X

WITH SALE_USER AS (
    SELECT
        EXTRACT(YEAR FROM SALES_DATE) AS YEAR,
        EXTRACT(MONTH FROM SALES_DATE) AS MONTH,
        USER_ID
    FROM ONLINE_SALE
)
SELECT
    YEAR,
    MONTH,
    U.GENDER,
    COUNT(DISTINCT U.USER_ID) AS USER
FROM SALE_USER AS S
INNER JOIN USER_INFO AS U
ON S.USER_ID = U.USER_ID
WHERE
    1=1
    AND GENDER IS NOT NULL
GROUP BY
    YEAR,
    MONTH,
    U.GENDER
ORDER BY
    YEAR,
    MONTH,
    GENDER















