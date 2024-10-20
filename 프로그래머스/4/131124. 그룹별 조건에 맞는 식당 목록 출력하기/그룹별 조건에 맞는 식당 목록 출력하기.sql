# 쿼리를 작성하는 목표, 확인할 지표 : 리뷰를 가장 많이 작성한 회원의 리뷰들을 조회 하는 sql문을 작성해주세요. 회원 이름,리뷰 텍스트, 리뷰 작성일이 출력
# 쿼리 계산 방법 : member_profile 과 rest_resview 테이블을 member_id를 통해 join
# 데이터의 기간 :
# 사용할 테이블 : member_profile,rest_resview
# Join KEY :
# 데이터 특징 :

WITH CTE1 AS (
    SELECT
        MEMBER_ID,
        COUNT(*) AS CTE
    FROM REST_REVIEW
    GROUP BY
        MEMBER_ID
    )
SELECT
    MEMBER_NAME,
    REVIEW_TEXT,
    DATE_FORMAT(REVIEW_DATE, '%Y-%m-%d') AS REVIEW_DATE
FROM REST_REVIEW AS RR
LEFT JOIN CTE1 AS C
ON RR.MEMBER_ID = C.MEMBER_ID
LEFT JOIN MEMBER_PROFILE AS MP
ON RR.MEMBER_ID = MP.MEMBER_ID
WHERE
    CTE = (SELECT
            MAX(CTE)
           FROM CTE1)
ORDER BY
    REVIEW_DATE,
    REVIEW_TEXT
