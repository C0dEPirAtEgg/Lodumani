#used_goods_board 와 used_goods_user 테이블에서 완료된 중고거래의 총금액이 70만원 이상인 사람의 회원id, 닉네임, 총거래금액을 조회
#총거래금액으로 오름차순 정렬
# user_id | nickname | sum(price)

# WITH over_price AS (
#     SELECT
#         writer_id,
#         SUM(price) AS total_sales
#     FROM used_goods_board
#     WHERE
#         1=1
#         AND status = "DONE"
#     GROUP BY
#         writer_id
#     HAVING
#         total_sales >= 700000
# )
# SELECT
#     ugu.user_id,
#     ugu.nickname,
#     op.total_sales
# FROM used_goods_user AS ugu
# INNER JOIN over_price AS op
# ON ugu.user_id = op.writer_id
# ORDER BY
#     total_sales

# SELECT
#     ugu.user_id,
#     ugu.nickname,
#     total.total_price
# FROM used_goods_user AS ugu
# INNER JOIN (SELECT
#                 writer_id,
#                 SUM(price) AS total_price
#            FROM used_goods_board
#            WHERE
#                 1=1
#                 AND status = "DONE"
#            GROUP BY
#                 writer_id
#            HAVING
#                 total_price >= 700000
#            ) AS total
# ON ugu.user_id = total.writer_id
# ORDER BY
#     total.total_price

SELECT
    user_id,
    nickname,
    SUM(price) AS total_price
FROM used_goods_user AS ugu
INNER JOIN used_goods_board AS ugb
ON ugu.user_id = ugb.writer_id
WHERE
    1=1
    AND status = "DONE"
GROUP BY
    user_id,
    nickname
HAVING
    total_price >= 700000
ORDER BY
    total_price