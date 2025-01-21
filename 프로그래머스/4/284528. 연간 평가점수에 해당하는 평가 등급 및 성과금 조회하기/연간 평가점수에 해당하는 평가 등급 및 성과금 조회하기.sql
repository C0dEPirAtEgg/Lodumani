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

# WITH hr_avg_score AS (
#     SELECT
#         emp_no,
#         AVG(score) AS score
#     FROM hr_grade
#     GROUP BY
#         emp_no
# )

# SELECT
#     he.emp_no,
#     he.emp_name,
#     CASE   
#         WHEN has.score >= 96 THEN 'S'
#         WHEN has.score >= 90 THEN 'A'
#         WHEN has.score >= 80 THEN 'B'
#     ELSE 'C'
#     END AS grade,
#     CASE
#         WHEN has.score >=96 THEN he.sal * 0.2
#         WHEN has.score >=90 THEN he.sal * 0.15
#         WHEN has.score >=80 THEN he.sal * 0.1
#     ELSE he.sal * 0
#     END AS bonus
# FROM hr_employees AS he
# INNER JOIN hr_avg_score AS has
# ON he.emp_no = has.emp_no
# ORDER BY
#     he.emp_no

# 쿼리를 작성하는 목표, 확인할 지표 : HR_DEPARTMENT, HR_EMPLOYEES, HR_GRADE 테이블을 이용해 사원별 성과금 정보를 조회하려고 합니다.  평가 점수별 등급과 등급에 따른 성과금 정보가 아래와 같을 때 사번 성명 평가 등급 성과금을 조회하는 SQL문 작성 평가등급의 컬럼명은 GRADE 성과금의 컬렴명은 BONUS로 해주세여.
# 쿼리 계산 방법 : HR_GRADE에서 평균 점수 테이블을 만든후 HR_EMPOLYEES 테이블과 JOIN하여 CASE WHEN을 사용하여 문제풀이
# 쿼리 결과 : 사번 | 성명 | 평가등금 | 성과금
# 데이터의 기간 : X
# 사용할 테이블 : HR_EMPLOYEES, HR_GRADE
# Join KEY :
# 데이터 특징 : X

WITH EMP_S AS (
    SELECT
        EMP_NO,
        AVG(SCORE) AS SCORE
    FROM HR_GRADE
    GROUP BY
        EMP_NO
), EMP_G AS (
    SELECT
        EMP_NO,
        CASE
            WHEN SCORE >= 96 THEN 'S'
            WHEN SCORE >= 90 THEN 'A'
            WHEN SCORE >= 80 THEN 'B'
        ELSE 'C'
        END AS GRADE
    FROM EMP_S
)
SELECT
    E.EMP_NO,
    H.EMP_NAME,
    E.GRADE,
    CASE
        WHEN E.GRADE = 'S'  THEN H.SAL * 0.2
        WHEN E.GRADE = 'A'  THEN H.SAL * 0.15
        WHEN E.GRADE = 'B'  THEN H.SAL * 0.1
        ELSE 0
    END AS BONUS
FROM EMP_G AS E
INNER JOIN HR_EMPLOYEES AS H
ON E.EMP_NO = H.EMP_NO
ORDER BY
    E.EMP_NO















