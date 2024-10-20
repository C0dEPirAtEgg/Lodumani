# 쿼리를 작성하는 목표, 확인할 지표 : FOOD_ORDER에서 생산일자가 2022년 05월인 식품들의 식품ID,    식품 이름 총매출을 조회
# 쿼리 계산 방법 : FOOD_ORDER에서 produce_date 가 2022년05인 값들을 찾은후 product_id를 그룹화 하여 amount 의 합을 구한후 FOOD_PRODUCT 테이블에서 price 와 곱하여 총매출을 조회
# 데이터의 기간 : 2022년 05월
# 사용할 테이블 : FOOD_PRODUCT, FOOD_ORDER
# Join KEY : product_id
# 데이터 특징 :


WITH FO5 AS (
    SELECT
        PRODUCT_ID,
        SUM(AMOUNT) AS CNT
    FROM FOOD_ORDER
    WHERE
        1=1
        AND YEAR(produce_date) = 2022
        AND MONTH(produce_date) = 5
    GROUP BY
        PRODUCT_ID
)
SELECT
    FP.product_id,
    FP.product_name,
    FP.price * F.cnt AS TOTAL_SALES
FROM FOOD_PRODUCT AS FP
INNER JOIN FO5 AS F
ON FP.PRODUCT_ID = F.PRODUCT_ID
ORDER BY
    TOTAL_SALES DESC,
    PRODUCT_ID