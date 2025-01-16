# SELECT
#     RI.REST_ID,
#     RI.REST_NAME,
#     RI.FOOD_TYPE,
#     RI.FAVORITES,
#     RI.ADDRESS,
#     ROUND(AVG(RR.REVIEW_SCORE),2) AS SCORE
# FROM REST_INFO AS RI
# INNER JOIN REST_REVIEW AS RR
# ON RI.REST_ID = RR.REST_ID
# WHERE
#     1=1
#     AND SUBSTR(RI.ADDRESS,1,2) = '서울'
# GROUP BY
#     2
# ORDER BY
#     SCORE DESC,
#     RI.FAVORITES DESC
    
# SELECT
#     R1.REST_ID,
#     R1.REST_NAME,
#     R1.FOOD_TYPE,
#     R1.FAVORITES,
#     R1.ADDRESS,
#     R2.SCORE
# FROM REST_INFO AS R1
# INNER JOIN (SELECT
#                 REST_ID,
#                 ROUND(AVG(REVIEW_SCORE),2) AS SCORE
#             FROM REST_REVIEW
#             GROUP BY
#                 REST_ID) AS R2
# ON R1.REST_ID = R2.REST_ID
# WHERE
#     1=1
#     AND SUBSTR(R1.ADDRESS,1,2) = '서울'
# ORDER BY
#     R2.SCORE DESC,
#     R1.FAVORITES DESC

# 쿼리를 작성하는 목표, 확인할 지표 : 서울에 위치한 식당들의 ID, 식당 이름, 음식 종류, 즐겨찾기, 주소, 리뷰 평균 점수을 조회하는 SQL 평균점수는 소수점 세 번째 자리에서 반올림 결과는 평균 점수를 기준으로 내림차순 같다면 즐겨찾기 수 내림차순
# 쿼리 계산 방법 : REST_REVEIW 테이블에서 REST_ID 마다 평균 점수를 구하여 REST_INFO 테이블에 조인하는 방법
# 데이터의 기간 : X
# 사용할 테이블 : REST_INFO, REST_REVEIW
# Join KEY : REST_ID
# 데이터 특징 : X

WITH REST_REVIEW_SCORE AS (
    SELECT
        REST_ID,
        ROUND(AVG(REVIEW_SCORE),2) AS SCORE
    FROM REST_REVIEW
    GROUP BY
        REST_ID
)
SELECT
    RI.REST_ID,
    RI.REST_NAME,
    RI.FOOD_TYPE,
    RI.FAVORITES,
    RI.ADDRESS,
    RRS.SCORE
FROM REST_INFO AS RI
INNER JOIN REST_REVIEW_SCORE AS RRS
ON RI.REST_ID = RRS.REST_ID
WHERE
    1=1
    AND ADDRESS LIKE '서울%'
ORDER BY
    SCORE DESC,
    FAVORITES DESC