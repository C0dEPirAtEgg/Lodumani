# 평균 길이가 33cm 이상인 물고기들을 종류별로 분류하여 잡은 수, 최대길이, 물고기의 종류
# 10cm이하의 물고기들은 10cm롤 취급 하여 평균 길이를 구해주세요.

WITH more33 AS (
    SELECT
        FISH_TYPE,
        AVG(IFNULL(LENGTH,10)) AS AVG_LENGTH
    FROM FISH_INFO
    GROUP BY
        FISH_TYPE
    HAVING
        AVG_LENGTH >= 33
)
SELECT
    COUNT(*) AS FISH_COUNT,
    MAX(FI.LENGTH) AS MAX_LENGTH,
    FI.FISH_TYPE
FROM FISH_INFO AS FI
INNER JOIN more33 AS m3
ON FI.FISH_TYPE = m3.FISH_TYPE
GROUP BY
    FI.FISH_TYPE
ORDER BY
    FI.FISH_TYPE
    