# 평균 길이가 33cm 이상인 물고기들을 종류별로 분류하여 잡은 수, 최대길이, 물고기의 종류
# 10cm이하의 물고기들은 10cm롤 취급 하여 평균 길이를 구해주세요.

# WITH more33 AS (
#     SELECT
#         FISH_TYPE,
#         AVG(IFNULL(LENGTH,10)) AS AVG_LENGTH
#     FROM FISH_INFO
#     GROUP BY
#         FISH_TYPE
#     HAVING
#         AVG_LENGTH >= 33
# )
# SELECT
#     COUNT(*) AS FISH_COUNT,
#     MAX(FI.LENGTH) AS MAX_LENGTH,
#     FI.FISH_TYPE
# FROM FISH_INFO AS FI
# INNER JOIN more33 AS m3
# ON FI.FISH_TYPE = m3.FISH_TYPE
# GROUP BY
#     FI.FISH_TYPE
# ORDER BY
#     FI.FISH_TYPE

# SELECT COUNT(*)    AS FISH_COUNT, 
#        MAX(LENGTH) AS MAX_LENGTH, 
#        FISH_TYPE
# FROM FISH_INFO
# GROUP BY FISH_TYPE
# HAVING AVG(IFNULL(LENGTH,10)) >= 33
# ORDER BY FISH_TYPE

# 쿼리를 작성하는 목표, 확인할 지표 : FISH_INFO 에서 평균 길이가 33CM 이상인 물고기들을 종류별로 분류하여 잡은 수, 최대 길이, 물고기의 종류를 출력하는 SQL문을 작성해주세요. 결과는 물고기 종류에 대해 오름차순으로 정렬해주시고, 10cm 이하의 물고기들을 10cm로 취급하여 평균길이 구해주세요
# 쿼리 계산 방법 : 
# 쿼리 결과 : 잡은수 | 최대 길이 | 물고기의 종류
# 데이터의 기간 : X
# 사용할 테이블 : FISH_INFO
# Join KEY :
# 데이터 특징 : X

WITH FISH33 AS (
    SELECT
        COUNT(*) AS FISH_COUNT,
        MAX(IFNULL(LENGTH,10)) AS MAX_LENGTH,
        FISH_TYPE
    FROM FISH_INFO
    GROUP BY
        FISH_TYPE
    HAVING
        AVG(IFNULL(LENGTH, 10)) >= 33
)
SELECT
    *
FROM FISH33
ORDER BY
    FISH_TYPE





