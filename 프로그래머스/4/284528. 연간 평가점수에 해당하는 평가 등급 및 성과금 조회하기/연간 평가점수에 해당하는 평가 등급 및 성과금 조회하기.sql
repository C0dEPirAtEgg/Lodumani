# 쿼리를 작성하는 목표, 확인할 지표 : 사원별 성과금 정보조회, 사번,성명,평가등급,성과금을 조회하는 SQL
# 쿼리 계산 방법 : HR_GRADE 테이블에서 평가점수별 평가등급을 만들어줌 성과금 = 연봉 * 0.2
# 데이터의 기간 : X
# 사용할 테이블 : HR_GRADE, HR_EMPLOYEES
# Join KEY : EMP_NO
# 데이터 특징 : 기준 점수를 1분기 2분기 합쳐서 나누기 2값으로 해야할것같다

# SELECT
#     *
# FROM hr_department

# SELECT
#     *
# FROM hr_employees

# SELECT
#     *
# FROM hr_grade

WITH hr_avg_score AS (
    SELECT
        emp_no,
        AVG(score) AS score
    FROM hr_grade
    GROUP BY
        emp_no
)

SELECT
    he.emp_no,
    he.emp_name,
    CASE   
        WHEN has.score >= 96 THEN 'S'
        WHEN has.score >= 90 THEN 'A'
        WHEN has.score >= 80 THEN 'B'
    ELSE 'C'
    END AS grade,
    CASE
        WHEN has.score >=96 THEN he.sal * 0.2
        WHEN has.score >=90 THEN he.sal * 0.15
        WHEN has.score >=80 THEN he.sal * 0.1
    ELSE he.sal * 0
    END AS bonus
FROM hr_employees AS he
INNER JOIN hr_avg_score AS has
ON he.emp_no = has.emp_no
ORDER BY
    he.emp_no