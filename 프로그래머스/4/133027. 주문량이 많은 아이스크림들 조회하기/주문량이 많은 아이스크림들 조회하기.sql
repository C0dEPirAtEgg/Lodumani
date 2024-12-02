-- 7월 아이스크림 총 주문량과 상반기 아이스크림 총 주문량을 더한 값이 큰 순서대로 상위 3개의 맛을 조회 하여 순서대로 출력해주세요.
SELECT
    FH.FLAVOR
FROM (SELECT
        FLAVOR,
        SUM(TOTAL_ORDER) AS TOTAL_ORDER
      FROM JULY
      GROUP BY
        FLAVOR)AS J
INNER JOIN (SELECT
                FLAVOR,
                SUM(TOTAL_ORDER) AS TOTAL_ORDER
            FROM FIRST_HALF
            GROUP BY
                FLAVOR) AS FH
ON J.FLAVOR = FH.FLAVOR
ORDER BY
    J.TOTAL_ORDER + FH.TOTAL_ORDER DESC
LIMIT
    3