# 쿼리를 작성하는 목표, 확인할 지표 : 
# 쿼리 계산 방법 : 년,월,성별로 그룹해서 count 하면될듯 성별 정보 없으면 제외
# 데이터의 기간 : X
# 사용할 테이블 : USER_INFO, ONLINE_SALE
# Join KEY : USER_ID
# 데이터 특징 :


SELECT
    YEAR(SAlES_DATE) AS YEAR,
    MONTH(SALES_DATE) AS MONTH,
    GENDER,
    COUNT(DISTINCT OS.USER_ID) AS USERS
FROM ONLINE_SALE AS OS
LEFT JOIN USER_INFO AS UI
ON OS.USER_ID = UI.USER_ID
WHERE
    GENDER IS NOT NULL
GROUP BY
    YEAR,
    MONTH,
    GENDER

    