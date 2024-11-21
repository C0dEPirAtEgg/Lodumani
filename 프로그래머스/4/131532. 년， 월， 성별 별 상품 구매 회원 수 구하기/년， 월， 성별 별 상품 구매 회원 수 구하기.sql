# 쿼리를 작성하는 목표, 확인할 지표 : 
# 쿼리 계산 방법 : 년,월,성별로 그룹해서 count 하면될듯 성별 정보 없으면 제외
# 데이터의 기간 : X
# 사용할 테이블 : USER_INFO, ONLINE_SALE
# Join KEY : USER_ID
# 데이터 특징 : X
# 년, 월, 성별 별로 상품을 구매한 회원수를 집계하는 성별이 null 값이면 제외
# 년 | 월 | 성별(user_id로 구분이 가능) | count(user) 

SELECT
    YEAR(os.sales_date) AS YEAR,
    MONTH(os.sales_date) AS MONTH,
    GENDER,
    COUNT(DISTINCT os.user_id) AS USERS
FROM ONLINE_SALE AS OS
INNER JOIN USER_INFO AS UI
ON UI.user_id = OS.user_id
WHERE
    1=1
    AND gender IS NOT NULL
GROUP BY
    YEAR,
    MONTH,
    GENDER
ORDER BY
    YEAR,
    MONTH,
    GENDER