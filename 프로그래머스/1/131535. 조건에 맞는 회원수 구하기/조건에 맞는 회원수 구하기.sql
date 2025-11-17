# SELECT
#     COUNT(*) AS USERS
# FROM USER_INFO
# WHERE
#     1=1
#     AND age BETWEEN 20 AND 29
#     AND EXTRACT(YEAR FROM JOINED) = 2021
SELECT
    COUNT(user_id) AS USERS
FROM USER_INFO
WHERE
    1=1
    AND age BETWEEN 20 AND 29
    AND STR_TO_DATE('2021-01-01', '%Y-%m-%d') <= joined
    AND STR_TO_DATE('2022-01-01', '%Y-%m-%d') > joined














