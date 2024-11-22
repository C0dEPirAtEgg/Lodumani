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

SELECT
    hd.dept_id,
    hd.dept_name_en,
    AVG_SAL
FROM hr_department AS hd
INNER JOIN (SELECT
                dept_id,
                ROUND(AVG(sal),0) AS AVG_SAL
            FROM hr_employees
            GROUP BY
                dept_id) AS he
ON hd.dept_id = he.dept_id
ORDER BY
    AVG_SAL DESC