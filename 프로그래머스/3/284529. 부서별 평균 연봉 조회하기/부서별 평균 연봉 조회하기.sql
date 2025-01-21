# 부서별로 평균 연봉을 조회하려 합니다.
# 부서별로 부서ID, 영문 부서명, 평균 연봉
# 평균 연봉은 소수점 첫째 자리에서 반올림하고 컬럼명은 AVG_SAL로 해주세요.
# 부서ID | 영문 부서명 | 평균 연봉

# SELECT
#     *
# FROM hr_department

# SELECT
#     *
# FROM hr_employees
# WITH avg_department AS (
#     SELECT
#         dept_id,
#         ROUND(AVG(sal),0) AS AVG_SAL
#     FROM hr_employees
#     GROUP BY
#         dept_id
# )
# SELECT
#     hd.dept_id,
#     hd.dept_name_en,
#     ad.avg_sal
# FROM hr_department AS hd
# INNER JOIN avg_department AS ad
# ON hd.dept_id = ad.dept_id
# ORDER BY
#     ad.avg_sal DESC

# SELECT
#     hd.dept_id,
#     hd.dept_name_en,
#     ROUND(AVG(he.sal),0) AS AVG_SAL
# FROM hr_department AS hd
# INNER JOIN hr_employees AS he
# ON hd.dept_id = he.dept_id
# GROUP BY
#     hd.dept_id,
#     hd.dept_name_en
# ORDER BY
#     AVG_SAL DESC

# SELECT
#     hd.dept_id,
#     hd.dept_name_en,
#     AVG_SAL
# FROM hr_department AS hd
# INNER JOIN (SELECT
#                 dept_id,
#                 ROUND(AVG(sal),0) AS AVG_SAL
#             FROM hr_employees
#             GROUP BY
#                 dept_id) AS he
# ON hd.dept_id = he.dept_id
# ORDER BY
#     AVG_SAL DESC

# 쿼리를 작성하는 목표, 확인할 지표 : HR_DEPARTMENT 와 HR_EMPLOYEES 테이블을 이용해 부서별 평균 연봉을 조회하려고 합니다. 부서별로 부서 ID, 영문 부서명, 평균 연봉을 조회하는 SQL문을작성
# 쿼리 계산 방법 : HR_EMPLOYEES 테이블에서 DEPT_ID를 그룹화하여 AVG(SAL) 하여 부서별 평균 연봉을 구한후 HR_DEPARTMENT 테이블과 JO
# 쿼리 결과 : DEPT_ID, DEPT_NAME_EN, AVG_SAL
# 데이터의 기간 : X
# 사용할 테이블 : HR_DEPARTMENT, HR_EMPLOYEES
# Join KEY :
# 데이터 특징 : X

WITH DEPT_SAL AS (
    SELECT
        DEPT_ID,
        ROUND(AVG(SAL),0) AS AVG_SAL
    FROM HR_EMPLOYEES
    GROUP BY
        DEPT_ID
)
SELECT
    H.DEPT_ID,
    H.DEPT_NAME_EN,
    D.AVG_SAL
FROM HR_DEPARTMENT AS H
INNER JOIN DEPT_SAL AS D
ON H.DEPT_ID = D.DEPT_ID
ORDER BY
    AVG_SAL DESC












