# #더이상 업그레이드 할 수 없는 아이템의 아이템 ID,NAME,RARITY를 출력

# SELECT
#     II.ITEM_ID,
#     II.ITEM_NAME,
#     II.RARITY
# FROM ITEM_TREE AS IT
# LEFT JOIN ITEM_TREE AS IT1
# ON IT.ITEM_ID = IT1.PARENT_ITEM_ID
# INNER JOIN ITEM_INFO AS II
# ON IT.ITEM_ID = II.ITEM_ID
# WHERE
#     1=1
#     AND IT1.PARENT_ITEM_ID IS NULL
# ORDER BY
#     II.ITEM_ID DESC

# SELECT
#     ii.ITEM_ID,
#     ii.ITEM_NAME,
#     ii.RARITY
# FROM
#     ITEM_INFO ii
# JOIN
#     ITEM_TREE it
#     ON ii.ITEM_ID = it.ITEM_ID
# WHERE
#     ii.ITEM_ID NOT IN (
#         SELECT PARENT_ITEM_ID
#         FROM ITEM_TREE
#         WHERE PARENT_ITEM_ID IS NOT NULL
#     )
# ORDER BY
#     ii.ITEM_ID DESC;

# 쿼리를 작성하는 목표, 확인할 지표 : 더 이상 업그레이드 할 수 없는 아이템의 아이템ID, 아이템 명, 아이템의 희귀도를 출력하는 쿼리
# 쿼리 계산 방법 : 
# 데이터의 기간 : X
# 사용할 테이블 : ITEM_TREE, ITME_INFO
# Join KEY : ITME_ID
# 데이터 특징 : x

WITH LAST_ITEM AS (
    SELECT
        I1.ITEM_ID
    FROM ITEM_TREE AS I1
    LEFT JOIN ITEM_TREE AS I2
    ON I1.ITEM_ID = I2.PARENT_ITEM_ID
    WHERE
        1=1
        AND I2.ITEM_ID IS NULL
)
SELECT
    I.ITEM_ID,
    I.ITEM_NAME,
    I.RARITY
FROM LAST_ITEM AS L
INNER JOIN ITEM_INFO AS I
ON L.ITEM_ID = I.ITEM_ID
ORDER BY
    I.ITEM_ID DESC




