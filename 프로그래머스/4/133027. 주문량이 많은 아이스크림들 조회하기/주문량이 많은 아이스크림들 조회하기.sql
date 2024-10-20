# 쿼리를 작성하는 목표, 확인할 지표 : 7월의 아이스크림 총 주문량과 상반기의 아이스크림 총 주문량을 더한 값 이 큰순 아이스크림 종류별로 주문량을 더한다 사위 3개
# 쿼리 계산 방법 : 각 테이블에서 FLAVOR를 그룹화 하여 TOTAL_ORDER의 SUM을 구한다
# 데이터의 기간 : X
# 사용할 테이블 : FIRST_HALF, JULY
# Join KEY : ?
# 데이터 특징 :
WITH FH AS (
    SELECT
        FLAVOR,
        SUM(TOTAL_ORDER) AS TOTAL_ORDER1
    FROM FIRST_HALF
    GROUP BY
        FLAVOR
), J1 AS (
    SELECT
        FLAVOR,
        SUM(TOTAL_ORDER) AS TOTAL_ORDER2
    FROM JULY
    GROUP BY
        FLAVOR
)
SELECT
    F.FLAVOR
FROM FH AS F
LEFT JOIN J1 AS J
ON F.FLAVOR = J.FLAVOR
ORDER BY
    (TOTAL_ORDER1 + TOTAL_ORDER2) DESC
LIMIT
    3