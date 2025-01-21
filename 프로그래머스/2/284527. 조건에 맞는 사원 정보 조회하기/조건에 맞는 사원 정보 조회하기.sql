# WITH MAX_SCORE AS (
#     SELECT
#         EMP_NO,
#         SUM(SCORE) AS SCORE
#     FROM HR_GRADE
#     GROUP BY
#         EMP_NO
#     ORDER BY
#         SCORE DESC
#     LIMIT
#         1
# )
# SELECT
#     SCORE,
#     MS.EMP_NO,
#     EMP_NAME,
#     POSITION,
#     EMAIL
# FROM MAX_SCORE AS MS
# INNER JOIN HR_EMPLOYEES AS HE
# ON MS.EMP_NO = HE.EMP_NO

WITH EMPSCORE2022 AS (
    SELECT
        EMP_NO,
        YEAR,
        SUM(SCORE) AS SCORE
    FROM HR_GRADE
    WHERE
        1=1
        AND YEAR = 2022
    GROUP BY
        EMP_NO,
        YEAR
    ORDER BY
        SCORE DESC
    LIMIT
        1
)
SELECT
    E.SCORE,
    H.EMP_NO,
    H.EMP_NAME,
    H.POSITION,
    H.EMAIL
FROM EMPSCORE2022 AS E
INNER JOIN HR_EMPLOYEES AS H
ON E.EMP_NO = H.EMP_NO


















