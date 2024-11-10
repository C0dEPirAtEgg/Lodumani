-- 서울에 있는 각각의 식당들 리뷰 평균 점수를 구하세요 리뷰 테이블과 식당정보 테이블을 합친 후 평점을 구한다
WITH seoul_rest AS (
    SELECT
        rest_id,
        rest_name,
        food_type,
        favorites,
        address
        -- 리뷰 평균 점수(소수점 세 번째 자리에서 반올림)
    FROM REST_INFO
    WHERE
        1=1
        AND LEFT(ADDRESS, 2) = '서울'
), avg_review_score AS (
    SELECT
        rest_id,
        ROUND(AVG(review_score),2) AS score
    FROM rest_review
    GROUP BY
        rest_id
)
SELECT
    sr.rest_id AS REST_ID,
    REST_NAME,
    FOOD_TYPE,
    FAVORITES,
    ADDRESS,
    SCORE
FROM seoul_rest AS sr
INNER JOIN avg_review_score AS ars
ON sr.rest_id = ars.rest_id
ORDER BY
    score DESC,
    favorites DESC


-- rest_id 1,2,3,4,5,8