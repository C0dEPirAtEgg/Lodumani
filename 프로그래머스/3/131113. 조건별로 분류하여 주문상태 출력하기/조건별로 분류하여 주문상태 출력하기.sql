# 쿼리를 작성하는 목표, 확인할 지표 : FOOD_ORDER 테이블에서 2022년 5월 1일을 기준으로 주문ID, 제품ID, 출고일자, 출고여부를 조회하는 SQL문을 작성해주세요. 출고여부는 2022년 5월 1일까지 출고 완료로 이 후 날짜는 출고 대기로 미정이면 출고미정으로 출력해주시고 결과는 주문ID기준 오름
# 쿼리 계산 방법 : OUT_DATE가 2022년 5월 전이면 출고완료 이후면 출고 대기 없다면 출고 미정으로 되는 출고여부 컬럼을 하나 만들어주는
# 쿼리 결과 : ORDER_ID | PRODUCT_ID | OUT_DATE | 출고여부
# 데이터의 기간 : 2022년 5월 1일 기준
# 사용할 테이블 : FOOD_ORDER
# Join KEY :
# 데이터 특징 : x


SELECT
    ORDER_ID,
    PRODUCT_ID,
    DATE_FORMAT(OUT_DATE, '%Y-%m-%d'),
    CASE
        WHEN OUT_DATE <= '2022-05-01' THEN '출고완료'
        WHEN OUT_DATE > '2022-05-01' THEN '출고대기'
        ELSE '출고미정'
    END AS '출고여부'
FROM FOOD_ORDER
ORDER BY
    ORDER_ID

