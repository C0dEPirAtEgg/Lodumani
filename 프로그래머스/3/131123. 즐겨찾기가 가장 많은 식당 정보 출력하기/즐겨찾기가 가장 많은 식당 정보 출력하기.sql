# 쿼리를 작성하는 목표, 확인할 지표 : FOOD_TYPE 별로 즐겨찾기수가 가장 많은 식당의 음식종류, ID, 식장 이름, 즐겨찾기수를 조회
# 쿼리 계산 방법 : 음식종류를 그룹해서 MAX(즐겨찾기수) 로 가게를 찾는다. 좋아요 수와 food_type을 통해서 식당 id와 식당 name을 알아낸다
# 데이터의 기간 : x
# 사용할 테이블 : REST_INFO
# Join KEY : x
# 데이터 특징 : ?X
# 한 : 734, 일 : 230 양 : 102 분식 : 151 중식 : 20

WITH FAVORITES_FOOD AS (
    SELECT
        FOOD_TYPE AS FT,
        MAX(FAVORITES) AS FR
    FROM
        REST_INFO
    GROUP BY
        FT
)

SELECT
    FOOD_TYPE,
    REST_ID,
    REST_NAME,FAVORITES
FROM REST_INFO AS RI
LEFT JOIN FAVORITES_FOOD AS FF
ON RI.FAVORITES = FF.FR
WHERE
    1=1
    AND FAVORITES = FR
    AND FOOD_TYpE = FT
ORDER BY
    FOOD_TYPE DESC