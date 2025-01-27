-- 코드를 작성해주세요
# 쿼리를 작성하는 목표, 확인할 지표 : DEVELOPERS 테이블에서 Front End 스킬을 가진 개발자의 정보를 조회 하려고 합니다. 조건에 맞는 개발자의 ID, 이메일, 이름, 성을 조회하는 SQL 문을 작성해주세요.
# 쿼리 계산 방법 :
# 쿼리 결과 : ID | EMAIL | FIRST_NAME | LAST_NAME
# 데이터의 기간 : X
# 사용할 테이블 : DEVELOPERS, SKILLCODES
# Join KEY :
# 데이터 특징 : X


WITH Front_End AS (
    SELECT
        *
    FROM SKILLCODES
    WHERE
        1=1
        AND CATEGORY = 'Front End'
)
SELECT
    D.ID,
    D.EMAIL,
    D.FIRST_NAME,
    D.LAST_NAME
FROM Front_End AS F
INNER JOIN DEVELOPERS AS D
ON F.CODE & D.SKILL_CODE > 0
GROUP BY
    1,2,3,4
ORDER BY
    ID
