# 쿼리를 작성하는 목표, 확인할 지표 : 사원별 성과금 정보조회, 사번,성명,평가등급,성과금을 조회하는 SQL
# 쿼리 계산 방법 : HR_GRADE 테이블에서 평가점수별 평가등급을 만들어줌 성과금 = 연봉 + 연봉 * 0.2
# 데이터의 기간 : X
# 사용할 테이블 : HR_GRADE, HR_EMPLOYEES
# Join KEY : EMP_NO
# 데이터 특징 : 기준 점수를 1분기 2분기 합쳐서 나누기 2값으로 해야할것같다

WITH BONUS AS (
    SELECT
        HG.EMP_NO,
        EMP_NAME,
        CASE
            WHEN SCORE >= 96 THEN 'S'
            WHEN SCORE >= 90 THEN 'A'
            WHEN SCORE >= 80 THEN 'B'
            WHEN SCORE < 80 THEN 'C'
        END AS GRADE
    FROM(
        SELECT
            EMP_NO,
            YEAR,
            AVG(SCORE) AS SCORE
        FROM HR_GRADE
        GROUP BY
            EMP_NO,
            YEAR
    ) AS HG
    LEFT JOIN HR_EMPLOYEES AS HE
    ON HG.EMP_NO = HE.EMP_NO
)
SELECT
    B.EMP_NO,
    B.EMP_NAME,
    GRADE,
    CASE
        WHEN GRADE = 'S' THEN SAL*0.2
        WHEN GRADE = 'A' THEN SAL*0.15
        WHEN GRADE = 'B' THEN SAL*0.1
        WHEN GRADE = 'C' THEN SAL*0
    END AS BONUS
FROM BONUS AS B
LEFT JOIN HR_EMPLOYEES AS HE
ON B.EMP_NO = HE.EMP_NO