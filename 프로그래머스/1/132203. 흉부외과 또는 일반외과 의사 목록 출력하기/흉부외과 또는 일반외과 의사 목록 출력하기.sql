# SELECT
#     DR_NAME,
#     DR_ID,
#     MCDP_CD,
#     DATE_FORMAT(HIRE_YMD,'%Y-%m-%d')
# FROM doctor
# WHERE
#     1=1
#     AND (MCDP_CD = 'CS'
#     OR MCDP_CD = 'GS')
# ORDER BY
#     HIRE_YMD DESC,
#     DR_NAME

SELECT
    DR_NAME,
    DR_ID,
    MCDP_CD,
    DATE_FORMAT(HIRE_YMD, '%Y-%m-%d')
FROM DOCTOR
WHERE
    1=1
    AND MCDP_CD IN ('CS','GS')
ORDER BY
    HIRE_YMD DESC,
    DR_NAME



