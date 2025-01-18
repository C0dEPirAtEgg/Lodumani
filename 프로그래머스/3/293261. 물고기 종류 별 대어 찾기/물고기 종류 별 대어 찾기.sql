# 물고기 종류 별로 가장 큰 물고기의 ID, 물고기 이름, 길이를 출력하는 SQL 문을 작성해주세요.
# 물고기의 ID 컬럼명은 ID, 이름 컬럼명은 FISH_NAME, 길이 컬럼명은 LENGTH 로 해주세요.
# 물고기 종류별 가장 큰 물고기는 1마리만 있으며 10cm이하의 물고기가 가장 큰경우는 없습니다. = 물고기가 NULL인 경우가 없다.


# WITH big_fish AS (
#     SELECT
#         FISH_TYPE,
#         MAX(LENGTH) AS LENGTH
#     FROM FISH_INFO
#     GROUP BY
#         FISH_TYPE
# )

# SELECT
#     fi.id,
#     fni.fish_name,
#     bf.length
# FROM big_fish AS bf
# INNER JOIN fish_name_info AS fni
# ON bf.fish_type = fni.fish_type
# INNER JOIN fish_info AS fi
# ON bf.fish_type = fi.fish_type
# AND bf.length = fi.length
# ORDER BY
#     fi.id

# 쿼리를 작성하는 목표, 확인할 지표 : 물고기 종류 별로 가장 큰 물고기의 ID, 물고기의 이름, 길이를 출력하는 SQL 문을 출력
# 쿼리 계산 방법 :
# 데이터의 기간 :
# 사용할 테이블 :
# Join KEY :
# 데이터 특징 :



WITH MAX_LENGTH AS (
    SELECT
        FISH_TYPE,
        MAX(LENGTH) AS MAXL
    FROM FISH_INFO
    GROUP BY
        FISH_TYPE
), MAX_LENGTH_NAME AS (
    SELECT
        M.FISH_TYPE,
        M.MAXL,
        F.FISH_NAME
    FROM MAX_LENGTH AS M
    INNER JOIN FISH_NAME_INFO AS F
    ON M.FISH_TYPE = F.FISH_TYPE
)
SELECT
    F.ID,
    M.FISH_NAME,
    F.LENGTH
FROM MAX_LENGTH_NAME AS M
INNER JOIN FISH_INFO AS F
ON M.FISH_TYPE = F.FISH_TYPE
AND M.MAXL = F.LENGTH
ORDER BY
    ID 

















