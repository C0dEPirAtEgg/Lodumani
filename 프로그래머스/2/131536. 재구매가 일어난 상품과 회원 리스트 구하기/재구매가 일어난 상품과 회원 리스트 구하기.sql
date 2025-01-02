SELECT
    user_id,
    product_id
FROM ONLINE_SALE
GROUP BY
    1,
    2
HAVING
    COUNT(*) >= 2
ORDER BY
    user_id,
    product_id DESC