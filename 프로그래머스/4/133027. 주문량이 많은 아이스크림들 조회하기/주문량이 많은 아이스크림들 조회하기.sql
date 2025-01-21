-- 7월 아이스크림 총 주문량과 상반기 아이스크림 총 주문량을 더한 값이 큰 순서대로 상위 3개의 맛을 조회 하여 순서대로 출력해주세요.
# SELECT
#     FH.FLAVOR
# FROM (SELECT
#         FLAVOR,
#         SUM(TOTAL_ORDER) AS TOTAL_ORDER
#       FROM JULY
#       GROUP BY
#         FLAVOR)AS J
# INNER JOIN (SELECT
#                 FLAVOR,
#                 SUM(TOTAL_ORDER) AS TOTAL_ORDER
#             FROM FIRST_HALF
#             GROUP BY
#                 FLAVOR) AS FH
# ON J.FLAVOR = FH.FLAVOR
# ORDER BY
#     J.TOTAL_ORDER + FH.TOTAL_ORDER DESC
# LIMIT
#     3

# 쿼리를 작성하는 목표, 확인할 지표 : 7월 아이스크림 총 주문량과 상반기의 아이스크림 총 주문량을 더한 값이 큰 순서대로 상위 3개의 맛을 조회하는 SQL문을 작성해주세요.
# 쿼리 계산 방법 : FIRST_HALF 테이블과 JULY 테이블에서 FLAVOR로 그룹화하여 총 주문량을 구한 테이블을 만들고 두개의 테이블을 JOIN하여    두테이블의 합 주문량으로 ORDER BY하여 LIMIT 3을 걸어 값 구하기
# 쿼리 결과 : 맛
# 데이터의 기간 : 7월
# 사용할 테이블 : FIRST_HALF, JULY
# Join KEY :
# 데이터 특징 : X


WITH JULYFLAVOR AS (
    SELECT
        FLAVOR,
        SUM(TOTAL_ORDER) AS TOTAL1
    FROM JULY
    GROUP BY
        FLAVOR
), FIRSTFLAVOR AS (
    SELECT
        FLAVOR,
        SUM(TOTAL_ORDER) AS TOTAL2
    FROM FIRST_HALF
    GROUP BY
        FLAVOR
)
SELECT
    F.FLAVOR
FROM JULYFLAVOR AS J
INNER JOIN FIRSTFLAVOR AS F
ON J.FLAVOR = F.FLAVOR
ORDER BY
    TOTAL1 + TOTAL2 DESC
LIMIT
    3