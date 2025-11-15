# SELECT
#     user_id,
#     product_id
# FROM ONLINE_SALE
# GROUP BY
#     1,
#     2
# HAVING
#     COUNT(*) >= 2
# ORDER BY
#     user_id,
#     product_id DESC


# SELECT
#     user_id,
#     product_id
# FROM ONLINE_SALE
# GROUP BY
#     user_id,
#     product_id
# HAVING
#     COUNT(*) >= 2
# ORDER BY
#     user_id,
#     product_id DESC

SELECT
    user_id,
    product_id
FROM ONLINE_SALE
GROUP BY
    user_id,
    product_id
HAVING
    COUNT(online_sale_id) >= 2
ORDER BY
    user_id,
    product_id DESC

