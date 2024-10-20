# 쿼리를 작성하는 목표, 확인할 지표 : 상품 코드 별 매출액(판매가 * 판매량) 합계 출력
# 쿼리 계산 방법 :
# 데이터의 기간 :
# 사용할 테이블 :
# Join KEY :
# 데이터 특징 :


WITH OS AS (
    SELECT
        product_id,
        SUM(sales_amount) AS SUM_S
    FROM OFFLINE_SALE
    GROUP BY
        product_id
)
SELECT
    PRODUCT_CODE,
    price * SUM_S AS SALES
FROM PRODUCT AS P
LEFT JOIN OS AS O
ON P.product_id = O.product_id
ORDER BY
    SALES DESC,
    PRODUCT_CODE