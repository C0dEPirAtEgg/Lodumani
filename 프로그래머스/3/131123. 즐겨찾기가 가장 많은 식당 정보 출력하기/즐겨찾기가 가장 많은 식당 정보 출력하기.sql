# 쿼리를 작성하는 목표, 확인할 지표 : FOOD_TYPE 별로 즐겨찾기수가 가장 많은 식당의 음식종류, ID, 식장 이름, 즐겨찾기수를 조회
# 쿼리 계산 방법 : 음식종류를 그룹해서 MAX(즐겨찾기수) 로 가게를 찾는다. 좋아요 수와 food_type을 통해서 식당 id와 식당 name을 알아낸다
# 데이터의 기간 : x
# 사용할 테이블 : REST_INFO
# Join KEY : x
# 데이터 특징 : ?X
# 한 : 734, 일 : 230 양 : 102 분식 : 151 중식 : 20

-- 음식종류별로 즐겨찾기수가 가장 많은 식당의 음식 종류, ID, 식당 이름, 즐겨찾기수
-- food_type | rest_id | rest_name | favorites

WITH max_favorites AS (
    SELECT
        food_type,
        MAX(favorites) AS favorites
    FROM rest_info
    GROUP BY
        food_type
)
SELECT
    ri.food_type,
    ri.rest_id,
    ri.rest_name,
    ri.favorites
FROM rest_info AS ri
INNER JOIN max_favorites AS mf
ON ri.food_type = mf.food_type
WHERE
    1=1
    AND ri.favorites = mf.favorites
ORDER BY
    ri.food_type DESC






