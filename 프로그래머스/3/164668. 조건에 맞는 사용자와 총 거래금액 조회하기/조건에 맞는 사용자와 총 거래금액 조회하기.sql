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

# SELECT
#     user_id,
#     nickname,
#     SUM(price) AS total_price
# FROM used_goods_user AS ugu
# INNER JOIN used_goods_board AS ugb
# ON ugu.user_id = ugb.writer_id
# WHERE
#     1=1
#     AND status = "DONE"
# GROUP BY
#     user_id,
#     nickname
# HAVING
#     total_price >= 700000
# ORDER BY
#     total_price

# 쿼리를 작성하는 목표, 확인할 지표 : USED_GOODS_BOARD 와 USED_GOODS_USER 테이블에서 완룐된 중고 거래의 총 금액이 70만원 이상인 사람의 회원 ID 닉네임 총거래금액을 조회하는 SQL 문을 작성해주세요.
# 쿼리 계산 방법 :
# 쿼리 결과 :
# 데이터의 기간 :
# 사용할 테이블 :
# Join KEY :
# 데이터 특징 :

WITH TOTAL70 AS (
    SELECT
        WRITER_ID,
        SUM(PRICE) AS SUM_PRICE
    FROM USED_GOODS_BOARD
    WHERE
        1=1
        AND STATUS = 'DONE'
    GROUP BY
        WRITER_ID
    HAVING
        SUM_PRICE >= 700000
)
SELECT
    U1.USER_ID,
    U1.NICKNAME,
    U2.SUM_PRICE
FROM USED_GOODS_USER AS U1
INNER JOIN TOTAL70 AS U2
ON U2.WRITER_ID = U1.USER_ID
ORDER BY
    SUM_PRICE