# 물고기 종류 별로 가장 큰 물고기의 ID, 물고기 이름, 길이를 출력하는 SQL 문을 작성해주세요.
# 물고기의 ID 컬럼명은 ID, 이름 컬럼명은 FISH_NAME, 길이 컬럼명은 LENGTH 로 해주세요.
# 물고기 종류별 가장 큰 물고기는 1마리만 있으며 10cm이하의 물고기가 가장 큰경우는 없습니다. = 물고기가 NULL인 경우가 없다.


WITH big_fish AS (
    SELECT
        FISH_TYPE,
        MAX(LENGTH) AS LENGTH
    FROM FISH_INFO
    GROUP BY
        FISH_TYPE
)

SELECT
    fi.id,
    fni.fish_name,
    bf.length
FROM big_fish AS bf
INNER JOIN fish_name_info AS fni
ON bf.fish_type = fni.fish_type
INNER JOIN fish_info AS fi
ON bf.fish_type = fi.fish_type
AND bf.length = fi.length
ORDER BY
    fi.id