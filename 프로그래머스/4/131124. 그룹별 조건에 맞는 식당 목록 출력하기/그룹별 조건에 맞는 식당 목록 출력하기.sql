-- MEMBER_PROFIlE, REST_REVIEW 테이블에서 리뷰를 가장 많이 작성한 회원의 리뷰들을 조회
-- MEMBER_NAME | REVIEW_TEXT | REVIEW_DATE
-- 두개의 테이블을 JOIN 하려면 REVIEW_ID를 사용해야한다.
-- REST_REVIEW 테이블에서 가장 많이 작성한 한명을찾아 member_profile 테이블과 연결해서 이름
WITH 1st_review AS (
    SELECT
        MEMBER_ID,
        COUNT(*) AS cnt
    FROM REST_REVIEW
    GROUP BY
        MEMBER_ID
    ORDER BY
        cnt DESC
    LIMIT
        1
)
SELECT
    MP.MEMBER_NAME,
    RR.REVIEW_TEXT,
    DATE_FORMAT(RR.REVIEW_DATE,'%Y-%m-%d')
FROM 1st_review AS 1r
INNER JOIN REST_REVIEW AS RR
ON 1r.MEMBER_ID = RR.MEMBER_ID
INNER JOIN MEMBER_PROFILE AS MP
ON 1r.MEMBER_ID = MP.MEMBER_ID
ORDER BY
    REVIEW_DATE,
    REVIEW_TEXT